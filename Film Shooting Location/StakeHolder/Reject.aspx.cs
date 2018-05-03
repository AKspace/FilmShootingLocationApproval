using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StakeHolder_Reject : System.Web.UI.Page
{
    string appl = "", sid = "";
    Query query = new Query();
    StakeHolderController stakeHolder = new StakeHolderController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        sid = stakeHolder.GetStakeHolderId(Session["UserID"].ToString());
        appl = Request.QueryString["appl"];
        lblApplicationid.Text = appl;
        lblLocation.Text = stakeHolder.GetLocationName(appl, sid);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (query.Update("update applicationstatus set statusid=4,remarks='"+txtRemarks.Text+"' where applicationid='"+appl+"'")&&query.Update("update forwardstatus set statusid=4,remarks='" + txtRemarks.Text + "' where applicationid='" + appl + "' and stakeholderid='" + sid + "' and locationid in(select locationid from location where locationname='" + lblLocation.Text + "')"))
        {
            ResponseMessage.Sucess("Successfully reject", this);
        }
        else
            ResponseMessage.Error(this);
    }
}