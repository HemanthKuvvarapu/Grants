<%@ Page Title="Check List" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PDFCheckList.aspx.cs" Inherits="PDFCheckList" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            color: #0066FF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
        <tr>
            <td align="center" style="height: 50px; padding-top: 5px">
                The Checklist has been SAVED successfully.<br />
                <br />
                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                    Width="200px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Cover Page (Part 11)"
                    Visible="true" OnClick="btnNextPart_Click" CausesValidation="false" CssClass="buttonClass2"
                    Width="250px" />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <table id="tblCheckList" runat="server" cellpadding="2" cellspacing="2" width="100%"
        border="1">
        <tr>
            <td colspan="3" align="center">
                <b>Checklist for Required Grant Application Documents<br />
                </b>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <b>Online Grant Application</b>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Within the Online Application the following forms were completed:
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>Applicant use only:</b>
            </td>
            <td align="center">
                <b>EEC use only:</b>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA2" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE2" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart1Title%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA3" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE3" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart2Title%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA8" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE8" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart3Title%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA4" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE4" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart4Title%>
            </td>
        </tr>
        <tr id="RequiredProgram" runat="server">
            <td align="center">
                <asp:CheckBox ID="chkA5" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE5" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart5Title%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA6" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE6" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart6aTitle%>
            </td>
        </tr>
        <tr id="BudgetSummary1Year" runat="server" visible="false">
            <td align="center">
                <asp:CheckBox ID="chkA25" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE25" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart6bTitle%>
            </td>
        </tr>
        <tr id="BudgetSummary2Year" runat="server" visible="false">
            <td align="center">
                <asp:CheckBox ID="chkA26" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE26" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart6cTitle%>
            </td>
        </tr>
        <tr id="NarrativeQuestions" runat="server" visible="true">
            <td align="center">
                <asp:CheckBox ID="chkA7" runat="server"/>
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE7" runat="server"/>
            </td>
            <td>
                <%=AppInfo.DisplayPart7Title%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA18" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE18" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart8Title%>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" style="padding-top:10px">
                <asp:CheckBox ID="chkA22" runat="server" Visible="false"/><br />
                <asp:CheckBox ID="chkA101" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkA102" runat="server" Enabled="false"/><br />
                <%--<asp:CheckBox ID="chkA103" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkA104" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkA105" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkA106" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkA107" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkA108" runat="server" Enabled="false"/><br />--%>
                <br />
            </td>
            <td align="center" valign="top" style="padding-top:10px">
                <asp:CheckBox ID="chkE22" runat="server" Visible="false"/><br />
                <asp:CheckBox ID="chkE101" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkE102" runat="server" Enabled="false"/><br />
                <%--<asp:CheckBox ID="chkE103" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkE104" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkE105" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkE106" runat="server" Enabled="false"/><br />--%>
                <%--<asp:CheckBox ID="chkE107" runat="server" Enabled="false"/><br />
                <asp:CheckBox ID="chkE108" runat="server" Enabled="false"/><br />--%>
                <br />
            </td>
            <td>
                <%=AppInfo.DisplayPart9Title%>
                <ul type="circle">
                    <%--<li>Narrative Response</li>--%>
                    <%--<li>Service Delivery Plan</li>--%>
                    <%--<li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>
                    <li>Lead Agency Organization Chart</li>--%>
                    <%--<li>Grant Organization Chart</li>--%>
                    <%--<li>Key Personnel Statement</li>--%>
                    <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>
                    <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>
                </ul>
                <span style="color:red">Please Note: The Required Grant Forms must be submitted as hard copies as these do <u>not</u> print as part of the PDF document. <u>Grant applications will be considered incomplete if hard copies are not received</u>.</span>    
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA23" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE23" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart10Title%> (this form)
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA24" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE24" runat="server" />
            </td>
            <td>
                <%=AppInfo.DisplayPart11Title%>
            </td>
        </tr>
        <tr id="blanktr" runat="server">
            <td colspan="3" align="center" style="height:50px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <b>Part 12 - Administrative Forms:</b><br />
                    Applicants who have previous contract(s) with the Commonwealth and have up-to-date, ink-signature versions the Request for Taxpayer Identification and Verification (Mass. Substitute W-9 Form), and Authorization for Electronic Funds Transfer on file with the Office of the State Comptroller may submit copies of the signed forms. However, a <b>new Standard Contract Form</b> and <b>Contractor Authorized Signatory Listing</b> with original ink signatures must be submitted for each new contract with the Commonwealth. Please note it is the responsibility of the applicant to ensure that EEC has the most current MA Administrative forms. Please submit new forms if there are any changes.
<%--                Bidders who have previous contract(s) with the Commonwealth and have up-to-date, ink-signature versions of the Commonwealth Terms and Conditions, the Request for Taxpayer Identification and Verification (Mass. Substitute W-9 Form), and Authorization for Electronic Funds Transfer on file with the Office of the State Comptroller may submit copies of the signed forms.  However, a <b>new Standard Contract Form</b> and <b>Contractor Authorized Signatory Listing</b> with original ink signatures must be submitted for each new contract with the Commonwealth.  --%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkF18" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkF19" runat="server" />
            </td>
            <td>
                Check if all forms are on file
            </td>
        </tr>
        <%--<tr>
            <td align="center">
                <asp:CheckBox ID="chkA12" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE12" runat="server" />
            </td>
            <td>
                Commonwealth Terms &amp; Conditions
            </td>
        </tr>--%>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA13" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE13" runat="server" />
            </td>
            <td>
                W-9 with DUNS #
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA14" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE14" runat="server" />
            </td>
            <td>
                Contractor Authorized Signatory Listing
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA15" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE15" runat="server" />
            </td>
            <td>
                Authorization for Electronic Funds Payment (EFT) Form
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA16" runat="server" />
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE16" runat="server" />
            </td>
            <td>
                Federal Funding and Accountability and Transparency Act (FFATA) Reporting Requirements
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;
            </td>
            <td align="center">
                <asp:CheckBox ID="chkE17" runat="server" />
            </td>
            <td>
                <b>Fund Code <%=AppInfo.FundCode%> Online Application Submission Date_______</b>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:CheckBox ID="chkA17" runat="server" />
            </td>
            <td align="center">
                &nbsp;
            </td>
            <td>
                Mail one (1) original (all signatures in <span class="style1">blue ink</span>) 
                and <%=AppInfo.MailCopiesEn%> (<%=AppInfo.MailCopies%>) copy of all grant forms/documents.</td>
        </tr>
        <tr>
            <td colspan="3">
                <b>
                    <br />
                    To be mailed to:<br />
                    Department of Early Education and Care<br />
                    FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Grant (Fund Code <%=AppInfo.FundCode%>)<br />
                    <asp:Label ID="lblOrgname" runat="server" Text="[Orgname]"></asp:Label>
                    <br />
                    Attention: <%=AppInfo.Adminstrator%> Grants Administration
                    <br />
                    51 Sleeper Street, 4th Floor<br />
                    Boston, MA 02210</b>
                <br />
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="height: 100px; width: 100%">
        <tr>
            <td align="center" valign="middle">
                <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" OnClick="btnSavePrint_Click" CausesValidation="true" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnContinue" runat="server" Text="Cancel Save" OnClick="btnCancel_Click" CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnSaveContinue" runat="server" Text="Save Information" OnClick="btnSave_Click" CausesValidation="true" CssClass="buttonClass" />
            </td>
        </tr>
    </table>
</asp:Content>
