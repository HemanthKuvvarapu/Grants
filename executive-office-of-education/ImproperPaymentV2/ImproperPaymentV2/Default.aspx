<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Improper Payment"%>
<%@ MasterType  virtualPath="~/MasterPage0.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0">
    <tr><td><asp:Label ID="UserMsg" style="color:Red" runat="server" Visible="false" Text=""></asp:Label></td></tr>
    <tr style="background-color:#dde9d5">
        <td><b>Reviewer Name:&nbsp;</b></td>
        <td><asp:TextBox ID="ReviewerName" runat="server">
            </asp:TextBox>&nbsp;</td>
        <td><b>Password:&nbsp;</b></td>
        <td><asp:TextBox ID="ReviewerPass" TextMode="password" runat="server">
            </asp:TextBox>&nbsp;</td>
        <td><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" /></td>    
    </tr>
    </table>
</asp:Content>
