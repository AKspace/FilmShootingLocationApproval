<%@ Page Title="Add User" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="UpdateDetails.aspx.cs" Inherits="Administrator_Default" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
   .alignment
    {
    text-align:center;
    }
   
    #menu1 #UpdateDetails{
        background-color:#30A5FF;
        color:white;
    }
    
    .search
        {
          background:url('/Image/icon/calender.png')right no-repeat;
            
            border:1px solid #ccc;
        }
    .form{
        width:100%;
        height:40px;
        border-radius:3px;
        border-color:#DDDDDD;
    }
        </style>
    
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
            <div class="row">
			<ol class="breadcrumb">
				<li><a href="/User/Default.aspx">Dashboard</a></li>
                <li class="active">Update User</li>
			</ol>
		    </div>
            <div class="row">
		        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			            <div class="login-panel panel panel-default alertForError">
				    <div class="panel-heading alignment" >Update User</div>
				    <div class="panel-body">

						<fieldset>
                             <div class="form-group col-md-12 col-lg-12 col-sm-12">
								<input class="form-control" id="txtEmail" placeholder="" name="txtEmail" type="email"  runat="server" onblur="requiredField('txtEmail')" ClientIDMode="static"  disabled >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" ValidationGroup="buttonupdateuser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                            </div>
							<div class="form-group col-md-6 col-lg-6 col-sm-6"  >
                                <input class="form-control" id="txtFirstName" placeholder="First Name" name="txtFirstName" type="text" autofocus="" runat="server" onblur="requiredField('txtFirstName')" ClientIDMode="static">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="Required" ControlToValidate="txtFirstName" ValidationGroup="buttonupdateuser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-6" >
                                <input class="form-control" id="txtLastName" placeholder="Last Name" name="txtLastName" type="text"  runat="server" onblur="requiredField('txtLastName')" ClientIDMode="static">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtLastName" ValidationGroup="buttonupdateuser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                                </div>
                            
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <div class="col-lg-4 col-md-4 col-sm-4" style="margin-top:10px;">DOB</div>
                                <%--<div class="col-lg-1 col-md-1 col-sm-1">

                                </div>--%>
                                <div class="col-lg-8 col-md-8 col-sm-8" >
                                     <asp:TextBox ID="txtDob" CssClass="search form " runat="server" placeholder="MM/DD/YYYY" BackColor="White">  </asp:TextBox>
                                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDob"  runat="server" format="MM/dd/yyyy" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" ControlToValidate="txtDob" runat="server" ErrorMessage="Required" cssClass="label label-danger col-md-4 col-lg-4 col-sm-4"></asp:RequiredFieldValidator>
								
                                </div>
                            </div>
                         
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <div class="col-lg-4 col-md-4 col-sm-4" style="margin-top:5px;">Gender</div>
                                <%--<div class="col-lg-1 col-md-1 col-sm-1">

                                </div>--%>
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                  
                                 <asp:RadioButtonList ID="radioButtonListGender" runat="server" BackColor="White" Font-Size="Small" ForeColor="Gray" Height="35px" RepeatDirection="Horizontal" Width="264px">
                                       <asp:ListItem>Male</asp:ListItem>
                                       <asp:ListItem>Female</asp:ListItem>
                                       <asp:ListItem>Other</asp:ListItem>
                                   </asp:RadioButtonList>
                                
                                </div>
                                
                             </div>
                                
                       
                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                            <div class="col-md-5 col-lg-5 col-sm-5" style="margin-top:10px">
                                Phone Number
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                            <input class="form-control" id="txtPhone" placeholder="Phone Number" name="txtPhoneNumber" type="text" value="" runat="server" onblur="requiredField('txtPhone')" ClientIDMode="static">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="txtPhone" ValidationGroup="buttonupdateuser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                        </div>
                        </div>


                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                            <div class="col-lg-5 col-md-5 col-sm-5" style="margin-top:10px">
                                Adhaar ID
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                            <input class="form-control" id="txtAdhaar" placeholder="Adhaar Id" name="txtAdhaarId" type="text" value="" runat="server"  ClientIDMode="static">
                            </div> 
                        </div>
                        <div class=" col-md-12 col-lg-12 col-sm-12">
                            <div class="form-group col-md-5 col-lg-5 col-sm-5" >
                                Address
                                </div>
                            <div class="form-group col-md-7 col-lg-7 col-sm-7">
                            <textarea rows="4" cols="50" class="form-control" id="txtAddress" style="resize:none" placeholder="Address" runat="server" ></textarea>
                        </div>
                            </div>
                       
                            <asp:Button ID="buttonupdateuser" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Update" OnClick="buttonupdateuser_Click"/>
						
                            <%--<button--% id="btnReset" class="btn btn-primary resetBtn col-md-3 col-lg-3 col-lg-offset-1 buttonStyle" runat="server" onclick="">Reset</button>--%>
                            
							</fieldset>						
    			</div>
			</div>
		</div>
	</div>
</ContentTemplate>
        </asp:UpdatePanel>
    
</asp:Content>

