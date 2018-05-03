using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Applicant_review1 : System.Web.UI.Page
{
    //string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    static string q1, q2, q3, q4, q5;
    Query q = new Query();
    ConnectionUtility cu = new ConnectionUtility();
    SqlDataAdapter sqlda = new SqlDataAdapter();
    string appl="";
    SqlCommand com = new SqlCommand();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }


        //appl = q.GetSingleValue("applicationid", "movie", "userid='" + Session["UserID"].ToString() + "' and dateofapplication=(select max(dateofapplication) from movie where userid='" + Session["UserID"] + "')");
        appl = Request.QueryString["AppID"]?.ToString();
        if (!IsPostBack)
        {
            if (string.IsNullOrWhiteSpace(appl))
            {
                btnSubmit.Enabled = false;
                ddlApplicationid.Visible = true;
                Utility.FillDropDownList("select applicationid,userid from movie where userid='" + Session["UserID"] + "' and formcompleted=0", ddlApplicationid, "applicationid", "applicationid");
            }
            else
                Bind(appl);
        }
     
    }
    protected void bindform(ref FormView fm, string que)
    {
        SqlConnection conn = cu.OpenConnection();
        dt = new DataTable();
        com.Connection = conn;
        com.CommandText = que;
        sqlda = new SqlDataAdapter(com);
        sqlda.Fill(dt);
        fm.DataSource = dt;
        fm.DataBind();
    }
    protected void ddlApplicationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind(ddlApplicationid.SelectedItem.ToString());
            btnSubmit.Enabled = true;
        }
    }

    private void Bind(string appl)
    {
        
        q1 = "select applicationid,moviename,movietype,language,productionhouse from movie where applicationid='" + appl + "'";
        q2 = "select applicationid,name,email,phoneno,address,experianceprofile,type from filmmaker where applicationid='" + appl + "' and type='Producer'";
        q3 = "select applicationid,name,email,phoneno,address,experianceprofile,type from filmmaker where applicationid='" + appl + "' and type='Director'";
        q4 = "select applicationid,name,email,phoneno,address,experianceprofile,type from filmmaker where applicationid='" + appl + "' and type='LocalProducer'";
        q5 = "select applicationid,actor,actress,noofcast,totalnooffilmunit,dateofcommencement,dateofend,releasedate,stayplace from movie where applicationid='" + appl + "'";
        if (!IsPostBack)
        {
            //appl = q.GetSingleValue("applicationid", "movie", "userid='" + Session["UserID"].ToString() + "' and dateofapplication=(select max(dateofapplication) from movie where userid='" + Session["UserID"] + "')");
            bindform(ref FormView1, q1);
            bindform(ref FormView2, q2);
            bindform(ref FormView3, q3);
            bindform(ref FormView4, q4);
            bindform(ref FormView5, q5);
        }
    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        SqlConnection conn = cu.OpenConnection();
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        FormView1.DataBind();
        bindform(ref FormView1, q1);
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DataKey key = FormView1.DataKey;
        TextBox txtmoviename = (TextBox)FormView1.FindControl("txtmoviename");
        TextBox txtmovietype = (TextBox)FormView1.FindControl("txtmovietype");
        TextBox txtlanguage = (TextBox)FormView1.FindControl("txtlanguage");
        TextBox txtproductionhouse = (TextBox)FormView1.FindControl("txtproductionhouse");
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update movie set moviename='" + txtmoviename.Text + "',movietype='" + txtmovietype.Text + "',language='" + txtlanguage.Text + "',productionhouse='" + txtproductionhouse.Text + "' where applicationid='" + key.Value.ToString() + "'";
        com.ExecuteNonQuery();
        Response.Write("Record updated successfully");
        bindform(ref FormView1, q1);
        conn.Close();
    }
    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        FormView2.ChangeMode(FormViewMode.ReadOnly);
        bindform(ref FormView2, q2);
    }
    protected void FormView2_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        TextBox txtname = (TextBox)FormView2.FindControl("txtName1");
        TextBox txtexperience = (TextBox)FormView2.FindControl("txtExperienceProfile1");
        TextBox txtphoneno = (TextBox)FormView2.FindControl("txtPhone1");
        TextBox txtaddress = (TextBox)FormView2.FindControl("txtAddress1");
        TextBox txtEmail = (TextBox)FormView2.FindControl("txtEmail1");
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update filmmaker set name='" + txtname.Text + "',phoneno='" + txtphoneno.Text + "',email='" + txtEmail.Text + "',address='" + txtaddress.Text + "',experianceprofile='" + txtexperience.Text + "' where applicationid='" + appl + "' and type='Producer'";
        com.ExecuteNonQuery();
        Response.Write("Record updated successfully");
        bindform(ref FormView2, q2);
        conn.Close();
    }
    protected void FormView3_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        FormView3.ChangeMode(FormViewMode.ReadOnly);
        bindform(ref FormView3, q3);
    }
    protected void FormView3_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        TextBox txtname = (TextBox)FormView3.FindControl("txtName2");
        TextBox txtexperience = (TextBox)FormView3.FindControl("txtExperiencePofile2");
        TextBox txtphoneno = (TextBox)FormView3.FindControl("txtPhone2");
        TextBox txtaddress = (TextBox)FormView3.FindControl("txtAddress2");
        TextBox txtEmail = (TextBox)FormView3.FindControl("txtEmail2");
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update filmmaker set name='" + txtname.Text + "',phoneno='" + txtphoneno.Text + "',email='" + txtEmail.Text + "',address='" + txtaddress.Text + "',experianceprofile='" + txtexperience.Text + "' where applicationid='" + appl + "' and type='Director'";
        com.ExecuteNonQuery();
        Response.Write("Record updated successfully");
        bindform(ref FormView3, q3);
        conn.Close();
    }
    protected void FormView4_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        FormView4.ChangeMode(FormViewMode.ReadOnly);
        bindform(ref FormView4, q4);
    }
    protected void FormView4_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        TextBox txtname = (TextBox)FormView4.FindControl("txtName3");
        TextBox txtexperience = (TextBox)FormView4.FindControl("txtExperiencePofile3");
        TextBox txtphoneno = (TextBox)FormView4.FindControl("txtPhone3");
        TextBox txtaddress = (TextBox)FormView4.FindControl("txtAddress3");
        TextBox txtEmail = (TextBox)FormView4.FindControl("txtEmail3");
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update filmmaker set name='" + txtname.Text + "',phoneno='" + txtphoneno.Text + "',email='" + txtEmail.Text + "',address='" + txtaddress.Text + "',experianceprofile='" + txtexperience.Text + "' where applicationid='" + appl + "' and type='LocalProducer'";
        com.ExecuteNonQuery();
        Response.Write("Record updated successfully");
        bindform(ref FormView4, q4);
        conn.Close();
    }
    protected void FormView5_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        FormView5.ChangeMode(FormViewMode.ReadOnly);
        bindform(ref FormView5, q5);
    }
    protected void FormView5_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        TextBox txtactor = (TextBox)FormView5.FindControl("txtActor");
        TextBox txtactoress = (TextBox)FormView5.FindControl("txtActoress");
        TextBox txtnoofcast = (TextBox)FormView5.FindControl("txtNoOfCast");
        TextBox txttotalnooffilmunit = (TextBox)FormView5.FindControl("txtTotalNoOfFilmUnit");
        TextBox txtdateofcommencement = (TextBox)FormView5.FindControl("txtDateOfCommencement");
        TextBox txtdateofend = (TextBox)FormView5.FindControl("txtDateOfEnd");
        TextBox txtstayplace = (TextBox)FormView5.FindControl("txtStayPlace");
        TextBox txtreleasedate = (TextBox)FormView5.FindControl("txtReleaseDate");
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update movie set actor='" + txtactor.Text + "',actress='" + txtactoress.Text + "',noofcast='" + txtnoofcast.Text + "',totalnooffilmunit='" + txttotalnooffilmunit + "',dateofcommencement='" + txtdateofcommencement.Text + "',dateofend='" + txtdateofend.Text + "',stayplace='" + txtstayplace.Text + "',releasedate='" + txtreleasedate.Text + "'";
        com.ExecuteNonQuery();
        Response.Write("Record updated successfully");
        bindform(ref FormView5, q5);
        conn.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = cu.OpenConnection();
        com.Connection = conn;
        com.CommandText = "update movie set formcompleted=1 where applicationid='" + appl + "'";
        com.ExecuteNonQuery();
        conn.Close();

        q.Insert("insert into applicationstatus(applicationid,userid,statusid) values('" + appl + "','" + Session["UserID"] + "',1)");

        Response.Redirect($"Payment.aspx?appid={appl}");
    }
    protected void EditButton_Click(object sender, EventArgs e)
    {
        FormView1.ChangeMode(FormViewMode.Edit);
        bindform(ref FormView1, q1);
        FormView2.ChangeMode(FormViewMode.Edit);
        bindform(ref FormView2, q2);
        FormView3.ChangeMode(FormViewMode.Edit);
        bindform(ref FormView3, q3);
        FormView4.ChangeMode(FormViewMode.Edit);
        bindform(ref FormView4, q4);
        FormView5.ChangeMode(FormViewMode.Edit);
        bindform(ref FormView5, q5);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect($"ApplicationForm.aspx?appid={appl}");
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {

    }
}