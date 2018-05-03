using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Provides functionallity for Administrator
/// </summary>
public class AdminController
{
    #region Private Memebers
    /// <summary>
    /// Query class object
    /// </summary>
    private Query mquery;

    #endregion

    #region Constructor
    /// <summary>
    /// Default Constructor
    /// </summary>
    public AdminController()
    {
        mquery = new Query();
    }
    #endregion

    #region Public functions

    /// <summary>
    /// Creates a new stakeholder
    /// </summary>
    /// <param name="stakeholder"><see cref="Stakeholder"/></param>
    /// <returns></returns>
    public bool CreateStakeholder(Stakeholder stakeholder)
    {
        //return exception if stakeholder id is null
        if(string.IsNullOrWhiteSpace(stakeholder.StakeHolderID)) throw new ArgumentNullException("Stakehoder ID must be assign before use");
        //Insert Query
        string insertquery = $"INSERT INTO stakeholder (stakeholderID, stakeholdername, stakeholderdescription, email, phoneno, address) VALUES ('{Guid.NewGuid().ToString()}', '{stakeholder.StakeholderName}', '{stakeholder.StakeholderDescription}', '{stakeholder.Email}', '{stakeholder.PhoneNo}', '{stakeholder.Address}')";

        //Executes the query and return insertquery
        return mquery.Insert(insertquery);
    }

    /// <summary>
    /// Updates stakeholder contact details
    /// </summary>
    /// <param name="stakeholder"></param>
    /// <returns></returns>
    public bool UpdateStakeholder(Stakeholder stakeholder)
    {
        //Update query
        string updatequery = $"UPDATE stakeholder SET stakeholderdescription='{stakeholder.StakeholderDescription}', email = '{stakeholder.Email}', phoneno = '{stakeholder.PhoneNo}', address = '{stakeholder.Address}' where stakeholderid = '{stakeholder.StakeHolderID}'";

        //Executes query and return true if updated successfully
        return mquery.Update(updatequery);
    }

    /// <summary>
    /// Delets stakeholder
    /// </summary>
    /// <param name="stakeholderid"></param>
    /// <returns></returns>
    public bool DeleteStakeholder (string stakeholderid)
    {
        if (mquery.CheckExistance("stakeholder", $"stakeholderid = '{stakeholderid}'"))
        {
            //Delete query
            string deletequery = $"DELETE FROM stakeholder where stakeholderid = '{stakeholderid}'";

            //Executes and return true if delete record successfully
            return mquery.Delete(deletequery);
        }
        return false;
    }

    /// <summary>
    /// Gets stakeholder details
    /// </summary>
    /// <param name="stakeholderid"></param>
    /// <returns></returns>
    public Stakeholder GetStakeholder(string stakeholderid)
    {
        Stakeholder stakeholder = new Stakeholder();
        string select = $"SELECT stakeholdername, stakeholderdescription, email, phoneno, address from stakeholder where stakeholderid = '{stakeholderid}' ";
        DataTable dt = mquery.Select(select);
        stakeholder.StakeHolderID = stakeholderid;

        if(dt.Rows.Count > 0)
        {
            stakeholder.StakeholderName = dt.Rows[0]["stakeholdername"].ToString();
            stakeholder.StakeholderDescription = dt.Rows[0]["stakeholderdescription"].ToString();
            stakeholder.Email = dt.Rows[0]["email"].ToString();
            stakeholder.PhoneNo = dt.Rows[0]["phoneno"].ToString();
            stakeholder.Address = dt.Rows[0]["address"].ToString();
        }
        return stakeholder;
    }

    /// <summary>
    /// Add a new user
    /// </summary>
    /// <param name="email">Email of user</param>
    /// <param name="userType">type of user <see cref="UserType"/></param>
    /// <returns></returns>
    public bool AddUser(string email, string userType, string stakeholderid ,out string uniqueid)
    {
        string userid = Utility.NewID();
        uniqueid = Utility.NewID();
        //Insert query to add record in user table
        string insertquery1 = $"INSERT INTO [user] (userid, email, role, creationdate, active, stakeholderid) VALUES ('{userid}','{email}', '{userType}', '{Utility.CurrentDateTime}','0', '{stakeholderid}')";

        //Insert query to insert record in rest password request to set password in forst time
        string insertquery2 = $"INSERT INTO resetpasswordrequest (resetid, emailid,userid, requesttime)   VALUES ('{uniqueid}','{email}','{userid}','{Utility.CurrentDateTime}')";

        //Executes query and returns true if sccess
        return mquery.Insert(new string[] { insertquery1,insertquery2});
    }

