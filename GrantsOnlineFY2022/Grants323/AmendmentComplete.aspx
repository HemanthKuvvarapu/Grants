<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AmendmentComplete.aspx.cs" Inherits="AmendmentComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="border:1px solid #cccccc;background-color:#ededed">
        <br />
        The Department of Early Education and Care (EEC) would like to thank you for completing
        the online portion of the FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment Application.<br />
        <br />
        <b>To confirm the completion of the online portion of this Budget Amendment Application</b>, an
        email should be sent to EEC via the following e-mail address: <a href="mailto:EECSubmission@mass.gov?subject=FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment Submission Confirmation- Lead Agency ">
            EECSubmission@mass.gov</a>.
        <br />
        <br />
        <table id="printSummaryTable" runat="server" cellpadding="0" cellspacing="0" width="100%" style="border: 3px solid #ff0000;">
            <tr>
                <td style="padding: 5px" class="style6">
                    Click the <b>Print Summary</b> button to review your Budget Amendment as
                    a PDF. This PDF must be submitted as a hard copy with your Budget Amendment Cover Page.
                </td>
                <td style="text-align: center; padding: 1px 4px">
                    <asp:Button ID="btnPrint" runat="server" CausesValidation="false" Text="Print Summary"
                        OnClick="btnPrint_Click" />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <table>
        <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" >
            <tr>
                <td><u><b>Budget Amendment Process:</b></u></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>To alert EEC of your grant submission, please email <a href="EECSubmission@mass.gov">EECSubmission@mass.gov</a> with the subject line “<strong>FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment Submission Confirmation - <em>Your Agency Name</em></strong>”.</li>
                        <li>The "contact name" each grantee indicates on the Budget Amendment will be notified via email once the request has been approved or denied.</li>
                        <li><b>Grantees can begin to implement activities/funding changes ONLY AFTER the approval email is received.  You cannot spend your funds prior to this approval.</b></li>
                        <li>Grants Administration will forward all approved Budget Amendments to EEC’s 
                            Grants Contract staff for fiscal processing.  Grants Contract staff will mail a hard copy of the approved Budget Amendment to the designated contact.  The signed copy of the approved Budget Amendment Request Form should be received within two weeks of receiving an approval email from Grants Administration.</li>
                        <li>If you receive the email notice that your Budget Amendment has been approved but have not yet received a copy of the signed and approved request from EEC after two weeks, contact the Grants 
                            Contract Staff:<br />
                            <ul>
                            <li>Barbara Boyd&nbsp;&nbsp;617.988.2438&nbsp;&nbsp;<a href="mailto:barbara.boyd@mass.gov">barbara.boyd@mass.gov</a></li>
                            <li>Janee Carroll&nbsp;&nbsp;617.988.2439&nbsp;&nbsp;<a href="mailto:janee.carroll@mass.gov">janee.carroll@mass.gov</a></li>
                            <%--<li>Loida Marquez&nbsp;&nbsp;617.988.2443&nbsp;&nbsp;<a href="mailto:loida.marquez@mass.gov">loida.marquez@mass.gov</a> (Grants 391 & 262 only)</li>--%>
                        </ul>
                        </li>
                        <li><b>Important:</b> The "contact name" indicated on the Budget Amendment is responsible for communicating all approved budget changes to the Lead Agency grant program coordinators, fiscal staff, and any subcontractors.</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><u><b>Mail Instructions:</b></u></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Upon receipt of the EEC's emailed response that your electronic copy has been approved, the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> Cover Page must be completed and requires the original signature of lead agency authorized representative.</li>
                        <li>Mail one (1) <u>original</u> of the entire PDF that includes the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> and the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> Cover page with an original signature in <span style="color:blue">blue</span> ink.</li>
                        <li>All signed Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> should be mailed to: <br />
                            <span style="color:Blue">
                            Department of Early Education and Care<br />
                            FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment<br />
                            Grants Administration:  <%=AppInfo.AmendmentAdministrator%><br />
                            51 Sleeper St. 4th floor<br />
                            Boston, MA 02210<br />
                            <%=Session["Lead Agency Name"].ToString()%>&nbsp;Budget Amendment
                            </span>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><b>Budget Amendments that do not contain all of these documents will NOT be processed.</b><br /><br /></td>
            </tr>
           
            
        </table>
        </td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="btnSaveHome" runat="server" Text="Go to Budget Amendment Page" OnClick="btnSaveHome_Click" /></td>
        </tr>
        </table>
    </div>
    <br />
    <br />
    <div align="center">
        &nbsp;&nbsp;
        
            <br />
    <br />
    </div>

</asp:Content>
