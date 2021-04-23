<%@ Page Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="PreschoolHome.aspx.cs" Inherits="Preschool_2017_PreschoolHome" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPage4.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:#efefef">
<br />
<ol type="1" style="font-size:14px">
    <li><asp:HyperLink ID="lnkPreschoolProgramInformation" Enabled="true" runat="server">FY <%=AppInfo.FiscalYear%> IPLE Site Survey</asp:HyperLink><br /><br /><br /></li>
    <li><asp:LinkButton ID="lnkGrantOnlineLink" runat="server" 
            onclick="lnkGrantOnlineLink_Click">Grant Online Application</asp:LinkButton></li>
</ol>
<br />
</div>
</asp:Content>

