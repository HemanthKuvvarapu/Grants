<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="TemplateInstructionText.aspx.cs" Inherits="Admin_TemplateInstructionText" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="../js/tinymce/tinymce.min.js"></script><script type="text/javascript">tinymce.init({    selector: "textarea",    plugins: [        "advlist autolink lists link image charmap print preview anchor",        "searchreplace visualblocks code fullscreen",        "insertdatetime media table contextmenu paste"    ],    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"});</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>Part 1</td>
                <td><asp:TextBox ID="txtPart1" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 2</td>
                <td><asp:TextBox ID="txtPart2" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 3</td>
                <td><asp:TextBox ID="txtPart3" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 4</td>
                <td><asp:TextBox ID="txtPart4" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 5</td>
                <td><asp:TextBox ID="txtPart5" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 6a</td>
                <td><asp:TextBox ID="txtPart6a" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 6b</td>
                <td><asp:TextBox ID="txtPart6b" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 6c</td>
                <td><asp:TextBox ID="txtPart6c" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 7</td>
                <td><asp:TextBox ID="txtPart7" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 8</td>
                <td><asp:TextBox ID="txtPart8" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 9</td>
                <td><asp:TextBox ID="txtPart9" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 10</td>
                <td><asp:TextBox ID="txtPart10" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr>
                <td>Part 11</td>
                <td><asp:TextBox ID="txtPart11" runat="server" Rows="5" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
        </table>
    </div>
    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
    </form>
</body>
</html>
