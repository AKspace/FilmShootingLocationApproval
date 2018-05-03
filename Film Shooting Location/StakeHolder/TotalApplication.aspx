<%@ Page Title="" Language="C#" MasterPageFile="~/StakeHolder/StakeHolderMaster.master" AutoEventWireup="true" CodeFile="TotalApplication.aspx.cs" Inherits="StakeHolder_TotalApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function Select(chkId) {           
            var gridId = document.getElementById("<%= gdTotalApplication.ClientID %>");          
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/StakeHolder/Default.aspx">Dashboard</a></li>
                <li class="active">Total Applications</li>
			</ol>
		    </div>
     <br /><br />
    <div class="col-lg-12 col-md-12 col-sm-12">
        <asp:GridView id="gdTotalApplication" runat="server" Width="100%" DataKeyNames="applicationid" EmptyDataText="NO RECORDS!" GridLines="None" AutoGenerateColumns="False" EmptyDataRowStyle-Width="100%" Height="100%" CellPadding="4" ForeColor="#333333" RowStyle-Height="50px">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
             <asp:TemplateField ItemStyle-HorizontalAlign ="left">
                                    <ItemStyle CssClass ="infotable" Width ="5%"/>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect"  runat="server"/>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" ClientIDMode="Static"  OnClick="Select('CheckBox1')"/>
                                    </HeaderTemplate>
                                    <AlternatingItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                    </AlternatingItemTemplate>
                                </asp:TemplateField>                            
                                <asp:BoundField DataField="appid" HeaderText="Application Id" ReadOnly="true" ItemStyle-CssClass="" />
                                <asp:BoundField DataField="movname" HeaderText="Movie Name " ReadOnly="true" ItemStyle-CssClass="" />
<%--                <asp:BoundField DataField=" " HeaderText="Status" ReadOnly="true" ItemStyle-CssClass=""  />--%>
                <asp:BoundField DataField="dateofapp" HeaderText="Date of Application" ReadOnly="true" ItemStyle-CssClass=""  />
                <asp:BoundField DataField="statusname" HeaderText="Status" ReadOnly="true" ItemStyle-CssClass=""  />
                           <asp:TemplateField HeaderText="&nbsp;&nbsp;Options" ShowHeader="True">
                                    <ItemStyle width="10%" CssClass="infotable" /> 
                                    <ItemTemplate>
                                     <%--   <asp:ImageButton ID="ibtnEdit" runat ="server" OnClick="ibtnEdit_Click" CausesValidation="false" ImageUrl="Resources/images/edit.png" ToolTip="Edit"/>&nbsp;
                                        <asp:ImageButton ID="ibtnDelete" runat="server" OnClick="ibtnDelete_Click" CausesValidation="false" ImageUrl="Resources/images/delete.png" ToolTip="Delete" OnClientClick="return confirm('DO YOU WANT TO DELETE THIS RECORD?')" />--%>

                                        <asp:LinkButton ID="linkButtonView" runat="server" Text="View" OnClick="linkButtonView_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
      
                                </Columns>
                            <EditRowStyle BackColor="#999999" />

                            <EmptyDataRowStyle Width="100%"></EmptyDataRowStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="50px" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="35px" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>                        
    </div>
    <div class="container" style=""></div>
    <div style="padding-left: 0px; padding-top: 0px; text-align: left; padding-bottom: 15px; width: 100%; padding-top:20px; margin-left:15px">
        <table width="95% cellpadding="0px" cellspacing="0px" >
            <tr >
                <td style="width: 47%; text-align: left; vertical-align: middle;">
                   
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
    
</asp:Content>

