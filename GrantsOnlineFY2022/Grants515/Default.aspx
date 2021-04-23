<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    <h3>Introduction</h3>
        <p>
            In order to apply for the FY&nbsp;<%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantName%>, please go to the FY&nbsp;<%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantName%> application posted on COMMBUYS at <a href="https://www.commbuys.com/" target="_blank">www.commbuys.com</a>. 
        </p>
        <p>
            Grant applicants do not need to complete the entire online application at one time.  Applicants may complete a portion of the online application and finish entering their information at a later date/time until the close of the grant application.  Applicants will also be able to print information entered into this system for their own records as a PDF.  This PDF must be submitted as a hard copy as part of the grant application.
        </p>
        <p>
            <b>Please save often as the system will time you out after 30 minutes.</b>
        </p>
        <p>
            Throughout the Grant Application process, Grant Applicants are responsible for visiting the Department of Early Education and Care's Website at <a href="https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities" target="_blank">https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities</a> to obtain updates and information about this grant application.
        </p>
        <%--<p style="width: 865px">--%>
        <p>
            In order to apply and obtain updates for the FY 2022 Commonwealth Preschool Partnership Intiative Grant, please read the grant information posted on COMMBUYS at <a href="http://www.commbuys.com" target="_blank">www.commbuys.com</a>
        </p>
        <p>
            For assistance with the FY&nbsp;<%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantAbbrev%>&nbsp;(<%=AppInfo.FundCodeText%>) online grant application,
            please contact <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a></p>
        
        <%--<p style="width: 865px">--%>
        <p>
        Please see Appendix A in the grant application for Online Application Instructions.</p>
        <%--<p style="background-color: #FFFFCC;height:50px;padding-left:10px;border:solid 1px #cccccc">
            <br />
            <a href="Commbuys.aspx" target="_blank">COMMBUYS Registration Instructions</a><br /><br />
        </p>--%>
        <p style="background-color: #FFFFCC;height:50px;padding-left:10px;border:solid 1px #cccccc">
            <br />
            <asp:LinkButton ID="lbtnGotoRFR" runat="server" CommandName="New" Text="Login to Online Application"
                OnClick="lbtnGotoRFR_Click"></asp:LinkButton>
        </p>
        <br />
    </div>
</asp:Content>
