<%@ Page Title=" Add Location" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="AddLocation.aspx.cs" Inherits="Administrator_AddLocation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                <li class="active">Add Location</li>
			</ol>
		    </div>
    <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
            <div class="row">
		        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-lg-5 col-md-offset-3">
			        <div class="login-panel panel panel-default alertForError">
				        <div class="panel-heading alignment" >Add Location</div>
				        <div class="panel-body">
        <%--					<form role="form">--%>
						        <fieldset>
							        <div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                        <input class="form-control" id="txtName" placeholder="Name"  name="txtName" type="text" autofocus="" runat="server" onblur="requiredField('txtName')" ClientIDMode="static" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtName" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                           
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLatitude" placeholder="Latitude" name="txtLatitude" type="text"  runat="server" onblur="requiredField('txtLatitude')" ClientIDMode="static" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="txtLatitude" ValidationGroup="btnAddLocation" cssClass="label label-danger"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>

							        <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLongitude" placeholder="Longitude" name="txtLongitude" type="text"  runat="server" onblur="requiredField('txtLongitude')" ClientIDMode="static">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" ControlToValidate="txtLongitude" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                       
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <input class="form-control" id="txtDescription" placeholder="Description" name="txtDescription" type="text" value="" runat="server"  ClientIDMode="static">
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" ControlToValidate="txtDescription" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>
                                   <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <asp:Label ID="Label2" runat="server" Text="Keywords" Font-Bold="True"></asp:Label>
                                    
                                        <hr />
                                        <asp:CheckBoxList ID="ChkAddLocation" runat="server" DataSourceID="SqlDataSource1" DataTextField="keywordname" DataValueField="keywordname" RepeatColumns="3" CssClass="col-lg-12 col-md-12 col-sm-12"></asp:CheckBoxList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=lizz;Initial Catalog=filmshooting;Persist Security Info=True;User ID=dbAdmin1;Password=sih2018" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [keywordname] FROM [scriptkeyworddetails]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>

                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <asp:Label ID="Label1" runat="server" Text="Location Pic" CssClass="margincheck"></asp:Label>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                        <asp:FileUpload ID="FileUploadController" runat="server" CssClass="form-control"/>
                                        </div>
                                    </div>

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
                       
                                    


                                    <asp:Button ID="btnAddLocation" ValidationGroup="btnAddLocation" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Add" OnClick="btnAddLocation_Click"/>
							         <asp:Button ID="btnCancel" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>

							        </fieldset>
				        </div>
			        </div>
		        </div>
	        </div>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>