    /// <summary>
    /// Add new location
    /// </summary>
    /// <param name="location"><see cref="Location"/></param>
    /// <returns></returns>
    public bool AddLocation(Location location)
    {
        //Insert query
        string insertquery = $"INSERT INTO location (locationid, locationname, locationdescription, stakeholderid, latitude, longitude, imgpath) VALUES ('{location.LocationID}'," +
            $"'{location.LocationName}', '{location.LocationDescription}', '{location.StakeholderID}', '{location.Latitude}', '{location.Longitude}', '{location.ImagePath}') ";

        //Executes true if location added succesfully
        return mquery.Insert(insertquery);
    }

    /// <summary>
    /// Returns all locations with locationid and location name
    /// </summary>
    /// <returns></returns>
    public DataTable GetLocations()
    {
        string selectquery = "SELECT locationid, locationname, locationdescription, latitude, longitude, keywords,imgpath FROM location";
        return mquery.Select(selectquery);
    }

    /// <summary>
    /// Returns all stakeholders
    /// </summary>
    /// <param name="fulldetails">dTake <see cref="Boolean"/> for full details</param>
    /// <returns></returns>
    public DataTable GetStakeHolders(bool fulldetails = false)
    {
        string selectquery;
        if (fulldetails)
        {
            selectquery = $"SELECT stakeholderid, stakeholdername, email, phoneno, stakeholderdescription FROM stakeholder";
        }
        else
        {
            selectquery = $"SELECT stakeholderid, stakeholdername, stakeholderdescription FROM stakeholder";
        }
        DataTable dt = new DataTable();
        dt = mquery.Select(selectquery);
        return dt;
    }

    /// <summary>
    /// FIll the checkbox list item
    /// </summary>
    /// <param name="checkBoxList"></param>
    public void GetStakeHolders(ref CheckBoxList checkBoxList)
    {
        string query = $"select DISTINCT  stakeholderID, stakeholdername from stakeholder ";
        System.Data.DataTable dataTable = new System.Data.DataTable();
        dataTable = mquery.Select(query);
        checkBoxList.DataSource = dataTable ;
        checkBoxList.DataTextField = "stakeholdername";
        checkBoxList.DataValueField = "stakeholderID";
        checkBoxList.DataBind();
    }


    /// <summary>
    /// Delete exsting location
    /// </summary>
    /// <param name="locationid"></param>
    /// <returns></returns>
    public bool Deletelocation(string locationid)
    {
        if (mquery.CheckExistance("location", $"locationid='{locationid}'"))
        {
            string deletequery = $"DELETE FROM location where locationid='{locationid}'";
            return mquery.Delete(deletequery);
        }
        return false;
    }

    /// <summary>
    /// Gets Location details
    /// </summary>
    /// <param name="locationid"></param>
    /// <returns></returns>
    public Location GetLocation(string locationid)
    {
        string selectquery = $"SELECT locationname, locationdescription, stakeholderid, latitude, longitude, keywords,imgpath FROM  location WHERE locationid='{locationid}'";
        DataTable dt = mquery.Select(selectquery);
        Location location = new Location();
        location.LocationID = locationid;
        if (dt.Rows.Count > 0)
        {
            location.LocationName = dt.Rows[0]["locationname"].ToString();
            location.LocationDescription = dt.Rows[0]["locationdescription"].ToString();
            location.Latitude = dt.Rows[0]["latitude"].ToString();
            location.Longitude = dt.Rows[0]["longitude"].ToString();
            location.KeyWords = dt.Rows[0]["keywords"].ToString();
            location.StakeholderID = dt.Rows[0]["stakeholderid"].ToString();
            location.ImagePath = dt.Rows[0]["imgpath"].ToString();
        }
        return location;
    }

    /// <summary>
    /// Updates the location details
    /// </summary>
    /// <param name="location"></param>
    /// <returns></returns>
    public bool UpdateLocation (Location location)
    {
        string updatequery = $"UPDATE location SET locationname='{location.LocationName}'," +
            $" latitude='{location.Latitude}', longitude='{location.Longitude}', " +
            $"locationdescription='{location.LocationDescription}', keywords='{location.KeyWords}', " +
            $"stakeholderid ='{location.StakeholderID}' WHERE  locationid='{location.LocationID}'";
        return mquery.Update(updatequery);
    }

    #endregion
}