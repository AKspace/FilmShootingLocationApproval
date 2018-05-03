using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Collections.Generic;
/// <summary>
/// Provides function of stakeholder tasks
/// </summary>
public class StakeHolderController
{
    ConnectionUtility cu = new ConnectionUtility();
    Query query = new Query();
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
    public StakeHolderController()
    {
        mquery = new Query();
    }
    #endregion

    #region Public Function

    /// <summary>
    /// Creates a new stakeholder
    /// </summary>
    /// <param name="stakeholder"><see cref="Stakeholder"/></param>
    /// <returns></returns>
    public bool CreateStakeholder(Stakeholder stakeholder)
    {
        //return exception if stakeholder id is null
        if (string.IsNullOrWhiteSpace(stakeholder.StakeHolderID)) throw new ArgumentNullException("Stakehoder ID must be assign before use");
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
        string updatequery = $"UPDATE stakeholder SET email = '{stakeholder.Email}', phoneno = '{stakeholder.PhoneNo}', address = '{stakeholder.Address}' where stakeholderid = '{stakeholder.StakeHolderID}'";

        //Executes query and return true if updated successfully
        return mquery.Update(updatequery);
    }

    /// <summary>
    /// Delets stakeholder
    /// </summary>
    /// <param name="stakeholderid"></param>
    /// <returns></returns>
    public bool DeleteStakeholder(string stakeholderid)
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
    /// Add a new user
    /// </summary>
    /// <param name="email">Email of user</param>
    /// <param name="userType">type of user <see cref="UserType"/></param>
    /// <returns></returns>
    public bool AddUser(string email, string userType, string stakeholderid, out string uniqueid)
    {
        string userid = Utility.NewID();
        uniqueid = Utility.NewID();
        //Insert query to add record in user table
        string insertquery1 = $"INSERT INTO [user] (userid, email, role, creationdate, active, stakeholderid) VALUES ('{userid}','{email}', '{userType}', '{Utility.CurrentDateTime}','0', '{stakeholderid}')";

        //Insert query to insert record in rest password request to set password in forst time
        string insertquery2 = $"INSERT INTO resetpasswordrequest (resetid, emailid,userid, requesttime)   VALUES ('{uniqueid}','{email}','{userid}','{Utility.CurrentDateTime}')";

        //Executes query and returns true if sccess
        return mquery.Insert(new string[] { insertquery1, insertquery2 });
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
        checkBoxList.DataSource = dataTable;
        checkBoxList.DataTextField = "stakeholdername";
        checkBoxList.DataValueField = "stakeholderID";
        checkBoxList.DataBind();
    }
    public string GetLocationName(string appl,string sid)
    {
        string loc = "";
        loc = query.GetSingleValue("select a.locationname as loc,a.locationid,b.locationid from forwardstatus a,location b where a.applicationid='"+appl+"' and a.stakeholderid='"+sid+"' and a.locationid=b.locationid");
        return loc;
    }
    public string GetStakeHolderId(string userid)
    {
        string sid = "";
        sid=query.GetSingleValue("stakeholderid","[user]","userid='"+userid+"'");
        return sid;
    }
    public void GetPendingApplications(ref GridView gd,string sid)
    {
        try
        {
            SqlConnection sCon = cu.OpenConnection();
            SqlDataAdapter sDta = new SqlDataAdapter("select a.applicationid as appid ,a.moviename as movname,a.dateofapplication as dateofapp,b.applicationid,b.stakeholderid,b.statusid from movie a,forwardstatus b where a.applicationid=b.applicationid and b.stakeholderid='"+sid+"' and b.statusid=2", sCon);
            DataSet ds = new DataSet();
            sDta.Fill(ds);
            gd.DataSource = ds;
            gd.DataBind();
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
        }
    }
    public void GetApprovedApplications(ref GridView gd,string sid)
    {
        try
        {
            SqlConnection sCon = cu.OpenConnection();
            SqlDataAdapter sDta = new SqlDataAdapter("select a.applicationid as appid ,a.moviename as movname,a.dateofapplication as dateofapp,b.applicationid,b.stakeholderid,b.statusid from movie a,forwardstatus b where a.applicationid=b.applicationid and b.stakeholderid='" + sid + "' and b.statusid=3", sCon);
            DataSet ds = new DataSet();
            sDta.Fill(ds);
            gd.DataSource = ds;
            gd.DataBind();
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
        }
    }
    public void GetTotalApplications(ref GridView gd, string sid)
    {
        try
        {
            SqlConnection sCon = cu.OpenConnection();
            SqlDataAdapter sDta = new SqlDataAdapter("select a.applicationid as appid ,a.moviename as movname,a.dateofapplication as dateofapp,b.applicationid,b.stakeholderid,b.statusid,c.statusname as statusname from movie a,forwardstatus b,statusdetails c where a.applicationid=b.applicationid and b.stakeholderid='" + sid + "' and b.statusid=c.statusid", sCon);
            DataSet ds = new DataSet();
            sDta.Fill(ds);
            gd.DataSource = ds;
            gd.DataBind();
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
        }
    }
    public int GetApprovalStatus(string appl)
    {
        int approvalstatus = 0;
        Dictionary<string,bool> locids = new Dictionary<string,bool>();
        string result="";
        string query1 = "select locationid from requestedshotinglocations where applicationid='"+appl+"'";
        DataTable dt = query.Select(query1);
        List<int> stakestatus = new List<int>();
        if(dt.Rows.Count>0)
        {
           foreach(DataRow dr in dt.Rows)
            {
                string locid = dr["locationid"].ToString();
                string query2 = "select stakeholderid from location where locationid='"+locid+"'";
                System.Data.SqlClient.SqlDataReader sqlDataReader;
                query.Select(query2, out sqlDataReader);
                if(sqlDataReader.Read())
                {
                    result = sqlDataReader["stakeholderid"].ToString();
                }
                sqlDataReader.Close();
                var shid = result.Split(',');
                foreach(var a in shid)
                {
                    stakestatus.Add(Convert.ToInt16(query.GetSingleValue("select statusid from forwardstatus where applicationid='"+appl+"' and locationid='"+locid+"' and stakeholderid='"+a+"'")));
                }
                bool t = true;
                foreach(int i in stakestatus)
                {
                    if (i == 3)
                        t &= true;
                    else
                    {
                        t &= false;
                        break;
                    }
                }
                locids.Add(locid,t);
                if(t )
                    approvalstatus= 1;
            }
        }
        bool s = true;
        foreach(var a in locids)
        {
            s &= a.Value;
        }
        if (s == true)
            approvalstatus = 2;
        return approvalstatus;
    }
    public string GetForwardId(string appl,string sid)
    {
        string fwid = "";
    return fwid = query.GetSingleValue("select forwardid from forwardstatus where applicationid='"+appl+"' and stakeholderid='"+sid+"'");

    }
    public void GetRejectedApplications(ref GridView gd, string sid)
    {
        try
        {
            SqlConnection sCon = cu.OpenConnection();
            SqlDataAdapter sDta = new SqlDataAdapter("select a.applicationid as appid ,a.moviename as movname,a.dateofapplication as dateofapp,b.applicationid,b.stakeholderid,b.statusid,c.statusname as statusname from movie a,forwardstatus b,statusdetails c where a.applicationid=b.applicationid and b.stakeholderid='" + sid + "' and b.statusid=c.statusid", sCon);
            DataSet ds = new DataSet();
            sDta.Fill(ds);
            gd.DataSource = ds;
            gd.DataBind();
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
        }
    }
    #endregion
}