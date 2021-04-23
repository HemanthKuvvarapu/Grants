<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    <h3>Introduction</h3>
        <p>
            In order to apply for the FY&nbsp;<%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Grant, please go to the  FY&nbsp;<%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Application posted on COMMBUYS at <a target="_blank" href="https://www.commbuys.com/bso/">www.commbuys.com</a>.
        </p>
        <p>
            Grant applicants do not need to complete the entire online application at one time.  Applicants may complete a portion of the online application and finish entering their information at a later date/time until the close of the grant application. Applicants will also be able to print information entered into this system for their own records as a PDF.  This <b>PDF</b> must be submitted as a hard copy as part of the grant application.
        </p>
        <p>
            <b>Please save often as the system will time you out after 30 minutes.</b>
        </p>
        <p>
             Throughout the Grant Application process, Grant Applicants are responsible for visiting <b>COMMBUYS</b> and/or the EEC Website at <a href="https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities" target="_blank">https://www.mass.gov/lists/fy-2022-eec-funding-and-grant-opportunities</a> to obtain updates and information about this Grant Application.
        </p>
        <p style="width: 865px">
            For assistance with the FY&nbsp;<%=Session["FiscalYear"].ToString()%>&nbsp;<%=Session["GrantName"].ToString()%> online application,
            please contact <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a></p>
        <p style="width: 865px">
  Please see Appendix C in the grant application for Online Application Instructions.</p>
        <p style="background-color: #FFFFCC;height:50px;padding-left:10px;border:solid 1px #cccccc">
            <br />
            <asp:LinkButton ID="lbtnGotoRFR" runat="server" CommandName="New" Text="Login to Online Application"
                OnClick="lbtnGotoRFR_Click"></asp:LinkButton>
        </p>

        <br />
        <br />
    </div>
</asp:Content>
