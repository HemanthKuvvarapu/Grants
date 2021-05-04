<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReviewerComment.aspx.cs"
    Inherits="ReviewerComment" Title="Reviewer Comment"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 500px;
            background-color: #F0F5F2; border-color: #E7E7FF; border-width: 1px; border-style: None;
            border-collapse: collapse;">
            <tr>
                <td style="width: 100px">
                    <b>Reviewer: </b>
                </td>
                <td>
                    <asp:Label ID="lblReviewerName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Date: </b>
                </td>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Status: </b>
                </td>
                <td>
                    <asp:DropDownList ID="cboStatus" runat="server">
                        <asp:ListItem Value="1">Completed</asp:ListItem>
                        <asp:ListItem Value="2">Pending</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Comment: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtComment" runat="server" Rows="5" TextMode="MultiLine" Width="360px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="80" 
                        onclick="btnSave_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="grdComment" runat="server" AutoGenerateColumns="False" 
            onrowdatabound="grdComment_RowDataBound">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 500px;
                            background-color: #F7F6F3; border-color: #E7E7FF; border-width: 1px; border-style: None;
                            border-collapse: collapse;">
                            <tr>
                                <td style="width: 100px">
                                    <b>Reviewer: </b>
                                </td>
                                <td>
                                    <asp:Label ID="lblReviewerName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Date: </b>
                                </td>
                                <td>
                                    <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Status: </b>
                                </td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Comment: </b>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtComment" runat="server" Rows="5" TextMode="MultiLine" Width="360px"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
