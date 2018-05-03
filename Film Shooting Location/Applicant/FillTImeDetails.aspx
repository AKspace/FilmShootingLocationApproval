<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="FillTImeDetails.aspx.cs" Inherits="Applicant_FillTImeDetails" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Resources/css/css.css" rel="stylesheet" />
    <style>
    #menu1 #timedetails{
            background-color:#30A5FF !important;
            color:white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Applicant/Default.aspx">Dashboard</a></li>
                <li class="active">Fill Time Details</li>
			</ol>
		    </div>
    <br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate  >
        <div class="col-lg-9 col-md-9 col-sm-9 col-lg-offset-1 col-md-offset-0">
            <div class="panel panel-default col-lg-12 col-md-12 col-sm-12">
              <div class="panel-heading" style="text-align:center">Fill Time Details</div>
              <div class="panel-body col-lg-10 col-md-10 col-sm-10">
                  
                    <asp:Table ID="table" runat="server" CssClass="col-lg-10 col-md-10 col-sm-10">
                        <asp:TableHeaderRow CssClass="text">
                          <asp:TableCell CssClass="col-lg-8"><b>Date</b></asp:TableCell>

                          <asp:TableCell CssClass="col-lg-6" Style="margin-left:20px;"><b>Location</b></asp:TableCell>
                          <asp:TableCell CssClass="col-lg-6"><b>Start Time</b></asp:TableCell>
                          <asp:TableCell CssClass="col-lg-6"><b>End Time</b></asp:TableCell>
                      </asp:TableHeaderRow>
                    </asp:Table>
                  <br />
                    
                </div></div>
            
            
        </div>
        <div class="col-lg-9 col-md-9 col-sm-9 col-lg-offset-1 col-md-offset-0 panel panel-default ">
            
           <span style="font-size:25px;font-family:bold" class="panel-heading col-lg-12 col-md-12 col-sm-12 text-center"> StakeHolder Details </span> 
            
            <br />
            <asp:CheckBoxList ID="cbStakeHolder" runat="server" RepeatColumns="4" CssClass="col-lg-12 panel-body panel-default"></asp:CheckBoxList>
            <asp:CheckBoxList ID="cbMandatoryStakeHolder" runat="server" RepeatColumns="4" CssClass="col-lg-12 panel-body panel-default"></asp:CheckBoxList>
         <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="buttonview col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-lg-3 col-md-3 col-sm-3 " align-="right"/>    
        </div>
        
        
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

