<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BudgetAmendmentSummary.aspx.cs" Inherits="BudgetAmendmentSummary" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style337
        {
        	text-align: center;
            font-weight: bold;
            background-color: #00FF00;
        }
        .style93
        {
        	height: 45px;
            font-weight: bold;
            background-color: #00FF00;
            text-align: left;
            padding-left:5px;
        }
        .style41
        {
            padding-left: 5px;
            height: 54px;
            background-color: #FFFFCC;
        }
        .style42
        {
            padding-left: 5px;
            height: 54px;
            background-color: #CCFFFF;
        }
        .style315
        {
            text-align: center;
            height: 54px;
            background-color: #FFFFCC;
        }
        .style316
        {
            text-align: center;
            height: 54px;
            background-color: #CCFFFF;
        }
        .style317
        {
            text-align: center;
            height: 54px;
            background-color: #cbf5d0;
        }
        .style336
        {
            text-align: center;
            font-weight: bold;
            background-color: #FFCC99;
        }
        .style338
        {
            font-weight: bold;
            background-color: #FF6666;
            text-align: center;
        }
        .style339
        {
        	font-weight: bold;
            background-color: #faa34c;
            text-align: center;
        }
        .style92
        {
            height: 45px;
            font-weight: bold;
            background-color: #FFCC99;
            text-align: left;
            padding-left: 5px;
        }
        .style254
        {
            height: 30px;
            font-weight: bold;
            text-align: left;
            padding-left: 5px;
            background-color: #956250;
            color: #ffffff;
        }
        .style105
        {
            height: 45px;
            font-weight: bold;
            background-color: #FF6666;
            text-align: left;
            padding-left: 5px;
        }
        .style5
        {
            font-weight: bold;
            text-align: center;
            background-color: #EFEFEF;
        }
        .style6
        {
            font-weight: bold;
            text-align: center;
            background-color: #CDCDCD;
        }
        .styleSub1
        {
            text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #FFCC99;
        }
        .styleSub2
        {
            text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #FF6666;
        }
        .styleSub3
        {
        	text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #faa34c;
        }
        .styleSub4
        {
        	text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #00FF00;
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
        .style244
        {
            font-weight: bold;
            background-color: #FFFFFF;
            text-align: left;
        }
        .styleHighlight
        {
            border: 2px solid #ff0000;
        }
        .styleUnHighlight
        {
            border: 1px solid #666666;
            border-style: solid;
        }
        .styleErrors
        {
            text-align: left;
        }
        .styleDisplayOnly1
        {
        	background-color: #FFFFCC;
        	border-style:none;
        }
        .styleDisplayOnly2
        {
        	background-color: #CCFFFF;
        	border-style:none;
        }
        .styleDisplayOnly3
        {
        	background-color: #cbf5d0;
        	border-style:none;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
            style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
            <tr>
                <td align="center" style="height: 50px; padding-top: 5px">
                    <span class="styleErrors">
                    Please correct the following error(s).<br />
                    <span style="font-weight:normal">
                    <asp:BulletedList ID="lstErrors" runat="server" CssClass="styleErrors">
                    </asp:BulletedList>
                    </span>
                    </span>
                    <br />
                </td>
            </tr>
        </table>
        <table id="tblHSBudget" style="width: 100%; font-family: Arial; font-size: 13px">
            <tr>
                <td>
                    <img src="images/spacer.gif" width="210px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="9"><b>Instructions:</b>&nbsp;This is a read-only page; costs cannot be entered. In order to make changes to the information on this Budget Amendment Summary, changes must be made on the Lead Agency Budget Amendment or the Subcontractor Budget Amendment.</td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>1. Adminstrators</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisor/Director
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right;" Enabled="True" ReadOnly="true">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right;" Enabled="True" ReadOnly="true">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right;" Enabled="True" ReadOnly="true">0</asp:TextBox>
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSupervisorDirectorColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSupervisorDirectorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirector" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right;" Enabled="True" ReadOnly="true">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Project Coordinator</td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtProjectCoordinatorColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtProjectCoordinatorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinator" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtStipendColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtStipendColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Administrators Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtAdminSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtAdminSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>2. Instructional/Professional Staff</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Advisor
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColDOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAdvisorColDDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAdvisorColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisor" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Clinician
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtClinicianColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtClinicianColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinician" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Coordinator
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCoordinatorColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCoordinatorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinator" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Educator/Instructor
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEducatorInstructorColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEducatorInstructorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructor" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Home Visitor
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtHomeVisitorColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtHomeVisitorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitor" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Specialist
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSpecialistColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSpecialistColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialist" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtIPSStipendColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtIPSStipendColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtIPSOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtIPSOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Instructional/<br />
                    Professional Staff<br />
                    Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtIPSSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtIPSSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>3. Support Staff</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Aide/Paraprofessional
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColDOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColFOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAideParaprofessionalColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAideParaprofessionalColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessional" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Secretary/Bookkeeper
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeper" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSSStipendColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSSStipendColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSSOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSSOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Support Staff Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtSSSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtSSSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>4. Fringe Benefits</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Fringe Benefits
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColDOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColFOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtFringeBenefitsColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtFringeBenefitsColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefits" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Fringe Benefits Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtFBSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtFBSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>5. Contractual Services</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Advisor
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColDOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSAdvisorColDDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSAdvisorColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisor" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Clinician
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSClinicianColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSClinicianColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinician" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Consultant
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSConsultantColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSConsultantColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultant" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Educator/Instructor
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSEducatorInstructorColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSEducatorInstructorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructor" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Home Visitor
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSHomeVisitorColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSHomeVisitorColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitor" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Specialist
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSpecialistColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSpecialistColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialist" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Speaker
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSpeakerColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSpeakerColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeaker" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Substitute
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSubstituteColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSSubstituteColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstitute" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSStipendColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSStipendColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCSOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Contractual<br />
                    Services Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtCSSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtCSSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>6. Supplies &amp; Materials</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin C<br />
                    osts
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Educational & Instructional Materials
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColDOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColFOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColDDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColFDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColD" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColF" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterials" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Instructional Technology
                    <br />
                    including Software
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColDOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColFOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColDDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColFDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColD" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColF" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftware" runat="server" Width="73px"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Non-Instructional Supplies
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSupplies" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSMOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSMOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Supplies &amp; Materials
                    <br />
                    Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtSMSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtSMSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>7. Travel</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisory Staff
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColDOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColFOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSupervisoryStaffColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtSupervisoryStaffColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Instructional Staff
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalStaffColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalStaffColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtTravelOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtTravelOtherColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Travel Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtTravelSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtTravelSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>8. Other Costs</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Advertising
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColDOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColFOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAdvertisingColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAdvertisingColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertising" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Equipment Rental
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEquipmentRentalColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEquipmentRentalColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRental" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Maintenance/Repairs
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtMaintenanceRepairsColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtMaintenanceRepairsColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairs" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Membership/Subcriptions
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptions" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Printing/Reproduction
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtPrintingReproductionColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtPrintingReproductionColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproduction" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Staff Training
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtStaffTrainingColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtStaffTrainingColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTraining" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Rental of Space
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtRentalofSpaceColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtRentalofSpaceColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpace" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Telephone/Utilities
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilities" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Direct Service<br />
                    Transportation
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColDOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColFOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtDirectServiceTransportationColDDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtDirectServiceTransportationColFDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColD" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColF" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportation" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtOCOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtOCOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Other Costs Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtOCSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtOCSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>9. Capacity Building</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Professional Development Opportunities
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColDOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColFOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesOrg" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColDDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColFDiff" runat="server" Width="73px"
                        CssClass="styleDisplayOnly3" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColD" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColF" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunities" runat="server" Width="73px"
                        CssClass="styleDisplayOnly1" MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Application Fees
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtApplicationFeesColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtApplicationFeesColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFees" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    CEU Courses
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCEUCoursesColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCEUCoursesColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCourses" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    College Courses
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCollegeCoursesColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCollegeCoursesColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCourses" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly2" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCBOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtCBOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Capacity Building
                    <br />
                    Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtCBSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtCBSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>10. Indirect Costs</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Indirect Costs
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtIndirectCostsColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIndirectCostsOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    <br />
                </td>
                <td class="style317" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtIndirectCostsColFDiff" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    <br />
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtIndirectCostsColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIndirectCosts" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Indirect Costs Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339" >
                    &nbsp;
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtIndirectCostsSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>11. Equipment</b>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    Column G
                </td>
                <td class="style5">
                    Column H
                </td>
                <td class="style5">
                    Column I
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    Approved<br /> Program<br /> Costs
                </td>
                <td class="style6">
                    Approved<br /> Admin<br /> Costs
                </td>
                <td class="style6">
                    Approved<br />
                    Budget 
                    <br />
                    Total
                </td>
                <td class="style6">
                    Requested<br /> Program<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Requested<br /> Admin<br /> Costs (+/-) 
                </td>
                <td class="style6">
                    Revised<br />
                    Program 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised<br />
                    Admin 
                    <br />
                    Costs
                </td>
                <td class="style6">
                    Revised 
                    <br />
                    Total<br />
                    Budget
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Instructional Equipment
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColDOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColFOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentOrg" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalEquipmentColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtInstructionalEquipmentColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipment" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Non-instructional Equipment
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColDOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColFOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentOrg" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColDDiff" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColFDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColD" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly2" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipment" runat="server" Width="73px" Height="22px"
                        CssClass="styleDisplayOnly2" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColFOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEqOtherColDDiff" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly3" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtEqOtherColFDiff" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Equipment Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtEqSubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtEqSubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="9">
                    <b>12. Ancillary Services</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Ancillary Services
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        CssClass="styleDisplayOnly1" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtAncillaryColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317">
                    $<asp:TextBox ID="txtAncillaryColDDiff" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly3" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style317" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtAncillaryColFDiff" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly3" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryColD" runat="server" Width="73px" MaxLength="10"
                        CssClass="styleDisplayOnly1" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
                <td class="style315" style="text-align: left; padding-left: 10px">
                    $<asp:TextBox ID="txtAncillaryColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillary" runat="server" Width="73px" MaxLength="10" Height="22px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Ancillary Services Sub-Total
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColDOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColFOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalOrg" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtAncillarySubTotalColDDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style339">
                    <span class="styleSub3">$</span><asp:Label ID="txtAncillarySubTotalColFDiff" runat="server"
                        CssClass="styleSub3">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style105">
                    GRAND TOTAL
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColDOrg" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColFOrg" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalOrg" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColDDiff" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColFDiff" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColD" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColF" runat="server"
                        CssClass="styleSub2">0</asp:Label>
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
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">
                    <span class="styleSub4">$</span><asp:Label ID="txtAllocationFund" 
                        runat="server" CssClass="styleSub4">0.00</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style244" colspan="9">
                    &nbsp;
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
            <tr>
                <td align="center" style="height:100px">
                <asp:LinkButton ID="btnPrintHSBudgetSummary2015" runat="server" Text="Print Budget Summary" OnClick="btnPrintHSBudgetSummary2015_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnGoHome" 
                        Text="Go Back to Amendment Home" runat="server" onclick="btnGoHome_Click" CssClass="buttonClass" CausesValidation="False" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
