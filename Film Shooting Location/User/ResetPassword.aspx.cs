using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Forgetpassword : System.Web.UI.Page
{
    UserController usercontroller = new UserController();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!usercontroller.IslinkValid(Request.QueryString["uid"]?.ToString()))
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "removeElement('mainContent')", true);
        else
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "removeElement('alterContent')", true);

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {

                var resetid = Request.QueryString["uid"].ToString();
                if (usercontroller.ChangePassword(resetid, txtNewPwd.Value))
                {
                    Session["ResponseMessage"] = "Your password has been change.!!!!.</br> You May Login now.";
                    Response.Redirect("~/Login.aspx?response=success");
                }
                else
                    ResponseMessage.Error(this);        
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this);
        }
        
        
    }


}