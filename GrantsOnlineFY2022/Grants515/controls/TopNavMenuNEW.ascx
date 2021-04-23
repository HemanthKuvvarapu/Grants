<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNavMenuNEW.ascx.cs" Inherits="controls_TopNavMenuNEW" %>

<%@ Register src="NavMenuItemNEW.ascx" tagname="NavMenuItem" tagprefix="uc1" %>

<table id="menubar1" cellspacing="0" cellpadding="0" border="0" runat="server">
    <tr>
        <td align="left"><uc1:NavMenuItem ID="MenuItem1" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem2" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem3" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem4" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem5" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem6" runat="server" /></td>
        <td align="left"><uc1:NavMenuItem ID="MenuItem7" runat="server" /></td>
    </tr>
</table>
