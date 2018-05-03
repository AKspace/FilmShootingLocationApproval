<%@ Page Title="" Language="C#" MasterPageFile="~/DTFC/DTFCMaster.master" AutoEventWireup="true" CodeFile="ViewStakeholder.aspx.cs" Inherits="Administrator_UpdateStakeholder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
   .alignment
    {
    text-align:center;
    }
     #menu1 #addStack{
       background-color: #30A5FF;
       color:white;
   }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">Update Stakeholder</li>
			</ol>
		    </div>
    <%--<br />
    <br />--%>
     <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
    <div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			<div class="login-panel panel panel-default alertForError">
				<div class="panel-heading alignment" >Update Stakeholders</div>
				<div class="panel-body">
    <%--					<form role="form">--%>
						<fieldset>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading" style="font-size:16px">Stakeholder Details</div>
                                  <div class="panel-body">
                            
							<div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                <input class="form-control" id="txtName" placeholder="Name"  name="txtName" type="text" autofocus="" runat="server" onblur="requiredField('txtName')" ClientIDMode="static" disabled>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtName" ValidationGroup="btnAddStakeholder" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                           
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
								<%--<input class="form-control" id="txtDescription" placeholder="Description" name="txtDescription" type="text"  runat="server"  ClientIDMode="static">--%>
                                <textarea id="txtDescription" class="form-control" cols="50" rows="4" placeholder="Description" name="txtDescription" type="text" value="" runat="server"  ClientIDMode="static"></textarea>
                            </div>

                                  </div>
                            </div> 
                            </div>
                           
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading" style="font-size:16px">Contact Details</div>
                                  <div class="panel-body">
                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
								<input class="form-control" id="txtEmail" placeholder="E-MAIL" name="txtEmail" type="email"  runat="server"  ClientIDMode="static" >
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="txtEmail" ValidationGroup="btnAddStakeholder" cssClass="label label-danger"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                            </div>

                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <input class="form-control" id="txtPhone" placeholder="Phone Number" name="txtPhoneNumber" type="text" value="" runat="server"  ClientIDMode="static">
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" ControlToValidate="txtPhone" ValidationGroup="btnAddStakeholder" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                            </div>

                            <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                <%--<input class="form-control" id="txtAddress" placeholder="Address" name="txtAddress" type="text" value="" runat="server"  ClientIDMode="static">--%>
                                <textarea id="txtAddress" class="form-control" cols="50" rows="4" placeholder="Address" name="txtAddress" type="text" value="" runat="server"  ClientIDMode="static"></textarea>
                            </div>
                       
                            <asp:Button ID="btnUpdateStakeholder" ValidationGroup="btnUpdateStakeholder" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Update" OnClick="btnUpdateStakeholder_Click"/>
							 <asp:Button ID="btnEdit" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Edit" OnClick="btnEdit_Click"/>
</div>
                            </div> 
                            </div>
							</fieldset>
				</div>
			</div>
		</div>
	</div>
</ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

