using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTFC_Calendar : System.Web.UI.Page
{
    AdminController adminController = new AdminController();
    DTFCController controller = new DTFCController();
    private static System.Data.DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ddlLocation.DataSource = adminController.GetLocations();
            ddlLocation.DataBind();
            ListItem listItem = new ListItem();
            listItem.Text = "Select Location";
            listItem.Value = "0";
            ddlLocation.Items.Add(listItem);
            listItem.Selected = true;

        }
            
    }

    protected void fill()
    {
        GridViewDates.DataSource = dt;
        GridViewDates.DataBind();
    }

    protected void CalendarSelectDate_SelectionChanged(object sender, EventArgs e)
    {
        if (!ddlLocation.SelectedValue.Equals("0"))
        {
            if (dt is null)
                dt = new System.Data.DataTable();

            if (dt.Columns.Count <= 0)
            {
                dt.Columns.Add("Locationname");
                dt.Columns.Add("Dates");
                griddiv.Visible = true;
            }
            System.Data.DataRow dr = dt.NewRow();
            dr["Locationname"] = ddlLocation.SelectedValue.ToString();
            dr["Dates"] = CalendarSelectDate.SelectedDate.ToShortDateString();
            dt.Rows.Add(dr);
            fill();
        }
        else
        {
            ResponseMessage.Warning("Please select  location!!", this);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (controller.UpdateDatesStatus(dt))
        {
            dt = null;
            ResponseMessage.Sucess("Dates availability set to false", this, true);
            
        }
        else
        {
            ResponseMessage.Error(this);
            Response.Redirect("Calendar.aspx");
        }
    }

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!ddlLocation.SelectedValue.Equals("0"))
            ddlLocation.Enabled = false;
    }
}