<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="TrackStatus.aspx.cs" Inherits="Applicant_TrackStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #track{
            background-color:#30A5FF !important;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/User/Default.aspx">Dashboard</a></li>
                <li class="active">Track Status</li>
			</ol>
	</div>
    <br />
    <br />
    <asp:UpdatePanel ID="ApplicantTrack" runat="server">
        <ContentTemplate>
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="jumbotron colorfont">
                    <h2 class="aligntext">Welcome User!</h2>
                    <h3 class="aligntext">Now track your live application status in just one click</h3>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="panel panel-warning">
                      <div class="panel-body">
                          <h2 style="text-align:center">Enter Application ID</h2>
                          <input class="form-control" id="txtApplicationID" placeholder="Application ID"  name="txtApplicationID" type="text" autofocus="" runat="server" onblur="requiredField('txtApplicationID')" ClientIDMode="static">
                          <br />
                          <div class="col-lg-4 col-md-4 col-sm-4"></div>
                          <div class="col-md-4 col-lg-4 col-sm-4">
                              <asp:Button ID="btnTrack" OnClick="btnTrack_Click" class="btn btn-primary loginBtn buttonStyle textBtn" runat="server" Text="Track"  />
                          </div>
                      </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="panel panel-info">
                      <div class="panel-body">
                          <h4 style="text-align:center; font-weight:bold"> Application Status </h4>
                          <div class="col-lg-12 col-md-12 col-sm-12">
                              <div class="col-lg-4 col-md-4 col-sm-4">
                                  <asp:Label ID="lblApplied" runat="server" Text="Applied On" CssClass="margin"></asp:Label>
                              </div>
                              <div class="col-lg-8 col-md-8 col-sm-8">
                                  <input class="form-control" id="txtApplied" placeholder="" name="txtApplied" type="text"  runat="server"  ClientIDMode="static"  disabled >
                              </div>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12">
                              <div class="col-lg-4 col-md-4 col-sm-4">
                                  <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="margin"></asp:Label>
                              </div>
                              <div class="col-lg-8 col-md-8 col-sm-8">
                                  <input class="form-control" id="txtStatus" placeholder="" name="txtStatus" type="text"  runat="server"  ClientIDMode="static"  disabled >
                              </div>
                          </div>
                          
                          <div class="col-lg-12 col-md-12 col-sm-12">
                              <div class="col-lg-4 col-md-4 col-sm-4">
                                  <asp:Label ID="Label1" runat="server" Text="Remark" CssClass="margin"></asp:Label>
                              </div>
                              <div class="col-lg-8 col-md-8 col-sm-8">
                                  <textarea id="txtRemark" class="form-control" cols="20" rows="3" name="txtRemark" type="text"  runat="server"  ClientIDMode="static"  disabled></textarea>
                                  
                              </div>
                          </div>
                      </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

