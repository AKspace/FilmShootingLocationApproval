using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Status : System.Web.UI.Page
{
    static int flg = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkSelectAll_Click(object sender, EventArgs e)
    {
        if (flg == 0)
            foreach (GridViewRow grow in status.Rows)
            {
                CheckBox chkdel = (CheckBox)grow.FindControl("chkSelect");
                flg = 1;
                chkdel.Checked = true;
            }
        else
        {
            foreach (GridViewRow grow in status.Rows)
            {
                CheckBox chkdel = (CheckBox)grow.FindControl("chkSelect");
                flg = 0;
                chkdel.Checked = false;
            }
        }
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void status_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void status_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
