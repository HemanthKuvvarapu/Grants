<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AgencyInfoNEW.ascx.cs" Inherits="controls_AgencyInfoNEW" %>

<table id="tblAgency" cellpadding="0" cellspacing="0" border="0" style="width:100%" runat="server">
    <tr>
        <td style="width:60%;font-family:Arial;font-size:small">
            <b style="color:#c24736;font-family:Arial">Lead Agency:</b>&nbsp;<asp:Label ID="lblHSLeadAgency" runat="server" Style="font-weight: 700;font-family:Arial; color:#3f3f3f" Text=""></asp:Label>
            <asp:Literal ID="lblOrgId" runat="server"></asp:Literal>
        </td>
        <td style="width:40%;text-align:right;padding-right:20px;font-family:Arial;font-size:small;">
            <b style="color:#c24736;font-family:Arial">Maximum Eligibility Amount:</b>&nbsp;$<asp:Label ID="lblEligAmount" runat="server" Style="font-weight: 700;font-family:Arial;color:#3f3f3f" Text=""></asp:Label>
        </td>
    </tr>

    <%--    
    <tr id="trNEW" runat="server" visible=false>
        <td colspan="2" id="tdBudgetAmt" runat="server" visible="false" style="width:30%;text-align:right;padding-right:20px;font-family:Arial;font-size:small;">
            <b style="color:#c24736;font-family:Arial">Total Budget Amount:</b>&nbsp;$<asp:Label ID="lblBudgetAmount" runat="server" Style="font-weight: 700;font-family:Arial;color:#3f3f3f" Text=""></asp:Label>
        </td>
    </tr>
    --%>

    <tr>
        <td colspan="2"><br /></td>
    </tr>
</table>


