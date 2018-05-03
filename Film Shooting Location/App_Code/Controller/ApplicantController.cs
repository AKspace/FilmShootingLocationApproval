using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ApplicantController
/// </summary>
public class ApplicantController
{
    Query mQuery;
    public ApplicantController()
    {
        //
        // TODO: Add constructor logic here
        //
        mQuery = new Query();
    }
    public bool ApplyForm(ref Movie m, params FilmMaker[] filmMaker)
    {
        int i = 0;
        string[] querystrings = new string[filmMaker.Length + 1];
        for (i = 0; i < filmMaker.Length; i++)
        {
            querystrings[i] = $"INSERT INTO filmmaker VALUES ('{filmMaker[i].ApplicationID}','{filmMaker[i].Name}','{filmMaker[i].PhoneNo}','{filmMaker[i].Email}','{filmMaker[i].Address}','{filmMaker[i].Type}','{filmMaker[i].ExperienceProfile}')";
        }
        querystrings[i] = $"INSERT INTO movie VALUES('{m.ApplicationID}','{m.MovieName}','{m.ProductionHouse}','{m.Language}','{m.MovieType}','{m.Actor}','{m.Actress}','{m.NoOfCast}','{m.TotalNoOfCrew}','{m.DateOfCommencement}','{m.DateOfEnd}','{m.StayPlace}','{m.ReleaseDate}','{m.ScriptPath}','{m.CertificateIMPA}','{m.CertificateWIFPA}','{m.userid}','{m.dateofregistration}',0,'{m.scriptparameter}')";
        if (mQuery.Insert(querystrings))
        {
            return true;
        }
        else
            return false;
    }

    public bool InsertRequestedloction(List<RequestedShootingLocation> requestedShooting)
    {
        string[] query = new string[requestedShooting.Count];
        for (int i = 0; i < requestedShooting.Count; i++)
        {
            query[i] = $"INSERT INTO requestedshotinglocations VALUES ('{requestedShooting[i].LocationID}', '{requestedShooting[i].ApplicationID}', '{requestedShooting[i].Date}', '{requestedShooting[i].StartTime}', '{requestedShooting[i].EndTIme}', '{requestedShooting[i].ScriptPath}')";
        }
        return mQuery.Insert(query);
    }
    public System.Data.DataTable GetLocation()
    {
        string selectquery = $"SELECT locationid, locationname FROM location";
        return mQuery.Select(selectquery);
    }

    /// <summary>
    /// Checks wether  dates is available
    /// </summary>
    /// <param name="startdate"></param>
    /// <param name="enddate"></param>
    /// <returns></returns>
    public bool IsDateAvailable(string startdate, string enddate)
    {
        string result = mQuery.GetSingleValue("count(*)", "requestedshotinglocations", $"date between '{startdate}' and '{enddate}'");
        int.TryParse(result, out int cont);
        if (cont <= 0)
            return true;
        return false;
    }

    /// <summary>
    /// Gets details of film maker details
    /// </summary>
    /// <param name="appid"></param>
    /// <param name="usertype"></param>
    /// <returns></returns>
    public FilmMaker GetFilmmakerDetails(string appid, string usertype)
    {
        string selectquery = $"SELECT name, phoneno, email, address, experianceprofile FROM filmmaker  WHERE applicationid = '{appid}' and type='{usertype}' ";
        mQuery.Select(selectquery, out System.Data.SqlClient.SqlDataReader sqldatareader);
        FilmMaker filmMaker = new FilmMaker();
        if (sqldatareader.Read())
        {
            filmMaker.ApplicationID = appid;
            filmMaker.Email = sqldatareader["email"].ToString();
            filmMaker.PhoneNo = sqldatareader["phoneno"].ToString();
            filmMaker.ExperienceProfile = sqldatareader["experianceprofile"].ToString();
            filmMaker.Name = sqldatareader["name"].ToString();
            filmMaker.Address = sqldatareader["address"].ToString();
        }

        return filmMaker;
    }

    /// <summary>
    /// Get Movie Details
    /// </summary>
    /// <param name="appid">Application id of the form</param>
    /// <returns></returns>
    public Movie GetMovieDetails(string appid)
    {
        string selectquery = $"SELECT * FROM movie WHERE applicationid = '{appid}'";
        mQuery.Select(selectquery, out System.Data.SqlClient.SqlDataReader sqldatareader);
        Movie movie = new Movie();
        if (sqldatareader.Read())
        {
            movie.ApplicationID = appid;
            movie.MovieName = sqldatareader["moviename"].ToString();
            movie.ProductionHouse = sqldatareader["productionhouse"].ToString();
            movie.Language = sqldatareader["language"].ToString();
            movie.MovieType = sqldatareader["movietype"].ToString();
            movie.Actor = sqldatareader["actor"].ToString();
            movie.Actress = sqldatareader["actress"].ToString();
            int.TryParse(sqldatareader["nonofcost"].ToString(), out int a);
            movie.NoOfCast = a;
            int.TryParse(sqldatareader["totalnooffilunit"].ToString(), out a);
            movie.TotalNoOfCrew = a;
            DateTime.TryParse(sqldatareader["dateofcommencement"].ToString(), out DateTime dt);
            movie.DateOfEnd = dt;
            DateTime.TryParse(sqldatareader["dateofcommencement"].ToString(), out dt);
            movie.DateOfCommencement = dt;
            movie.StayPlace = sqldatareader["stayplace"].ToString();
            DateTime.TryParse(sqldatareader["dateofcommencement"].ToString(), out dt);
            movie.ReleaseDate = dt;
        }
        return movie;
    }

    public DataTable GetStakeholder(string locationid)
    {
        AdminController controller = new AdminController();
        DataTable dt = new DataTable();
        dt.Columns.Add("stakeholderid");
        dt.Columns.Add("stakeholdername");
        string stakeids = mQuery.GetSingleValue($"select stakeholderid from location where locationid = '{locationid}'");
        var stakeholders = stakeids.Split(',');
        foreach (string id in stakeholders)
        {
            Stakeholder stake = controller.GetStakeholder(id);
            DataRow dr = dt.NewRow();
            dr["stakeholderid"] = stake.StakeHolderID;
            dr["stakeholdername"] = stake.StakeholderName;
            dt.Rows.Add(dr);
        }
        return dt;
    }

    public bool InsertTransRecord(Transaction trans)
    {
        string insert = $"INSERT INTO transactiondetails (applicationid, transactionid, transactiontime, amount," +
            $" completed) values ('{trans.ApplicationID}', '{trans.TransactionID}', '{Utility.CurrentDateTime}', " +
            $"'{trans.Amount}', '0')";
        return mQuery.Insert(insert);
    }

    public bool CompleteTransaction(string appid)
    {
        string update = $"UPDATE transactiondetails SET completed='1'";
        return mQuery.Update(update);
    }

    public bool SetApplicationForward(string value, string appid)
    {
        string insertquery = $"INSERT INTO applicationforward (applicationid, stakeholderid) VALUES ('{value}','{appid}')";
        return mQuery.Insert(insertquery);
    }
}