<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Template.aspx.cs" Inherits="Template" Title="Untitled Page" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:720px" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>Put your content here.</td>
    </tr>
</table>
</asp:Content>

