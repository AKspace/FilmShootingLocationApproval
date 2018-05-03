using System;

/// <summary>
/// Controls User Tasks
/// </summary>
public class UserController
{
    #region Private Members
    /// <summary>
    /// Object of query class
    /// </summary>
    Query mQuery;

    /// <summary>
    /// Object of Encryption class
    /// </summary>
    Encryption mEncryption;
    #endregion

    #region Constructor

    /// <summary>
    /// Default Constructor
    /// </summary>
    public UserController()
    {
        mQuery = new Query();
    }
    #endregion

    #region Public Functions
    /// <summary>
    /// Authenticated user and returns user data to create session
    /// </summary>
    /// <param name="user"><see cref="User"/> to authenticated</param>
    /// <returns><see cref="LoginMessage"/></returns>
    public LoginMessage AuthenticateUser(ref User user)
    {
        //Quert String
        string querystring = $"SELECT a.userid, a.name,a.password, a.role FROM [user] a where email ='{user.Email}'";
        try
        {
            //Executes the query
            mQuery.Select(querystring, out System.Data.SqlClient.SqlDataReader sqlDataReader);

            //If usr does not exist
            if (!sqlDataReader.HasRows)
                return LoginMessage.NotRegistered;

            //If user exist
            sqlDataReader.Read();
            user.UserID = sqlDataReader["userid"].ToString();

            mEncryption = new Encryption(user.Email, user.UserID);

            //If password is incorrect
            if (!sqlDataReader["password"].ToString().Equals(mEncryption.EncryptText(user.Password)))
                return LoginMessage.IncorrectPassword;

            //If password is Correct
            user.Role = (UserType)Enum.Parse(typeof(UserType), sqlDataReader["role"].ToString()); /* Update in future */
            user.Name = sqlDataReader["name"].ToString();
            sqlDataReader.Close();
            return LoginMessage.Authenticated;
        }
        catch (Exception ex)
        {
            //Throw exception
            throw ex;
        }
        finally
        {
            //Close the connection
            mQuery.CloseConnection();
        }
    }

    /// <summary>
    /// Check whether user entered Correct password or not
    /// </summary>
    /// <param name="oldpassword"></param>
    /// <param name="userid"></param>
    /// <returns></returns>
    public bool Authenticate(string oldpassword,  string userid)
    {
        //Quert String
        string querystring = $"SELECT a.email, a.password FROM [user] a where userid ='{userid}'";
        try
        {
            //Executes the query
            mQuery.Select(querystring, out System.Data.SqlClient.SqlDataReader sqlDataReader);

            //If user exist
            if (sqlDataReader.Read())
            {
                //Gets email
                string email = sqlDataReader["email"].ToString();

                //Create an instance of Encryption class
                mEncryption = new Encryption(email, userid);

                //If password is correct
                if (sqlDataReader["password"].ToString().Equals(mEncryption.EncryptText(oldpassword)))
                {
                    //Close the sqldatreader
                    sqlDataReader.Close();
                    return true;
                }
            }
        }
        catch (Exception ex)
        {
            //Throw exception
            throw ex;
        }
        finally
        {
            //Close Connection
            mQuery.CloseConnection();
        }
        return false;
    }

    /// <summary>
    /// Change the password of user
    /// </summary>
    /// <param name="newpassword">New Password to change</param>
    /// <param name="oldpassword"> Existing Password</param>
    /// <param name="userid">Userid</param>
    /// <param name="email">Email</param>
    /// <returns></returns>
    public bool UpdatePassword(string newpassword, string userid)
    {
        //Gets Email
        string email = GetEmail(userid);

        //Creates new instance of Encryption classs
        mEncryption = new Encryption(email, userid);

        string encodedpassword = mEncryption.EncryptText(newpassword);

        //query to change password
        string updatequery = $"UPDATE [user] SET password='{encodedpassword}', lastpasswordchangedate = '{Utility.CurrentDateTime}' where userid='{userid}'";
        try
        {
            //If user entered correct password
                return mQuery.Update(updatequery);
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            throw ex;
        }
    }

    /// <summary>
    /// Chages password after forgot password request
    /// </summary>
    /// <param name="linkid">Linkid</param>
    /// <param name="password"> New Password</param>
    /// <returns></returns>
    public bool ChangePassword(string linkid, string password)
    {
        //Get emailid
        string emailid = mQuery.GetSingleValue("emailid", "resetpasswordrequest", $"resetid='{linkid}'");

        //Get userid
        string userid = mQuery.GetSingleValue("userid", "resetpasswordrequest", $"resetid='{linkid}'");
        mEncryption = new Encryption(emailid, userid);

        //Encrypt password
        string encodedpassword = mEncryption.EncryptText(password);

        //update password
        string updatequery = $"UPDATE [user] SET password='{encodedpassword}', lastpasswordchangedate = '{Utility.CurrentDateTime}' where userid='{userid}'";

        string deletequery = $"Delete FROM resetpasswordrequest where userid='{userid}'";
        mQuery.Delete(deletequery);
        return mQuery.Update(updatequery);
    }

