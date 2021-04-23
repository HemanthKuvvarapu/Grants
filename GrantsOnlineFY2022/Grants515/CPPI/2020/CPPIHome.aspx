<%@ Page Language="C#" MasterPageFile="~/MasterPageNEW4.master" AutoEventWireup="true" CodeFile="CPPIHome.aspx.cs" Inherits="CPPIHome" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPageNEW4.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:#efefef">
<br />
<ol type="1" style="font-size:14px">
    <li><asp:HyperLink ID="lnkDistrictInformation" Enabled="true" runat="server">Lead Agency Summary Page</asp:HyperLink><br /><br /><br /></li>
    <li><asp:HyperLink ID="lnkProgramInformation" Enabled="true" runat="server">Program/Subcontractor Information</asp:HyperLink><br /><br /><br /></li>
    <li><asp:LinkButton ID="lnkGrantOnlineLink" runat="server" onclick="lnkGrantOnlineLink_Click">Grant Online Application</asp:LinkButton></li>
</ol>
<br />
</div>
</asp:Content>

