using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Stores Information of user role
/// </summary>
public class UserRole
{
    /// <summary>
    /// Gets or sets RoleID of user role
    /// </summary>
    public string RoleID { get; set; }

    /// <summary>
    /// Gets or sets type of user
    /// </summary>
    public UserType RoleCode { get; set; }

    /// <summary>
    /// Gets or sets role name
    /// </summary>
    public string RoleName { get; set; }

    /// <summary>
    /// Gets or sets description of role
    /// </summary>
    public string RoleDescription { get; set; }
}