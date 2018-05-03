<%@ Page Title="" Language="C#" MasterPageFile="~/DTFC/DTFCMaster.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="DTFC_Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .calendar
        {
            width:100%;
            align-items:center;
            text-align:center;
        }
        .btn{
            float:right;
            margin-top:5px;
        }
        .onSelect{
            background-color:firebrick;

        }
        .calendarDay{
            
            margin-left:-10px;
        }
        .align{
            text-align:center;
        }
        .th{
            margin-left:10px;
        }
        .grid
        {
            text-align:center;
            font-size:20px;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            width:100%;
        }
        .gridAlign{
            text-align:center;
        }
        .cal{
            margin-left:20px;
        }
        .ddl{
            width:100%;
            height:40px;
            border-radius:4px;
        }
        #menu1 #disDate{
       background-color: #30A5FF;
       color:white;
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/DTFC/Default.aspx">Dashboard</a></li>
                <li class="active">Prune Dates</li>
			</ol>
		    </div>

    <br /><br />
    <asp:UpdatePanel runat="server" ID="calendar">
        <ContentTemplate>

    <div class="container">
        <asp:Label ID="lblShowMessage" runat="server" CssClass="align" Text="" Visible="False"></asp:Label>
    </div>
    <div class="container">
        <div class="col-md-6 col-lg-6 col-sm-6 ">
            <asp:DropDownList ID="ddlLocation" CssClass="ddl" runat="server" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" DataTextField="locationname" DataValueField="locationid">
                <asp:ListItem>Select Location</asp:ListItem>
            </asp:DropDownList>
       </div>
    </div>
            <div style="margin-top:10px"></div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Calendar ID="CalendarSelectDate" CssClass="calendar"  OnSelectionChanged="CalendarSelectDate_SelectionChanged" runat="server" ForeColor="Black" Height="400px" SelectedDayStyle-CssClass="onSelect" SelectedDayStyle-ForeColor="Red" DayHeaderStyle-VerticalAlign="Middle" DayHeaderStyle-CssClass="col-lg-1" DayHeaderStyle-ForeColor="#0033CC" DayStyle-BackColor="White" DayStyle-BorderStyle="None" Font-Size="Medium" NextPrevStyle-ForeColor="#33CC33" NextPrevFormat="CustomText" DayStyle-CssClass="calendarDay" DayHeaderStyle-HorizontalAlign="Center"></asp:Calendar>
                    
                </div>
            </div>
        </div>
        
        
        <div class="col-lg-2 col-md-2 col-sm-2"></div>
        <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="panel panel-primary">
                <div id="griddiv" class="panel-body" runat="server" visible="false">
                    <asp:GridView ID="GridViewDates" AutoGenerateColumns="false" runat="server" CssClass="grid" AlternatingRowStyle-BackColor="#F4F4F4" HeaderStyle-Height="40px" HeaderStyle-BackColor="#0099FF" HeaderStyle-ForeColor="Black" HeaderStyle-CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" HeaderStyle-HorizontalAlign="Center" HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" RowStyle-VerticalAlign="Middle" RowHeaderColumn="middle" HeaderStyle-BorderWidth="0px" >
                        <Columns>
                            <asp:BoundField DataField="Dates" HeaderText="Selected Dates" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-success" OnClick="Button1_Click" runat="server" Text="Update" />
                </div> 
            </div>
        </div>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

