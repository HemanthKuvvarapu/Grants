<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"  CodeFile="ErrorRateReport.aspx.cs" Inherits="ErrorRateReport" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 500px;
        }
        .auto-style3 {
            width: 50px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellspacing="0" cellpadding="3" rules="all" border="1" style="width:700px;background-color: #F7F6F3;border-color:#E7E7FF;border-width:1px;border-style:double;border-collapse:collapse">
    <tr>
        <td colspan="9" style="text-align:left">
           &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="9" style="text-align:left">
            <asp:Label ID="lblErrMsg" ForeColor="Red" runat="server" Text =""></asp:Label>
        </td>
    </tr>
    <tr style="background-color: #D5D8E9">
        <td align="center" style="width:50px" valign="top"><b>Item #</b></td>
        <td align="center" class="auto-style1"></td>
        <td align="center" class="auto-style3"></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>1.</b></td>
        <td class="auto-style1"><b>Current Improper Payment Rate</b></td>
        <td align="center" class="auto-style3">
            <asp:Label ID="txtPercentCaseImproperPayment" runat="server" ForeColor="blue"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>2.</b></td>
        <td class="auto-style1"><b>A. Senior Official Accountable for the Corrective Action Plan</b><br /><b>B. Senior Official Job Title</b></td>
        <td align="center" class="auto-style3"><asp:TextBox ID="txtSeniorOfficial" runat="server" Width="200" Height="22"></asp:TextBox>
            <br /><asp:TextBox ID="txtSeniorOfficialTitle" runat="server" Width="200" Height="22"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>3.</b></td>
        <td class="auto-style1" colspan="2"><b>Identify actions the Lead Agency will undertake to reduce improper payments. Identify milestones, timelines, and the individual(s) responsible for completing each action.</b></td>
        
    </tr>
    <tr>
        <td align="center" style="width:50px"></td>
        <td class="auto-style1" colspan="2">

            <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <th valign="top" width="150">a. Action</th>
                    <th valign="top" width="150">b. Milestones</th>
                    <th valign="top" width="150">c. Timeline</th>
                    <th valign="top" width="150">d. Individual(s) Responsible</th>
                </tr>
                <tr>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtAction1" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtMilestone1" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtTimeline1" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top "width="150" height="60"><asp:TextBox ID="txtResponsible1" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                </tr>
                <tr>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtAction2" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtMilestone2" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtTimeline2" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top "width="150" height="60"><asp:TextBox ID="txtResponsible2" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                </tr>
                <tr>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtAction3" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtMilestone3" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtTimeline3" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top "width="150" height="60"><asp:TextBox ID="txtResponsible3" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                </tr>
                <tr>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtAction4" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtMilestone4" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top" width="150" height="60"><asp:TextBox ID="txtTimeline4" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                    <td valign="top "width="150" height="60"><asp:TextBox ID="txtResponsible4" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="150" Maxlines="5" TextWrapping="Wrap"></asp:TextBox>&nbsp;</td>
                </tr>
               
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>4.</b></td>
        <td class="auto-style1"><b>Timeline for reducing the error rate below 10 percent</b></td>
        <td align="center" class="auto-style3"><asp:TextBox ID="txtTimelineReducingErrorRate" runat="server" Text="" TextMode="MultiLine" cols="50" rows="5" Width="200" Maxlines="5" TextWrapping="Wrap"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>5.</b></td>
        <td class="auto-style1"><b>Identify targets for future improper payments</b></td>
        <td align="center" class="auto-style3" ><asp:TextBox ID="txtTargetFutureImproperPayment" runat="server" TextMode="MultiLine" cols="50" rows="5" Width="200" Maxlines="5" TextWrapping="Wrap"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="9" style="text-align:left">
           &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="80" 
                onclick="btnSave_Click" />
        </td>
    </tr>
 </table>
</asp:Content>