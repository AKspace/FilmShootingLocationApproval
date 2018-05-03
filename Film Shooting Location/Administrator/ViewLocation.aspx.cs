using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Administrator_UpdateLocation : System.Web.UI.Page
{
    AdminController adminController = new AdminController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        string id = "";
        if(Request.QueryString["id"] != null)
            id = Request.QueryString["id"]?.ToString();
        if (!IsPostBack)
            FillDetails(id);
    }

    protected void btnUpdateLocation_Click(object sender, EventArgs e)
    {
        try
        {
            Location location = new Location();
            location.LocationID = Request.QueryString["id"]?.ToString();
            location.LocationDescription = txtDescription.Value;
            location.KeyWords = txtKeyword.Value;
            location.LocationName = txtName.Value;
            location.Latitude = txtLatitude.Value;
            location.Longitude = txtLongitude.Value;
            location.StakeholderID = string.Join(", ", cbStackholder.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Value));

            if (adminController.UpdateLocation(location))
            {
                ResponseMessage.Sucess("Location details updated successfully!!", this, true);
            }
            else
                ResponseMessage.Warning("Chnages can not be updated!!", this);
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this,true);
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        txtDescription.Disabled = false;
        txtKeyword.Disabled = false;
        cbStackholder.Enabled = true;
        btnEdit.Enabled = false;
        txtName.Disabled = false;
        txtDescription.Disabled = false;
        txtLatitude.Disabled = false;
        txtLongitude.Disabled = false;
        btnUpdateLocation.Enabled = true;
    }

    protected void FillDetails(string id)
    {
        btnUpdateLocation.Enabled = false;
        txtDescription.Disabled = true;
        txtKeyword.Disabled = true;
        cbStackholder.Enabled = false;
        Location location = adminController.GetLocation(id);
        txtName.Value = location.LocationName;
        txtLatitude.Value = location.Latitude;
        txtLongitude.Value = location.Longitude;
        txtDescription.Value = location.LocationDescription;
        txtKeyword.Value = location.KeyWords;
        var ids = location.StakeholderID.Split(',');
        foreach (string item in ids)
        {
            cbStackholder.SelectedValue = item;
        }
    }
}