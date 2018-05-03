<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.master" AutoEventWireup="true" CodeFile="Status.aspx.cs" Inherits="Administrator_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:GridView id="status" runat="server" Width="100%" DataKeyNames="statusid" EmptyDataText="NO RECORDS!" GridLines="None" AutoGenerateColumns="False" EmptyDataRowStyle-Width="100%" Height="100%" OnRowDataBound="status_RowDataBound" CellPadding="4" ForeColor="#333333" AllowPaging="True" OnPageIndexChanging="status_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign ="left" ItemStyle-CssClass="data" HeaderStyle-CssClass="header">
                                    <ItemStyle CssClass ="chkSelect" Width ="5%"/>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect"  runat="server" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lnkSelectAll" runat="server" onclick="lnkSelectAll_Click" Text="Select All"  ForeColor="White"></asp:LinkButton>
                                     </HeaderTemplate>
                                                                 </asp:TemplateField>
                                <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="true" ItemStyle-CssClass="data" HeaderStyle-CssClass="header" HeaderStyle-Height="40px" >
<HeaderStyle CssClass="header" Height="50px"></HeaderStyle>

<ItemStyle CssClass="data"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="description" HeaderText="Description" ReadOnly="true" HeaderStyle-Height="40px" ItemStyle-CssClass="data" HeaderStyle-CssClass="header" >
<HeaderStyle CssClass="header" Height="50px"></HeaderStyle>

<ItemStyle CssClass="data"></ItemStyle>
                                </asp:BoundField>
                           <asp:TemplateField HeaderText="&nbsp;&nbsp;Options" ShowHeader="True">
                                    <ItemStyle width="10%" CssClass="header" /> 
                                    <ItemTemplate>
           <asp:ImageButton ID="ibtnEdit" runat ="server" OnClick="ibtnEdit_Click" CausesValidation="false" ImageUrl="Resources/images/edit.png" ToolTip="Edit" ImageAlign="Middle" />
                                        <asp:ImageButton ID="ibtnDelete" runat="server" onclick="ibtnDelete_Click" CausesValidation="false" ImageUrl="Resources/images/delete.png" ToolTip="Delete" OnClientClick="return confirm('DO YOU WANT TO DELETE THIS RECORD?')" ImageAlign="Middle" />
                                    </ItemTemplate>
                                </asp:TemplateField>
      
                                </Columns>
                           
            
            <EditRowStyle BackColor="#999999" />

<EmptyDataRowStyle Width="100%"></EmptyDataRowStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

</asp:Content>

