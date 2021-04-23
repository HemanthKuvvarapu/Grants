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
                <b>1. Increased staff compensation and benefits to improve the quality of preschool workforce and retention.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                1a.
            </td>
            <td class="style2">
                Number of preschool staff receiving <b>compensation and/or benefit increases</b> as the result of a policy for providing increased compensation/benefits to educators based on additional knowledge, skills and/or competencies as a result of using grant funds.         
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
                Number of preschool staff receiving <b>ongoing compensation</b> increases this grant year as a result of using grant funds.
            </td>
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
                Number of preschool staff that will <b>earn a degree</b> this grant year as a result of using grant funds (e.g., Associate’s degree, Bachelor’s degree, etc.).
            </td>
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
            <td class="style2">
                1d.
            </td>
            <td class="style2">
                Number of preschool staff that <b>benefitted from college courses</b> this grant year as a result of using grant funds.       
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="txt1d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1ddescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1e.
            </td>
            <td class="style2">
                Number of preschool staff that will <b>earn credentials</b> this grant year as a result of using grant funds (i.e., Child Development Associate Credential).
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1e" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="txt1e"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1edescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1f.
            </td>
            <td class="style2">
                Number of preschool staff that will <b>participate in professional development trainings</b> this grant year as a result of using grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1f" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" ControlToValidate="txt1f"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1fdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1g.
            </td>
            <td class="style2">
                Number of hours for <b>additional preschool staff planning time</b> as a result of using grant funds. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1g" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ControlToValidate="txt1g"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1gdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1h.
            </td>
            <td class="style2">
                Number of preschool <b>staff retained</b> (also indicate the number of staff not retained in the description box) as a result of using grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1h" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" ControlToValidate="txt1h"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1hdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>2. Lower staff-to-child ratios and/or reduced class/group size.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                2a.
            </td>
            <td class="style2">
                Number of staff hired into new positions as a result of using grant funds.  
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
                Number of staff with increased hours as a result of using grant funds.
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
                Number of additional staff hours provided per week as a result of using grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
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
                Indicate staff-to-child ratio if impacted by grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator33" runat="server"
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
            <td class="style2">
                2e.
            </td>
            <td class="style2">
                Indicate class size if impacted by grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2e" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator34" runat="server"
                    ControlToValidate="txt2e" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2edescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>3. Implementation of continuous quality improvement activities to maintain or enhance the program’s current level in EEC’s QRIS. </b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                3a.
            </td>
            <td class="style2">
                Number of short-term goals identified in the current CQIP.
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
                Number of short-term goals addressed and resolved from the CQIP as a result of using grant funds.
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
                Number of long-term goals identified in current CQIP.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" ControlToValidate="txt3c"
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
                Number of long-term goals addressed and resolved from the CQIP as a result of using grant funds.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" ControlToValidate="txt3d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt3ddescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>4. Enhancement of a program’s ability to use evidence-based screening and formative assessment tools; to interpret and use screening and formative assessment data to individualize teaching and plan effective developmentally appropriate curriculum.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                4a.
            </td>
            <td class="style2">
                Percentage of preschool children receiving a <b>developmental screening</b> within 45 days of program entry.
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
                Percentage of preschool children <b>assessed</b> using one of the EEC-approved formative assessment tools in at least two checkpoints during the year.
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
            <td colspan="4" class="style1">
                <b>5. Provision of professional development opportunities that support staff in improving skills, knowledge and competencies; assistance to meet the professional development requirements of EEC's QRIS; and/or support for staff attainment of credentials or degrees.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                5a.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focus on the <b>CLASS</b> measurement tool.
            </td>
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
                Number of preschool educators who participate in professional development opportunities that focus on <b>developmental screening</b>: understanding and implementing developmental screening.
            </td>
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
        <tr>
            <td class="style2">
                5c.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focus on <b>formative assessment</b>: observation and documentation for assessment and planning; utilizing the data for planning individualized learning; assessing diverse learners; or engaging families in the assessment process.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txt5c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                5d.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focused on <b>curriculum development</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt5d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txt5d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5ddescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                5e.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focused on <b>inclusive practices in the classroom</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5e" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server"
                    ControlToValidate="txt5e" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5edescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                5f.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focused on <b>social-emotional development of young children</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5f" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator35" runat="server"
                    ControlToValidate="txt5e" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5fdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                5g.
            </td>
            <td class="style2">
                Number of preschool educators who participate in professional development opportunities that focused on <b>effective family engagement practices</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5g" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server"
                    ControlToValidate="txt5g" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt5gdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>6. Enhancement of current or provision of comprehensive services into a program to meet the diverse learning needs of children and their social-emotional, behavioral, and/or physical health needs.</b> 
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                6a.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Health Services</b> (Vision, Hearing, etc.).
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txt6a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6b.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Dental Services</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txt6b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6c.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Nutrition Services</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txt6c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6d.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Speech/Language Therapy</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="txt6d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6ddescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="style2">
                6e.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Occupational Therapy</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6e" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator29" runat="server" ControlToValidate="txt6e"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6edescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6f.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Physical Therapy</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6f" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator30" runat="server" ControlToValidate="txt6f"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6fdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6g.
            </td>
            <td class="style2">
                Number of preschool children benefiting from <b>Mental/Behavioral Health Services</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6g" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator31" runat="server" ControlToValidate="txt6g"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6gdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6h.
            </td>
            <td class="style2">
                Number of <b>Home Visits</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6h" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator32" runat="server" ControlToValidate="txt6h"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6hdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6i.
            </td>
            <td class="style2">
                Number of <b>Social Service Referrals</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6i" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator36" runat="server" ControlToValidate="txt6i"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6idescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                6j.
            </td>
            <td class="style2">
                Other
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6j" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator37" runat="server" ControlToValidate="txt6j"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt6jdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>7. Enhancement of current or provision of new family engagement opportunities.</b> 
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description<br />(indicate direct services or, if contracted, the name of the contractor)
            </td>
        </tr>
        <tr>
            <td class="style2">
                7a.
            </td>
            <td class="style2">
                Number of <b>orientations</b>. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt7a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" ControlToValidate="txt7a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7b.
            </td>
            <td class="style2">
                Number of <b>family volunteering</b> opportunities.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt7b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator38" runat="server" ControlToValidate="txt7b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7c.
            </td>
            <td class="style2">
                Number of <b>family nights</b>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt7c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator39" runat="server" ControlToValidate="txt7c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7d.
            </td>
            <td class="style2">
                Number of <b>family workshops</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator40" runat="server" ControlToValidate="txt7d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7ddescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="style2">
                7e.
            </td>
            <td class="style2">
                Number of <b>family-child play groups/events</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7e" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator41" runat="server" ControlToValidate="txt7e"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7edescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7f.
            </td>
            <td class="style2">
                Number of <b>family leadership opportunities</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7f" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator42" runat="server" ControlToValidate="txt7f"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7fdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7g.
            </td>
            <td class="style2">
                Number of <b>home visits (by Teachers)</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7g" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator43" runat="server" ControlToValidate="txt7g"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7gdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7h.
            </td>
            <td class="style2">
                Number of <b>home visits (by Family Engagement Staff)</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7h" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server" ControlToValidate="txt7h"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7hdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7i.
            </td>
            <td class="style2">
                Number of <b>Individual Family Plans</b>.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7i" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server" ControlToValidate="txt7i"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7idescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                7j.
            </td>
            <td class="style2">
                Other
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt7j" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator46" runat="server" ControlToValidate="txt7j"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7jdescr" runat="server" Height="58px" TextMode="MultiLine"
                    Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>8. Enhancement of current or provision of new transitional supports to children moving to/from other programs or to kindergarten.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for this Time Frame
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                8a.
            </td>
            <td class="style2">
                Number of joint planning activities between preschool educators and kindergarten educators.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server" ControlToValidate="txt8a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2"><asp:TextBox ID="txt8adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                8b.
            </td>
            <td class="style2">
                Number of kindergarten educator visits to the UPK preschool classroom(s)
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server" ControlToValidate="txt8b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2"><asp:TextBox ID="txt8bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                8c.
            </td>
            <td class="style2">
                Number of field trips/visits to the kindergarten classroom(s)
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator47" runat="server" ControlToValidate="txt8c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2"><asp:TextBox ID="txt8cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                8d.
            </td>
            <td class="style2">
                Number of parent/provider meetings to address kindergarten transitions.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator48" runat="server" ControlToValidate="txt8d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2"><asp:TextBox ID="txt8ddescr" runat="server" Height="58px"
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
