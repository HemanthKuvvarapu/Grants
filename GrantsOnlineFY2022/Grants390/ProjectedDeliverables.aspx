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
                <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>1. Required Activity:</b>&nbsp;Support staff’s compensation and benefits.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total
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
                Projected total budget amount to supplement staff salaries and/or benefits.
            </td>
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
                Total number of staff that will be supported by this grant with salaries and/or benefits.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt1a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1bdescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1c.
            </td>
            <td class="style2">
                Total number of staff retained that were supported by salaries and/or benefits from the FY2021 HS State Supplemental grant.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt1a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1cdescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td colspan="4" class="style1">
                <b>2. Required Activity:</b>&nbsp;Provide incentives and/or stipends for staff that have achieved a credential and/or a degree or are on a path to earn a credential and/or degree in the Early Childhood field and/or related Human Services field.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total
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
                 Projected total budget amount for staff incentives and/or stipends.
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
                 Total number of staff that will be supported by incentives and/or stipends from this grant.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txt2a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2bdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                2c.
            </td>
            <td class="style2">
                 Total number of staff retained that were supported by incentives from the FY2021 HS State Supplemental grant.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txt2a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2cdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>


        <tr>
            <td colspan="4" class="style1">
                <b>3. Required Activity:</b>&nbsp;Use of Head Start State Supplemental Funds to assist with 20% Non- Federal match requirements.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total&nbsp;
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
                Current total award of OHS Federal funding for your HS program
            </td>
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
                Current total award of OHS Federal funding for your EHS program (if applicable)
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txt3b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3bdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                3c.
            </td>
            <td class="style2">
                Current total amount of your FY2022 HS State Supplemental grant
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt3c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3cdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                3d.
            </td>
            <td class="style2">
                Percentage of your total HS Supplemental grant to your total amount of Federal funding to assist your program with 20%  Non-Federal match requirements 
                <br /><emphasis><i>Note: Formula for Percentage is = Total Federal funding divided by total amount of your FY2022 HS State Supplemental grant.</i></emphasis>
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txt3c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3ddescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

<%--        <tr>
            <td colspan="4" class="style1">
                <b>4. Required Activity:</b>&nbsp;Number of State-Funded Children you serve with Head Start State Supplemental Funds.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output/outcomes can be measured:
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
                Total number of state-funded children served from FY2019 Head Start State Supplemental grant.
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
                Total number of state-funded children you intend to serve from FY2020 Head Start State Supplemental grant.
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
        </tr>--%>
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
