<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="NarrativeQuestions.aspx.cs" Inherits="NarrativeQuestions" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 30px;
            text-align: center;
            background-color: #bababa;
            font-family: Arial;
            font-size: 13px;
        }
        .style2
        {
            background-color: #FFFFCC;
            padding-left: 5px;
            font-family: Arial;
            font-size: 13px;
            padding-bottom: 5px;
        }
        .style3
        {
            background-color: #FFFFCC;
            text-align: center;
            font-family: Arial;
            font-size: 13px;
        }
        .style4
        {
            font-family: Arial;
            font-size: 13px;
        }
        .styleErrors
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td>
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
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Projected Deliverables (Part 8)"
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
            <td>
                <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            <span class="styleErrors">The Information has been SAVED with the following error(s).<br />
                                <ul style="font-weight: normal">
                                    <li>
                                        <asp:Label ID="lblErrors" runat="server"></asp:Label></li>
                                </ul>
                            </span><span style="text-align: center">
                                <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Home" Visible="true"
                                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="200px" />
                            </span>
                            <br />
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
    <span class="style4">
        <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
</span>
    <table id="tblPartIII" runat="server" style="width: 100%; font-family: Arial; font-size: 13px"
        cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="style1">
                <b>Topic and Questions</b>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
               <b> 1. Community Level Collaborations <br /><br />
                   From EEC’s Strategic Action Plan <br /><br />
                   Community Level Collaborations: </b>
                <i>Invest in community level collaborations as a connective tissue to ensure comprehensive and wraparound supports for child development and family opportunity through Coordinated Family and Community Engagement; work across health, mental health, education, child development, youth development, and child and family welfare domains to meet the holistic needs of children, youth, and families.</i><br />
                As we think about local systems of support for children and families, it is helpful to understand how communities are organized in the Birth to Third Grade space and the role CFCEs play in these systems.  <br /><br /><br />
                <b>Part I – CFCE Advisory Council </b><br /><br />
                Please include answers to the following questions in your overall response about your CFCE council. <br />
                <b>Please refer to <u>Appendix M: FY 2022 CFCE Local Advisory Council Roles and Responsibilities</u> in preparing your response to the following questions.</b>
<ul>
<li>How does your CFCE council represent integration of community partners serving children and families in the Birth to Third grade space?  </li>
<li>If you serve multiple communities, how do you engage key partners across your service area to promote a coordinated and aligned approach to serving families?</li>
<li>Who participates on your council and what role do they play? How are families engaged with your council? </li>
<li>How do you coordinate and align your efforts across the community you serve? If you serve multiple communities, how do you coordinate and align your efforts, recognizing potential differences in assets and needs within your service area?</li>
</ul>
                <b>Part II - Community-wide Systems</b>
                <ul>
                    <li>How do systems in your community work together to coordinate resources and align efforts that support young children and their families? </li>
                    <li>Are there articulated, shared goals for young children and their families in your communities? </li>
                    <li>Is there an overarching community-wide body of stakeholders of which your CFCE council is a part? </li>
                    <li>Is so, is there local leadership (mayor, superintendent, etc.) leading these efforts? </li>
                    <li>If there is a community-wide structure in place, what role does your CFCE council play? </li>
                </ul>
                (<b>Please note:</b> If you serve more than one community, please provide a brief overview of all the communities you serve in response to this set of questions.)
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA1" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="30000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>

        <tr>
            <td class="style2">
                <b>2. Strengthening Partnerships: A Framework for Prenatal through Young Adulthood Family Engagement in Massachusetts<br />
                  From EEC’s Strategic Action Plan:<br /></b>
                  <i>Fully integrate the Massachusetts Family Engagement Framework to create common language and approach to engaging families across sectors/programs through existing systems. </i>
                  <ul>
                      <li>Please describe your plan to integrate the Family Engagement Framework as the backbone of your work with families. Include the following: staff training, council orientation, engagement with community partners, etc. </li>
                      <li>What are some best practices from the Family Engagement Framework that you will adopt or strengthen in your work with families?</li>
                  </ul>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA2" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="30000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>

        <tr>
            <td class="style2">
                <b>3.	Using Data to inform Practice</b><br />
                CFCE grantees have been collecting data that reflects program offerings and participation, trends in family needs, family satisfaction, referral and outreach efforts, etc. 
                <ul>
                    <li>How are you using this data to inform your practice?</li>
                    <li>What other data sources are you using to strengthen your understanding of the children, families and communities you serve?</li>
                    <li>In concert with the Family Engagement Framework, CFCEs are required to use the Strengthening Families Self-Assessment tool to identify strengths and opportunities to enhance their capacity to be responsive to family needs. Please share some highlights from your Strengthening Families Self-Assessment, including strengths as well as opportunities for strengthening your capacity that surfaced in this process that will be reflected in your FY22 programming. </li>
                </ul>
                  
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA3" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="30000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>

       <%-- <tr>
            <td class="style2">
                4. <b>Community Partnerships</b><br /><br />
                Coordinated community engagement is key to the successful implementation of the CFCE grant. 
                <ul>
                    <li>How have you built a community stakeholder/partnership advisory to meet the needs of your community? How has/will your advisory support your plans for addressing issues that surfaced in your community needs assessment and your strengthening families self-assessment?  </li>
                    <li>What is your relationship with community partners, including public schools, local businesses, DCF Offices, Family Resource Centers, WIC and other family supporting agencies?  </li>
                    <li>How have you engaged in outreach to families to encourage parent leadership through Advisory Council participation and to inform program direction and development?</li>
                    <li>Describe your overall successes and challenges in implementing authentic family and community engagement to support the execution of the CFCE grant, including through your Advisory Council.</li>
                    <li>Please provide a description of how you will address any challenges that you have experienced related to any of the items listed above.</li>
                    <li>Provide a list of your active council members for FY19 and their affiliation. </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA4" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="30000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>--%>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                    <tr>
                        <td height="100" align="center">
                            <asp:LinkButton ID="btnPrintHSNQ" runat="server" Text="Save and Print" OnClick="btnPrintHSNQ_Click"
                                CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" OnClick="btnCancel_Click"
                                CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnSave" runat="server" Text="Save Information" OnClick="btnSave_Click"
                                CausesValidation="true" CssClass="buttonClass" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
