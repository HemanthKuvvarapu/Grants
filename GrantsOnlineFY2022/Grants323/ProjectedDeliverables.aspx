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
                <b>1. <u>Coaching and Technical Assistance:</u></b> Grantees must provide technical assistance, coaching, and consultation services to providers and educators in EEC’s mixed delivery system regardless of setting type, age group served, or position level. 
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                FY2019 Projection (Number)
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Deliverable Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                1a.
            </td>
            <td class="style2">
                Identify the anticipated number of providers (programs) that will be supported through a program-focused model. </td>
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
                Identify the number of EPS coaches that are staff of the lead agency. In the description list the first and last names of lead agency coaches. </td>
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
                 Identify the number of EPS coaches that are individual consultants or contractors who contract with the lead agency directly for services. In the description list the first and last name of contracted coaches. </td>
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
                 Identify the number of EPS coaches that are staff of another agency but serve as an EPS coach through a contract with the lead agency and the coach's place of employment. In the description list the agency and agency coaches, first and last name. </td>
            <td class="style3">
                <asp:TextBox ID="txt1d" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txt1d"
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
                 Identify the number of Spanish speaking coaches for your region. In the description provide the coach's first and last name.</td>
            <td class="style3">
                <asp:TextBox ID="txt1e" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server" ControlToValidate="txt1e"
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
                 Identify the number of Portugese speaking coaches for your region. In the description provide the coach's first and last name.</td>
            <td class="style3">
                <asp:TextBox ID="txt1f" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator56" runat="server" ControlToValidate="txt1f"
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
                 Identify the number of Chinese speaking coaches for your region. In the description provide the coach's first and last name.</td>
            <td class="style3">
                <asp:TextBox ID="txt1g" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator57" runat="server" ControlToValidate="txt1g"
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
                 Identify the number of EPS coaches that speak a language other than English, Spanish, Portugese, or Chinese. In the description list the other langauges spoken; provide first and last name of coaches.  </td>
            <td class="style3">
                <asp:TextBox ID="txt1h" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator58" runat="server" ControlToValidate="txt1h"
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
            <td class="style2">
                1i.
            </td>
            <td class="style2">
                 Identify the number of Professionl Learning Communities (PLCs) to be offered to the field by type/topic. In the description identify the number of sessions associated with each PLC type/topic and who is the target participant. </td>
            <td class="style3">
                <asp:TextBox ID="txt1i" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator59" runat="server" ControlToValidate="txt1i"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1idescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                1j.
            </td>
            <td class="style2">
                 Identify the number of Technical Assistance opportunities to be provided through a cohort group. In the description identify topics and/or groups targeted. </td>
            <td class="style3">
                <asp:TextBox ID="txt1j" runat="server" Height="25px"
                    Width="78px" Style="text-align: center"  MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt1j"
                    ErrorMessage="Please input a valid number." ValidationExpression="^\d*$" SetFocusOnError="True"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt1jdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="4" class="style1">
                <b>2. <u>Educator and Provider Planning:</u></b> Grantees should utilize CQIP/PIP and IPDPs as a basis for planning and delivering professional development opportunities. These opportunities should be delivered through a combination of program focused and individual level supports.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                FY2019 Projection (Number)
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Deliverable Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                2a.
            </td>
            <td class="style2">
                 Identify the anticipated number of continuing education (CEU) courses to be provided through the grant; this number should not include CEUs that may be provided through a Program-Focused Model. 
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
                Identify the anticipated number of CEU courses that will be provided in a language other than English; this number should not include CEUs that may be provided through a Program-Focus Model. In the description provide detail on the number of courses per language.  
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
                Identify anticipated grant funds to be allocated to CEU courses; this amount should not include anticipated funds for CEU courses that may be offered through a Program-Focus Model.</td>
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
                Identify anticipated grant funds to be allocated to support CEU courses for programs participating in a Program-Focus Model. </td>
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
                2e.
            </td>
            <td class="style2">
                Identify the anticipated number of college courses at the Associate's degree level that will be offered through a cohort model. </td>
            <td class="style3">
                <asp:TextBox ID="txt2e" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
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
            <td class="style2">
                2f.
            </td>
            <td class="style2">
                Identify the anticipated number of college courses at the Bachelor's degree level that will be offered through a cohort model.</td>
            <td class="style3">
                <asp:TextBox ID="txt2f" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator60" runat="server"
                    ControlToValidate="txt2f" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2fdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td class="style2">
                2g.
            </td>
            <td class="style2">
                Identify the anticipated number of college courses at the Master's degree level that will be offered through a cohort model. </td>
            <td class="style3">
                <asp:TextBox ID="txt2g" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator61" runat="server"
                    ControlToValidate="txt2g" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2gdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                2h.
            </td>
            <td class="style2">
                Identify the anticipated number of cohort college courses to be provided in a language other than English. In the description provide detail on the number of courses per language. </td>
            <td class="style3">
                <asp:TextBox ID="txt2h" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator62" runat="server"
                    ControlToValidate="txt2h" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2hdescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                2i.
            </td>
            <td class="style2">
                Identify anticipated grant funds to be allocated to support cohort college courses; this number should not include cohort college courses that may be provided through a Program-Focus Model.
            </td>
            <td class="style3">
                <asp:TextBox ID="txt2i" runat="server" Height="25px"
                    Width="78px" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator63" runat="server"
                    ControlToValidate="txt2i" ErrorMessage="Please input a valid number."
                    ValidationExpression="^\d*$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt2idescr" runat="server" Height="58px"
                    TextMode="MultiLine" Font-Names="Arial" 
                    Width="98%"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="4" class="style1">
                <b>3. <u>Outreach, Coordination, and Collaboration:</u></b> Grantees must provide leadership and support coordination of professional development opportunities and resources across the state. Grantees are responsible for building relationships at the local, regional, and state level to support the professional development of providers and educators across EEC’s mixed delivery system.
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5" style="width: 40%">
                These output outcomes can be measured:
            </td>
            <td class="style5" style="width: 20%;text-align:center">
                FY2019 Projection (Number)
            </td>
            <td class="style5" style="width: 40%;text-align:center">
                Deliverable Description
            </td>
        </tr>
        <tr>
            <td class="style2">
                3a.
            </td>
            <td class="style2">
                Identify the number of providers (programs) included on the distribution list for the EPS grant. In the description provide the service that is used to maintain the distribution lists, for example, ConstantContact. </td>
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
                Identify the number of educators included on the distribution list for the EPS grant. In the description provide the service that is used to maintain the distribution lists, for example, ConstantContact. </td>
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
            <td class="style2">
                3c.
            </td>
            <td class="style2">
                Identify the anticipated number of information sessions planned throughout the grant year. In the description provide details regarding the proposed modality of the information sessions, anticipated time of year, and location, if known.  </td>
            <td class="style3">
                <asp:TextBox ID="txt3c" runat="server" Height="25px"
                    Width="78px" style="text-align:center" MaxLength="10"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
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
