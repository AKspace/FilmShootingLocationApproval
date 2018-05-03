using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_UpdateStakeholder : System.Web.UI.Page
{
    AdminController adminController = new AdminController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        string id = "";
        if (Request.QueryString["id"] != null)
            id = Request.QueryString["id"]?.ToString();
        if (!IsPostBack)
            FillDetails(id);
    }

    private void FillDetails(string id)
    {
        btnEdit.Visible = true;
        btnEdit.Enabled = true;
        btnUpdateStakeholder.Visible = false;
        btnUpdateStakeholder.Enabled = false;
        txtAddress.Disabled = true;
        txtDescription.Disabled = true;
        txtEmail.Disabled = true;
        txtPhone.Disabled = true;
        Stakeholder stakeholder = new Stakeholder();
        stakeholder = adminController.GetStakeholder(id);
        txtName.Value = stakeholder.StakeholderName;
        txtDescription.Value = stakeholder.StakeholderDescription;
        txtEmail.Value = stakeholder.Email;
        txtPhone.Value = stakeholder.PhoneNo;
        txtAddress.Value = stakeholder.Address;

    }



    protected void btnUpdateStakeholder_Click(object sender, EventArgs e)
    {
        try
        {
            Stakeholder stakeholder = new Stakeholder();
            stakeholder.StakeHolderID = Request.QueryString["id"]?.ToString();
            stakeholder.Email = txtEmail.Value;
            stakeholder.PhoneNo = txtPhone.Value;
            stakeholder.Address = txtAddress.Value;
            stakeholder.StakeholderDescription = txtDescription.Value;
            if (adminController.UpdateStakeholder(stakeholder))
                ResponseMessage.Sucess("Location details updated successfully!!", this, true);
            else
                ResponseMessage.Warning("Chnages can not be updated!!", this);
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this, true);
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnEdit.Visible = false;
        btnEdit.Enabled = false;
        btnUpdateStakeholder.Visible = true;
        btnUpdateStakeholder.Enabled = true;
        txtAddress.Disabled = false;
        txtDescription.Disabled = false;
        txtEmail.Disabled = false;
        txtPhone.Disabled = false;

    }
}