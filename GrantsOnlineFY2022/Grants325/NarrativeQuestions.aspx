<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW.master" AutoEventWireup="true"
    CodeFile="NarrativeQuestions.aspx.cs" Inherits="NarrativeQuestions" %>

<%@ MasterType VirtualPath="~/MasterPageNEW.master" %>
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
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Required Grant Forms (Part 9)"
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
        <%--<tr>
            <td class="style2">     NOTE:  The text below goes into the Instructions for FY2019
                <b>1. Describe the regional plan for implementing FY2018 grant services to enhance program quality through intentional professional development opportunities that improve instructional practice, build educator competencies, and support positive outcomes for children.<br/><br/>
                        The implementation plan should speak to individual grant services as well as the intersection amongst services. Include information on the decision-making process, lessons learned, and anticipated challenges or concerns. The implementation plan must specifically address: 
                        <ol type="a">
                        <li>Implementing a Program-Focused Model, including:
	
	                        <ol type="i">
		                        <li>Program application and selection process</li>
		                        <li>Program distribution, including regional and program type</li>
	                        </ol></li>
                        <li>Delivery of coaching and technical assistance, including
	                        <ol type="i">
		                        <li>Application and selection process</li>
		                        <li>Initial assessment and goal setting process</li>
		                        <li>Duration and dosage of coaching services</li>
	                        </ol></li>
                        <li>Portfolio of professional development opportunities available and process for course selection,</li>
                        <li>Supporting certificate and degree attainment, and</li>
                        <li>Services available in languages other than English.</li>
                        </ol></b>
                <br />
                <br />
            </td>
        </tr>--%>
        <tr>
            <td class="style2">
                <b>1.&nbsp;Identify your experience and expertise as it pertains to 1) working with adult learners, 2) working with educators and providers in EEC's mixed delivery system, and 3) providing for-credit professional development opportunities, technical assistance, and coaching and mentoring services.</b>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="txtA1" runat="server" TextMode="MultiLine" Width="98%" Rows="8"
                    MaxLength="7000" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <b>2.&nbsp;Identify your experience working with EEC, administering grant programs, leveraging resources and partnering with local, regional, and statewide stakeholders.</b>
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
    <script type="text/javascript">
    enableEnterKey = true;
    </script>
</asp:Content>
