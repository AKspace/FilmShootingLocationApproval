using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Stores information of locations
/// </summary>
public class Location
{
    #region Public Properties
    /// <summary>
    /// Gets or sets the location id for location
    /// </summary>
    public string LocationID { get; set; }

    /// <summary>
    /// Gets or sets the Name for location
    /// </summary>
    public string LocationName { get; set; }

    /// <summary>
    /// Gets or sets location decsription
    /// </summary>
    public string LocationDescription { get; set; }

    /// <summary>
    /// Gets or sets the statkeholder id for location
    /// </summary>
    public string StakeholderID { get; set; }

    /// <summary>
    /// Gets or sets the location latitude
    /// </summary>
    public string Latitude { get; set; }

    /// <summary>
    ///  Gets or sets the location longitude
    /// </summary>
    public string Longitude { get; set; }

    /// <summary>
    ///  Gets or sets the path for images of location
    /// </summary>
    public string ImagePath { get; set; }

    /// <summary>
    ///  Gets or sets the keywords for location
    /// </summary>
    public string KeyWords { get; set; }
    #endregion
}