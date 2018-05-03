using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserRole"] != null)
        {
            string user = Session["UserRole"].ToString();
            Response.Redirect($"/{user}/");
        }
    }
}