﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="StakeholderDetails.aspx.cs" Inherits="Administrator_StakeholderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #a1{
            background-color:#30A5FF !important;
            color:white;
        }
    </style> 
    <script type="text/javascript">
        function Select(chkId) {           
            var gridId = document.getElementById("<%= stackholderDetails.ClientID %>");          
            var cell;
            if (gridId.rows.length > 0) {                
                for (i = 1; i < gridId.rows.length; i++) {                    
                    cell = gridId.rows[i].cells[0];                    
                    for (j = 0; j < cell.childNodes.length; j++) {                                     
                        if (cell.childNodes[j].type == "checkbox") {                          
                            cell.childNodes[j].checked = document.getElementById(chkId).checked;
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/Administrator/Default.aspx">Dashboard</a></li>
                <li class="active">Stakeholder Details</li>
			</ol>
		    </div>
    <br />
    <br />
    <div>
        <asp:GridView ID="stackholderDetails" runat="server" Width="100%" DataKeyNames="stakeholderid" EmptyDataText="NO RECORDS!" CssClass="" GridLines="None" ShowHeader="true" ShowFooter="false" AutoGenerateColumns="False" EmptyDataRowStyle-Width="100%" Height="20px" OnRowDataBound="manageStack_RowDataBound" >
            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="left">
                    <ItemStyle CssClass="infotable" Width="5%" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox1" ClientIDMode="Static" runat="server"  OnClick="Select('CheckBox1')"/>
                    </HeaderTemplate>
                    <AlternatingItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </AlternatingItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="stakeholdername" HeaderText="Name" ReadOnly="true" ItemStyle-CssClass="data" HeaderStyle-CssClass="header" HeaderStyle-Height="70px">
                    <HeaderStyle CssClass="header" Height="40px"></HeaderStyle>

                    <ItemStyle CssClass="data"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="true" ItemStyle-CssClass="data" HeaderStyle-CssClass="header" HeaderStyle-Height="70px">
                    <HeaderStyle CssClass="header" Height="40px"></HeaderStyle>

                    <ItemStyle CssClass="data"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="phoneno" HeaderText="Phone" ReadOnly="true" ItemStyle-CssClass="data" HeaderStyle-CssClass="header" HeaderStyle-Height="70px">
                    <HeaderStyle CssClass="header" Height="40px"></HeaderStyle>

                    <ItemStyle CssClass="data"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;Options" ShowHeader="True">
                    <ItemStyle Width="10%" CssClass="" />
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEdit" runat="server" OnClick="ibtnEdit_Click" CausesValidation="false" ImageUrl="Resources/images/edit.png" ToolTip="Edit" />&nbsp;
                        <asp:ImageButton ID="ibtnDelete" runat="server" OnClick="ibtnDelete_Click" CausesValidation="false" ImageUrl="Resources/images/delete.png" ToolTip="Delete" OnClientClick="return confirm('DO YOU WANT TO DELETE THIS RECORD?')" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <AlternatingRowStyle BackColor="White" Height="30px" />
            <EditRowStyle BackColor="#2461BF"  Height="40px" />

            <EmptyDataRowStyle Width="100%"></EmptyDataRowStyle>

            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>


           <div class="container" style=""></div>
    <div style="padding-left: 0px; padding-top: 0px; text-align: left; padding-bottom: 15px; width: 100%; padding-top:20px; margin-left:15px">
        <table width="95% cellpadding="0px" cellspacing="0px" >
            <tr >
                <td style="width: 47%; text-align: left; vertical-align: middle;">
                    <asp:Button ID="btnDelete" runat="server" CssClass="btnClass" Text="DELETE" OnClick="btnDelete_Click"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="btnAdd" runat="server" CssClass="btnClass" Text="Add New Stakeholder" PostBackUrl="~/Administrator/AddStakeholder.aspx"></asp:Button>
                </td>

                <td style="width: 18%; text-align: right; vertical-align: top;">
                    <asp:DropDownList ID="ddlPageSize" runat="server" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" AutoPostBack="true" Width="100%" CssClass="drpClass">
                        <asp:ListItem Text="&nbsp;SHOW 15 RECORDS" Value="15" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="&nbsp;SHOW 25 RECORDS" Value="25"></asp:ListItem>
                        <asp:ListItem Text="&nbsp;SHOW 50 RECORDS" Value="50"></asp:ListItem>
                        <asp:ListItem Text="&nbsp;SHOW ALL RECORDS" Value="5000"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                <td style="width: 5px; text-align: right; vertical-align: middle;" class="pagingClass">
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Text="&raquo;" OnClick="lnkbtnNext_Click" CssClass="btnClass" Font-Size="Medium"></asp:LinkButton>
                </td>
                <td style="width:20px; text-align: center;vertical-align:middle; text-wrap:normal;" class="pagingClass">
                    <asp:DataList ID="dlPaging" runat="server" OnItemDataBound="dlPaging_ItemDataBound" OnItemCommand="dlPaging_ItemCommand" RepeatDirection="Horizontal" Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %> ' CssClass="btnClass"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td style="width: 5px; text-align: right; vertical-align: middle;" class="pagingClass">
                    <asp:LinkButton ID="lnkbtnPrevious" runat="server" Text="&laquo;" OnClick="lnkbtnPrevious_Click" CssClass="btnClass" Font-Size="Medium"></asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    </div>



</asp:Content>

