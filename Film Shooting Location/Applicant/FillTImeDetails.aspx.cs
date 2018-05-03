using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class Applicant_FillTImeDetails : System.Web.UI.Page
{
    AdminController adminController = new AdminController();
    ApplicantController ac = new ApplicantController();
    List<RequestedShootingLocation> location = new List<RequestedShootingLocation>();
    DateTime dt;
    DateTime dt1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        dt = Convert.ToDateTime(Session["StartDate"]?.ToString());
        dt1 = Convert.ToDateTime(Session["EndDate"]?.ToString());

        CreateTabl(dt, dt1);
        if (!IsPostBack)
        {
            adminController.GetStakeHolders(ref cbStakeHolder);
        }
    }

    private void CreateTabl(DateTime DateOfCommencement, DateTime DateOfEnd)
    {
        table.ID = "Locationtable";
        DateTime dateTime = DateOfCommencement;
        for (int i = 0; i <= DateOfEnd.Day - DateOfCommencement.Day; i++)
        {
            TableRow tableRow = new TableRow();
            Label lb = new Label();
            lb.ID = "Label" + i.ToString() + "0";
            lb.Text = dateTime.AddDays(i).ToShortDateString();

            DropDownList dropDown = new DropDownList();
            dropDown.ID = "DropDown" + i.ToString() + "1";
            dropDown.CssClass = "locstyle focus locmargin";
            dropDown.SelectedIndexChanged += new EventHandler(FillManadatoryFields);
            dropDown.AutoPostBack = true;

            Utility.FillDropDownList(ac.GetLocation(), "locationname", "locationid", ref dropDown);

            TextBox tsA = new TextBox();
            tsA.ID = "tsA" + i.ToString() + "2";
            tsA.Attributes.Add("placeholder", "HH:MM");

            tsA.Width = 200;
            tsA.CssClass = "boxview focus locmargin col-md-3 col-sm-3";


            TextBox tsB = new TextBox();
            tsB.ID = "tsB" + i.ToString() + "3";
            tsB.Attributes.Add("placeholder", "HH:MM");

            tsB.Width = 200;
            tsB.CssClass = "boxview focus locmargin col-md-3 col-sm-3";
            for (int k = 0; k < 4; k++)
            {
                TableCell tc1 = new TableCell();
                tc1.ID = $"tabcell{i}{k}";
                tc1.Width = 200;
                tc1.Height = 50;
                tableRow.Cells.Add(tc1);
            }

            tableRow.Cells[0].Controls.Add(lb);
            tableRow.Cells[1].Controls.Add(dropDown);
            tableRow.Cells[2].Controls.Add(tsA);
            tableRow.Cells[3].Controls.Add(tsB);
            table.Rows.Add(tableRow);
        }
    }

    protected void GetControlsValue()
    {
        dt = Convert.ToDateTime(Session["StartDate"]?.ToString());
        dt1 = Convert.ToDateTime(Session["EndDate"]?.ToString());
        int diff = dt1.Day - dt.Day;
        for (int i = 0; i <= diff; i++)
        {
            location.Add(new RequestedShootingLocation());
            location[i].ApplicationID = Session["AppID"]?.ToString();
            string id = "Label" + i.ToString() + "0";
            location[i].Date = ((Label)table.FindControl(id)).Text;
            id = "DropDown" + i.ToString() + "1";
            location[i].LocationID = ((DropDownList)table.FindControl(id)).SelectedValue;
            id = "tsA" + i.ToString() + "2";
            location[i].StartTime = ((TextBox)table.FindControl(id)).Text;
            id = "tsB" + i.ToString() + "3";
            location[i].EndTIme = ((TextBox)table.FindControl(id)).Text;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GetControlsValue();
        string value = string.Join(", ", cbStakeHolder.Items.OfType<ListItem>().Where(r => r.Selected & r.Enabled==true).Select(r => r.Value));
        try
        {
            if (ac.InsertRequestedloction(location) & ac.SetApplicationForward(value, Session["AppID"]?.ToString()))
                Response.Redirect($"FormReview.aspx?appid={Session["AppID"].ToString()}");
            //ResponseMessage.Sucess($"Your application is successfully submitted!!! Your Application id is {Session["AppID"].ToString()}. ", this);
            else
                ResponseMessage.Error(this);

        }
        catch
        {
            ResponseMessage.Error(this);
        }


    }

    protected void FillManadatoryFields(object sender, EventArgs args)
    {
        DropDownList dropDownList = (DropDownList)sender;
        DataTable dt = ac.GetStakeholder(dropDownList.SelectedValue);
         foreach (DataRow dr in dt.Rows)
        {
            string temp = dr["stakeholderid"].ToString();
            foreach (ListItem item in cbStakeHolder.Items)
            {
                if (temp.Equals(item.Value) && !item.Selected)
                {
                    item.Selected = true;
                    item.Enabled = false;
                }
            }
        }
        
    }
}