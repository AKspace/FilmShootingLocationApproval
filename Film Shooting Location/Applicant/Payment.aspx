<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Applicant_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .box
        {
            width:100%;
            height:35px;
            border-radius:3px;
            border-color:darkgray;
            border:1px solid;
            background-color:aquamarine;
        }
        .butt{
            height:35px;
            float:right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Applicant/Default.aspx">Dashboard</a></li>
                <li class="active">Payment</li>
			</ol>
	</div>
    <br />
    <br />
    <div class="container">
        <div class=" col-lg-6 col-md-6 col-sm-6 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
            <div class="panel panel-default">
              <div class="panel-body">

                      <div style="height:15px"></div>
                      <div class="col-lg-5 col-md-5 col-sm-5">Application ID</div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                          <asp:Label ID="lblApplicationID" CssClass=" form-control" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                      </div>
                      <div style="height:50px"></div>
                      <div class="col-lg-5 col-md-5 col-sm-5">Name</div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                          <asp:Label ID="lblName" CssClass="form-control" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                      </div>
                      <div style="height:50px"></div>
                      <div class="col-lg-5 col-md-5 col-sm-5">Mobile No</div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                          <asp:Label ID="lblMobile" CssClass="form-control" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                      </div>
                      <div style="height:50px"></div>
                      <div class="col-lg-5 col-md-5 col-sm-5">Amount</div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                          <asp:Label ID="lblAmount" CssClass="form-control" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                      </div>
                      <div style="height:50px"></div>
                       
                      <div class="col-lg-5 col-md-5 col-sm-5"></div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                      <asp:Button ID="btnPayNow" runat="server" CssClass="btn-success butt" Text="Pay Now"  OnClick="btnPayNow_Click"/>
                      </div>
               </div>
            </div>
        </div>
    </div>
</asp:Content>

