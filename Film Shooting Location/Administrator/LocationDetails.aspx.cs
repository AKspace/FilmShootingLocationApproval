using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_ManageStackHolder : System.Web.UI.Page
{
    AdminController admincontroller = new AdminController();
    PagedDataSource pDs = new PagedDataSource();
    static CheckBox chkRole = new CheckBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            FillGridView();
        }
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

    protected void LocationDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibtndelete = sender as ImageButton;
        GridViewRow gvRow = (GridViewRow)ibtndelete.NamingContainer;
        if (admincontroller.Deletelocation(LocationDetails.DataKeys[gvRow.RowIndex].Value.ToString()))
        {
            ResponseMessage.Sucess("One record is deleted successfully!!", this);
            FillGridView();
        }
        else
        {
            ResponseMessage.Error(this);
        }
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ibtnEdit = sender as ImageButton;
        GridViewRow gvRow = (GridViewRow)ibtnEdit.NamingContainer;
        Response.Redirect($"ViewLocation.aspx?id={LocationDetails.DataKeys[gvRow.RowIndex].Value.ToString()}");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //int count = 0;
        //try
        //{
        //    foreach (GridViewRow gvRow in LocationDetails.Rows)
        //    {
        //        chkRole = (CheckBox)gvRow.FindControl("chkSelect");
        //        if ((chkRole.Checked == true))
        //        {

        //            if (admincontroller.Deletelocation(LocationDetails.DataKeys[gvRow.RowIndex].Value.ToString()))
        //                count += 1;
        //        }
        //    }
        //    ResponseMessage.Sucess($"{count} Record deleted succesfully", this);
        //}
        //catch(Exception ex)
        //{
        //    Utility.LogEntry(ex);
        //    ResponseMessage.Error(this);
        //}
    }

    #endregion

    #region Protected function
    protected void FillGridView()
    {
        DataTable dataTable = admincontroller.GetLocations();
        pDs.DataSource = dataTable.DefaultView;
        pDs.AllowPaging = true;
        pDs.PageSize = Convert.ToInt16(ddlPageSize.SelectedValue);
        if (CurrentPage >= pDs.PageCount)
        {
            CurrentPage = CurrentPage - 1;
        }
        pDs.CurrentPageIndex = CurrentPage;
        lnkbtnNext.Enabled = !(pDs.IsLastPage);
        lnkbtnPrevious.Enabled = !(pDs.IsFirstPage);
        LocationDetails.DataSource = pDs;
        LocationDetails.DataBind();
        DoPaging();
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
}