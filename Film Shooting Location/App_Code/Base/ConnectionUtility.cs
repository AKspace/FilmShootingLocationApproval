using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Provides Functionality to connect to databse 
/// </summary>
 public class ConnectionUtility
{
    #region Private Members

    /// <summary>
    /// Connection string to connect to Database
    /// </summary>
    private static readonly string mConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();

    /// <summary>
    /// Connectio string to connect to local Databse
    /// </summary>
    private static readonly string mConnectionStringLocal = ConfigurationManager.ConnectionStrings["conntemp"].ConnectionString.ToString();

    /// <summary>
    /// Stores Connection Details
    /// </summary>
    private SqlConnection mSqlConnection;

    ///// <summary>
    ///// Stores SqlCommand to execute query
    ///// </summary>
    //private SqlCommand mSqlCommand;

    ///// <summary>
    ///// Controls transaction over a transaction
    ///// </summary>
    //private SqlTransaction mSqlTransaction;
    #endregion

    #region Protected Property

    /// <summary>
    /// Gets connection string for
    /// </summary>
    protected string ConnectionString
    {
        get { return mConnectionString; }
    }

    /// <summary>
    /// Gets Connection string for local database
    /// </summary>
    protected string ConnectionStringLocal
    {
        get { return mConnectionStringLocal; }
    }
    #endregion

    #region Public Property
    /// <summary>
    /// Gets connection status is open or close
    /// </summary>
    public bool IsOpen
    {
        get
        {
            // return true if connection is not null and connection state is open
            if (mSqlConnection != null && mSqlConnection.State == ConnectionState.Open)
                return true;
            return false;
        }
    }
    #endregion

    #region Helper Function
    /// <summary>
    /// Open a connection to databse and return sqlconnection having an open connection
    /// </summary>
    /// <returns><see cref="SqlConnection"/></returns>
    public SqlConnection OpenConnection()
    {
        //return existing connection if connection is already open
        if (IsOpen)
            return mSqlConnection;

        //Open a Connection for database
        mSqlConnection = new SqlConnection();
        try
        {
            // Try to connect to server Database
            mSqlConnection.ConnectionString = ConnectionString;
            mSqlConnection.Open();
            return mSqlConnection;
        }
        catch (SqlException ex)
        { 
            Exception df = ex.InnerException;
            string msg = df.Message.ToString();
            // If sever database doe snot exist then try to connect to local database
            mSqlConnection.ConnectionString = ConnectionStringLocal;
            mSqlConnection.Open();
            return mSqlConnection;
        }
    }

    public void CloseConnection()
    {
        if (IsOpen)
            mSqlConnection.Close();
    }
    #endregion
}