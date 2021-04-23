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
                <b>1. MA Department of Early Education and Care Professional Certifications.</b> 
            </td>
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
                Identify the anticipated number of educators to be supported in achieving EEC Teacher Certification: </td>
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
                Identify the anticipated number of educators to be supported in achieving EEC Lead Teacher Certification: </td>
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
                Identify the anticipated number of educators to be supported in achieving EEC Director I or Director II Certification: </td>
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
                <b>2. Child Development Associate (CDA) Credential.</b>
            </td>
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
                Identify the number of CDA cohorts to be provided through the grant:
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
                Identify the anticipated number of educators participating in grant funded CDA program to achieve CDA credential:   
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
            <td colspan="4" class="style1">
                <b>3. College Certificates</b>
            </td>
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
                Identify the number of college level certificate cohorts related to early childhood education (ECE) to be provided through the grant:
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
                Identify the anticipated number of educators participating in grant funded college certificate cohorts: 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt3b" runat="server" Height="25px"
                    Width="78px" style="text-align:center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
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
            <td colspan="4" class="style1">
                <b>4. Leadership Development.</b> 
            </td>
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
                4a.
            </td>
            <td class="style2">
                Identify the number of college level certificate or national credentialing cohorts specifically for administrators and directors:</td>
            <td class="style3">
                <asp:TextBox ID="txt4a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt4a"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt4adescr" runat="server" Height="58px" TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                4b.
            </td>
            <td class="style2">
                Identify the anticipated number of administrators and directors participating in grant funded cohorts: </td>
            <td class="style3">
                <asp:TextBox ID="txt4b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txt4b"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
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
                <b>5. Training.</b> 
            </td>
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
                Identify the anticipated number of EEC Licensing Orientations to be provided through the grant: </td>
            <td class="style3">
                <asp:TextBox ID="txt5a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txt5a"
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
                Identify the anticipated number of Continuing Education Unit (CEU) courses to be provided through the grant:</td>
            <td class="style3">
                <asp:TextBox ID="txt5b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txt5b"
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
                Identify the anticipated number of college courses to be provided through the grant:</td>
            <td class="style3">
                <asp:TextBox ID="txt5c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
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
            <td colspan="4" class="style1">
                <b>6. Technical Assistance.</b> 
            </td>
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
                6a.
            </td>
            <td class="style2">
                Identify the number of advisors to be supported through the grant: </td>
            <td class="style3">
                <asp:TextBox ID="txt6a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txt6a"
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
                Identify the number of Professional Learning Communities (PLCs) to be provided through the grant: </td>
            <td class="style3">
                <asp:TextBox ID="txt6b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txt6b"
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
            <td colspan="4" class="style1">
                <b>7. Collaboration.</b> 
            </td>
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
                7a.
            </td>
            <td class="style2">
                Identify the number of 2-year institutions of higher education you plan to collaborate with:</td>
            <td class="style3">
                <asp:TextBox ID="txt7a" runat="server" Height="25px" Width="78px"
                    Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txt7a"
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
                Identify the number of 4-year institutions of higher education you plan to collaborate with: </td>
            <td class="style3">
                <asp:TextBox ID="txt7b" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txt7b"
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
                Identify the number of vocational-technical high schools you plan to collaborate with:  </td>
            <td class="style3">
                <asp:TextBox ID="txt7c" runat="server" Height="25px" Width="78px"
                    Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="txt7c"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt7cdescr" runat="server" Height="58px"
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
