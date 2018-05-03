using System;


/// <summary>
/// Store information of user
/// </summary>
public class User
{
    string muserid;
    #region Public Properties
    /// <summary>
    /// Gets or sets User id
    /// </summary>
    public string UserID
    {
        get
        {
            if (string.IsNullOrWhiteSpace(muserid)) throw new Exception("UserID must me assign before its use");
            return muserid;
        }
        set
        {
            muserid = value;
        }
    }

    /// <summary>
    /// Gets or sets Email of user
    /// </summary>
    public string Email { get; set; }

    /// <summary>
    /// Gets or sets Name of user
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// Gets or sets Phone number of user
    /// </summary>
    public string PhoneNO { get; set; }

    /// <summary>
    /// Gets or sets Gender of user
    /// </summary>
    public Gender Gender { get; set; }

    /// <summary>
    /// Gets or sets date of birth of user
    /// </summary>
    public string DateOfBirth { get; set; }

    /// <summary>
    /// Gets or sets Address of user
    /// </summary>
    public string Address { get; set; }

    /// <summary>
    /// Gets or sets Adhaar of user
    /// </summary>
    public string AdhaarID { get; set; }

    /// <summary>
    /// Gets or sets password
    /// </summary>
    public string Password { get; set; }

    /// <summary>
    /// Gets or sets role code of user
    /// </summary>
    public UserType Role { get; set; }

    /// <summary>
    /// Gets or sets last login date of user
    /// </summary>
    public DateTime LastLoginDate { get; set; }

    /// <summary>
    /// Gets or sets date of last password change of account
    /// </summary>
    public DateTime LastPasswordChangeDate { get; set; }

    /// <summary>
    /// Gets or sets Creation date of account
    /// </summary>
    public DateTime CreationDate { get; set; }

    /// <summary>
    /// Gets or sets modification date  of account
    /// </summary>
    public DateTime ModificationDate { get; set; }

    #endregion

}