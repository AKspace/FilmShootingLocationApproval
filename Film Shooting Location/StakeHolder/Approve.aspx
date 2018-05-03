<%@ Page Title="" Language="C#" MasterPageFile="~/StakeHolder/StakeHolderMaster.master" AutoEventWireup="true" CodeFile="Approve.aspx.cs" Inherits="StakeHolder_Approve" %>

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
            <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Fee"></asp:Label>
            <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Approve" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

