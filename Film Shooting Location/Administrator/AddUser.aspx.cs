using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AddUser : System.Web.UI.Page
{
    AdminController adminController = new AdminController();
    UserController userController = new UserController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Utility.FillDropDownList(adminController.GetStakeHolders(), "stakeholdername", "stakeholderID", ref DropDownListUserType);
            ListItem listItem = new ListItem();
            listItem.Text = "DTTDC";
            listItem.Value = "DTFC";
            DropDownListUserType.Items.Add(listItem);

        }
    }

    protected void buttonAddUser_Click(object sender, EventArgs e)
    {
        if (DropDownListUserType.SelectedIndex >= 1)
        {
            if (!string.IsNullOrWhiteSpace(txtEmail.Value))
            {
                try
                {
                    if (!userController.IsUserExist(txtEmail.Value))
                    {
                        Email email = new Email();
                        email.IsBodyHTML = true;
                        email.Subject = "Complete Your Registration";
                        string usertype = UserType.Stakeholder.ToString();
                        if (DropDownListUserType.SelectedValue == UserType.DTFC.ToString())
                            usertype = UserType.DTFC.ToString();

                        if (adminController.AddUser(txtEmail.Value, usertype, DropDownListUserType.SelectedValue, out string uniqueid))
                        {
                            email.Body = MessageFormat.RegistrtationConfirmation(uniqueid);
                            email.SendMail(txtEmail.Value);
                            ResponseMessage.Sucess("User Created Successfully!!! An Email send to user account to complete the process ", this,true);
                        }
                        else
                            ResponseMessage.Error(this);
                    }
                    else
                        ResponseMessage.Warning("User already exist!!!", this);
                }
                catch (Exception ex)
                {
                    Utility.LogEntry(ex);
                    ResponseMessage.Error(this);
                }
            }
        }
        else
            ResponseMessage.Warning("Please select User Type", this);
    }

    protected void DropDownListUserType_SelectedIndexChanged(object sender, EventArgs e)
    {
        
            
    }
}