    /// <summary>
    /// Send an email to reset password
    /// </summary>
    /// <param name="email"></param>
    public bool ForgotPassword(string email)
    {
        //If user exist
        if (mQuery.CheckExistance("[user]", $" email='{email}'"))
        {
            //Create new unique id
            string uniqueid = Guid.NewGuid().ToString();

            //Get userid
            string userid = mQuery.GetSingleValue("userid", "[user]", $"email='{email}'");

            //strig query
            string insertquery = $"INSERT INTO resetpasswordrequest (resetid, emailid,userid, requesttime)   VALUES ('{uniqueid}','{email}','{userid}','{Utility.CurrentDateTime}')";
            Email emailobj = new Email
            {
                Body = MessageFormat.ForgotPassword(email, uniqueid),
                IsBodyHTML = true,
                Subject = "Forgot Password"
            };

            //Send Email
            emailobj.SendMail(email);

            //Insert reset details
            mQuery.Insert(insertquery);
            return true;
        }
        return false;
    }

    /// <summary>
    /// Checks whether link is valid or not
    /// </summary>
    /// <param name="linkid"></param>
    /// <returns></returns>
    public bool IslinkValid(string linkid)
    {
        //return trueif link is valid
        return mQuery.CheckExistance("resetpasswordrequest", $"resetid='{linkid}'");
        
    }

    /// <summary>
    /// Checks whether user exist
    /// </summary>
    /// <param name="email">Email</param>
    /// <returns></returns>
    public bool IsUserExist(string email)
    {
        //return true if User Exist
        return mQuery.CheckExistance("[user]", $"email = '{email}'");
    }

    /// <summary>
    /// Creates a new user
    /// </summary>
    /// <param name="user"> <see cref="User"/></param>
    /// <returns></returns>
    public bool CreateUser(User user)
    {
        //Generate new Guid
        user.UserID = Utility.NewID().ToString();

        //Create an instance for Encryption class
        mEncryption = new Encryption(user.Email, user.UserID);

        //Encrypt password
        string encrypttext = mEncryption.EncryptText(user.Password);

        //Insert query 
        string insertquery = $"INSERT INTO [user] (userid, email, name, phoneno, gender, dateofbirth, adhaarid, password, role, creationdate, active) " +
            $"VALUES ('{user.UserID}' , '{user.Email}' , '{user.Name}' , '{user.PhoneNO}' , '{user.Gender.ToString()}' , '{user.DateOfBirth}' , '{user.AdhaarID}' " +
            $", '{encrypttext}', '{user.Role}' , CONVERT(datetime ,'{Utility.CurrentDateTime}',101), '1')";

        //Execute query and returns true if inserted data successfully
        return mQuery.Insert(insertquery);
    }

    /// <summary>
    /// Gets user Information
    /// </summary>
    /// <param name="userid"><see cref="string"/>User id</param>
    /// <returns><see cref="User"/></returns>
    public User GetUserInfo(string userid)
    {
        //Creates object of user
        User user = new User();

        //Select query
        string selectquery = $"select email, name, phoneno, gender,dateofbirth, address, adhaarid from [user] where userid = '{userid}'";

        //Executes select data
        mQuery.Select(selectquery, out System.Data.SqlClient.SqlDataReader sqldatareader);

        if (sqldatareader.Read())
        {
            //Set email
            user.Email = sqldatareader["email"].ToString();

            //set Name
            user.Name = sqldatareader["name"].ToString();

            //Set Phone No
            user.PhoneNO = sqldatareader["phoneno"].ToString();

            //Set Gender
            user.Gender = ValueConverter.ToGender(sqldatareader["gender"].ToString());

            //Set Date
            user.DateOfBirth = sqldatareader["dateofbirth"].ToString();

            //Set Address
            user.Address = sqldatareader["address"].ToString();

            //Set Adhaarid
            user.AdhaarID = sqldatareader["adhaarid"].ToString();
        }
        sqldatareader.Close();
        mQuery.CloseConnection();
        return user;
    }

    /// <summary>
    /// Gets the useer login history.
    /// </summary>
    /// Gets the user registration date , password change date, last password change date and modification date 
    /// <param name="userid"><see cref="string"/> Userid</param>
    /// <returns><see cref="User"/> </returns>
    public User GetAccountSummary(string userid)
    {
        User user = new User();

        //select query
        string selectquery = $"select lastlogindate, lastpasswordchangedate, creationdate, modificationdate from[user] where userid = '{userid}'";

        //Executes select query
        mQuery.Select(selectquery, out System.Data.SqlClient.SqlDataReader sqldatareader);

        //If Rescord exist
        if (sqldatareader.Read())
        {
            //Assign last login date
            if (DateTime.TryParse(sqldatareader["lastlogindate"].ToString(), out DateTime date))
                user.LastLoginDate = date;

            //Assign Last Password change date
            if (DateTime.TryParse(sqldatareader["lastpasswordchangedate"].ToString(), out date))
                user.LastPasswordChangeDate = date;

            //Assign creation date
            if (DateTime.TryParse(sqldatareader["creationdate"].ToString(), out date))
                user.CreationDate = date;

            //Assign modification date
            if (DateTime.TryParse(sqldatareader["modificationdate"].ToString(), out  date))
                user.ModificationDate = date;


        }
        sqldatareader.Close();
        mQuery.CloseConnection();
        return user;

    }

