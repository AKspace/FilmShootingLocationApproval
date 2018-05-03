using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AddLocation : System.Web.UI.Page
{
    Location location = new Location();
    AdminController adminController = new AdminController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            adminController.GetStakeHolders(ref cbStackholder);
            SetButtonText();
        }
    }

    protected void btnAddLocation_Click(object sender, EventArgs e)
    {
        location.LocationName = txtName.Value;
        location.Latitude = txtLatitude.Value;
        location.Longitude = txtLongitude.Value;
        string stakeholder = string.Join(", ", cbStackholder.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Value));
        location.LocationID = Utility.NewID();
        location.StakeholderID = stakeholder;
        string keywords = string.Join(", ", ChkAddLocation.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Value));
        location.KeyWords = keywords;
        location.LocationDescription = txtDescription.Value;
        string path = Server.MapPath("~/Image/location/");
        location.ImagePath = path + location.LocationID + FileUploadController.FileName;
        if (adminController.AddLocation(location))
        {
            FileUploadController.SaveAs(location.ImagePath);
            ResponseMessage.Sucess("Location added successfully!!!", this, true);
        }
        else
            ResponseMessage.Error(this);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void FileUploadController_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        //string filename = System.IO.Path.GetFileName(FileUploadController.FileName);
        //FileUploadController.SaveAs(Server.MapPath("~/Administrator/Resources/images/location/") + filename);
    }

    private void SetButtonText()
    {
        if (Request.QueryString["pgtype"] != null)
        {
            string type = Request.QueryString["type"]?.ToString();
            if (type.Equals("View"))
            {
                btnAddLocation.Text = "Update";
                btnCancel.Visible = false;
                btnAddLocation.Enabled = false;
            }
        }
    }
}