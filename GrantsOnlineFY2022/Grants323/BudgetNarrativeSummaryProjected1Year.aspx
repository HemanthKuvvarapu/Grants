<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BudgetNarrativeSummaryProjected1Year.aspx.cs" Inherits="BudgetNarrativeSummaryProjected1Year" %>
<%@ MasterType VirtualPath="~/MasterPage2.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style336
        {
        	text-align: center;
            font-weight: bold;
            background-color: #FFCC99;
        }
        .style337
        {
        	text-align: center;
            font-weight: bold;
            background-color: #00FF00;
        }
        .style338
        {
            font-weight: bold;
            background-color: #FF6666;
            text-align: center;
        }
        .style92
        {
        	height: 45px;
            font-weight: bold;
            background-color: #FFCC99;
            text-align: left;
            padding-left:5px;
        }
        .style93
        {
        	height: 45px;
            font-weight: bold;
            background-color: #00FF00;
            text-align: left;
            padding-left:5px;
        }
        .style105
        {
        	height:45px;
            font-weight: bold;
            background-color: #FF6666;
            text-align: left;
            padding-left:5px;
        }
        .style5
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #EFEFEF;
            width: 218px;
        }
        .styleSub0
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 44px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub1
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub2
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FF6666;
        }
        .styleSub3
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#00FF00;
        }
        .style6
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #CDCDCD;
        }

        p.MsoNormal
        {
            margin-bottom: .0001pt;
            font-size: 11.0pt;
            font-family: "Calibri" , "sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="tblError" style="width:100%" runat="server">
            <tr>
                <td>
                    <table id="tblErrorMessage" cellpadding="0" cellspacing="0" border="0" runat="server" style="background-color:Yellow;height:40px;width:100%;border:solid 1px #ff0000;font-family:Arial">
                        <tr>
                            <td style="color:Red;font-weight:bold;padding:5px">Please complete the FY <%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantName%>&nbsp;Grant Budget before generating the FY&nbsp;<%=AppInfo.FiscalYear+1%>&nbsp;<%=AppInfo.GrantName%>&nbsp;Grant Budget.</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table id="tblHSBudget" style="width: 100%;" runat="server">
            <tr>
                <td><img src="images/spacer.gif" width="200px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="80px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="80px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="100px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="100px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="100px" height="1px" alt="" /></td>
            </tr>
            <tr>
                <td colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6">
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5">
                    #of<br />
                    Staff
                </td>
                <td class="style5">
                    FTE
                </td>
                <td class="style5">
                    Program<br /> Costs
                </td>
                <td class="style5">
                    Admin<br /> Costs
                </td>
                <td class="style5">
                    Total Grant<br /> Budget
                </td>
            </tr>
            <tr>
                <td class="style92">
                    1. Administrators
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    2. Instructional/<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Professional Staff
                </td>
                <td class="style336">
                    <asp:Label ID="txtIPSSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtIPSSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    3. Support Staff
                </td>
                <td class="style336">
                    <asp:Label ID="txtSSSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtSSSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    4. Fringe Benefits
                </td>
                <td class="style336">
                    <asp:Label ID="txtFBSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtFBSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    5. Contractual Services
                </td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    6. Supplies &amp; Materials
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    7. Travel
                </td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    8. Other Costs
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    9. Capacity Building
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    10. Indirect Costs
                </td>
                <td class="style336" colspan="2">Lead Agency<br />Approved Rate:&nbsp;<asp:Label ID="txtIndirectPercent" runat="server" CssClass="styleSub1">0</asp:Label>%</td>
                <td class="style336">&nbsp;</td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCosts" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">&nbsp;</td>
            </tr>
            <tr>
                <td class="style92">
                    11. Equipment
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    12. Ancillary Services
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style105">
                    GRAND TOTAL
                </td>
                <td class="style338">
                    &nbsp;
                </td>
                <td class="style338">
                    &nbsp;
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalD" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalF" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotal" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style93">
                    ELIGIBILITY AMOUNT
                </td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">
                    <span class="styleSub3">$</span><asp:Label ID="txtAllocationFund" runat="server" CssClass="styleSub3">0.00</asp:Label>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
            <tr>
                <td align="center" style="height:100px">
                    <asp:LinkButton ID="btnPrintBudgetSummary" runat="server" Text="Print Budget Summary" OnClick="btnPrintBudgetSummary_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnGoHome" 
                        Text="Go Back to Home" runat="server" onclick="btnGoHome_Click" CausesValidation="False" CssClass="buttonClass" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
