<%@ Page Title="Home" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Applicant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #default{
            background-color:#30A5FF !important;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li class="active">Dashboard</li>
			</ol>
		    </div>
     <br><br><br><br>
    <%--<div class="col-md-12 col-lg-12 col-sm-12">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="panel-group">
                    <div class="panel panel-default">             
                        <div class="panel-body">
                            <img src="Resources/images/track.png" width="100px" height="100px" >
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
         
    </div>
    --%>
    <div class="container col-md-12 col-lg-12">
        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#58D68D  "><img src="/Image/icon/ok.png" width="47px" height="47px">Approved Application</div>
                  <div class="panel-body"><a href="#">view details</a></div>
                </div>
            </div>
            

            <div class="col-md-2">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#EC7063  "><img src="/Image/icon/rejected.png" width="47px" height="47px">Rejected Application</div>
                  <div class="panel-body"><a href="#">view details</a></div>
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
                  <div class="panel-heading"><img src="/Image/icon/db.png" width="50px" height="50px">Total Application</div>
                  <div class="panel-body"><a href="#">view details</a></div>
                </div>
            </div>
            <div class="col-md-2">

            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                  <div class="panel-heading" style="background-color:#F4D03F  "><img src="/Image/icon/track.png" width="47px" height="47px">Track Application</div>
                  <div class="panel-body"><a href="/Applicant/TrackStatus.aspx">view details</a></div>
                </div>
            </div>

            
            <div class="col-md-1">

            </div>
        </div>
    </div>

</asp:Content>

