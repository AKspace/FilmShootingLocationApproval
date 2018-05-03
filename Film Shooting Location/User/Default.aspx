<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    #menu1 #Dash{
        background-color:#30A5FF;
        color:white;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
			<ol class="breadcrumb">
				<li><a href="/User/Default.aspx">Dashboard</a></li>
			</ol>
	</div>
    <%--<br />--%>
 <asp:UpdatePanel ID="defaultMyAccount" runat="server">
     <ContentTemplate>
         <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="jumbotron">
                    <h2 class="aligntext">Hey User ! <img src="/Image/dag/hihand.png" width="50px" height="50px"/></h2>
                    <h3 class="aligntext">Welcome to My Account panel. Stuffs are waiting for you...</h3>
                </div>
         </div>
         <div class="col-md-12 col-lg-12 col-sm-12">
             <div class="col-lg-6 col-md-6 col-sm-6 col-md-offset-3 col-lg-offset-3 col-sm-offset-3">
                 <div class="panel panel-primary">
                  <div class="panel-heading">Account Summary</div>
                  <div class="panel-body">
                      <fieldset>
                      <div class="form-group">
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <asp:Label ID="Label1" runat="server" Text="Last Login Date  :" CssClass="margin"></asp:Label>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <input class="form-control" id="txtLastLogin" placeholder="" name="txtLastLogin" type="text"  runat="server"  ClientIDMode="static"  disabled >
                          </div>
                      </div>
                      <div style="height:10px"></div>
                      <div class="form-group">
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <asp:Label ID="Label2" runat="server" Text="Last Password Change  :" CssClass="margin"></asp:Label>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <input class="form-control" id="txtLastPasswordChange" placeholder="" name="txtLastPasswordChange" type="text"  runat="server"  ClientIDMode="static"  disabled >
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <asp:Label ID="Label3" runat="server" Text="Creation Date :" CssClass="margin"></asp:Label>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <input class="form-control" id="txtCreationDate" placeholder="" name="txtCreationDate" type="text"  runat="server"  ClientIDMode="static"  disabled >
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <asp:Label ID="Label4" runat="server" Text="Modification Date :" CssClass="margin"></asp:Label>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6">
                              <input class="form-control" id="txtModificationDate" placeholder="" name="txtModificationDate" type="text"  runat="server"  ClientIDMode="static"  disabled >
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

