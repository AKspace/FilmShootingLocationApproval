using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StakeHolder_Default : System.Web.UI.Page
{
    DTFCController dTFCController = new DTFCController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        //if (!IsPostBack)
        //{
        //    LabelPending.Text = dTFCController.GetPendingApplicationCount().ToString();
        //    LabelApproved.Text = dTFCController.GetApprovedApplicationCount().ToString();
        //    LabelRejected.Text = dTFCController.GetRejctedApplicationCount().ToString();
        //    LabelTotal.Text = dTFCController.GetForwardedApplicationCount().ToString();
        //}
    }
}