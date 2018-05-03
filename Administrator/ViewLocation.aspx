<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewLocation.aspx.cs" Inherits="Administrator_UpdateLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
   .alignment
    {
    text-align:center;
    }
   #menu1 #addLocation{
       background-color: #30A5FF;
       color:white;
   }
   
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">Update Location</li>
			</ol>
		    </div>
    <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
            <div class="row">
		        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			        <div class="login-panel panel panel-default alertForError">
				        <div class="panel-heading alignment" >Update Location</div>
				        <div class="panel-body">
        <%--					<form role="form">--%>
						        <fieldset>
							        <div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                        <input class="form-control" id="txtName" placeholder="Name"  name="txtName" type="text" autofocus="" runat="server" onblur="requiredField('txtName')" ClientIDMode="static" disabled>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtName" ValidationGroup="btnUpdateLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                           
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLatitude" placeholder="Latitude" name="txtLatitude" type="text"  runat="server" onblur="requiredField('txtLatitude')" ClientIDMode="static" disabled >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="txtLatitude" ValidationGroup="btnUpdateLocation" cssClass="label label-danger"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>

							        <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLongitude" placeholder="Longitude" name="txtLongitude" type="text"  runat="server" onblur="requiredField('txtLongitude')" ClientIDMode="static" disabled>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" ControlToValidate="txtLongitude" ValidationGroup="btnUpdateLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                       
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <input class="form-control" id="txtDescription" placeholder="Description" name="txtDescription" type="text" value="" runat="server"  ClientIDMode="static">
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" ControlToValidate="txtDescription" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <%--<input class="form-control" id="txtKeyword" placeholder="Keyword" name="txtKeyword" type="text" value="" runat="server"  ClientIDMode="static">--%>
                                        <textarea class="form-control" id="txtKeyword" style="resize:none" placeholder="Keyword" name="txtKeyword" type="text" value="" runat="server"  ClientIDMode="static" cols="50" rows="3"></textarea>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" ControlToValidate="txtDescription" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>

                                    <%--<div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <asp:Label ID="Label1" runat="server" Text="Location Pic" CssClass="margincheck"></asp:Label>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                        <ajaxToolkit:AsyncFileUpload ID="FileUploadController" runat="server"  OnUploadedComplete="FileUploadController_UploadedComplete" CssClass="form-control"/>
                                        </div>
                                    </div>--%>

                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Associated Stakeholder</div>
                                          <div class="panel-body" style="font-family: 'Lucida Sans'; font-weight: 100; font-style: normal; text-transform: capitalize">
                                             <div>
                                                <asp:CheckBoxList ID="cbStackholder" DataValueField="" runat="server" CellSpacing="1" RepeatLayout="Flow">
                                                    <asp:ListItem>abc</asp:ListItem>
                                                    <asp:ListItem>qwe</asp:ListItem>
                                                    <asp:ListItem>yui</asp:ListItem>
                                                    <asp:ListItem>bbb</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                       
                                    


                                    <asp:Button ID="btnUpdateLocation" ValidationGroup="btnUpdateLocation" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Update" OnClick="btnUpdateLocation_Click"/>
							         <asp:Button ID="btnEdit" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Edit" OnClick="btnEdit_Click"/>

							        </fieldset>
				        </div>
			        </div>
		        </div>
	        </div>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>

