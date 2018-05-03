<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="Changepassword.aspx.cs" Inherits="Changepassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>    .button1 {padding: 15px 24px;
    border:none;
    }
    #menu1 #Changepwd{
       background-color: #30A5FF;
       color:white;
   }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/User/Default.aspx">Dashboard</a></li>
                <li class="active">Change Password</li>
			</ol>
		    </div>
    
    <br><br><br>
    <asp:UpdatePanel ID="ResetPassword" runat="server">
        <ContentTemplate>
            
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading alignment" style="text-align:center">Change Password</div>
				<div class="panel-body button1">
                    <br />
					
						<fieldset>
                            <div class="form-group">
                                <input runat="server" class ="form-control " id="txtoldpwd" placeholder="Old Password" type="password" ClientIDMode="static" onblur="requiredField('txtoldpwd')" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtoldpwd" ValidationGroup="btnReset" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                                </div>
							<div class="form-group">
                                <asp:TextBox ID="txtNewPwd" CssClass="form-control" Style="height:48px;" type="password" placeholder="Enter New Password" runat="server" ClientIDMode="Static" onblur="requiredField('txtNewPwd')" ToolTip="Enter password"></asp:TextBox>
                                <ajaxToolkit:BalloonPopupExtender UseShadow="false" BalloonSize="Small" BalloonPopupControlID="Panel1"  runat="server" ExtenderControlID="" CustomCssUrl=""  BehaviorID="txtNewPwd_BalloonPopupExtender" TargetControlID="txtNewPwd" ID="txtNewPwd_BalloonPopupExtender"></ajaxToolkit:BalloonPopupExtender>
                                <asp:Panel ID="Panel1" Font-Size="12px" BackColor="WhiteSmoke" runat="server">Minimum 8 charecters<br />A capital upper case letter <br />A lower case letter <br /> A number<br />A special Charecter</asp:Panel>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPwd" ErrorMessage="Required " ValidationGroup="btnReset"></asp:RequiredFieldValidator>
                            </div>
							<div class="form-group">
								<%--<input runat="server" class="form-control" id="txtConfirmPwd" placeholder="Confirm Password" name="txtConfirmPwd" type="password">--%>
                                <asp:TextBox ID="txtConfirmPwd" CssClass="form-control" Style="height: 48px;" type="password" placeholder="Confirm Password" runat="server" ClientIDMode="Static" onblur="requiredField('txtNewPwd')" ToolTip="Confirm password"></asp:TextBox>

                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password do not match"  ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd" ValidationGroup="btnReset" SetFocusOnError="true"  CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:CompareValidator>

							</div>
                            <div >
                                <asp:Button ID="btnReset" runat="server" Text="Reset Password" class="btn btn-primary resetBtn col-md-11 col-lg-11  buttonStyle" ValidationGroup="btnReset" OnClick="Button1_Click"/>
							</div>
							</fieldset>
						
						
					
				</div>
			</div>
		</div>
	</div>
        </ContentTemplate>
        </asp:UpdatePanel>
   <%-- <asp:UpdatePanel ID="ChangePassword" runat="server">
        <ContentTemplate>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading"><b>Change Password</b></div>
				<div class="panel-body button1">
					<form role="form">
						<fieldset>
							<div class="form-group">
								<input class="form-control" id="check" placeholder="Current Password" name="txtcurrentpwd" type="email" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="New Password" name="txtnewpwd" type="password" value="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Confirm Password" name="txtconfirmpwd" type="password" value="">
							</div>
                            <div style="float:right">
							<button class=" buttons button1" style="background-color:#25ba64;color:white;border:none;">Change Password</button>
                            <button class="button button1" style="background-color:#25ba64;border:none;color:white">Cancel</button></div>
						<!--	<div class="checkbox">
								<label>
									<input name="remember" type="checkbox" value="Remember Me">Remember Me
								</label>
							</div>
						-->
							<!--<a href="index.html" class="btn btn-primary loginBtn col-md-6 col-lg-4  buttonStyle">Change Password</a>&nbsp&nbsp&nbsp
							<a href="index.html" class="btn btn-primary loginBtn col-md-6 col-lg-4  buttonStyle">Change Password</a>
							<!--<button class="btn btn-primary resetBtn col-md-4 col-lg-4  buttonStyle">Cancel</button>-->
							</fieldset>
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
        </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>

