<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="NarrativeQuestions.aspx.cs" Inherits="NarrativeQuestions" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 30px;
            text-align: center;
            background-color: #bababa;
            font-family: Arial;
            font-size: 13px;
        }
        .style2
        {
            background-color: #FFFFCC;
            padding-left: 5px;
            font-family: Arial;
            font-size: 13px;
            padding-bottom: 5px;
        }
        .style3
        {
            background-color: #FFFFCC;
            text-align: center;
            font-family: Arial;
            font-size: 13px;
        }
        .style4
        {
            font-family: Arial;
            font-size: 13px;
        }
        .styleErrors
        {
            text-align: left;
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
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Projected Deliverables (Part 8)"
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
    <span class="style4">
        <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
</span>
    <table id="tblPartIII" runat="server" style="width: 100%; font-family: Arial; font-size: 13px"
        cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="style1">
                <b>Topic and Questions</b>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>1. Please describe your program or agency’s system of fiscal and programmatic management specific to the oversight and administration of this grant.</b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA1" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>2. Please describe how your program or agency currently approaches the <b>MA-QRIS process</b>, including staff involvement, planning time, self-assessment, quality planning, and any other relevant information; what will change as a result of UPK funding; and how will those practices be sustained at the end of the grant cycle.  </b> 
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA2" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>3. Please describe how your program or agency currently approaches the <b>child screening and formative assessment process</b>; what will change as a result of UPK funding; and how will those practices be sustained at the end of the grant cycle. Ensure your answer addresses how child screening and formative assessment impacts curriculum planning and individualization.  </b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA3" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>4. Please describe how your program or agency determines the <b>professional development needs</b> for staff members; what professional development opportunities will be supported with UPK funding; and how will those professional development needs be sustained at the end of the grant cycle. Ensure your answer addresses how professional development is delivered both internally and externally and identify any outside professional development entities that your program or agency contracts with.  </b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA4" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>

        <tr>
            <td class="style2">
                <b>5. Please describe how your program or agency currently provides <b>comprehensive services</b> for preschool children; what will change as a result of UPK funding; and how will these services be sustained at the end of the grant cycle.</b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA5" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>6. Please describe how your program or agency currently <b>engages with families</b>; what will change as a result of UPK funding; and how will these practices and services be sustained at the end of the grant cycle. Ensure your answer addresses daily and on-going commination as well as general engagement strategies with families.</b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA6" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>7. Please describe how your program or agency currently provides <b>transition to kindergarten supports and services</b> for preschool children and families; what will change as a result of UPK funding; and how will these supports and services be sustained at the end of the grant cycle.</b>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA7" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>

        <tr>
            <td style="font-size: xx-small">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                    <tr>
                        <td height="100" align="center">
                            <asp:LinkButton ID="btnPrintHSNQ" runat="server" Text="Save and Print" OnClick="btnPrintHSNQ_Click"
                                CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" OnClick="btnCancel_Click"
                                CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnSave" runat="server" Text="Save Information" OnClick="btnSave_Click"
                                CausesValidation="true" CssClass="buttonClass" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
