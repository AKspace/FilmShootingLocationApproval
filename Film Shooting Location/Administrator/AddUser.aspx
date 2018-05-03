<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Administrator_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #addUser{
            background-color:#30A5FF !important;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
            <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">Add User</li>
			</ol>
		    </div>
    <div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading alignment" >Add User</div>
				<div class="panel-body">
						<fieldset>
                            <asp:UpdatePanel ID="AddUser" runat="server">
							    <ContentTemplate>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtEmail" placeholder="E-MAIL" name="txtEmail" type="text"  runat="server" onblur="requiredField('txtEmail')" ClientIDMode="static" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" ValidationGroup="buttonAddUser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                                    </div>
							
                                
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <asp:DropDownList ID="DropDownListUserType"  runat="server" CssClass="form-control" default="" Height="45px"  OnSelectedIndexChanged="DropDownListUserType_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Value=""> User Type </asp:ListItem>
                                                <asp:ListItem>DTFC</asp:ListItem>
                                                <asp:ListItem>Stakeholder</asp:ListItem>
                                         </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListUserType" ValidationGroup="buttonAddUser" SetFocusOnError="true" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                                    </div>
                       
                           <%-- <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                    <asp:DropDownList ID="DropDownListStakeholder" runat="server" CssClass="form-control" default="" Height="45px" Visible="false" >
                                            <asp:ListItem Value="">Stakeholder Name</asp:ListItem>
                                    </asp:DropDownList>

                            </div>--%>
                            <asp:Button ID="buttonAddUser" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Create" OnClick="buttonAddUser_Click"/>
                            <input id="btnReset" class="btn btn-primary resetBtn col-md-3 col-lg-3 col-lg-offset-1 buttonStyle" type="reset" value="Reset" runat="server" />
							         </ContentTemplate>
                           </asp:UpdatePanel>
                           </fieldset>
				    </div>
			    </div>
		    </div>
	    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

