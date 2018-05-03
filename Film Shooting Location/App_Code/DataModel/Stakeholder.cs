using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Provides data of stakeholder
/// </summary>
public class Stakeholder
{
    /// <summary>
    /// Gets or sets ID of stakeholder
    /// </summary>
    public string StakeHolderID { get; set; }

    /// <summary>
    /// Gets or sets  name of stakeholder
    /// </summary>
    public string StakeholderName { get; set; }

    /// <summary>
    /// Gets or sets description of stakeholder
    /// </summary>
    public string StakeholderDescription { get; set; }

    /// <summary>
    /// Gets or sets Email of stakeholder
    /// </summary>
    public string Email { get; set; }

    /// <summary>
    /// Gets or sets Phone number of stakeholder
    /// </summary>
    public string PhoneNo { get; set; }

    /// <summary>
    /// Gets or sets Address of stakeholder
    /// </summary>
    public string Address { get; set; }
}