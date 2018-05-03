using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Session["UserRole"] != null)
        {
            if (!Session["UserRole"].ToString().Equals(UserType.Administrator.ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        if (Session["UserName"] != null)
        {
            lblUsername.Text = Session["UserName"].ToString();
        }

    }

   
}
