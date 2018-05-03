using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Changepassword : System.Web.UI.Page
{
    UserController usercontroller = new UserController();
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        
        try
        {
            var resetid = Session["UserID"].ToString();
            if (usercontroller.Authenticate(txtoldpwd.Value, resetid))
            {
                if (usercontroller.UpdatePassword(txtNewPwd.Text, resetid))
                    ResponseMessage.Sucess("Your password has been changed successfully!!", this, true);
                else
                    ResponseMessage.Error(this);
            }
            else
            {
                ResponseMessage.Warning("Please enter correct password!!", this);
            }
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this, true);
        }
    }
}