<%@ Page Title="" Language="C#" MasterPageFile="~/StakeHolder/StakeHolderMaster.master" AutoEventWireup="true" CodeFile="Reject.aspx.cs" Inherits="StakeHolder_Reject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="Application ID"></asp:Label>
            <asp:Label ID="lblApplicationid" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Location"></asp:Label>
            <asp:Label ID="lblLocation" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Remarks"></asp:Label>
            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reject" />
        </ContentTemplate>
    </asp:UpdatePanel> 
</asp:Content>

