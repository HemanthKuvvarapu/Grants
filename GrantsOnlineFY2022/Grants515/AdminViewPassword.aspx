<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminViewPassword.aspx.cs" Inherits="AdminViewPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="pnlDataSummary" runat="server" Visible="false">
    <br />
        <asp:Label ID="lblDataSummary" runat="server" 
        style="font-size: small; font-family: Verdana"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" 
            onclick="btnExportToExcel_Click" />
        &nbsp; <a href="AdminView.aspx" target="">&lt;&lt; Back to Home Page</a><br /><br />
        <asp:GridView ID="grdDataSummary" runat="server" 
        AlternatingRowStyle-CssClass="AlternateColor2" 
        style="font-family: Verdana; font-size: small" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Vertical">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" ForeColor="White" Font-Bold="True" />
            <AlternatingRowStyle BackColor="#DCDCDC" CssClass="AlternateColor2" />
        </asp:GridView>
        </asp:Panel>
</asp:Content>

