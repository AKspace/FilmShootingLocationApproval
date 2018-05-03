using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Default : System.Web.UI.Page
{
    UserController userController = new UserController();
    global::User user = new global::User();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            FillDetails();
        }

    }

    protected void buttonupdateuser_Click(object sender, EventArgs e)
    {
        user.UserID = Session["UserID"].ToString();
        user.Name = $"{txtFirstName.Value} {txtLastName.Value}";
        user.PhoneNO = txtPhone.Value;
        user.Address = txtAddress.Value;
        user.AdhaarID = txtAdhaar.Value;
        user.DateOfBirth = txtDob.Text;
        user.Gender = ValueConverter.ToGender(radioButtonListGender.SelectedValue);
        try
        {
            string responesurl = $"~/{Session["UserRole"].ToString()}/";
            if (userController.UpdateUserInfo(user))
                Response.Redirect(responesurl);
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this);
        }


    }

    #region Helper Function

    private void FillDetails()
    {
        string userid = Session["UserID"]?.ToString();
        if (!string.IsNullOrWhiteSpace(userid))
        {
            user = userController.GetUserInfo(userid);
            txtAddress.Value = user.Address;
            txtAdhaar.Value = user.AdhaarID;
            txtDob.Text = user.DateOfBirth;
            txtEmail.Value = user.Email;
            string[] array = user.Name?.Split(' ');
            txtFirstName.Value = array[0] ?? null;
            txtLastName.Value = array[array.Length - 1] ?? null;
            txtPhone.Value = user.PhoneNO;
            radioButtonListGender.SelectedValue = user.Gender.ToString();
        }

        try
        {
            if (userController.IsActive(userid))
            {
                txtFirstName.Disabled = true;
                txtLastName.Disabled = true;
                radioButtonListGender.Enabled = false;
                txtDob.Enabled = false;

            }
        }
        catch(Exception ex)
        {
            ResponseMessage.Error(this);
        }
    }

    #endregion
}