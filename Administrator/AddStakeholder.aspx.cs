using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AddStakeholder : System.Web.UI.Page
{
    Stakeholder stakeholder = new Stakeholder();
    AdminController admin = new AdminController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnAddStakeholder_Click(object sender, EventArgs e)
    {
        stakeholder.StakeholderName = txtName.Value;
        stakeholder.Email = txtEmail.Value;
        stakeholder.PhoneNo = txtPhone.Value;
        stakeholder.Address = txtAddress.Value;http://localhost:56901/Administrator/AddStakeholder.aspx.cs
        stakeholder.StakeholderDescription = txtDescription.Value;
        stakeholder.StakeHolderID = Utility.NewID();
        try
        {
            if (admin.CreateStakeholder(stakeholder))
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "window.alert('Stakeholder Created Successfully!!!!!'); window.location.reload()", true);
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "window.alert('Something Went Wrong !!!!!'); window.location.reload()", true);
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "window.alert('Something Went Wrong !!!!!'); window.location.reload()", true);

        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}