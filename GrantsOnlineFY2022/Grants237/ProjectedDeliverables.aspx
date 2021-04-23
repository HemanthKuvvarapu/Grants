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
                <b>1. Required Activity:</b>&nbsp;<b>Maintain current information on comprehensive services and resources available to support families. These resources should include, but not be limited to, physical and dental health, early childhood mental health consultation, early intervention, early childhood special education, occupational or speech therapy, etc.  (See section B. Information and Referrals for additional examples of resources.) 
Specific referrals to these resources must be provided directly to families and to early education and care programs on behalf of the children and families they serve.
</b>
                <br /><br /><b>Do not include general referrals that are shared through newsletters or email blasts. See #2.</b>
                <br /><br />*For the purposes of this form, "Enhanced Referral" is defined as a referral that includes follow-up with a family to ascertain if the initial referral met their needs and if additional support or information is needed. An "Enhanced Referral" could also include direct contact with a service provider in order to facilitate a connection with a family.                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                <br /><b>Please note: Enhanced referrals (1b) are a subset of the total number listed in 1a.                                                                                                                                                                                                                                   </b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
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
                Number of families provided with referrals.
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
                Number of enhanced referrals.
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
                Number of early education and care programs provided with referrals.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt1c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" ControlToValidate="txt1c"
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
                <b>2. Required Activity:</b>&nbsp;<b>Conduct universal and targeted outreach through a variety of methods and languages, ensuring that all populations of children and families are provided with opportunities to receive information and other supports.
</b>
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
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of <u>newsletters</u> sent to families.
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
                b.
            </td>
            <td class="style2">
                Number of <u>families</u> that received newsletters.
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
                c.
            </td>
            <td class="style2">
                Number of one-time outreach events offered to engage families in additional CFCE activities.
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
                d.
            </td>
            <td class="style2">
                Number of families that participated in outreach events.</td>
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
            <td class="style2">
                e.
            </td>
            <td class="style2">
                Number of families that engaged in additional CFCE programs and services after participating in these outreach events.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2e" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator35" runat="server"
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
                <b>3. Required Activity:</b>&nbsp;Provide educational opportunities for families that strengthen knowledge of child development across all domains, including intellectual and cognitive, social and emotional, physical and motor, and speech and language. Provide evidence-based parenting programs that enhance families’ capacity to support their children’s development. (An example of this would be education on social and emotional development that includes strategies for managing challenging behaviors.<sup>1</sup>)</td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of educational parenting programs offered.
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
                b.
            </td>
            <td class="style2">
                Number of families that participated in educational parenting programs.

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
                c.
            </td>
            <td class="style2">
                Number of children these families represent.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txt3c"
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
            <td colspan="4" class="style1">
                <b>4. Required Activity:</b>&nbsp;Support early literacy and language development through evidence-based programming, such as parent/child playgroups and authorized home visitation programs* in order to strengthen the quality of parent-child verbal interactions and support school readiness. <br /><br /><b>Only CFCE grantees authorized by EEC may offer home visiting programs.</b></td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of families that participated in educational Parent/Child educational playgroups.
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
                b.
            </td>
            <td class="style2">
                Number of children these families represent.
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
                c.
            </td>
            <td class="style2">
                Number of families that received early and/or family literacy support through research-based home visiting programs. This would include ParentChild+ and Parents as Teachers.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
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
                d.
            </td>
            <td class="style2">
                Number of children these families represent. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt4d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator36" runat="server"
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
                <b>5. Required Activity:</b>&nbsp;Coordinating activities and resources that maximize families’ access to supports through a broad range of transitions that may occur between a child’s birth and age eight that ultimately support school readiness and/or family stability. Examples of transitions include moving into and between early education and care settings (such as between and among home, early education and early intervention programs) as well as life transitions related to family relocation, parent job loss, etc.
                <br /><br /><b><u>Do not include Kindergarten transition activities in your response. (See question #6)</u></b><br /><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of families that received transition supports related to moving between and among home and early education and care, EI and/or early childhood special education programs. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txt5a"
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
                b.
            </td>
            <td class="style2">
                Number of children these families represent.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txt5b"
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
                c.
            </td>
            <td class="style2">
                 Number of families that received transition supports related to family circumstances, such as family relocation, parent job loss, etc.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt5c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txt5c"
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
                d.
            </td>
            <td class="style2">
                Number of children these families represent.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt5d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txt5d"
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
            <td colspan="4" class="style1">
                <b>6. Required Activity:</b>&nbsp;<b>Collaborate with public schools and community based early education and care programs to ensure that families receive information about Kindergarten registration and screening.</b>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description (indicate direct services or, if contracted, the name of the contractor)

            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of transition activities related to <u>Kindergarten only</u>.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="txt6a"
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
                b.
            </td>
            <td class="style2">
                Number of families that participated in Kindergarten transition in 6a.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="txt6b"
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
                c.
            </td>
            <td class="style2">
                 Number of children these families represent.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt6c" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="txt6c"
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
                d.
            </td>
            <td class="style2">
                Number of families that received information about Kindergarten registration and screening through email, newsletters or other means.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" ControlToValidate="txt6d"
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
                e.
            </td>
            <td class="style2">
                Number of children these families represent.
            </td>
            <td class="style3" align="center">
                <asp:TextBox ID="txt6e" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" ControlToValidate="txt6e"
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
            <td colspan="4" class="style1">
                <b>7. Required Activity:</b>&nbsp;Programming and services must be offered locally, in each community served.  Program space must be child safe, developmentally appropriate, locally accessible public space (e.g., family center, in-kind library, community space, etc.) open during hours that meet the needs of families, where families can participate in educational parent-child playgroups, get information on community resources, access parent education and literacy resources, participate in ASQ screenings and network with other families.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number and types of spaces available across service area.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt7a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" ControlToValidate="txt7a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                Include community name and locations in the description.<br />
                <asp:TextBox ID="txt7adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                b.
            </td>
            <td class="style2">
                Number of hours space is available across service area.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt7b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ControlToValidate="txt7b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                Provide breakdown of hours by community/location here.<br />
                <asp:TextBox ID="txt7bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                <b>8. Required Activity:</b>&nbsp;In partnership with families, incorporate the use of the Ages and Stages Questionnaire screening tool to enhance families’ understanding of child development and to link families with community-based resources.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output/outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                Total Planned for the Year
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                a.
            </td>
            <td class="style2">
                Number of ASQ screens conducted. 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server" ControlToValidate="txt8a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt8adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                b.
            </td>
            <td class="style2">
                Number of ASQ-SE screens conducted.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server" ControlToValidate="txt8b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt8bdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                c.
            </td>
            <td class="style2">
                Number of referrals for further assessment.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txt8c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt8cdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                d.
            </td>
            <td class="style2">
                Number of referrals to community resources.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt8d" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt8d"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt8ddescr" runat="server" Height="58px"
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
