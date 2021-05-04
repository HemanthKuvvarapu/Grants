<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavMenuItem.ascx.cs" Inherits="controls_NavMenuItem" %>
           <table id="tblMenuItem" align="left" valign="top" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td valign="top" align="left" style="color:#b4121b;height:23px;">
                            <asp:LinkButton ID="lnkMenuItem" runat="server" CssClass="navTopMenuItemB"
                                onclick="lnkMenuItem_Click"  CausesValidation="False" ForeColor="#ffffff"
                                CommandArgument="0" style="height:23px;">Menu Item
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>