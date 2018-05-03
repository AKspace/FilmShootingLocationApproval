using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Stores Information of Film maker
/// </summary>
public class FilmMaker
{
    /// <summary>
    /// Gets or sets ApplicationID
    /// </summary>
    public string ApplicationID { get; set; }

    /// <summary>
    /// Gets or sets Name of film maker
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// Gets or sets phone number of film maker
    /// </summary>
    public string PhoneNo { get; set; }

    /// <summary>
    /// Gets or sets Email of film maker
    /// </summary>
    public string Email { get; set; }

    /// <summary>
    /// Gets or sets Address of film maker
    /// </summary>
    public string Address { get; set; }

    /// <summary>
    /// Gets or sets film make type
    /// </summary>
    public FilmMakerType Type { get; set; }

    /// <summary>
    /// Gets or sets Experience Profile of film maker
    /// </summary>
    public string ExperienceProfile { get; set; }
}