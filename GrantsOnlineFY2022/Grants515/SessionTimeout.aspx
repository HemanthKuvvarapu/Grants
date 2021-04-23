<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SessionTimeout.aspx.cs" Inherits="SessionTimeout" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        The session has been timeout. Please click <asp:HyperLink ID="lnkLogin" runat="server">here</asp:HyperLink>&nbsp; to login again.
    </div>
</asp:Content>
