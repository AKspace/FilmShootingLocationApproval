<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="User_Forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function removeElement(elementId) {
            WebForm_GetElementById(elementId).parentNode.removeChild(WebForm_GetElementById(elementId));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br><br><br>
    <asp:UpdatePanel ID="ResetPassword" runat="server">
        <ContentTemplate>
	<div class="row" id="mainContent" runat="server" ClientIdMode="static"  >
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4" " >
			<div class="login-panel panel panel-default alertForError" >
				<div class="panel-heading"><b>Reset Your Password</b></div>
				<div class="panel-body button1">
                    <br />
					
						<fieldset>
							<div class="form-group">
								<input runat="server" class="form-control" id="txtNewPwd" placeholder="New Password" name="txtNewPwd" type="password" ClientIDMode="static" onblur="requiredField('txtNewPwd')">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNewPwd" ValidationGroup="btnReset" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                                </div>
							<div class="form-group">
								<input runat="server" class="form-control" id="txtConfirmPwd" placeholder="Confirm Password" name="txtConfirmPwd" type="password">
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password do not match"  ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd" ValidationGroup="btnReset" SetFocusOnError="true"  CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:CompareValidator>

							</div>
                            <div >
                                <asp:Button ID="btnReset" runat="server" Text="Reset Password" class="btn btn-primary resetBtn col-md-6 col-lg-6 col-lg-offset-6 buttonStyle" OnClick="btnReset_Click"/>
                                
							</div>

							</fieldset>
		                   
       				</div>
			</div>
		</div>
          
	</div>
       

            <div class="container" id="alterContent" runat="server" ClientIdMode="static">
           <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-warning ">
				<div class="panel-heading" style="height:100px;">Your linked is expired </br>
                    To reset again <a href="ForgetPassword.aspx">Click here</a>
				</div>
		    </div>
               </div>
                </div>
        </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>

