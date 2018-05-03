<%@ Page Title="Update Profile" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="ProfileUpdate.aspx.cs" Inherits="Administrator_ProfileUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
   .alignment
    {
    text-align:center;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">Profile Update</li>
			</ol>
		    </div>
     <asp:UpdatePanel ID="adminCreateUser" runat="server">
    <ContentTemplate>
    <div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading alignment" >Update Profile</div>
				<div class="panel-body">
<%--					<form role="form">--%>
						<fieldset>
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                               
                                <div class="col-md-6 col-lg-6 col-md-offset-4 col-lg-offset-4">
                                    <div class="profile-userpic">
				                        <img src="/Image/icon/user.png" class="img-responsive" alt="">
			                        </div>
                                </div>
                                
                                <br ><br >
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <input class="form-control" id="txtPhone" placeholder="Phone Number" name="txtPhoneNumber" type="text" value="" runat="server" onblur="requiredField('txtPhone')" ClientIDMode="static">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="txtPhone" ValidationGroup="btnProfileUpdate" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
							<div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                <input class="form-control" id="txtAddress" placeholder="New Address"  name="txtAddress" type="text" autofocus="" runat="server" onblur="requiredField('txtAddress')" ClientIDMode="static">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtAddress" ValidationGroup="btnProfileUpdate" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                       
                            <asp:Button ID="btnProfileUpdate" ValidationGroup="btnProfileUpdate" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Update" OnClick="btnProfileUpdate_Click"/>
							<asp:Button ID="btnCancel" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>

						</fieldset>
				</div>
			</div>
		</div>
	</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

