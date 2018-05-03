using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Stores information of requested shooting location with date time 
/// </summary>
public class RequestedShootingLocation
{
    /// <summary>
    /// Gets or Sets Location id
    /// </summary>
    public string LocationID { get; set; }

    /// <summary>
    /// Gets or Sets Application ID
    /// </summary>
    public string ApplicationID { get; set; }

    /// <summary>
    /// Gets or sets shooting start time
    /// </summary>
    public string Date { get; set; }

    /// <summary>
    /// Gets or sets shooting start time
    /// </summary>
    public string StartTime { get; set; }
    
    /// <summary>
    /// Gets or sets shooting end time
    /// </summary>
    public string EndTIme { get; set; }

    /// <summary>
    /// Gets or sets path to store shooting script
    /// </summary>
    public string ScriptPath { get; set; }
    
}