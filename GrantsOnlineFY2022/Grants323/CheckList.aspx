<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CheckList.aspx.cs" Inherits="CheckList" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .styleLeftCol
        {
            padding-left: 10px;
        }
        .styleError
        {
            color: Red;
            border-style: none;
            background-color: #ffffff;
            font-weight: normal;
            font-size: 12px;
        }
        .styleWarning
        {
            color: Blue;
            border-style: none;
            background-color: #ffffff;
            font-weight: normal;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div id="amendmentHeader" runat="server" style="width:100%;text-align:center;background-color:yellow"><b style="color:#000000">To complete a Budget Amendment, scroll down to bottom of page.<br />
        </b></div><br />
    <table cellpadding="0" cellspacing="0" border="0" style="border: 1px solid #cccccc;
        width: 100%; font-family: Arial; font-size: 13px">
        <tr>
            <td>
                <table id="tblCheckList" runat="server" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 30%">
                            &nbsp;
                        </td>
                        <td style="width: 40%">
                            &nbsp;
                        </td>
                        <td style="width: 10%">
                            &nbsp;
                        </td>
                        <td style="width: 20%">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectContactInfoPart1" runat="server" CausesValidation="false"
                                Text="View/Edit" Width="120px" OnClick="btnSelectContactInfoPart1_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart1Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart1" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart1" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectCommuntiesServedPart2" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectCommuntiesServedPart2_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart2Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart2" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart2" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectLanguagesServedPart3" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectLanguagesServedPart3_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart3Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart3" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart3" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectLeadAgencyBudgetPart4" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectLeadAgencyBudgetPart4_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart4Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart4" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart4" runat="server" CssClass="styleError"></asp:Label><br />
                            <asp:Label ID="lblWarningPart4" runat="server" CssClass="styleWarning"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectSubcontractorPart5" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectSubcontractorPart5_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart5Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart5" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart5" runat="server" CssClass="styleError"></asp:Label><br />
                            <asp:Label ID="lblWarningPart5" runat="server" CssClass="styleWarning"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectBudgetSummaryPart6a" runat="server" CausesValidation="false"
                                Text="View/Read Only" Enabled="true" Width="120px" OnClick="btnSelectBudgetSummaryPart6a_Click"
                                Height="27px" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart6aTitle%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart6a" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart6a" runat="server" CssClass="styleError"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr id="Section6b_1" runat="server">
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectBudgetSummaryPart6b" runat="server" CausesValidation="false"
                                Text="View/Read Only" Enabled="true" Width="120px" OnClick="btnSelectBudgetSummaryPart6b_Click"
                                Height="27px" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart6bTitle%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart6b" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart6b" runat="server" CssClass="styleError"></asp:Label><br />
                        </td>
                    </tr>
                    <tr id="Section6b_2" runat="server">
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr id="Section6c_1" runat="server">
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectBudgetSummaryPart6c" runat="server" CausesValidation="false"
                                Text="View/Read Only" Enabled="true" Width="120px" OnClick="btnSelectBudgetSummaryPart6c_Click"
                                Height="27px" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart6cTitle%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart6c" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart6c" runat="server" CssClass="styleError"></asp:Label><br />
                        </td>
                    </tr>
                    <tr id="Section6c_2" runat="server">
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectNarrativeQuestionsPart7" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectNarrativeQuestionsPart7_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart7Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart7" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart7" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectProjectedDeliverablePart8" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectProjectedDeliverablePart8_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart8Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart8" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart8" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectRequiredGrantFormsPart9" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectRequiredGrantFormsPart9_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart9Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart9" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart9" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectChecklistPart10" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectChecklistPart10_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart10Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart10" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart10" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            <asp:Button ID="btnSelectCoverPagePart11" runat="server" CausesValidation="false"
                                Text="View/Edit" Enabled="true" Width="120px" OnClick="btnSelectCoverPagePart11_Click" />
                        </td>
                        <td class="styleLeftCol">
                            <%=AppInfo.DisplayPart11Title%>
                        </td>
                        <td>
                            <asp:Image ID="imgPart11" runat="server" ImageUrl="~/Images/InComplete.jpg" />
                        </td>
                        <td>
                            <asp:Label ID="lblErrorPart11" runat="server" CssClass="styleError"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table style="border: 1px solid #cccccc; background-color: #cccccc">
        <tr>
            <td style="padding: 5px; width: 80%">
                Please click the <b>Submit</b> button when you have completed your Online Application
                and are ready to <b>submit</b> your application to EEC for grant review. In order to save your Information, you must press Submit.
            </td>
            <td style="width: 20%;text-align:center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; font-family: Arial;
        font-size: 13px">
        <tr>
            <td>
                <b>Part 12 - ADMINISTRATIVE FORMS</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
               Applicants who have previous contract(s) with the Commonwealth and have up-to-date, ink-signature versions of the W-9 Form, and Authorization for Electronic Funds Transfer on file with the Office of the State Comptroller may submit copies of the signed forms. <b>However, a new Standard Contract Form and Contractor Authorized Signatory Listing with original ink signatures must be submitted for each new contract with the Commonwealth.  </b>
                <br />
                <br />
                Please note is it the responsibility of the applicant to ensure that EEC has the most current Administrative forms on record.  Please submit any of the following forms below if changes have been made.
                <br />
                <ul>
                    
                    <li><a href="docs/W9.doc" target="_blank">W-9 with DUNS #</a></li>
                    <li><a href="docs/Contractor Authorized Signatory.doc" target="_blank">Contractor Authorized Signatory
                        Listing</a></li>
                    <li><a href="docs/EFT_FORM_10.pdf" target="_blank">Authorization for Electronic Funds Payment
                        (EFT) Form</a></li>
                    <li><a href="docs/FFATA Reporting Requirements.docx" target="_blank">Federal Funding and Accountability and Transparency Act Reporting Requirement (FFATA)</a></li>
                </ul>
                <br />
                To alert EEC of your grant submission, please email EECSubmission@mass.gov with the subject line “<strong>FY 2022 Early Childhood Mental Health Consultation Submission Confirmation - <em>Your Agency Name</em></strong>”.
                <br />
<br />Obtain the appropriate signatures on the cover page (all signatures in <strong>blue</strong> ink) and additional attachments, if necessary.
                <br />
<br /><p style="color:red">
             We are not requiring that you submit hard copies of the grant application to EEC.  This means that you need to <b><i>submit the online application electronically</i></b> by the grant submission date, including uploading the required grant forms. <b><i> PLEASE DO NOT SEND ANY HARD COPIES OF THE GRANT APPLICATION TO EEC.</i></b>  We will send an approval email to you once we complete the grant review and the follow-up correspondences.  Once you receive that approval email, you will submit the <b><i>final-approved grant application as a PDF hard copy to EEC.</i></b> 
        </p>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table cellpadding="0" cellspacing="0" border="0" style="border: solid 1px #cccccc;
        width: 100%; background-color: #cccccc">
        <tr>
            <td style="padding: 5px;width:80%">
                Click the <b>Print Summary</b> button to <u>Review your Grant Application</u> as
                a PDF. This PDF must be submitted as a hard copy as part of the Grant Application.
            </td>
            <td style="width:20%;text-align:center">
                <asp:Button ID="btnPrint" runat="server" CausesValidation="false" Text="Print Summary"
                    OnClick="btnPrint_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table id="tblFinancialReport" runat="server" visible="true" style="border: 1px solid #cccccc; background-color: #cccccc" width="100%">
            <tr>
                <td style="padding: 5px; width: 80%">
                    <asp:Button ID="btnFinancialReport" Text="Final Financial Report" runat="server" 
                        onclick="btnFinancialReport_Click" />
                </td>
            </tr>
        </table>
    <br />
    <br />
    <div id="amendmentSection" runat="server">
        <table width="100%">
            <tr>
                <td>
                    <b>Budget Amendments</b>
                </td>
            </tr>
        </table>
        <br />
        <table id="tblAmendment1" runat="server" visible="false" style="border: 1px solid #cccccc; background-color: #cccccc" width="100%">
            <tr>
                <td style="padding: 5px; width: 80%">
                    <asp:Button ID="btnAmendmentHome1" Text="Budget Amendment #1" runat="server"  name="btnAmendmentHome1"
                        onclick="btnAmendmentHome1_Click" />
                </td>
            </tr>
        </table>
        <table id="tblAmendment2" runat="server" visible="false" style="border: 1px solid #cccccc; background-color: #cccccc" width="100%">
            <tr>
                <td style="padding: 5px; width: 80%">
                    <asp:Button ID="btnAmendmentHome2" Text="Budget Amendment #2" runat="server"  name="btnAmendmentHome2"
                        onclick="btnAmendmentHome2_Click" />
                </td>
            </tr>
        </table>
        <table id="tblAmendment3" runat="server" visible="false" style="border: 1px solid #cccccc; background-color: #cccccc" width="100%">
            <tr>
                <td style="padding: 5px; width: 80%">
                    <asp:Button ID="btnAmendmentHome3" Text="Budget Amendment #3" runat="server" name="btnAmendmentHome3"
                        onclick="btnAmendmentHome3_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
