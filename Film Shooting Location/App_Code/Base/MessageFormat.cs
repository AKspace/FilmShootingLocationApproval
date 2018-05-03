using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Contains the message formats to email
/// </summary>
public class MessageFormat
{
    public static string ForgotPassword(string username,string uniqueid)
    {
        StringBuilder mesg = new StringBuilder();
        mesg.Append("Dear " + username + ",<br/><br/>");
        mesg.Append("Please click on the following link to reset your password");
        mesg.Append("<br/>");
        mesg.Append("http://localhost:56901/User/ResetPassword.aspx?uid=" + uniqueid);
        mesg.Append("<br/><br/>");
        mesg.Append("<b>Delhi Traval and Tourism Corporation</b>");
        return mesg.ToString();
    }

    public static string RegistrtationConfirmation( string userid)
    {
        StringBuilder mesg = new StringBuilder();
        mesg.Append("Thank you for contacting us  ,<br/><br/>");
        mesg.Append("We have sent a verification link below down kindly");
        mesg.Append("Please click on the following link to complete your registration process");
        mesg.Append("<br/>");
        mesg.Append("http://localhost:56901/User/ResetPassword.aspx?uid=" + userid);
        mesg.Append("<br/><br/>");
        mesg.Append("<b>Delhi Traval and Tourism Corporation</b>");
        return mesg.ToString();
    }
}