    /// <summary>
    /// Get Account summary
    /// </summary>
    /// <param name="userid"></param>
    /// <param name="user"><see cref="User"/></param>
    /// <returns></returns>
    public User GetAccountSummary(string userid, ref User user)
    {
        //Select query
        string selectquery = $"select lastlogindate, lastpasswordchangedate, creationdate, modificationdate from[user] where userid = '{userid}'";

        //Executes select query
        mQuery.Select(selectquery, out System.Data.SqlClient.SqlDataReader sqldatareader);

        // If record exist
        if (sqldatareader.Read())
        {
            //Assign last login date
            if (DateTime.TryParse(sqldatareader["lastlogindate"].ToString(), out DateTime date))
                user.LastLoginDate = date;

            //Assign last password change date
            if (DateTime.TryParse(sqldatareader["lastpasswordchangedate"].ToString(), out date))
                user.LastPasswordChangeDate = date;

            //Assign creation date
            if (DateTime.TryParse(sqldatareader["creationdate"].ToString(), out date))
                user.CreationDate = date;

            //Assign modification date
            if (DateTime.TryParse(sqldatareader["modificationdate"].ToString(), out date))
                user.ModificationDate = date;


        }
        sqldatareader.Close();
        mQuery.CloseConnection();
        return user;

    }

    /// <summary>
    /// Update Last Login Date And time
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    public bool UpdateLastLoginDate(string userid)
    {
        string updatequery = $"UPDATE [user] SET lastlogindate = '{Utility.CurrentDateTime}' where userid='{userid}'";
        return mQuery.Update(updatequery);

    }

    ///// <summary>
    ///// Update User Details
    ///// </summary>
    ///// <param name="userid"></param>
    ///// <returns></returns>
    //public bool UpdateDetails(User user)
    //{
    //    if (string.IsNullOrWhiteSpace(user.UserID)) throw new ArgumentNullException("User.UserID must be ssign before its use");
    //    //Update query
    //    string updatequery = $"update [user] set phoneno='{user.PhoneNO}',address='{user.Address}',adhaarid='{user.AdhaarID}' where userid='{user.UserID}'";

    //    //Execute query to update
    //    return mQuery.Update(updatequery);
    //}

    /// <summary>
    /// Update User info in first login
    /// </summary>
    /// <param name="user"></param>
    /// <returns></returns>
    public bool UpdateUserInfo(User user)
    {
        string updatequery;

        //Throws exception if userid is null
        if (string.IsNullOrWhiteSpace(user.UserID)) throw new ArgumentNullException("User Id must be assign before use");
        if (!IsActive(user.UserID))
        { 
            //query to update alluserinfo
             updatequery = $"UPDATE [user] SET name = '{user.Name}', phoneno = '{user.PhoneNO}', gender = '{user.Gender.ToString()}',dateofbirth='{user.DateOfBirth}', " +
                $"address='{user.Address}', adhaarid='{user.AdhaarID}', modificationdate='{Utility.CurrentDateTime}', active = '1' WHERE userid='{user.UserID}' ";
        }
        else
            //Query to update user details
             updatequery = $"update [user] set phoneno='{user.PhoneNO}',address='{user.Address}',adhaarid='{user.AdhaarID}', modificationdate = '{Utility.CurrentDateTime}' where userid='{user.UserID}'";

        //Executes query and return true if updated succesfully
        return mQuery.Update(updatequery);
    }

    /// <summary>
    /// Checks whether account is active or not
    /// </summary>
    /// <param name="userid">userid of the account</param>
    /// <returns>status of the account</returns>
    public bool IsActive(string userid)
    {
        //Get account status
        string active = mQuery.GetSingleValue("active", "[user]", $"userid='{userid}'");

        //return account status 
        return Boolean.Parse(active);

    }
    public bool IsActive(User user)
    {
        //Get account status
        string active = mQuery.GetSingleValue("active", "[user]", $"userid='{user.UserID}'");

        //return account status 
        return Boolean.Parse(active);
    }

    #endregion

    #region Private Members
    /// <summary>
    /// Gets email of the user
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    public string GetEmail(string userid)
    {
        //Returns email
        return mQuery.GetSingleValue("email", "[user]", $"userid='{userid}'");
    }

    #endregion

}
