<%@ Page Title=" Add Role" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="AddRole.aspx.cs" Inherits="Administrator_AddRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
   .alignment
    {
    text-align:center;
    }
     #menu1 #addRole{
       background-color: #30A5FF;
       color:white;
   }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">>Add Role</li>
			</ol>
		    </div>
    <br /><br /><br /><br /><br />
 <asp:UpdatePanel ID="adminCreateUser" runat="server">
    <ContentTemplate>
    <div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading alignment" >Add Role</div>
				<div class="panel-body">
<%--					<form role="form">--%>
						<fieldset>


							<div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                <input class="form-control" id="txtRoleName" placeholder="Role Name"  name="txtRoleName" type="text" autofocus="" runat="server" onblur="requiredField('txtRollName')" ClientIDMode="static">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtRoleName" ValidationGroup="btnAddRole" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                       
                            <asp:Button ID="btnAddRole" ValidationGroup="btnAddRole" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Create" OnClick="btnAddRole_Click"/>
							<asp:Button ID="btnCancel" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>

						</fieldset>
				</div>
			</div>
		</div>
	</div>
    </ContentTemplate>
</asp:UpdatePanel>
   
</asp:Content>

