<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/ApplicantMaster.master" AutoEventWireup="true" CodeFile="FinalPayment.aspx.cs" Inherits="Applicant_FinalPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .box
        {
            margin-top:50px;
        }
        .butt{
            height:35px;
            float:right;
        }
        .image{
            width:100px;
            height:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Applicant/Default.aspx">Dashboard</a></li>
                <li class="active">Final Payment</li>
			</ol>
	</div>
    <br />
    <br />
    <div class="container">
        <div class=" col-lg-6 col-md-6 col-sm-6 col-lg-offset-2 col-md-offset-2 col-sm-offset-2">
            <div class="panel panel-default">
              <div class="panel-body">
                       <div class="col-lg-12 col-md-12 col-sm-12">
                           <div class="col-lg-3 col-md-3 col-sm-3">
                               <img src="../Image/icon/paypal.png" class="image" style="height:90px" />
                           </div>
                           <div class="col-lg-3 col-md-3 col-sm-3">
                               <img src="../Image/icon/master.png" class="image"/>
                           </div>
                           <div class="col-lg-3 col-md-3 col-sm-3">
                               <img src="../Image/icon/card.png" class="image"/>
                           </div>
                           <div class="col-lg-3 col-md-3 col-sm-3">
                               <img src="../Image/icon/visa.png" class="image"/>
                           </div>
                       </div>
                      
                      <div style="height:50px"></div>
                      
                      <div class="box">
                      <div class="col-lg-5 col-md-5 col-sm-5">Application ID</div>
                      <div class="col-lg-7 col-md-7 col-sm-7">
                          <%--<asp:Label ID="lblApplicationID" CssClass=" form-control" runat="server" Text="" ClientIDMode="Static"></asp:Label>--%>
                          <asp:DropDownList ID="ddlApplication" CssClass=" form-control" AutoPostBack="false" ClientIDMode="Static" runat="server">
                              <asp:ListItem>Select Application ID</asp:ListItem>
                          </asp:DropDownList>
                      </div>
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
                      <asp:Button ID="btnPayNow" runat="server" OnClick="btnPayNow_Click" CssClass="btn-success butt col-lg-offset-4 col-lg-4" Text="Pay Now" />
                          <div style="width:5px"></div>
                      <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" CssClass="btn-danger butt" Text="Cancel" />
                      </div>
               </div>
            </div>
        </div>
    </div>

</asp:Content>

