using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    UserController userController = new UserController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillAccoutSummary();

    }

    protected void FillAccoutSummary()
    {
        string userid = Session["UserID"]?.ToString();
        global::User user = userController.GetAccountSummary(userid);
        txtCreationDate.Value = user.CreationDate.ToString();
        txtLastLogin.Value = user.LastLoginDate.ToString();
        txtLastPasswordChange.Value = user.LastPasswordChangeDate.ToString();
        txtModificationDate.Value = user.ModificationDate.ToString();
    }
}