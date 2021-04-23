<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    <h3>Introduction</h3>
        <p style="width: 865px">
            In order to apply for the FY&nbsp;<%=Session["FiscalYear"].ToString()%>&nbsp; Head Start State Supplemental Grant, please read the Grant Application posted on COMMBUYS. 
        </p>
        <p style="width: 865px">
            Grant Applicants do not need to complete the entire Online Application at one time. Applicants may complete a portion of the Online Application and finish entering their information at a later date/time until the close of the Grant Application. Applicants will also be able to print information entered into this system for their own records as a PDF. This <b>PDF</b> must be submitted as a hard copy as part of the Grant Application.
        </p>
        <p style="width: 865px">
            <b>Please save often as the system will time you out after 30 minutes.</b>
        </p>
        <p style="width: 865px">
            Throughout the Grant Application process, Grant Applicants are responsible for visiting COMMBUYS (See COMMBUYS Registration Instructions link below) and/or the EEC Website at <a href="https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities" target="_blank">https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities</a> to obtain updates and information about this Grant Application.
        </p>
        <p>
            In order to apply and obtain updates for the FY 2022 Commonwealth Preschool Partnership Intiative Grant, please read the grant information posted on COMMBUYS at <a href="http://www.commbuys.com" target="_blank">www.commbuys.com</a>
        </p>
        <p style="width: 865px">
            For assistance with the FY&nbsp;<%=Session["FiscalYear"].ToString()%>&nbsp;<%=Session["GrantName"].ToString()%> <%=AppInfo.GrantAppType%> Online Application, please contact <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a>.
        </p>
        <p style="width: 865px">
            Please see Appendix A in the Grant Application for the Online Application Instructions.
        </p>
        <p style="background-color: #FFFFCC;height:50px;padding-left:10px;border:solid 1px #cccccc">
            <br />
            <asp:LinkButton ID="lbtnGotoRFR" runat="server" CommandName="New" Text="Login to Online Application"
                OnClick="lbtnGotoRFR_Click"></asp:LinkButton>
        </p>

        <br />
        <br />
    </div>
</asp:Content>
