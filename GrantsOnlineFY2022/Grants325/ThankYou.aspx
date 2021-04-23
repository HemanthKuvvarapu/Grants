<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="ThankYou" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<fieldset><legend></legend>
<div align=center><br />
<asp:Label ID=lblMessage runat=server Text=""></asp:Label>
    <br />
    <br />
    <asp:LinkButton runat="server" ID=lbtnContinue Text="Continue" 
        onclick="lbtnContinue_Click"></asp:LinkButton>
    <asp:LinkButton runat="server" ID=lbtnGoHome 
        Text="Click here to go to Home Page" onclick="lbtnGoHome_Click"></asp:LinkButton>
</div>
</fieldset>
</asp:Content>

