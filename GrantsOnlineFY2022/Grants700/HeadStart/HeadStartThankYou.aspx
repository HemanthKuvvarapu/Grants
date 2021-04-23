<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HeadStartThankYou.aspx.cs" Inherits="HeadStart_HeadStartThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="border:1px solid #cccccc;background-color:#FFFFCC">
        <br />
        The Department of Early Education and Care (EEC) would like to thank you for completing the online portion of the 
        <br />
        FY <%=AppInfo.FiscalYear%> Head Start State Supplemental 
        Program Site Survey.<br />
        <br />
    </div>
    <br />
    <br />
    <div align="center">
        &nbsp;&nbsp;
        <asp:Button ID="btnSaveHome" runat="server" Text="Go to EEC grants page" OnClick="btnSaveHome_Click" />
    </div>
    
</asp:Content>
