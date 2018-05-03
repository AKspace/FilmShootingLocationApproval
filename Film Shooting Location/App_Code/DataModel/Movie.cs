using System;

/// <summary>
/// Stores description of Movie
/// </summary>
public class Movie
{ 
    #region Public Properties
    public DateTime dateofregistration { get; set; }
    public string scriptparameter { get; set; }
    public string userid { get; set; }
    /// <summary>
    /// Gets or sets ApplicationID
    /// </summary>
    public string ApplicationID { get; set; }

    /// <summary>
    /// Gets or sets name of movie
    /// </summary>
    public string MovieName { get; set; }

    /// <summary>
    /// Gets or sets production house name of the movie
    /// </summary>
    public string ProductionHouse { get; set; }

    /// <summary>
    /// Gets or sets Language of movie
    /// </summary>
    public string Language { get; set; }

    /// <summary>
    /// Gets or sets type of the movie
    /// </summary>
    public string MovieType { get; set; }

    /// <summary>
    /// Gets or sets actor name
    /// </summary>
    public string Actor { get; set; }

    /// <summary>
    /// Gets or sets actress name
    /// </summary>
    public string Actress { get; set; }

    /// <summary>
    /// Gets or sets no of people participating in shooting on a location
    /// </summary>
    public int NoOfCast { get; set; }


    /// <summary>
    /// Gets or sets total no of people in film unit
    /// </summary>
    public int TotalNoOfCrew  { get; set; }

    /// <summary>
    /// Gets or sets date of commencement of shooting
    /// </summary>
    public DateTime DateOfCommencement { get; set; }

    /// <summary>
    /// Gets or sets date of end shooting
    /// </summary>
    public DateTime DateOfEnd { get; set; }

    /// <summary>
    /// Gets or sets place od staying film unit
    /// </summary>
    public string StayPlace { get; set; }

    /// <summary>
    /// Gets or sets release date of movie
    /// </summary>
    public DateTime ReleaseDate { get; set; }

    /// <summary>
    /// Gets or sets path of script file
    /// </summary>
    public string ScriptPath { get; set; }

    /// <summary>
    /// Gets or sets path for IMPA certificate file
    /// </summary>
    public string CertificateIMPA { get; set; }

    /// <summary>
    /// Gets or sets path for certificate WIFPA file
    /// </summary>
    public string CertificateWIFPA { get; set; }
    #endregion
}