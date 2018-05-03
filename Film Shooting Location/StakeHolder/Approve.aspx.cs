using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StakeHolder_Approve : System.Web.UI.Page
{
    string appl="",sid="",fwdid="";
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
        lblLocation.Text = stakeHolder.GetLocationName(appl,sid);
        fwdid = stakeHolder.GetForwardId(appl,sid);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int stat = 0;
        if(query.Update("update forwardstatus set statusid=3,fee='"+txtFee.Text+"' where applicationid='"+appl+"' and stakeholderid='"+sid+"' and forwardid='"+fwdid+"' and locationid in(select locationid from location where locationname='"+lblLocation.Text+"')"))
        {   
            ResponseMessage.Sucess("Successfully approved",this);
            stat=stakeHolder.GetApprovalStatus(appl);
            if(stat==0)
            {
                query.Update("update applicationstatus set statusid=2 where applicationid='"+appl+"' ");
            }
            else if(stat==1)
            {
                query.Update("update applicationstatus set statusid=5 where applicationid='" + appl + "' ");
            }
            else if(stat==2)
            {
                query.Update("update applicationstatus set statusid=3 where applicationid='" + appl + "' ");
            }
        }
        else
            ResponseMessage.Error(this);
    }
}