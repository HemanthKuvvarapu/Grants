<%@ Page Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="UPKQuestionnaire.aspx.cs" Inherits="UPK_2018_UPKQuestionnaire" Title="Untitled Page" %>
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
        .style5
        {
            background-color: #FFFFCC;
            padding-left: 5px;
            font-family: Arial;
            font-size: 13px;
            padding-bottom: 5px;
            height: 42px;
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
                            Based on the information you have provided below your program is considered eligible for the FY <%=AppInfo.FiscalYear%> UPK renewal grant.<br />
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
                            <span class="styleErrors">According to the questions answered, your program does not qualify for the FY <%=AppInfo.FiscalYear%> UPK renewal grant.<br /><br />Please view <a href="http://www.mass.gov/edu/government/departments-and-boards/department-of-early-education-and-care/">EEC's website</a> for more grant opportunities.<br />
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
    <span class="style4"><b>Instructions:</b>&nbsp;In order to be eligible to apply for FY&nbsp;<%=AppInfo.FiscalYear%> Universal Pre-Kindergarten Renewal Grant, designated classrooms and/or family child care homes must continue to meet <b><i>all</i></b> of the criteria outlined below. 
</span>
    <table id="tblPartIII" runat="server" style="width: 100%; font-family: Arial; font-size: 13px"
        cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="style2">
                1.  Does your program have, <u>at a minimum</u>, a <b>Granted Level 3</b> status in the Department of Early Education and Care’s Quality Rating and Improvement System (QRIS) Program Manager?
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
                2.	Does your program have an income-eligible contract, and/or voucher agreement in place and does your program accept EEC-subsidized or low-income children?<sup>1</sup>
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
                3.	Does your program offer access to full-day, full-year services for working families?<sup>2</sup>
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
                4.	If you are a group child care program, does your program have current NAEYC or NEASC accreditation? If you are a family child care educator, do you have current NAFCC accreditation, a non-expired CDA credential, or an AA, BA or Master's degree? <sup>3</sup>
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
            <td class="style2">
                5. Does your program currently serve preschool-aged children?<sup>4</sup>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo5" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="rdo5" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                6.	Does your program currently serve high needs children?<sup>5</sup>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo6" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="rdo6" Display="Dynamic" 
                    ErrorMessage="Please select one of the options." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                7. Does your program currently collect and enter formative assessment data for each child in the preschool classroom(s)?
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rdo7" runat="server" 
                    RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="rdo7" Display="Dynamic" 
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
                <sup>1</sup>EEC-subsidized or low-income children are defined as any of the following populations:
                <ol type="a">                  
                    <li>Children accessing care through EEC contracts or vouchers; </li>
                    <li>Children funded with Head Start dollars; </li>
                    <li>Privately subsidized children from families meeting EEC income eligibility criteria (i.e., total household income at or below 85% of the state median income) with supporting documentation from program; and</li>
                    <li>Children attending preschool programs operated by public schools that:
                    <ol type="i">
                        <li>Have a high proportion of children qualifying for free/reduced lunch; </li>
                        <li>Are at risk of or have been determined to be under-performing in accordance with sections 1J and 1K of Chapter 69 of the General Laws; and/or </li>
                        <li>Have been placed in the accountability status of identified for improvement, corrective action, or restructuring pursuant to Massachusetts Department of Elementary and Secondary Education (DESE) school regulations, or which have been designated Commonwealth priority schools or Commonwealth Pilot Schools pursuant to said regulations.</li>
                    </ol>
                    </li>
                </ol>
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>2</sup>For the purposes of this grant, the term "full day/full year" is defined as operating for <b>at least 231 days and 2,079 hours per year</b>. Programs that are not "full-day, full-year" must demonstrate how UPK and/or other funds are being used to provide access to full-day, full-year services in the narrative section of the UPK budget.  
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>3</sup>Current NAEYC, NEASC, or NAFCC accreditation means that a program is considered by the national accrediting body as of <b>July 1, 2017</b> to be accredited.  If there is a lapse in accreditation, during the contract period, the program must report this change to EEC and come back into accreditation status within 90 days of the first day of the lapse or be subject to loss of UPK funding. 
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>4</sup>For the purposes of this grant, the term "preschool-aged children" is defined as children who are 2 years, 9 months to Kindergarten eligible. 
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                <sup>5</sup>For the purposes of this grant, the term "high needs children" is defined as children who have  <u>two or more</u> of the following risk factors shown to be <u>linked to poor outcomes</u> in such areas as school performance, health, and mental health:
                <ol type="i">                  
                    <li>Low-income households/children eligible for free or reduced priced meals;</li>
                    <li>Children with special needs/disability (IEP or 504 Plan);</li>
                    <li>Children and families who previously participated in Early Intervention services (IFSP)</li>
                    <li>Children who are homeless or move more than once per year, as defined under the McKinney-Vento Homeless Education Assistance Improvements Act of 2001;</li>
                    <li>Children who are Dual Language Learners whose home language is not English (DLL/ELL/LEP);</li>
                    <li>Parent(s) with education less than a high school diploma or GED;</li>
                    <li>Parent(s) with chronic illness or disability affecting care-giving ability;</li>
                    <li>Children who have experienced multiple traumas or losses;</li>
                    <li>Young children whose family recently immigrated to U.S. (parent(s) who came to the U.S. within the past 10 years);</li>
                    <li>Families and children involved with multiple state agencies;</li>
                    <li>Children with parent(s) who are deployed and are not living on a military base.</li>
                </ol>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
