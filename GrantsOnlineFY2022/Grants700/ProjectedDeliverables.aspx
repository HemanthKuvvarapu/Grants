<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProjectedDeliverables.aspx.cs" Inherits="ProjectedDeliverables" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function buttonclick() {
            if ($find("CalendarExtender")) {
                $find("CalendarExtender").dispose();
            }
            //The last parameter should be the TargetControl's id. If you use "TextBox1", the TextBox1 would be associated.
            $create(AjaxControlToolkit.CalendarBehavior, { "id": "CalendarExtender" }, null, null, $get("input"));
            $find("CalendarExtender").show();
        }

        enableEnterKey = true;
    </script>
    <style type="text/css">
        .style1
        {
            height: 30px;
            background-color: #cccccc;
            padding-left: 5px;
        }
        .style2
        {
            background-color: #FFFFCC;
            padding-left: 5px;
            height: 70px;
            vertical-align: top;
            padding-top:5px;
        }
        .style3
        {
            background-color: #FFFFCC;
            text-align: left;
            height: 70px;
            padding-left:60px;
        }
        .style5
        {
            background-color: #956250;
            color: #ffffff;
            padding-left: 5px;
        }
        .styleErrors
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table style="width: 100%;">
        <tr>
            <td colspan="4">
                <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            The Information has been SAVED successfully.<br />
                            <br />
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Required Grant Forms (Part 9)"
                                Visible="true" OnClick="btnNextPart_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="250px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            <span class="styleErrors">The Projected Deliverables has been SAVED with the following
                                error(s).<br />
                                <span style="font-weight: normal">
                                    <ul>
                                        <li>
                                            <asp:Label ID="lblErrors" runat="server"></asp:Label></li>
                                    </ul>
                                </span></span><span style="text-align: center">
                                    <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Home" Visible="true"
                                        OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                        Width="200px" />
                                </span>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <span class="style4">
        <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
</span>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>1. Required Activity:&nbsp;Provide early Childhood Mental Health Consultation (ECMHC) Services Accessible to Programs and Providers in the Mixed Delivery System - Outreach, Referrals, and Requests.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Describe
            </td>
        </tr>
        <tr>
            <td class="style2">
                1a.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Total Number of cities and towns in your agency's ECMHC proposed service delivery area. (Major Towns).</td>
            <td class="style3">
                <asp:TextBox ID="txt1a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt1a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1b.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of programs and FCC providers located within the proposed service delivery area.</td>
            <td class="style3">
                <asp:TextBox ID="txt1b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt1b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1c.
            </td>
            <td class="style2">
                 <b>FY 2022:</b> Number of programs and FCC providers that have voucher/contract agreements to provide subsidized care that are located within the proposed service delivery area.</td>
            <td class="style3">
                <asp:TextBox ID="txt1c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt1c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>2. Required Activity: Personnel and Consultant Requirements: Personnel hired possess appropriate qualificaitons, knowledge, skills and license.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="text-align:center">
                Describe
            </td>
        </tr>
        <tr>
            <td class="style2">
                2a.
            </td>
            <td class="style2">
                 <b>FY 2022:</b> Anticipated Total Number of ECMH consultants whose salaries will be supported with FY2022 grant funds. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txt2a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2adescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                2b.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Projected Number of Clinical/Reflective Supervision Hours that will be provided to <u>grant funded ECMH</u> consultants monthly.  
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2b" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server"
                    ControlToValidate="txt2b" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                2c.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Projected number of programs and family child care providers  that will be assigned to each ECMH consultant.</td>
            <td class="style3">
                <asp:TextBox ID="txt2c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator33" runat="server"
                    ControlToValidate="txt2c" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                2d.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of ECMH consultants that will receive formal professional development/ training.</td>
            <td class="style3">
                <asp:TextBox ID="txt2d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator34" runat="server"
                    ControlToValidate="txt2d" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2ddescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>3. Required Activity: Provide ECMH Consultation and Interventions that are Responsive to the Needs of   Programs, Educators, Children and Families.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="text-align:center">
                Describe
            </td>
        </tr>
        <tr>
            <td class="style2">
                3a.
            </td>
            <td class="style2">
                <b>FY 2022:</b> The projected number of programs and family childcare that your agency will have the capacity to serve in FY2022.</td>
            <td class="style3">
                <asp:TextBox ID="txt3a" runat="server" Height="25px"
                    Width="78px" style="text-align:center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator104" 
                    runat="server" ControlToValidate="txt3a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3adescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="style2">
                3b.
            </td>
            <td class="style2">
                <b>FY 2022:</b> The projected number of classrooms /FCC homes that your agency will have the capacity to serve in FY2022.</td>
            <td class="style3">
                <asp:TextBox ID="txt3b" runat="server" Height="25px"
                    Width="78px" style="text-align:center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                    runat="server" ControlToValidate="txt3b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                3c.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Projected Number of partnership agreements that will be developed with programs and family child care providers in FY2022.</td>
            <td class="style3">
                <asp:TextBox ID="txt3c" runat="server" Height="25px"
                    Width="78px" style="text-align:center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                    runat="server" ControlToValidate="txt3c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>4. Required Activity: Inform Families and Communities and Strengthen Linkages to Community Supports.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="text-align:center">
                Describe
            </td>
        </tr>
        <tr>
            <td class="style2">
                4a.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of Community Service Agencies (CSA) located within your agencies proposed service delivery area. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator105" runat="server"
                    ControlToValidate="txt4a" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*\.?\d*$" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
                <br />
            </td>
            <td class="style2">
                <asp:TextBox ID="txt4adescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                4b.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of CFCE Grantees located within your agencies proposed service delivery area.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4b" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                    ControlToValidate="txt4b" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*\.?\d*$" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt4bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="style2">
                4c.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of Professional Development Centers (PDCs) currently operating in your agencies proposed service delivery area.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                    ControlToValidate="txt4c" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*\.?\d*$" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt4cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                4d.
            </td>
            <td class="style2">
                <b>FY 2022:</b> Number of CCR&Rs currently operating in your agencies proposed service delivery area.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                    ControlToValidate="txt4d" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*\.?\d*$" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt4ddescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>5. Required Activity: Utilize evidence-based techniques to inform and evaluate the effectiveness of ECMHC Services.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Describe
            </td>
        </tr>
        <tr>
            <td class="style2">
                5a.
            </td>
            <td class="style2">
                <b>FY 2022:</b> How many evidence-based measurement tools does your agency propose to implement to measure changes in the program and/or classroom environments?</td>
            <td class="style3">
                <asp:TextBox ID="txt5a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txt5a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                5b.
            </td>
            <td class="style2">
                <b>FY 2022:</b> How many evidence-based measurement tools does your agency propose to implement to measure changes in children’s behavior over time?</td>
            <td class="style3">
                <asp:TextBox ID="txt5b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txt5b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 100px">
        <tr>
            <td style="width: 100%; text-align: center">
                <asp:LinkButton ID="btnPrintHSPD8" runat="server" Text="Save and Print" OnClick="btnPrintHSPD8_Click"
                        CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnCancelSave" runat="server" OnClick="btnCancelSave_Click" Text="Cancel Save" CausesValidation="false"
                    Visible="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;                
                <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save Information" Visible="True" CssClass="buttonClass" />
            </td>
        </tr>
    </table>
    <asp:ToolkitScriptManager ID="toolkitScriptMaster" runat="server">
    </asp:ToolkitScriptManager>
</asp:Content>
