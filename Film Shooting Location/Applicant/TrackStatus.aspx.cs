using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_TrackStatus : System.Web.UI.Page
{
    Query query = new Query();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }


    protected void btnTrack_Click(object sender, EventArgs e)
    {
        string appl = txtApplicationID.Value.ToString();
        txtApplied.Value = query.GetSingleValue("select dateofapplication from movie where applicationid='"+appl+"'");
        txtStatus.Value = query.GetSingleValue("select statusdetail.statusname from statusdetails,applicationstatus where applicationstatus.statusid=statusdetail.statusid and applicationstatus.applicationid='"+appl+"'");
        txtRemark.Value = query.GetSingleValue("select remarks from applicationstatus where applicationid='"+appl+"'");
    }
}