<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="RequiredGrantForms.aspx.cs" Inherits="RequiredGrantForms" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
    .leftStyle
    {
        padding-left:5px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td>
                <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            The Information has been SAVED successfully.<br />
                            <br />
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Checklist (Part 10)"
                                Visible="true" OnClick="btnNextPart_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="250px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            <span class="styleErrors">The Information has been SAVED with the following error(s).<br />
                                <ul style="font-weight: normal">
                                    <li>
                                        <asp:Label ID="lblErrors" runat="server"></asp:Label></li>
                                </ul>
                            </span><span style="text-align: center">
                                <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Home" Visible="true"
                                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="200px" />
                            </span>
                            <br />
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
    <table id="tblGPCS" runat="server" cellpadding="0" cellspacing="0" border="0" style="width:100%">
        <tr>
            <td>
                <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>
                <table runat="server" cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                    <tr>
                        <td>
                            <asp:DataList ID="dlstFile" runat="server" Width="100%" OnItemDataBound="dlstFile_ItemDataBound" OnItemCommand="dlstFile_ItemCommand">
                            <ItemTemplate>
                                <table style="width:100%;background-color:#dddddd">
                                    <tr>
                                        <td><img src="images/spacer.gif" width="70%" height="1" alt="" /></td>
                                        <td><img src="images/spacer.gif" width="30%" height="1" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td class="leftStyle">
                                            <asp:Literal ID="lblCustomText" runat="server"></asp:Literal>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="trFileUploaded" visible="false" runat="server">
                                        <td colspan="2" class="leftStyle">
                                            <b>Attached File:</b>&nbsp;&nbsp;<asp:LinkButton ID="lnkFileUploaded" runat="server" Text="FileName.pdf" CommandName="ShowFile"></asp:LinkButton>
                                            <asp:Image ID="imgFileUploadedIcon" runat="server" ImageUrl="images/pdficon_large.gif" Width="30px" Height="30px" />
                                            &nbsp;<asp:Button ID="btnRemoveFileUploaded" runat="server" Text="Remove file" />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr id="trFileChange" runat="server">
                                        <td colspan="2" class="leftStyle">
                                            If you want to change the attached file, remove the file and select a different one.
                                        </td>
                                    </tr>
                                    <tr id="trUploadFile" runat="server">
                                        <td colspan="2" class="leftStyle">
                                            <asp:FileUpload runat="server" ID="fileUpload" Width="655px" />
                                            <asp:HiddenField ID="FileUploadedType" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td height="50px" align="center">
                <asp:LinkButton ID="btnPrintRequiredForms" runat="server" Text="Save and Print" OnClick="btnPrintRequiredForms_Click"
                        CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" OnClick="btnCancel_Click"
                                CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnUploadFiles" runat="server" Text="Save Information" OnClick="btnUploadFiles_Click" CssClass="buttonClass" />
            </td>
        </tr>
    </table>
</asp:Content>
