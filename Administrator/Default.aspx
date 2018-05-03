<%@ Page Title="Home" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
    #menu1 #default{
        background-color:#30A5FF;
        color:white;
    }


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel runat="server" ID="StakeholderDefault">
        <ContentTemplate>

    <div class="row">
			<ol class="breadcrumb">
                <li class="active">DashBoard</li>
			</ol>
		    </div>
    <br><br>
    <br><br>
    <br><br>
    
    <div class="container col-md-12 col-lg-12">
        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#F4D03F  "><img src="/Image/icon/wait.png" width="50px" height="50px">Pending Application</div>
                  <div class="panel-body"><a href="#">view details</a><%--<asp:Label ID="Label4" runat="server" Text="25" style="float:right" Font-Size="18px" Width="50px" Font-Bold="True" ForeColor="#F4D03F"></asp:Label>--%></div>
                </div>
            </div>
            
            <div class="col-md-2">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#58D68D  "><img src="/Image/icon/ok.png" width="47px" height="47px">Approved Application</div>
                  <div class="panel-body"><a href="#">view details</a> <%--<asp:Label ID="Label2" runat="server" Text="25" style="float:right" Font-Size="18px" Width="50px" Font-Bold="True" ForeColor="#58D68D"></asp:Label>--%></div>
                </div>
            </div>
            <div class="col-md-1">

            </div>
        </div>
    </div>
    
    <div>

    </div>


    <div class="container col-md-12 col-lg-12">
        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#EC7063"><img src="/Image/icon/rejected.png" width="47px" height="47px">Rejected Application</div>
                  <div class="panel-body"><a href="#">view details</a> <%--<asp:Label ID="Label1" runat="server" Text="25" style="float:right" Font-Size="18px" Width="50px" Font-Bold="True" ForeColor="#EC7063"></asp:Label>--%>  </div>
                </div>
            </div>
            <div class="col-md-2">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading"><img src="/Image/icon/db.png" width="50px" height="50px">Total Application</div>
                  <div class="panel-body"><a href="#">view details</a> <%--<asp:Label ID="Label3" runat="server" Text="25" style="float:right" Font-Size="18px" Width="50px" Font-Bold="True" ForeColor="#4285F4"></asp:Label>--%></div>
                </div>
            </div>
            
            <div class="col-md-1"> 
            </div>
            
        </div>
    </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

