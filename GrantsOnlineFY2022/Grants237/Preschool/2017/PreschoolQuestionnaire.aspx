<%@ Page Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="PreschoolQuestionnaire.aspx.cs" Inherits="Preschool_2017_PreschoolQuestionnaire" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPage4.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
    </script>
    <style type="text/css">
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
            text-align: left;
            padding-left:20px;
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
                            Based on the information you have provided below your program is considered eligible for the FY <%=AppInfo.FiscalYear%> Inclusive Preschool Learning Environments Grant.<br />
                            <br />
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
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
                        <td align="center" style="height: 70px; padding-top: 5px">
                            <span class="styleErrors">According to the questions answered, your program does not qualify for the FY <%=AppInfo.FiscalYear%> Inclusive Preschool Learning Environments grant.<br /><br />Please view <a href="http://www.mass.gov/edu/government/departments-and-boards/department-of-early-education-and-care/">EEC's website</a> for more grant opportunities.<br />
                            </span>
                            <br />
                            <span style="text-align: center">
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
    <span class="style4"><b>Instructions:</b>&nbsp;In order to be eligible to apply for the FY 2016 IPLE grant, the lead agency must ensure that <b>all programs</b> and designated preschool session(s) proposed for funding meet <i><b>all</b></i> of the criteria outlined below. 
</span>
    <table id="tblPartIII" runat="server" style="width: 100%; font-family: Arial; font-size: 13px"
        cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="style2">
                1. Are all programs proposed for FY 2017 IPLE funding one of the following preschool program types:  preschool-age children in EEC-licensed group and center based programs; Head Start programs; and/or public preschool programs?
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo1" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="rdo1" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                2. Will all programs proposed for FY 2017 IPLE funding have the capacity to enroll preschool-age children  with and without disabilities? 
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo2" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="rdo2" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                3. Will all preschool settings (classrooms and sessions) designated for funding meet the criteria of an inclusive preschool learning environment as defined under the <b>Required Services</b>?  
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo3" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="rdo3" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                4. Will all programs proposed for FY 2017 IPLE funding  meet one of the following QRIS Participation Requirements:
                <ul>
                    <li>Programs are currently participating in the Massachusetts QRIS with a Center Based / School Based QRIS Application with a status of QRIS Rating Granted at <b>QRIS Level 1 or higher as of <u>April 15, 2016</u>;</b></li>
                    <li>Programs are currently participating in the Massachusetts QRIS with a Center Based / School Based QRIS Application with a Status of <b>EEC Review in Progress</b> or <b>EEC Review Complete</b> (as of April 15, 2016)  <b>and</b> agree to submit a Continuous Quality Improvement Plan (CQIP) that  clearly state the steps that the program (s) will take to ensure that <b>QRIS Rating Granted at QRIS Level 1 or higher</b> is achieved <b><u>on or before by December 1, 2016</u></b>;  AND/ OR</li>
                    <li><b>Programs</b>  not currently participating in QRIS agree to participate in the Massachusetts QRIS, by completing a Center Based / School Based QRIS Application <b>QRIS Self-Assessed Level at QRIS Level 1</b> or higher with a status of <b>"Final Submitted to EEC"</b> in efforts to achieve a <b>QRIS Rating Granted at QRIS Level 1 or higher <u>before June 1, 2017</u></b>. </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo4" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="rdo4" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: xx-small">
                <br />
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                    <tr>
                        <td height="100" align="center">
                            <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Submit" OnClick="btnCancel_Click"
                                CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnSave" runat="server" Text="Submit Information" OnClick="btnSave_Click"
                                CausesValidation="true" CssClass="buttonClass" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>1</sup>For the purposes of this grant, the term "preschool-aged children" is defined as children who are 2.9 years old to Kindergarten eligible.  
                  <br /><br />
            </td>
        </tr>
    </table>
</asp:Content>
