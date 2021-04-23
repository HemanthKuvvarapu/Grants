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
                <b>1. Provide Early Childhood Mental Health Consultation (ECMHC) Services Accessible to Programs and Providers in the Mixed Delivery System.</b><br /><br />
                A. Provide an overview of your agency’s mission and initiatives that support positive child and family outcomes and the communities your agency has traditionally served.  In your response, also describe:
                <ol type="1">
                    <li>your agency’s experience in delivering ECMHC services  and, if applicable, how ECMHC services will interface with the other services of your agency, </li>
                    <li>your agency’s system of fiscal and program management, specific to the oversight and  administration of this grant, including the strengths of such system,</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA1" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
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
                <b>2. Provide Early Childhood Mental Health Consultation (ECMHC) Services Accessible to Programs and Providers in the Mixed Delivery System.</b><br /><br />
                A. Describe the community, family, educator and provider demographics in grant coverage area that your agency is proposing to serve. Your response should also address:
                <ol type="1">
                    <li>how grant funding for early childhood mental health consultation services will be used to address community needs and the target population to be served; </li>
                    <li>how your agency plans to perform outreach to programs and potential community partners within your coverage area, </li>
                    <li>how your agency will pay particular attention to those prioritized for ECMHC services as described in the RFR;</li>
                    <li>how  programs will be matched with ECMH Consultants including
						<ol type="i">
							<li>how services will be triaged based on program need and </li>
							<li>how consultants will reflect and be responsive to the language and cultural diversity of programs served,</li>
						</ol>
                    </li>
                    <li>how your agency will manage referrals, track response time, including the method  that will be used for evaluating how a program meets the specified priorities.</li>
               </ol>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA2" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>3. Provide Early Childhood Mental Health Consultation (ECMHC) Services Accessible to Programs and Providers in the Mixed Delivery System.</b><br /><br />
                A. Describe how your agency proposes to utilize the resources provided through the ECMHC grant to build capacity of early education and care leadership in order to ensure quality practices are embedded in the program, to create opportunities for engagement with teachers and families and to build high quality learning environments that support social emotional learning for children.
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA3" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
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
                <b>4. Personnel and Consultant Requirements</b><br /><br />
                A. Please describe how your agency will assure that clinicians who will have responsibilities for carrying out the requirements of the grant will possess the professional qualifications, skills and experience required to successfully fulfill the responsibilities of their positions as outlined in the grant requirements. In your response, also describe:
                <ol type="1">
                    <li>the anticipated staff involved and their roles on this project,</li>
                    <li>your organization’s capacity to support the on-going professional development needs of grant funded staff,</li>
					<li>the supervisory structure that will be used, including the experience and discipline of supervisors, and</li>
					<li>the process for managing clinicians/consultants caseloads, including a description of the anticipated case load of ECMH consultants staff (program- level, classroom-level, and child - family focused)</li>
                </ol>
            </td>    
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA4" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
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
                <b>5. Provision of Responsive ECMH Services.</b><br /><br />
                A. Describe the manner in which your program will include strategies to raise awareness of the adverse effects and to reduce the likelihood of suspension and expulsion of children.<br />
				B. Describe how ECMH services provided will:
				<ol type="1">
					<li>Strengthen the capacity of administrators,</li>
					<li>Support implementation of evidence-based practices, and</li>
					<li>Build the self-sufficiency of program staff</li>
				</ol>
				C. Describe how services will support program development through review of policies, introduction to resources, and development of materials,<br />
				D. Describe your service delivery approach which should include initiating, assessing, planning, providing services and supports, sustaining and then completing the services. Explain how ECMH consultants will determine the type and length of service delivery for a specific program. <br />
				E. Describe your plan for supporting educators and directors to embed social-emotional practices learned from ECMH clinician’s to build their capacity in addressing children’s social and emotional skills.<br />
				F. Describe your plan for delivering Child and Family-Focused ECMHC services. In your response, identify the specific measurable outcomes related to the provision of ECMHC services that your agency will use at the child and family level. Describe your plan to determine and share your findings with programs, educators, families and EEC on whether these outcomes are met or not.<br /><br />
				Note: Please review the grant reporting requirements and Appendix H EEC's ECMHC Practice Model prior to preparing your response. 
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA5" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
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
                <b>6. Strengthen Linkages to Community Supports</b><br /><br />
                A. Describe your agency's plan to systematically and consistently communicate and/or collaborate with other local and regional EEC programs and initiatives and other local mental health, child welfare, health, education, and family support resources. Explain how this communication and/or collaboration will maximize access and opportunities for family education and support, professional development, and program quality services.<br />
				B. Describe how your agency will develop and leverage these relationships to support enhanced cross-system coordination and continuity of services with the appropriate health care, mental health, family supports, or other educational services and supports in high need communities where there are proportionately increased numbers of children identified with high needs.
            </td>    
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA6" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
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
                <b>7. Utilize evidence-based techniques to inform and evaluate the effectiveness of ECMHC Services.</b><br /><br />
                A. Describe what data collection tools your agency will use to determine the effectiveness of the methods and practices being utilized for grant services.<br />
				B. Describe how these tools will inform the work and how you will make changes based on this evidence.
            </td>    
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="txtA7" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: xx-small">
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
