using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class TestFiles_wizard : System.Web.UI.Page
{
    Movie m = new Movie()
    {
        ApplicationID = Utility.GetApplicationId()
    };


    Utility u = new Utility();
    Table table = new Table();
    ApplicantController ac = new ApplicantController();
    FilmMaker producer = new FilmMaker
    {
        Type = FilmMakerType.Producer
    };
    FilmMaker director = new FilmMaker
    {
        Type = FilmMakerType.Director
    };
    FilmMaker locallineproducer = new FilmMaker
    {
        Type = FilmMakerType.LocalProducer,
    };


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        Page.MaintainScrollPositionOnPostBack = false;
        Page.SetFocus(Wizard1.ClientID);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

     
    }


    public void InitalizeControlList()
    {

    }
    protected void ApplicantApplicationForm_Init(object sender, EventArgs e)
    {

    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        bool suc;
        try
        {
            producer.ApplicationID = director.ApplicationID = locallineproducer.ApplicationID = m.ApplicationID;
            producer.Name = txtProducerName.Text;
            producer.Email = txtProducerEmail.Text;
            producer.PhoneNo = txtProducerMobileNo.Text;
            producer.Address = txtProducerAddress.Text;
            producer.ExperienceProfile = txtProducerProfile.Value;
            director.Name = txtDirectorName.Text;
            director.Email = txtDirectorEmail.Text;
            director.PhoneNo = txtDirectorMobileNo.Text;
            director.Address = txtDirectorAddress.Text;
            director.ExperienceProfile = txtDirectorProfile.Value;
            locallineproducer.Name = txtLocalPName.Text;
            locallineproducer.Email = txtLocalPEmail.Text;
            locallineproducer.PhoneNo = txtLocalPMobileNo.Text;
            locallineproducer.Address = txtLocalPAddress.Text;
            locallineproducer.ExperienceProfile = txtLocalLineProfile.Value;
            m.MovieName = txtFilmName.Text;
            m.ProductionHouse = txtBannerName.Text;
            m.Language = txtFilmLanguage.Text;
            m.MovieType = RadioButtonList1.SelectedItem.Text;
            m.Actor = txtActorName.Text;
            m.Actress = txtActressName.Text;
            m.userid = Session["UserID"]?.ToString();
            m.dateofregistration = DateTime.Now;
            Int16 temp = 0;
            Int16.TryParse(txtTotalCast.Text, out temp);
            m.NoOfCast = temp;
            temp = 0;
            Int16.TryParse(txtTotalCrew.Text, out temp);
            m.TotalNoOfCrew = temp;
            DateTime dateTime;
            DateTime.TryParse(txtDateOfCom.Text, out dateTime);
            m.DateOfCommencement = dateTime;
            DateTime.TryParse(txtDateOfEnd.Text, out dateTime);
            m.DateOfEnd = dateTime;
            DateTime.TryParse(txtRealeaseDate.Text, out dateTime);
            m.ReleaseDate = dateTime;
            m.StayPlace = txtStayPlace.Text;
            string path = Server.MapPath("~/Applicant/Resources/Uploads/");
            m.ScriptPath = path + m.ApplicationID + "Script" + Path.GetExtension(FileUpload1.FileName);
            m.CertificateWIFPA = path + m.ApplicationID + "WIFPA" + Path.GetExtension(FileUpload3.FileName);
            m.CertificateIMPA = path + m.ApplicationID + "IMPA" + Path.GetExtension(FileUpload2.FileName);
            FileUpload1.SaveAs(m.ScriptPath);
            FileUpload2.SaveAs(m.CertificateIMPA);
            FileUpload3.SaveAs(m.CertificateWIFPA);
            m.scriptparameter = String.Join(", ", chkListScript.Items.Cast<ListItem>()
                                           .Where(i => i.Selected));
        }

        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            ResponseMessage.Error(this);
        }

        try
        {
            if (ac.IsDateAvailable(txtDateOfCom.Text, txtDateOfEnd.Text))
            {
                if (txtLocalPName.Text == "")
                {
                    if (suc = ac.ApplyForm(ref m, producer, director))
                    {
                        Session["StartDate"] = m.DateOfCommencement;
                        Session["EndDate"] = m.DateOfEnd;
                        //Session["ApplicationID"] = m.ApplicationID;
                        Response.Redirect("FillTImeDetails.aspx");
                    }
                    else
                        ResponseMessage.Error(this);
                }
                else
                {
                    if (suc = ac.ApplyForm(ref m, producer, director, locallineproducer))
                    {
                        Session["StartDate"] = m.DateOfCommencement;
                        Session["EndDate"] = m.DateOfEnd;
                        Session["AppID"] = m.ApplicationID;
                        Response.Redirect("FillTImeDetails.aspx");

                        //ResponseMessage.Sucess($"Your application is successfully submitted!!! Your Application id is {m.ApplicationID}. ", this);
                    }
                    else
                        ResponseMessage.Error(this);
                }
            }
            else
                ResponseMessage.Warning("Dates are already booked for request", this);
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            // ResponseMessage.Warning("Your application is successfully submitted!!!", this);
        }
    }
}