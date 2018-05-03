using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Administrator_ProfileUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnProfileUpdate_Click(object sender, EventArgs e)
    {
        ListControlCollections();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    private void ListControlCollections()
    {
        List<HtmlInputText> controlList = new List<HtmlInputText>();
        AddControls(adminCreateUser.Controls, controlList);

        foreach (Control str in controlList)
        {
            Response.Write(str.ID + "<br/>");
        }
        Response.Write("Total Controls:" + controlList.Count);

        string abcd = controlList[0].Value;
        string abcde = controlList[1].Value;
    }

    private void AddControls(ControlCollection page, List<HtmlInputText> controlList)
    {
        foreach (Control c in page)
        {
            if (c.ID != null )
            {
                if (c is HtmlInputText)
                {
                    controlList.Add((HtmlInputText)c);
                }
            }

            if (c.HasControls())
            {
                AddControls(c.Controls, controlList);
            }
        }
    }
}