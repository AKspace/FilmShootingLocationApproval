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
    string lat=" ";
    string lan=" ";


    
    protected void Page_Load(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "initialize()", true);
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if(!IsPostBack)
        {
            adminController.GetStakeHolders(ref cbStackholder);
        }
        
        
        
    }
   

    protected void btnAddLocation_Click(object sender, EventArgs e)
    {
        
        location.LocationName = txtName.Value;
        location.Latitude = txtLatitude.Value;
        location.Longitude = txtLongitude.Value;
        string stakeholder = string.Join(", ", cbStackholder.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Value));
        location.StakeholderID = stakeholder;
        location.LocationDescription = txtDescription.Text;
        string path = Server.MapPath("~/Image/location/");
        location.ImagePath = path+location.LocationID+FileUploadController.FileName;
        if (adminController.AddLocation(location))
        {
            FileUploadController.SaveAs(location.ImagePath);
            ResponseMessage.Sucess("Location added successfully!!!", this,true);
        }
        else
            ResponseMessage.Error(this);

    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "initialize()", true);
        lat = latlon1.Value;
        lan = latlon2.Value;
        txtLongitude.Value = lat;
        txtLatitude.Value =lan;
    }
}