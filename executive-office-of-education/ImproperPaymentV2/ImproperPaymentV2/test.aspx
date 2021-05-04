<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="250" cellpadding ="0" cellspacing="0" border="0" style="background-color:#ffff00">
            <tr>
                <td>
                     <table cellpadding ="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <img src="images/spacer.gif" style="width:10px;height:1px" />
                            </td>
                            <td valign="top" style="padding-top:2px">
                                <img src="images/spacer.gif" style="width:1px;height:1px;display:none" />
                                <input type="checkbox" style="width:30px"/>
                            </td>
                            <td valign="top">
                                hello world 1 hello world 1 hello world 1 hello world 1 hello world 1
                                <input type="button" value="get" style="vertical-align:middle"/>
                            </td>
                        </tr>
                     </table>
                </td>
            </tr>
            <tr>
                <td>
                     <table cellpadding ="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <img src="images/spacer.gif" style="width:40px;height:1px" />
                            </td>
                            <td valign="top" style="padding-top:2px">
                                <img src="images/spacer.gif" style="width:1px;height:1px" />
                                <input type="checkbox" style="width:30px;display:none" />
                            </td>
                            <td valign="top">hello world 1 hello world 1 hello world 1 hello world 1 hello world 1
                            <input type="button" value="get" style="vertical-align:middle"/></td>
                        </tr>
                     </table>
                </td>
            </tr>
        </table>
    </div>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Horizontal">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </form>
</body>
</html>
