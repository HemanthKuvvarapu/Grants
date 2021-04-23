<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavMenuItem.ascx.cs" Inherits="controls_NavMenuItem" %>

                <table id="tblMenuItem" align="left" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td><asp:Image ID="imgLeft" runat="server"  Width="22" Height="37"
                                ImageUrl="~/images/spacer.gif" /></td>
                        <td valign="middle" align="center" style="color:#b5111a;height:37px">
                            <asp:LinkButton ID="lnkMenuItem" runat="server" CssClass="navTopMenuItemF"
                                onclick="lnkMenuItem_Click" Width="100px" CausesValidation="False" ForeColor="#b4121b"
                                CommandArgument="0" >
                                Menu<br />Item
                            </asp:LinkButton>
                        </td>
                        <td><asp:Image ID="imgRight" runat="server" Width="22" Height="37"
                                ImageUrl="~/images/spacer.gif" /></td>
                    </tr>
                </table>