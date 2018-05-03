using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Converts value from one type to another type
/// </summary>
public class ValueConverter
{

    /// <summary>
    /// Converts string to <see cref="UserType"/> 
    /// </summary>
    /// <param name="value">User Type</param>
    /// <returns></returns>
    public static UserType ToUserType(string value)
    {
        if (!string.IsNullOrWhiteSpace(value))
            return (UserType)Enum.Parse(typeof(UserType), value);
        else
            return UserType.None;
        
    }

    /// <summary>
    /// Converts string to <see cref="Gender"/> 
    /// </summary>
    /// <param name="value"><see cref="Gender"/></param>
    /// <returns></returns>
    public static Gender ToGender(string value)
    {
        if (!string.IsNullOrWhiteSpace(value))
            return (Gender)Enum.Parse(typeof(Gender), value);
        else
            return Gender.Other;
    }

    public static Status ToStatus(string value)
    {
        if (!string.IsNullOrWhiteSpace(value))
            return (Status)Enum.Parse(typeof(Status), value);
        else
            return Status.None;
    }
}