using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_Payment : System.Web.UI.Page
{
    ApplicantController applicantController = new ApplicantController();
    Payment payment = new Payment();
    static Transaction transaction = new Transaction();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Fill();
    }

    protected void btnPayNow_Click(object sender, EventArgs e)
    {
        if (applicantController.InsertTransRecord(transaction))
            payment.PaymentData(transaction,this);

         
    }
    public void Fill()
    {
        transaction.PhoneNumber = lblMobile.Text = "1234567890";
        transaction.ApplicationID = lblApplicationID.Text = Request.QueryString["appid"]?.ToString();
        transaction.TransactionID = Request.QueryString["appid"]?.ToString();
        transaction.Name = lblName.Text= Session["UserName"].ToString();
        transaction.Amount = 2000;
        lblAmount.Text = "2000";
    }
}