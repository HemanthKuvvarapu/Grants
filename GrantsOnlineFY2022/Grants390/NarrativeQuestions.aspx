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
                <b>1.</b>&nbsp;Please describe one specific, positive impact that the FY2021 Head Start State Supplemental grant funding had in your Head Start or Early Head Start program last year and how it helped you to provide high-quality comprehensive services in your program during the pandemic.<br />
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
                <b>2.</b>&nbsp;Please describe the specific staffs’ salaries that you will be supporting with the FY2022 Head Start State Supplemental grant funding and report the ways your program is continuing to address staff retention. (See Part 9. Required grant form- Staff Salary Chart- you must download and complete and upload).<br />
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
                <b>3.</b>&nbsp;Please describe the specific staff that you will be providing incentives and/or stipends to with the FY2022 Head Start State Supplemental grant funding who achieved a credential and/or a degree or are on a path to earn a credential and/or degree in the Early Childhood field and/or related Human Services field. (See Part 9. Required grant form- Staff  Incentive Chart- you must download and complete and upload) <br />
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
                <b>4.</b>&nbsp;Provide at least one example of your Head Start or Early Head Start Program goals (from your current Federal Head Start Grant Application) that are focused on improving program quality for FY2022.
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
                <b>5.</b>&nbsp;Please describe successful strategies that your program has implemented to meet your 20% Non-Federal match beyond this grant funding.
                
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
                <b>6.</b>&nbsp;In the last year has your program requested a non-Federal share waiver? Yes or No.
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA6" runat="server" TextMode="MultiLine" Width="98%" Rows="2"
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
                <b>7.</b>&nbsp;<b>7.	Please report the specific number of total children anticipated to be served in FY22 in your program through the following funding sources: </b>.<br />
                <%--<ul>
                Total number of children served ________<br />
                Head Start only funded children______________<br />
                Early Head Start only funded children__________<br />
                Head Start State Supplemental only funded children _________<br />
                Early Head Start State Supplemental only funded children ______<br />
                Head Start and State Supplemental children (blended funding) _______<br />
                Early Head Start and State Supplemental children (blended funding) _______<br />
                </ul>--%>
                <br />
                <b>7a.</b>&nbsp;Total number of children served in your program <asp:TextBox ID="txtA7" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator1" ControlToValidate="txtA7" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7b.</b>&nbsp;Head Start <b>only</b> funded children <asp:TextBox ID="txtA8" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator2" ControlToValidate="txtA8" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7c.</b>&nbsp;Early Head Start <b>only</b> funded children <asp:TextBox ID="txtA9" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator3" ControlToValidate="txtA9" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7d.</b>&nbsp;Head Start State Supplemental <b>only</b> funded children <asp:TextBox ID="txtA10" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator4" ControlToValidate="txtA10" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7e.</b>&nbsp;Early Head Start State Supplemental <b>only</b> funded children <asp:TextBox ID="txtA11" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator5" ControlToValidate="txtA11" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7f.</b>&nbsp;Head Start and State Supplemental children <b>(blended funding)</b> <asp:TextBox ID="txtA12" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator6" ControlToValidate="txtA12" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                <b>7g.</b>&nbsp;Early Head Start and State Supplemental children <b>(blended funding)</b> <asp:TextBox ID="txtA13" runat="server" Font-Names="Arial" Font-Size="12pt" MaxLength="10" Width="50px" Text=""></asp:TextBox>
                <asp:RegularExpressionValidator ID="txtValidator7" ControlToValidate="txtA13" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </td>
        </tr>
<%--        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA7" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt" 
                    Text="">
                    <%--Text = "Total number of children served ________
Head Start only funded children______________
Early Head Start only funded children__________
Head Start State Supplemental only funded children _________
Early Head Start State Supplemental only funded children ______
Head Start and State Supplemental children (blended funding) _______
Early Head Start and State Supplemental children (blended funding) _______  
                    ">            
                </asp:TextBox>
            </td>
        </tr>--%>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>8.</b>&nbsp;If there is a change in the number of projected Head Start and/or Early Head Start State Supplemental funded children from FY21 to FY22, please provide the total number of children that you will not be funding with this grant and a detailed explanation with a timeframe of how these funds will be used in FY22.
                
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA14" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
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
