<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageDetailTitle.ascx.cs" Inherits="controls_PageDetailTitle" %>

<table id="pageTitle" class="formtext" cellpadding="0" cellspacing="0" border="0" style="width: 100%">
    <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            <h3><asp:Label ID="txtPageTitle" runat="server" Text="RECORD REVIEW WORKSHEET (ACF-403)<br />"></asp:Label></h3>
        </td>
        <td align="right" valign="top">
            <h3><asp:Label ID="txtControlNo" runat="server" Text="OMB Control No. 0970-0323<br />Expiration Date: 10/31/2021"></asp:Label></h3>
        </td>
    </tr>
    <tr style="background-color: #ccff99">
        <td colspan="2" align="left">
            <b>Child ID #: </b>
            <span style="color: blue"><asp:Label ID="txtID" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <b>State: </b>
            <span style="color: Blue"><asp:Label id="txtState" runat="server" Text="Massachusetts"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <b>County: </b>
            <span style="color: blue"><asp:Label ID="txtCounty" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <b>Sample Month/Year: </b>
            <span style="color: blue"><asp:Label ID="txtServiceDate" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <b>Review Date: </b>
            <span style="color: blue"><asp:Label ID="txtReviewDate" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
</table>


