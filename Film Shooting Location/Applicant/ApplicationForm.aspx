<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="ApplicationForm.aspx.cs" Inherits="TestFiles_wizard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
     #menu1 #application{
            background-color:#30A5FF !important;
            color:white;
        }
         .btn-border{
             border-radius:0px;
             width:70px;
             height:40px;
             font-size:18px;
         }
         .margin1{
             margin-top:10px;
         }
         .textbox{
             
         }
         .wizard-margin{
             margin-left:-70px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-4 col-sm-offset-4 col-lg-offset-2">
                <br />
                <br />

                
                <asp:Label ID="Label1" runat="server" Text="Step1" CssClass="btn btn-primary btn-border col-lg-3 col-sm-3 col-md-3" ></asp:Label>        
                <span class="col-lg-1" style="margin-top:10px;"> >> </span>
           

                <asp:Label ID="Label2" runat="server" Text="Step2" CssClass="btn btn-primary btn-border col-lg-3 col-sm-3 col-md-3"></asp:Label>
                <span class="col-lg-1" style="margin-top:10px;"> >> </span>
                <asp:Label ID="Label3" runat="server" Text="Step3" CssClass="btn btn-primary btn-border col-lg-3 col-sm-3 col-md-3"></asp:Label>
                
                <br />
        </div>
              
     
    <asp:Wizard ID="Wizard1" runat="server" Width="100%" SideBarStyle-VerticalAlign="NotSet" SideBarButtonStyle-ForeColor="White" NavigationButtonStyle-BorderStyle="Dotted" StartNextButtonStyle-CssClass="btn btn-success" CssClass="wizard-margin" FinishCompleteButtonStyle-CssClass="btn btn-success" StepNextButtonStyle-CssClass="btn btn-success" StepPreviousButtonStyle-CssClass="btn btn-default" FinishPreviousButtonStyle-CssClass="btn btn-default" ValidateRequestMode="Enabled" OnFinishButtonClick="Wizard1_FinishButtonClick" >
     <WizardSteps>
         
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
              
                <div class="" style="margin-top:12px;">
                   
                              <div class="panel-heading" style="margin-left:12px;font-size:22px;font-weight:bold;border-bottom:1px solid black">Movie Details</div>
                                <div class="panel-body">                        
                                    <asp:Label ID="label" runat="server" Text="Name of the film/Title " CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtFilmName" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="False" EnableViewState="True" ErrorMessage="Required"></asp:RequiredFieldValidator>  
                                     <asp:TextBox ID="txtFilmName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox" placeholder="Name of the film/Title " onblur="requiredField('txtFilmName')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div> 
                                     
                                    
                           <asp:Label ID="label5" runat="server" Text="Banner Name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtBannerName" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator> 
                                     <asp:TextBox ID="txtBannerName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox" placeholder="Banner Name" onblur="requiredField('txtBannerName')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div>
                                     
                                    
                                     <asp:Label ID="label6" runat="server" Text="Language Of the film" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtFilmLanguage" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                                     <asp:TextBox ID="txtFilmLanguage" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius " placeholder="Language Of the film" onblur="requiredField('txtFilmLanguage')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                  <br />
                                 </div>
                                        
                                   
                                    
                                    <asp:Label ID="label4" runat="server" Text="Movie Type" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                    
                                    <div class="form-gorup col-md-8 col-lg-8 col-sm-8">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-control form-group col-md-6 col-lg-6 col-sm-6" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected ="True">U</asp:ListItem>
                                            <asp:ListItem>U/A</asp:ListItem>
                                            <asp:ListItem>A</asp:ListItem>
                                            <asp:ListItem>S</asp:ListItem>
                                        </asp:RadioButtonList>
                                    <br />
                                        </div>
                                    
                                    <asp:Label ID="label7" runat="server" Text="Actor name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtActorName" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                                     <asp:TextBox ID="txtActorName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Actor name" onblur="requiredField('txtActorName')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div>
                                     
                                    
                                      <asp:Label ID="label8" runat="server" Text="Actress name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtActressName" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                                     <asp:TextBox ID="txtActressName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Actress name" onblur="requiredField('txtActressName')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div>
                                     
                                    
                                     <asp:Label ID="label9" runat="server" Text="Total number of cast" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtTotalCast" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>  
                                     <asp:TextBox ID="txtTotalCast" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Total number of cast" onblur="requiredField('txtTotalCast')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div>
                                     
                                   
                                    
                                      <asp:Label ID="label10" runat="server" Text="Total Number of crew" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="txtTotalCrew" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                                     <asp:TextBox ID="txtTotalCrew" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Total Number of crew" onblur="requiredField('txtTotalCrew')" ClientIDMode="Static" Height="40px" ></asp:TextBox>
                                 
                                 </div>
                                     
                                </div>
                            </div>
                 
                </asp:WizardStep>
             

            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                    <div class=""  style="margin-top:12px;">
                              <div class="panel-heading" style="margin-left:12px;font-weight:bold;font-size:22px;border-bottom:1px solid black">Producer Details</div>
                                <div class="panel-body">
                                      <asp:Label ID="label11" runat="server" Text="Name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" cssClass="label label-danger" Display="Dynamic" ControlToValidate="txtProducerName" SetFocusOnError="True"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtProducerName"  runat="server" CssClass="form-control form-group borderRadius col-md-12 col-lg-12 textbox "  placeholder="Name"  ClientIDMode="Static" Height="35px"></asp:TextBox>
                                   </div>
                                     
                                    <asp:Label ID="label12" runat="server" Text="Address" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" cssClass="label label-danger" Display="Dynamic" ControlToValidate="txtProducerAddress" runat="server" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtProducerAddress" onblur="requiredField('txtProducerAddress')" runat="server" Display="Dynamic" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox"   placeholder="Address" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />   
                                 </div>
                                     
                                    
                                    <asp:Label ID="label13" runat="server" Text="Phone Number" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" cssClass="label label-danger" ControlToValidate="txtProducerMobileNo" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ValidationExpression="^[6789][0-9]{9}" ValidationGroup="btnNext" ControlToValidate="txtProducerMobileNo" cssClass="label label-danger"  runat="server" ErrorMessage="Enter valid mobile number"></asp:RegularExpressionValidator>
                                     <asp:TextBox ID="txtProducerMobileNo" onblur="requiredField('txtProducerMobileNo')" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox" placeholder="Phone Number"  ClientIDMode="Static" Height="40px" ></asp:TextBox>
                                 <br />
                                     
                                 </div>
                                     
                                    <asp:Label ID="label14" runat="server" Text="Email" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1 " Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ValidationGroup="btnNext" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ControlToValidate="txtProducerEmail"   cssClass="label label-danger"  ErrorMessage="Enter valid email address"></asp:RegularExpressionValidator>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator23" cssClass="label label-danger" ControlToValidate="txtProducerEmail" runat="server" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtProducerEmail" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox" onblur="requiredField('txtProducerEmail')" placeholder="Email" ClientIDMode="Static" Height="40px" Style="margin-top:-20px;"></asp:TextBox>
                                 <br />   
                                 </div>
                                   
                                    <asp:Label ID="label15" runat="server" Text="Experience Profile (In Brief)" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtProducerProfile" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <textarea id="txtProducerProfile" cols="50" rows="4" placeholder=" Experience Profile (In Brief)" runat="server" onblur="requiredField('txtProducerProfile')" class="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius textbox" ClientIDMode="Static" aria-expanded="false" aria-setsize="50" draggable="false" wrap="hard" style="resize:none" Height="35px"></textarea> 
                                 <br />  
                                 </div>
                                     
                                </div>
                        <div class="panel-heading" style="margin-left:12px;font-weight:bold;font-size:22px;border-bottom:1px solid black">Director Details</div>
                                <div class="panel-body">
                                    <asp:Label ID="label16" runat="server" Text="Name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" cssClass="label label-danger" ControlToValidate="txtDirectorName" SetFocusOnError="True" Display="Dynamic"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtDirectorName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" onblur="requiredField('txtDirectorName')" ClientIDMode="Static" placeholder=" Name" Height="40px"></asp:TextBox>
                                 <br />   
                                 </div>
                                     
                                    
                                    <asp:Label ID="label17" runat="server" Text="Address" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtDirectorAddress" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtDirectorAddress" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Address" onblur="requiredField('txtDirectorAddress')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                     </div>
                                     
                                    
                                    <asp:Label ID="label18" runat="server" Text=" Phone Number" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator24"  ControlToValidate="txtDirectorMobileNo" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationExpression="^[789][0-9]{9}"  Display="Dynamic" ControlToValidate="txtDirectorMobileNo" cssClass="label label-danger"  runat="server" ErrorMessage="Enter valid mobile number"></asp:RegularExpressionValidator>
                                     <asp:TextBox ID="txtDirectorMobileNo" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Phone Number" onblur="requiredField('txtDirectorMobileNo')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />  
                                 </div>
                                    
                                   <asp:Label ID="label19" runat="server" Text="Email" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius"> 
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ControlToValidate="txtDirectorEmail"   cssClass="label label-danger"  ErrorMessage="Enter valid email address"></asp:RegularExpressionValidator>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="txtDirectorEmail" runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <asp:TextBox ID="txtDirectorEmail" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Email" onblur="requiredField('txtDirectorEmail')" ClientIDMode="Static" Height="40px" ></asp:TextBox>
                                 <br />
                                     </div>
                                    
                                     
                                    <asp:Label ID="label20" runat="server" Text="Experience Profile (In Brief)" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtDirectorProfile"  runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                     <textarea id="txtDirectorProfile" cols="50" rows="4" placeholder="Experience Profile (In Brief)" runat="server" class="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" onblur="requiredField('txtDirectorProfile')" ClientIDMode="Static" style="resize:none" ></textarea>
                                 <br />   
                                 </div>
                                     
                                </div>
                            
                            <div class="panel-heading" style="margin-left:12px;font-size:22px;font-weight:bold;border-bottom:1px solid black">Local Line Producer Details</div>
                                <div class="panel-body" >
                                    <asp:Label ID="label21" runat="server" Text="Name" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" cssClass="label label-danger" ControlToValidate="txtLocalPName" SetFocusOnError="True"  runat="server" Text="Required"></asp:RequiredFieldValidator>--%>
                                     <asp:TextBox ID="txtLocalPName" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Name" onblur="requiredField('txtLocalPName')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                 <br />
                                 </div>
                                     
                                                                    <asp:Label ID="label22" runat="server" Text="Address" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" cssClass="label label-danger" ControlToValidate="txtLocalPAddress" SetFocusOnError="True"  runat="server" Text="Required"></asp:RequiredFieldValidator>--%>
                                     <asp:TextBox ID="txtLocalPAddress" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Address" onblur="requiredField('txtLocalPAddress')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                   <br />
                                     </div>
                                     
                                
                                    <asp:Label ID="label23" runat="server" Text="Phone Number" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator26" cssClass="label label-danger" ControlToValidate="txtLocalPMobileNo" SetFocusOnError="True"  runat="server" Text="Required"></asp:RequiredFieldValidator>--%>
                                     <asp:TextBox ID="txtLocalPMobileNo" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Phone Number" onblur="requiredField('txtLocalPMobileNo')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                <br />
                                 </div>
                                   <asp:Label ID="label24" runat="server" Text="Email" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius"> 
                                  
                                     <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ControlToValidate="txtDirectorEmail"   cssClass="label label-danger"  ErrorMessage="Enter valid email address"></asp:RegularExpressionValidator>--%>
                                     <asp:TextBox ID="txtLocalPEmail" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder=" Email" onblur="requiredField('txtDirectorEmail')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                  
                                 <br />
                                 </div>
                                     
                                    <asp:Label ID="label25" runat="server" Text="Experience Profile (In Brief)" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px"></asp:Label>
                                 <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtDirectorProfile" runat="server" cssClass="label label-danger"  SetFocusOnError="True" Text="Required"></asp:RequiredFieldValidator>--%>
                                     <textarea id="txtLocalLineProfile" cols="50" rows="4" placeholder="Experience Profile (In Brief)" runat="server" class="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" onblur="requiredField('txtDirectorProfile')" ClientIDMode="Static" style="resize:none;" ></textarea>
                                 <br />   
                                 </div>
                                     
                                </div>
                        
                            
                            </div>                           
                  </asp:WizardStep>   
              <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                  <div class="" style="margin-top:12px;">
         <div class="panel-heading" style="margin-left:12px;font-size:22px;font-weight:bold;border-bottom:1px solid black">Shooting & Location Details</div>
                                <div class="panel-body">
                                    <asp:Label ID="label26" runat="server" Text="Date of Commicement" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>             
                                    <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDateofCom"  runat="server" format="MM/dd/yyyy" PopupPosition="BottomLeft" TodaysDateFormat="MMMM d,yyyy" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="txtDateOfCom"  runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtDateOfCom" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Date of Commicement" onblur="requiredField('txtDateOfCom')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                         <br />
                                    </div>
                               
                               
                        <asp:Label ID="label27" runat="server" Text="Date of end" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>             
                                    <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                   <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDateOfEnd" runat="server"  Format="MM/dd/yyyy"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="txtDateOfEnd"  runat="server" cssClass="label label-danger" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDateOfEnd" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Date of end" onblur="requiredField('txtDateOfEnd')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                            <br />        
                            </div>
                          <asp:Label ID="label28" runat="server" Text="Place of stay" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>                       
                                <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
     <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="txtStayPlace" runat="server" Display="Dynamic" cssClass="label label-danger"  SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtStayPlace" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Place of stay" onblur="requiredField('txtStayPlace')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                    <br />
                                        </div>
                                    <asp:Label ID="label29" runat="server" Text="Realease Date" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>             
                                     <div class="col-md-8 col-lg-8 col-sm-8 borderRadius">
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" TargetControlID="txtRealeaseDate" runat="server" Format="MM/dd/yyyy"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" Display="Dynamic" ControlToValidate="txtRealeaseDate" runat="server" cssClass="label label-danger"  SetFocusOnError="True" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                         <asp:TextBox ID="txtRealeaseDate" runat="server" CssClass="form-control form-group col-md-12 col-lg-12 col-sm-12 borderRadius" placeholder="Realease Date" onblur="requiredField('txtRealeaseDate')" ClientIDMode="Static" Height="40px"></asp:TextBox>
                                    
<br />
</div>
                                                                            <asp:Label ID="label32" runat="server" Text="Script keywords" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1" Font-Size="16px" ></asp:Label>             
                                     <div class="form-group col-md-8 col-lg-8 col-sm-8">
                                         <asp:CheckBoxList ID="chkListScript" runat="server" DataSourceID="SqlDataSource1" DataTextField="keywordname" DataValueField="keywordname" Width="100%" RepeatColumns="4" CssClass="col-md-12 col-lg-12 col-sm-12" >
                                         </asp:CheckBoxList>
                                         <br />
                                         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=lizz;Initial Catalog=filmshooting;Persist Security Info=True;User ID=dbAdmin1;Password=sih2018" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [keywordname] FROM [scriptkeyworddetails]"></asp:SqlDataSource>
                                     </div>
                                    <asp:Label ID="Label33" runat="server" Text="Script" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1"></asp:Label>  
                                         <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-group col-md-8 col-lg-8 col-sm-8 borderRadius" />
                                         <asp:Label ID="Label34" runat="server" Text="IMPA" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1"></asp:Label>
                                     <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-group col-md-8 col-lg-8 col-sm-8 borderRadius" />
                                         <asp:Label ID="Label35" runat="server" Text="WIFPA" CssClass="col-md-4 col-lg-4 col-sm-4 borderRadius margin1"></asp:Label>
                                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-group col-md-8 col-lg-8 col-sm-8 borderRadius" />
      

                      </div>
                      </div>
                  </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>

