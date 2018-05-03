using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DTFC_ForwardedApplication : System.Web.UI.Page
{
    DTFCController dtfcController = new DTFCController();
    PagedDataSource pDs = new PagedDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
            FillGridView();
    }
    #region Events
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkbtnPage.Enabled = false;
            lnkbtnPage.Font.Bold = true;
        }
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        FillGridView();
    }

    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("lnkbtnPaging"))
        {
            CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
            FillGridView();
        }
    }

    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        FillGridView();
    }

    protected void lnkbtnPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        FillGridView();
    }

    public int CurrentPage
    {
        get
        {
            if (this.ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt16(this.ViewState["CurrentPage"].ToString());
            }
        }
        set
        {
            this.ViewState["CurrentPage"] = value;
        }
    }

    private void DoPaging()
    {
        DataTable dtTable = new DataTable();
        dtTable.Columns.Add("PageIndex");
        dtTable.Columns.Add("PageText");
        for (int i = 0; i <= pDs.PageCount - 1; i++)
        {
            DataRow dtRow = dtTable.NewRow();
            dtRow[0] = i;
            dtRow[1] = i + 1;
            dtTable.Rows.Add(dtRow);
        }
        dlPaging.DataSource = dtTable;
        dlPaging.DataBind();
    }
    #endregion

    protected void linkButtonView_Click(object sender, EventArgs e)
    {
        LinkButton linkforward = sender as LinkButton;
        GridViewRow gvRow = (GridViewRow)linkforward.NamingContainer;
        string appid = ForwardedApplication.DataKeys[gvRow.RowIndex].Value.ToString();
        Response.Redirect($"FormReview.aspx?AppID={appid}");
    }
    private void FillGridView()
    {
        ForwardedApplication.DataSource = dtfcController.GetForwardApplication();
        ForwardedApplication.DataBind();
    }
}