using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for DTFCController
/// </summary>
public class DTFCController:Stakeholder
{
    Query mquery;
    public DTFCController()
    {
        mquery = new Query();
    }

    /// <summary>
    /// Gets all Pending application
    /// </summary>
    /// <returns> <see cref="DataTable"/></returns>
    public DataTable GetPendingApplications()
    {

        string selectquery = "select a.applicationid, a.moviename, a.dateofapplication from movie a, applicationstatus b where a.applicationid = b.applicationid and b.statusid=1";
        return mquery.Select(selectquery);
    }

    /// <summary>
    /// Gets all Approved application
    /// </summary>
    /// <returns> <see cref="DataTable"/></returns>
    public DataTable GetApprovedApplication()
    {
        string selectquery = "select a.applicationid, a.moviename, a.dateofapplication from movie a, applicationstatus b where a.applicationid = b.applicationid and b.statusid=3";
        return mquery.Select(selectquery);
    }

    /// <summary>
    /// Gets all Forward application
    /// </summary>
    /// <returns> <see cref="DataTable"/></returns>
    public DataTable GetForwardApplication()
    {
        string selectquery = "select a.applicationid, a.moviename, a.dateofapplication from movie a, applicationstatus b where a.applicationid = b.applicationid and b.statusid=2";
        return mquery.Select(selectquery);
    }

    /// <summary>
    /// Gets all Rejected application
    /// </summary>
    /// <returns> <see cref="DataTable"/></returns>
    public DataTable GetRejectedApplication()
    {
        string selectquery = "select a.applicationid, a.moviename, a.dateofapplication from movie a, applicationstatus b where a.applicationid = b.applicationid and b.statusid=4";
        return mquery.Select(selectquery);
    }


    /// <summary>
    /// Forward the application for furthur approval process
    /// </summary>
    /// <param name="applicationid"></param>
    /// <returns></returns>
    public bool ForwardApplication(string applicationid)
    {
        string result ="";
        bool res = true;
        string query2 = $"select locationid from requestedshotinglocations where applicationid = '{applicationid}'";
        DataTable dt = mquery.Select(query2);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                string locid = dr["locationid"].ToString();
                string query = $"select stakeholderid from location a  where a.locationid = '{locid}' ";
                System.Data.SqlClient.SqlDataReader sqlDataReader;
                mquery.Select(query, out sqlDataReader);
                if (sqlDataReader.Read())
                {
                    result = sqlDataReader["stakeholderid"].ToString();
                }
                sqlDataReader.Close();
                mquery.CloseConnection();
                var ids = result.Split(',');
                foreach (string id in ids)
                {
                    string insert = $"INSERT INTO forwardstatus VALUES ('{applicationid}','{Utility.NewID()}', 1,'{id}','{locid}',' ',0)";
                    res &= mquery.Insert(insert);
                }
            }

            string update = $"UPDATE applicationstatus SET statusid=2 where applicationid='{applicationid}'";
            res &= mquery.Update(update);
        }
        return res;
    }

    public bool ForwardToStakeholders(string applicationid)
    {
        string ids = mquery.GetSingleValue($"select stakeholderid from applicationforward where applicationid='{applicationid}'");
        var stakeholders = ids.Split(',');
        List<string> queries = new List<string>();
        foreach(var id in stakeholders)
        {
            queries.Add($"INSERT INTO forwardstatus (applicationid, forwardid, statusid, stakeholderid) VALUES ('{applicationid}','{Utility.NewID()}',1,'{id}')");
        }
        return mquery.Insert(queries.ToArray());
    }

    /// <summary>
    /// Updates the status
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    public bool UpdateDatesStatus(DataTable dt)
    {
        List<string> datesquery = new List<string>();
        string[] list = new string[dt.Rows.Count];
        foreach(DataRow dr in dt.Rows)
        {
            datesquery.Add($"INSERT INTO datesavail VALUES ('{dr["Dates"].ToString()}','{dr["Locationname"]}')");
        }
        return mquery.Insert(datesquery.ToArray());
    }


    public int GetPendingApplicationCount()
    {
        string count = mquery.GetSingleValue("count(*)", "applicationstatus", "statusid=1");
        if (string.IsNullOrWhiteSpace(count))
            return 0;
        else
            return int.Parse(count);
    }

    public int GetApprovedApplicationCount()
    {
        string count = mquery.GetSingleValue("count(*)", "applicationstatus", " statusid=3");
        if (string.IsNullOrWhiteSpace(count))
            return 0;
        else
            return int.Parse(count);
    }

    public int GetRejctedApplicationCount()
    {
        string count = mquery.GetSingleValue("count(*)", "applicationstatus", " statusid=4");
        if (string.IsNullOrWhiteSpace(count))
            return 0;
        else
            return int.Parse(count);
    }

    public int GetForwardedApplicationCount()
    {
        string count = mquery.GetSingleValue("count(*)", "applicationstatus", " statusid=2");
        if (string.IsNullOrWhiteSpace(count))
            return 0;
        else
            return int.Parse(count);
    }
}