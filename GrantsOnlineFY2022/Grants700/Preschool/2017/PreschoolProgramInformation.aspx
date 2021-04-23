<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="PreschoolProgramInformation.aspx.cs" Inherits="Preschool_2017_PreschoolProgramInformation" %>
<%@ MasterType VirtualPath="~/MasterPage4.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="javascript" type="text/javascript">
    
    function GetTotalChildren(Id1, Id2, Id3, Id4, totalTxtId)
    {
        var a1 = document.getElementById(Id1);
        var a2 = document.getElementById(Id2);
        var a3 = document.getElementById(Id3);
        var a4 = document.getElementById(Id4);
        
        var a1Value = (a1 == null) ? 0 : parseInt(a1.value);
        var a2Value = (a2 == null) ? 0 : parseInt(a2.value);
        var a3Value = (a3 == null) ? 0 : parseInt(a3.value);
        var a4Value = (a4 == null) ? 0 : parseInt(a4.value);
        
        a1Value = (isNaN(a1Value)) ? 0 : a1Value;
        a2Value = (isNaN(a2Value)) ? 0 : a2Value;
        a3Value = (isNaN(a3Value)) ? 0 : a3Value;
        a4Value = (isNaN(a4Value)) ? 0 : a4Value;
        
        document.getElementById(totalTxtId).value = a1Value + a2Value + a3Value + a4Value;
    }
    
    function GetTotalChildren2(Id1, Id2, Id3, Id4, Id5, Id6, Id7, Id8, totalTxtId)
    {
        var a1 = document.getElementById(Id1);
        var a2 = document.getElementById(Id2);
        var a3 = document.getElementById(Id3);
        var a4 = document.getElementById(Id4);
        var a5 = document.getElementById(Id5);
        var a6 = document.getElementById(Id6);
        var a7 = document.getElementById(Id7);
        var a8 = document.getElementById(Id8);
        
        var a1Value = (a1 == null) ? 0 : parseInt(a1.value);
        var a2Value = (a2 == null) ? 0 : parseInt(a2.value);
        var a3Value = (a3 == null) ? 0 : parseInt(a3.value);
        var a4Value = (a4 == null) ? 0 : parseInt(a4.value);
        var a5Value = (a5 == null) ? 0 : parseInt(a5.value);
        var a6Value = (a6 == null) ? 0 : parseInt(a6.value);
        var a7Value = (a7 == null) ? 0 : parseInt(a7.value);
        var a8Value = (a8 == null) ? 0 : parseInt(a8.value);
        
        a1Value = (isNaN(a1Value)) ? 0 : a1Value;
        a2Value = (isNaN(a2Value)) ? 0 : a2Value;
        a3Value = (isNaN(a3Value)) ? 0 : a3Value;
        a4Value = (isNaN(a4Value)) ? 0 : a4Value;
        a5Value = (isNaN(a5Value)) ? 0 : a5Value;
        a6Value = (isNaN(a6Value)) ? 0 : a6Value;
        a7Value = (isNaN(a7Value)) ? 0 : a7Value;
        a8Value = (isNaN(a8Value)) ? 0 : a8Value;
        
        document.getElementById(totalTxtId).value = a1Value + a2Value + a3Value + a4Value + a5Value + a6Value + a7Value + a8Value;
    }
    
     </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxControlToolkit:ToolkitScriptManager>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td>
                <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            The Information has been SAVED successfully.<br />
                            <br />
                            <br />
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Program Summary" Visible="true"
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
                            <td align="center" style="height: 50px; padding-top: 5px">
                                <span class="styleErrors">The Program Information has been SAVED with the following error(s).<br />
                                    <span style="font-weight: normal">
                                        <asp:BulletedList ID="lstErrors" runat="server" CssClass="styleErrors">
                                        </asp:BulletedList>
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
    </table>
    <table id="tblData" runat="server" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #FFFFCC">
        
        <tr>
            <td>
                <table id="tblSysProviders" runat="server" visible="false" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td colspan="2"><b>Instructions: An IPLE Site Survey must be completed for each program site that the IPLE Lead Agency is proposing to fund with FY <%=AppInfo.FiscalYear %> IPLE funds. <br /><br />
                        Please complete one IPLE site survey for each group and center based program; Head Start program; and/or public preschool program where IPLE funds will be used. 
                        <br /><br />
                        To create a record for a IPLE site, click the "<b>Add New Program</b>" button below.
                                <ul>
                                    <li><u>To VIEW or EDIT</u> information for the IPLE site, click "<b>View/Edit</b>" next to that site's information.</li>
                                    <li>To VIEW or PRINT a draft copy of a IPLE Site Survey, Click "<b>Print PDF</b>"</li>
                                    <li>To DELETE an IPLE Site Survey, click "<b>Delete</b>".</li>
                                </ul>
                            <br /> 
                            <b>IMPORTANT: </b>   
                            <ol type="a">
                                <li>All fields require a response. </li>
                                <li>Responses to this section <b><u>must be consistent</u></b> with responses as offered the Budget and Budget Narrative, the Narrative Questions, the Projected Deliverables, and the Required Grant Forms.  IPLE Program Summary and IPLE Site Survey are generated based on information submitted in this section. </li>
                                <li>Please review and revise responses, as needed, to ensure information provided in the Site Survey is consistent will all other sections of the Grant Application.</li>
                                <li><span style="red">Please note that if all information for the site is deleted or if any information in the site survey is not completed in full, the site will not be eligible FY 2017 IPLE funding.</span></li>
                            </ol> 
                        <br /><br />
                        </td>
                    </tr>
                    <tr style="background-color: #6699FF; color: #FFFFFF">
                        <td style="font-size: larger;height:30px" width="800px">&nbsp;&nbsp;<b>Program Summary</b></td>
                        <td><asp:Button ID="btnPrintProgramSummary" runat="server" Text="Print Program Summary" 
                                OnClick="btnPrintProgramSummary_Click" />
                            </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;" colspan="2">
                            <asp:GridView ID="grdSysProviders" runat="server" AutoGenerateColumns="false" 
                                DataKeyNames="SystemProviderId" OnRowDataBound="grdSysProviders_RowDataBound" 
                            OnRowDeleting="grdSysProviders_RowDeleting" 
                                OnRowEditing="grdSysProviders_RowEditing" Width="100%" BackColor="White" 
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                                ForeColor="Black" GridLines="Vertical" 
                                onrowcommand="grdSysProviders_RowCommand" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="txtProgramName" HeaderText="Program" >
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtEECProgramNumber" HeaderText="Program Number" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtCity" HeaderText="City/Town" >
                                        <ItemStyle />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="QRISGrantedStatus1" HeaderText="QRIS Level" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtQ8" HeaderText="IPLE Sessions" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtQ9" HeaderText="Weeks Open" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtQ11_1" HeaderText="IPLE Enrollment Capacity" >
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtQ11_3" HeaderText="Children With IEPs" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtQ11_2" HeaderText="Children Without IEPs" >
                                        <ItemStyle Width="65px" />
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="Link" CommandName="Edit" Text="Edit/ View">
                                        <ItemStyle Width="40px" />
                                    </asp:ButtonField>
                                    <asp:ButtonField ButtonType="Link" CommandName="Delete" Text="Delete">
                                        <ItemStyle Width="40px" />
                                    </asp:ButtonField>
                                    <asp:ButtonField ButtonType="Link" CommandName="Print" Text="Print PDF">
                                        <ItemStyle Width="40px" />
                                    </asp:ButtonField>
                                </Columns>
                                <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                                <FooterStyle BackColor="#CCCC99" Font-Bold="True" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr><td align="center"><b style="text-align:center;color:#FF0000">No program found.</b></td></tr>
                                    </table>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnAddNewProgram" runat="server" Text="Add New Program" OnClick="btnAddNewProgram_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="5" id="tblCenter" runat="server" style="width: 100%;">
                    <tr>
                        <td style="background-color:#ffffff"><b>Instructions</b>: The following questions pertain to the IPLE- funded settings and the IPLE-preschool sessions that the Lead Agency is proposing as the designated settings for FY 2017 Inclusive Preschool Learning Environments Grant. 
                        <br /><br />
                        See Appendix D: Site Survey Guidelines
                        <br /><br />
                        <b>Answer Questions 1 - 8 and then click the "Save Information" button to save your program information for the first time information is saved.</b>
                        <br /><br />
                            For the purpose of the grant, these classrooms are referred to as <b>IPLE-funded sessions</b> The term "session" is used as an alternative to classroom, as an IPLE classroom may be used to serve two groups of children on the same day (i.e., when morning and afternoon sessions are offered).  
                            <br /><br />
                        <b>All questions require a response.</b><br /><br />
                        <b>For the FY 2017 Grant Application, applicants must provide responses to Questions 1 thru 19 including all questions about anticipated enrollments for October 1, 2016</b><br /><br />
All questions in the IPLE site survey must be completed in full.  An incomplete site survey will not be eligible FY 2017 IPLE funding.</span></b><br /><br /><b>Please remember to save your information frequently</b>.</td>
                    </tr>
                    <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="font-size: larger;height:25px">&nbsp;&nbsp;<b>Program Information</b></td>
        </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Program Name:</b>&nbsp;&nbsp;
                            <asp:TextBox ID="txtProgramName" runat="server" MaxLength="100" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtProgramName" Display="Dynamic" 
                                ErrorMessage="Please enter the Program Name."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>1. What is this program's EEC Program Number<sup>2</sup>? If you do not know your program's EEC Program Number or QRIS Program Number, please contact the EEC Program Quality Technical Desk via the following link: eecqris@MassMail.State.ma.us
                        <a href="mailto:eecqris@MassMail.State.ma.us">eecqris@MassMail.State.ma.us</a></b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            EEC Program Number:&nbsp;<asp:TextBox ID="txtEECProgramNumber" runat="server" 
                                MaxLength="7"></asp:TextBox>
                            <br/><asp:CompareValidator ID="CompareValidator14" runat="server" Display="Dynamic" 
                                ErrorMessage="Please enter a valid EEC Program Number." ControlToValidate="txtEECProgramNumber" 
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator234" runat="server" 
                                ControlToValidate="txtEECProgramNumber" Display="Dynamic" 
                                ErrorMessage="Please enter the Program Number."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>2. What is this program's QRIS Rating <u>Granted Status</u>? Please choose a status below for the date period specified:</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:180px">*2a. As of June 1, 2016</td>
                                    <td>
                                        <asp:DropDownList ID="QRISGrantedStatus1" runat="server">
                                            <asp:ListItem Value="0">No QRIS Rating Status </asp:ListItem>
                                            <asp:ListItem Value="1">QRIS Rating Status: EEC Review Completed</asp:ListItem>
                                            <asp:ListItem Value="2">QRIS Rating Status: EEC Review In Progress</asp:ListItem>
                                            <asp:ListItem Value="3">QRIS Rating Granted: Level 1</asp:ListItem>
                                            <asp:ListItem Value="4">QRIS Rating Granted: Level 2</asp:ListItem>
                                            <asp:ListItem Value="5">QRIS Rating Granted: Level 3</asp:ListItem>
                                            <asp:ListItem Value="6">QRIS Rating Granted: Level 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:180px">2b. As of December 1, 2016</td>
                                    <td>
                                        <asp:DropDownList ID="QRISGrantedStatus2" runat="server">
                                            <asp:ListItem Value="-1">----select----</asp:ListItem>
                                            <asp:ListItem Value="0">No QRIS Rating Status </asp:ListItem>
                                            <asp:ListItem Value="1">QRIS Rating Status: EEC Review Completed</asp:ListItem>
                                            <asp:ListItem Value="2">QRIS Rating Status: EEC Review In Progress</asp:ListItem>
                                            <asp:ListItem Value="3">QRIS Rating Granted: Level 1</asp:ListItem>
                                            <asp:ListItem Value="4">QRIS Rating Granted: Level 2</asp:ListItem>
                                            <asp:ListItem Value="5">QRIS Rating Granted: Level 3</asp:ListItem>
                                            <asp:ListItem Value="6">QRIS Rating Granted: Level 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:180px">2c. As of June 1, 2017</td>
                                    <td>
                                        <asp:DropDownList ID="QRISGrantedStatus3" runat="server">
                                            <asp:ListItem Value="-1">----select----</asp:ListItem>
                                            <asp:ListItem Value="0">No QRIS Rating Status </asp:ListItem>
                                            <asp:ListItem Value="1">QRIS Rating Status: EEC Review Completed</asp:ListItem>
                                            <asp:ListItem Value="2">QRIS Rating Status: EEC Review In Progress</asp:ListItem>
                                            <asp:ListItem Value="3">QRIS Rating Granted: Level 1</asp:ListItem>
                                            <asp:ListItem Value="4">QRIS Rating Granted: Level 2</asp:ListItem>
                                            <asp:ListItem Value="5">QRIS Rating Granted: Level 3</asp:ListItem>
                                            <asp:ListItem Value="6">QRIS Rating Granted: Level 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>3. Is this program a Head Start 
                            program?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rbtnIsHeadStartProgram" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator233" runat="server" 
                                ControlToValidate="rbtnIsHeadStartProgram" Display="Dynamic" 
                                ErrorMessage="Please select one of the options."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>4. Is this preschool program 
                            currently accredited?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rbtnIsAccredited" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                onselectedindexchanged="rbtnIsAccredited_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator235" runat="server" 
                                ControlToValidate="rbtnIsAccredited" Display="Dynamic" 
                                ErrorMessage="Please select one of the options."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="trAccr" runat="server" visible="true">
                        <td style="background-color: beige;">
                            <table style="width: 100%;">
                                <tr>
                                    <td colspan="4"><b>Please enter the accreditation details.</b></td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <asp:DropDownList ID="ddlAccreditation" runat="server" Width="150px">
                                            <asp:ListItem Value="0" Text="---------"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="NAEYC"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="NEASC"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationNumber" runat="server" Text="" MaxLength="20"></asp:TextBox><br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationEarnDate" runat="server" Width="100px"></asp:TextBox>
                                        <asp:ImageButton ID="btnCalendarEarnDate" runat="server" ImageUrl="~/images/CalendarImage.png" CausesValidation="false" /><br />
                                        <ajaxControlToolkit:MaskedEditExtender runat="server" ID="MaskedEditExtender1" TargetControlID="txtAccreditationEarnDate"
                                            Mask="99/99/9999" MaskType="Date" PromptCharacter="_" ClearMaskOnLostFocus="true">
                                        </ajaxControlToolkit:MaskedEditExtender>
                                        <ajaxControlToolkit:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtAccreditationEarnDate"
                                            PopupButtonID="btnCalendarEarnDate">
                                         </ajaxControlToolkit:CalendarExtender>
                                        <ajaxControlToolkit:TextBoxWatermarkExtender runat="server" ID="TextBoxWatermarkExtender1"
                                            TargetControlID="txtAccreditationEarnDate" WatermarkText="mm/dd/yyyy">
                                        </ajaxControlToolkit:TextBoxWatermarkExtender>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationExpDate" runat="server" Width="100px"></asp:TextBox>
                                        <asp:ImageButton ID="btnCalendarExpDate" runat="server" ImageUrl="~/images/CalendarImage.png" CausesValidation="false" /><br />
                                        <ajaxControlToolkit:MaskedEditExtender runat="server" ID="MaskedEditExtender2" TargetControlID="txtAccreditationExpDate"
                                            Mask="99/99/9999" MaskType="Date" PromptCharacter="_" ClearMaskOnLostFocus="true" >
                                        </ajaxControlToolkit:MaskedEditExtender>
                                        <ajaxControlToolkit:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtAccreditationExpDate"
                                            PopupButtonID="btnCalendarExpDate" >
                                        </ajaxControlToolkit:CalendarExtender>
                                        <ajaxControlToolkit:TextBoxWatermarkExtender runat="server" ID="TextBoxWatermarkExtender2"
                                            TargetControlID="txtAccreditationExpDate" WatermarkText="mm/dd/yyyy">
                                        </ajaxControlToolkit:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>(Type)
                                    </td>
                                    <td>(No.)
                                    </td>
                                    <td>(Earned Date)
                                    </td>
                                    <td>(Expiration Date)
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>5. Is this program currently an EEC licensed group and center based program or a public preschool program (license-exempt)?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <asp:RadioButtonList ID="rbtnIsProgramLicensed" runat="server" 
                                RepeatDirection="Vertical" Height="26px">
                                            <asp:ListItem Text="EEC licensed group and center based program" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="public preschool program (License-Exempt)" Value="1"></asp:ListItem>
                                        </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator236" runat="server" 
                                ControlToValidate="rbtnIsProgramLicensed" Display="Dynamic" 
                                ErrorMessage="Please select one of the options."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>6. IPLE Program Site Location:</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <table cellpadding="5" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:150px">Street Address:</td>
                                    <td><asp:TextBox ID="txtAddress" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator225" runat="server" 
                                            ControlToValidate="txtAddress" Display="Dynamic" 
                                            ErrorMessage="Please input the Street Address."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>City/Town:</td>
                                    <td><asp:TextBox ID="txtCity" runat="server" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator226" runat="server" 
                                            ControlToValidate="txtCity" Display="Dynamic" 
                                            ErrorMessage="Please input the City/Town."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>Zip Code:</td>
                                    <td><asp:TextBox ID="txtZipCode" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator227" runat="server" 
                                            ControlToValidate="txtZipCode" Display="Dynamic" 
                                            ErrorMessage="Please input the Zip Code."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>7. Please provide contact information for this site's designated QRIS Program Administrator<sup>3</sup></b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <table cellpadding="5" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:150px">First Name:</td>
                                    <td><asp:TextBox ID="txtFirstName" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator228" runat="server" 
                                            ControlToValidate="txtFirstName" Display="Dynamic" 
                                            ErrorMessage="Please input the First Name."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>Last Name:</td>
                                    <td><asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator229" runat="server" 
                                            ControlToValidate="txtLastName" Display="Dynamic" 
                                            ErrorMessage="Please input the Last Name."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>Job Title:</td>
                                    <td><asp:TextBox ID="txtJobTitle" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator230" runat="server" 
                                            ControlToValidate="txtJobTitle" Display="Dynamic" 
                                            ErrorMessage="Please input the Job Title."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>Phone Number:</td>
                                    <td><asp:TextBox ID="txtPhoneNumber" runat="server" Width="250px"></asp:TextBox>(Ex: 617-111-2222)
                                    <asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator231" runat="server" 
                                            ControlToValidate="txtPhoneNumber" Display="Dynamic" 
                                            ErrorMessage="Please input the Phone Number."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhoneNumber"
                                Display="Dynamic" ErrorMessage="Please enter a valid Phone Number." 
                                ValidationExpression="(\s*)((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}((\s*)x\d{0,})?(\s*)" 
                                SetFocusOnError="True">Please enter a valid phone number</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email Address:</td>
                                    <td><asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                                Display="Dynamic" ErrorMessage="Please enter a valid email." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Please enter a valid email.</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator232" runat="server" 
                                            ControlToValidate="txtEmail" Display="Dynamic" 
                                            ErrorMessage="Please input the Email Address."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:85%">                      <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:85%"><span style="color: red; font-weight: bold;">*</span><b>8. How many IPLE-funded preschool sessions<sup>4</sup> will be available at this site in FY 2017?
                                        </b></td>
                                    <td><asp:TextBox ID="txtQ8" runat="server" Text="0"></asp:TextBox><br />
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator15" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." 
                                            ControlToValidate="txtQ8" Operator="DataTypeCheck" 
                                            Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator223" runat="server" 
                                            ControlToValidate="txtQ8" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:85%"><span style="color: red; font-weight: bold;">*</span><b>9. How many weeks between July 1, 2016 and June 30, 2017 will this IPLE-funded site provide grant-funded services? <span style="color:red">(Maximum Number must not exceed 52 weeks)</span>.</b></td>
                                    <td><asp:TextBox ID="txtQ9" runat="server" Text="0"></asp:TextBox><br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator16" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." 
                                            ControlToValidate="txtQ9" Operator="DataTypeCheck" 
                                            Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator224" runat="server" 
                                            ControlToValidate="txtQ9" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>10. For each IPLE-funded session to be offered in FY 2017, please provide a count of the number of sessions by the length of the program day (hours of each session) and number of days per week that each session will be offered (only count each session one time).<br /><br />
                        <span style="color:red">Please enter “0” if this program does not offer this type of session.</span></b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:35%"><b>Length of the program day for in IPLE-funded session</b></td>
                                    <td colspan="5" style="text-align:center"><b>Number of days per week</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="text-align:center;height:25px"><b>Number of IPLE sessions</b></td>
                                    <td style="text-align:center"><b>2 days/week</b></td>
                                    <td style="text-align:center"><b>3 days/week</b></td>
                                    <td style="text-align:center"><b>4 days/week</b></td>
                                    <td style="text-align:center"><b>5 days/week</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Number of Extended day sessions: Six or more hours per day for 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ10_1_0" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                    </td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator98" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_1_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtQ10_1_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Number of Extended day sessions: Six or more hours per day for less than 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ10_2_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator100" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtQ10_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator101" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtQ10_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/><asp:CompareValidator 
                                            ID="CompareValidator102" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtQ10_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                    <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                           c. Number of School day sessions: At least four (4) hours but fewer than six (6) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ10_3_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator105" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtQ10_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator106" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtQ10_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator107" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="txtQ10_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator108" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="txtQ10_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Number of Part day sessions: Fewer than four (4) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ10_4_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_4_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator10" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="txtQ10_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_4_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator11" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="txtQ10_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_4_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator12" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="txtQ10_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ10_4_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator13" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ10_4_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                            ControlToValidate="txtQ10_4_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b><u>IPLE Enrollment Capacity</u></b><br /><br />
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:85%"><span style="color: red; font-weight: bold;">*</span><b>11. What is the anticipated TOTAL ENROLLMENT CAPACITY for the IPLE-funded preschool sessions identified 
                                        <br />
                                        in Question 10? </b></td>
                                    <td><asp:TextBox ID="txtQ11_1" runat="server" Width="100px" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator35" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." 
                                            ControlToValidate="txtQ11_1" Operator="DataTypeCheck" 
                                            Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                            ControlToValidate="txtQ11_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Of the total number of children reported in Question 11, what is the enrollment capacity for <b>children without IEPs</b> who will participate in the proposed IPLE funded sessions? </td>
                                    <td><asp:TextBox ID="txtQ11_2" runat="server" Width="100px" Text="0"></asp:TextBox><br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator17" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." 
                                            ControlToValidate="txtQ11_2" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                            ControlToValidate="txtQ11_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Of the total number of children reported in Question 11, what is the enrollment capacity for <b>children with IEPs</b> who will participate in the proposed IPLE funded sessions? </td>
                                    <td><asp:TextBox ID="txtQ11_3" runat="server" Width="100px" Text="0"></asp:TextBox><br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator18" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." 
                                            ControlToValidate="txtQ11_3" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                            ControlToValidate="txtQ11_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b>
                        12. For each session reported above in Question 10, What is the enrollment capacity for the IPLE-funded sessions proposed?<br /><br />
                        <u>Enter the maximum number of children</u> that may be enrolled in each session based on this site's IPLE operating schedule reported in Question 10.<br /><br />
                        <span style="color:red">Please enter “0” if this program does not offer this type of session.</span></b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:35%"><b>Enrollment Capacity for each IPLE Session Type</b></td>
                                    <td colspan="5" style="text-align:center"><b>Maximum Number of children that may be enrolled in the IPLE-funded sessions.</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%"><b>What is enrollment capacity for the proposed IPLE –funded sessions</b></td>
                                    <td style="text-align:center"><b>Total number of<br /> children</b></td>
                                    <td style="text-align:center"><b>2 days/week</b></td>
                                    <td style="text-align:center"><b>3 days/week</b></td>
                                    <td style="text-align:center"><b>4 days/week</b></td>
                                    <td style="text-align:center"><b>5 days/week</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. IPLE Extended day sessions: six or more hours per day for 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ12_1_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator19" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_1_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                            ControlToValidate="txtQ12_1_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. IPLE Extended day sessions: six or more hours per day less than 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ12_2_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator20" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                            ControlToValidate="txtQ12_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator21" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                            ControlToValidate="txtQ12_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator22" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                            ControlToValidate="txtQ12_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                    <br/></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Number of children enrolled in IPLE School day sessions: At least four (4) hours but fewer than six (6) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ12_3_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator23" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                            ControlToValidate="txtQ12_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator24" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                            ControlToValidate="txtQ12_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator25" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                            ControlToValidate="txtQ12_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator26" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                            ControlToValidate="txtQ12_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Number of children enrolled in IPLE Part Day sessions: Fewer than four (4) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ12_4_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_4_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator27" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                            ControlToValidate="txtQ12_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_4_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator28" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                            ControlToValidate="txtQ12_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_4_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator29" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                            ControlToValidate="txtQ12_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ12_4_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator30" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ12_4_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                            ControlToValidate="txtQ12_4_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><b>13. How many children were enrolled in IPLE-funded session(s) according to the IPLE operating schedules at this site on December 1, 2016?</b><br /></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:35%"><b>Enrollment for each IPLE sessions offered in FY 17</b></td>
                                    <td colspan="5" style="text-align:center"><b>How many children participated in the IPLE sessions by session schedule.</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%"><b><span style="color:red">DECEMBER 2016 REPORTING: ACTUAL ENROLLMENT</span></b></td>
                                    <td style="text-align:center"><b>Total number of<br /> children</b></td>
                                    <td style="text-align:center"><b>2 days/week</b></td>
                                    <td style="text-align:center"><b>3 days/week</b></td>
                                    <td style="text-align:center"><b>4 days/week</b></td>
                                    <td style="text-align:center"><b>5 days/week</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Number of children enrolled in IPLE Extended day sessions: six or more hours per day for 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ13_1_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator31" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_1_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                            ControlToValidate="txtQ13_1_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Number of children enrolled in IPLE Extended day sessions: six or more hours per day less than 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ13_2_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator32" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                            ControlToValidate="txtQ13_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator33" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                            ControlToValidate="txtQ13_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator34" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                            ControlToValidate="txtQ13_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                    <br/></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Number of children enrolled in IPLE School day sessions: At least four (4) hours but fewer than six (6) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ13_3_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator39" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="txtQ13_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator40" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                            ControlToValidate="txtQ13_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator41" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                            ControlToValidate="txtQ13_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator42" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                            ControlToValidate="txtQ13_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Number of children enrolled in Part Day sessions: Fewer than four (4) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ13_4_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_4_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator43" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                            ControlToValidate="txtQ13_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_4_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator44" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                                            ControlToValidate="txtQ13_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_4_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator45" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                                            ControlToValidate="txtQ13_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ13_4_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator46" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ13_4_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                                            ControlToValidate="txtQ13_4_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><b>14. How many children were enrolled in IPLE-funded session(s) according to the IPLE operating schedules at this site on June 1, 2017?</b><br /></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:35%"><b>Enrollment for each IPLE sessions offered in FY 17</b></td>
                                    <td colspan="5" style="text-align:center"><b>How many children participated in the IPLE sessions by session schedule.</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%"><b><span style="color:red">JUNE 2017 REPORTING: ACTUAL ENROLLMENT</span></b></td>
                                    <td style="text-align:center"><b>Total number of<br /> children</b></td>
                                    <td style="text-align:center"><b>2 days/week</b></td>
                                    <td style="text-align:center"><b>3 days/week</b></td>
                                    <td style="text-align:center"><b>4 days/week</b></td>
                                    <td style="text-align:center"><b>5 days/week</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Number of children enrolled in IPLE Extended day sessions: six or more hours per day for 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ14_1_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center">
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator47" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_1_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                            ControlToValidate="txtQ14_1_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Number of children enrolled in IPLE Extended day sessions: six or more hours per day less than 5 days per week</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ14_2_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator48" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                            ControlToValidate="txtQ14_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator49" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                                            ControlToValidate="txtQ14_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator50" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                            ControlToValidate="txtQ14_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                    <br/></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Number of children enrolled in IPLE School day sessions: At least four (4) hours but fewer than six (6) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ14_3_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator51" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                            ControlToValidate="txtQ14_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator52" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                                            ControlToValidate="txtQ14_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator53" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                            ControlToValidate="txtQ14_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator54" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                                            ControlToValidate="txtQ14_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Number of children enrolled in Part Day sessions: Fewer than four (4) hours per day</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ14_4_0" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_4_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator55" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" 
                                            ControlToValidate="txtQ14_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_4_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator56" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                                            ControlToValidate="txtQ14_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_4_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator57" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                                            ControlToValidate="txtQ14_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ14_4_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator58" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ14_4_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" 
                                            ControlToValidate="txtQ14_4_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left:20px">
                        <b>IPLE Enrollment by Age of Child and Disability Status</b><br /><br />
                        <b>Instruction:</b> Provide an unduplicated enrollment count for children enrolled in IPLE-funded sessions only.<br />
                        * An enrollment number for "Anticipated Enrollment by October 1, 2016" must be submitted with the FY 2017 Grant Application. 
                        <br /><br />
                        Note: for actual enrollment numbers, if the enrollment numbers are not yet available, please fill in the boxes with a "0".<br />
                        ** Awarded IPLE Grantees will be required to update these responses to satisfy the FY 2017 IPLE Performance Reporting Requirements.
                        <br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>15. Number of children to be enrolled in this IPLE-funded site by Age and Disability Status: <br /><br />
                            Provide an unduplicated enrollment count for children enrolled in IPLE- funded sessions</b></td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:40%"><b>IPLE Enrollment by Age<sup>6</sup> of Child and Disability Status</b></td>
                                    <td style="width:20%;text-align:center" colspan="2"><b style="color:red">Anticipated 
                                        Enrollment October 1, 2016 
                                        <span style="color:red">*</span></b></td>
                                    <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment December 1, 2016 
                                        **</b></td>
                                    <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment<br />
                                        June 1 , 2017 
                                        **</b></td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;height:25px">&nbsp;</td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">a. Total number of children enrolled in IPLE-funded sessions?</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_1_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">b. Of the total, Number of Three Year Olds?</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator133" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" 
                                            ControlToValidate="txtQ15_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator134" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" 
                                            ControlToValidate="txtQ15_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator116" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" 
                                            ControlToValidate="txtQ15_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator117" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" 
                                            ControlToValidate="txtQ15_2_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator118" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" 
                                            ControlToValidate="txtQ15_2_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_2_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator119" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_2_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" 
                                            ControlToValidate="txtQ15_2_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">c. Of the total, Number of Four Year Olds?</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator120" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" 
                                            ControlToValidate="txtQ15_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator121" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" 
                                            ControlToValidate="txtQ15_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator122" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" 
                                            ControlToValidate="txtQ15_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator123" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" 
                                            ControlToValidate="txtQ15_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator124" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator69" runat="server" 
                                            ControlToValidate="txtQ15_3_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_3_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator125" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_3_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator70" runat="server" 
                                            ControlToValidate="txtQ15_3_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">d. Of the total, Number of Five Year Olds?</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator126" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" 
                                            ControlToValidate="txtQ15_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator127" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator72" runat="server" 
                                            ControlToValidate="txtQ15_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator128" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator73" runat="server" 
                                            ControlToValidate="txtQ15_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator129" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator74" runat="server" 
                                            ControlToValidate="txtQ15_4_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator130" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator75" runat="server" 
                                            ControlToValidate="txtQ15_4_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_4_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator131" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_4_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator76" runat="server" 
                                            ControlToValidate="txtQ15_4_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">e. Of the total, number of children 2.9 years, but under Three Years old?</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator1" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" 
                                            ControlToValidate="txtQ15_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator2" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" 
                                            ControlToValidate="txtQ15_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator3" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" 
                                            ControlToValidate="txtQ15_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator4" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" 
                                            ControlToValidate="txtQ15_5_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator5" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" 
                                            ControlToValidate="txtQ15_5_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ15_5_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator6" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ15_5_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" 
                                            ControlToValidate="txtQ15_5_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>16. Demographic<sup>7</sup> Information for Children who are 3 years old and enrolled in IPLE Sessions</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="width:20%;text-align:center"><b style="color:red">Anticipated Enrollment
                                        <br />
                                        October 1, 2016**</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment December 1, 2016</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">a. Children who are 3 years old, and enrolled in IPLE Sessions</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">b. Number of children who are <u>three years old</u> and African-American or Black (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator137" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator86" runat="server" 
                                            ControlToValidate="txtQ16_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator138" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator87" runat="server" 
                                            ControlToValidate="txtQ16_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_2_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator139" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator88" runat="server" 
                                            ControlToValidate="txtQ16_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">c. Number of children who are <u>three years old</u> and Asian (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator140" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator89" runat="server" 
                                            ControlToValidate="txtQ16_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator141" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator90" runat="server" 
                                            ControlToValidate="txtQ16_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_3_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator142" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator91" runat="server" 
                                            ControlToValidate="txtQ16_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">d. Number of children who are <u>three years old</u> and Hispanic or Latino</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator143" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator92" runat="server" 
                                            ControlToValidate="txtQ16_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator144" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator93" runat="server" 
                                            ControlToValidate="txtQ16_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_4_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator145" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator94" runat="server" 
                                            ControlToValidate="txtQ16_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">e. Number of children who are <u>three years old</u> and Native American (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator146" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator95" runat="server" 
                                            ControlToValidate="txtQ16_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_5_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator147" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator96" runat="server" 
                                            ControlToValidate="txtQ16_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_5_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator148" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator97" runat="server" 
                                            ControlToValidate="txtQ16_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">f. Number of children who are <u>three years old</u> and Native Hawaiian or Other Pacific Islander (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_6_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator149" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_6_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator98" runat="server" 
                                            ControlToValidate="txtQ16_6_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_6_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator150" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_6_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator99" runat="server" 
                                            ControlToValidate="txtQ16_6_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_6_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator151" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_6_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator100" runat="server" 
                                            ControlToValidate="txtQ16_6_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">g. Number of children who are <u>three years old</u> and White (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_7_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator152" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_7_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator101" runat="server" 
                                            ControlToValidate="txtQ16_7_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_7_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator153" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_7_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator102" runat="server" 
                                            ControlToValidate="txtQ16_7_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_7_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator154" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_7_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator103" runat="server" 
                                            ControlToValidate="txtQ16_7_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">h. Number of Children who are <u>three years old</u> and Multi-racial (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_8_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator7" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_8_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator104" runat="server" 
                                            ControlToValidate="txtQ16_8_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_8_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator8" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_8_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator105" runat="server" 
                                            ControlToValidate="txtQ16_8_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_8_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator9" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_8_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator106" runat="server" 
                                            ControlToValidate="txtQ16_8_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">i. Number of Children whose racial identity is unknown</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_9_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator36" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_9_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator107" runat="server" 
                                            ControlToValidate="txtQ16_9_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_9_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator37" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_9_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator108" runat="server" 
                                            ControlToValidate="txtQ16_9_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ16_9_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator59" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ16_9_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator109" runat="server" 
                                            ControlToValidate="txtQ16_9_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>17. Demographic<sup>7</sup> Information for Children who are 4 years old and enrolled in IPLE Sessions</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                                <tr>
                                    <td style="width:40%"><b>IPLE Children who are 4 years old</b></td>
                                    <td style="width:20%;text-align:center"><b style="color:red">Anticipated Enrollment
                                        <br />
                                        October 1, 2016**</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment December 1, 2016</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">a. Children who are 4years old, and enrolled in IPLE Sessions</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">b. Number of children who are <u>four years old</u> and African-American or Black (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator64" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator113" runat="server" 
                                            ControlToValidate="txtQ17_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator65" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator114" runat="server" 
                                            ControlToValidate="txtQ17_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator66" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator115" runat="server" 
                                            ControlToValidate="txtQ17_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">c. Number of children who are <u>four years old</u> and Asian (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator67" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator116" runat="server" 
                                            ControlToValidate="txtQ17_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator68" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator117" runat="server" 
                                            ControlToValidate="txtQ17_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_3_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator69" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator118" runat="server" 
                                            ControlToValidate="txtQ17_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">d. Number of children who are <u>four years old</u> and Hispanic or Latino</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator70" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator119" runat="server" 
                                            ControlToValidate="txtQ17_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator71" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator120" runat="server" 
                                            ControlToValidate="txtQ17_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_4_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator72" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" 
                                            ControlToValidate="txtQ17_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">e. Number of children who are <u>four years old</u> and Native American (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator73" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator122" runat="server" 
                                            ControlToValidate="txtQ17_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_5_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator74" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" 
                                            ControlToValidate="txtQ17_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_5_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator75" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator124" runat="server" 
                                            ControlToValidate="txtQ17_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">f. Number of children who are <u>four years old</u> and Native Hawaiian or Other Pacific Islander (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_6_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator76" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_6_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator125" runat="server" 
                                            ControlToValidate="txtQ17_6_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_6_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator77" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_6_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator126" runat="server" 
                                            ControlToValidate="txtQ17_6_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_6_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator78" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_6_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator127" runat="server" 
                                            ControlToValidate="txtQ17_6_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">g. Number of children who are <u>four years old</u> and White (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_7_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator79" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_7_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator128" runat="server" 
                                            ControlToValidate="txtQ17_7_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_7_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator80" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_7_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator129" runat="server" 
                                            ControlToValidate="txtQ17_7_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_7_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator81" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_7_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator130" runat="server" 
                                            ControlToValidate="txtQ17_7_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">h. Number of Children who are <u>four years old</u> and Multi-racial (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_8_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator82" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_8_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator131" runat="server" 
                                            ControlToValidate="txtQ17_8_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_8_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator84" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_8_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator132" runat="server" 
                                            ControlToValidate="txtQ17_8_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_8_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator85" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_8_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator133" runat="server" 
                                            ControlToValidate="txtQ17_8_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">i. Number of Children where racial identity is unknown</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_9_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator86" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_9_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator134" runat="server" 
                                            ControlToValidate="txtQ17_9_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_9_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br /><asp:CompareValidator 
                                            ID="CompareValidator221" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_9_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator135" runat="server" 
                                            ControlToValidate="txtQ17_9_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ17_9_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator222" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ17_9_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator136" runat="server" 
                                            ControlToValidate="txtQ17_9_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>18. Demographic<sup>7</sup> Information for Children who are 5 years old and enrolled in IPLE Sessions</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:40%"><b>IPLE Children who are 5 years old</b></td>
                                    <td style="width:20%;text-align:center"><b style="color:red">Anticipated Enrollment by
                                        <br />
                                        October 1, 2016 
                                        <span style="color:red">**</span></b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment December 1, 2016</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">a. Total number of children who are <u>five years old</u> and enrolled in IPLE Sessions</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_1_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_1_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">b. Number of children who are <u>five years old</u> and African-American or Black (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator157" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator140" runat="server" 
                                            ControlToValidate="txtQ18_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator158" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator141" runat="server" 
                                            ControlToValidate="txtQ18_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_2_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator159" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator142" runat="server" 
                                            ControlToValidate="txtQ18_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">c. Number of children who are <u>five years old</u> and Asian (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator160" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator143" runat="server" 
                                            ControlToValidate="txtQ18_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator161" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator144" runat="server" 
                                            ControlToValidate="txtQ18_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_3_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator162" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator145" runat="server" 
                                            ControlToValidate="txtQ18_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">d. Number of children who are <u>five years old</u> and Hispanic or Latino</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator163" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator146" runat="server" 
                                            ControlToValidate="txtQ18_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator164" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator147" runat="server" 
                                            ControlToValidate="txtQ18_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_4_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator165" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator148" runat="server" 
                                            ControlToValidate="txtQ18_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">e. Number of children who are <u>five years old</u> and Native American (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_5_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator93" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator149" runat="server" 
                                            ControlToValidate="txtQ18_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_5_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator94" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator150" runat="server" 
                                            ControlToValidate="txtQ18_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_5_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator95" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator151" runat="server" 
                                            ControlToValidate="txtQ18_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">f. Number of children who are <u>five years old</u> and Native Hawaiian or Other Pacific Islander (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_6_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator96" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_6_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator152" runat="server" 
                                            ControlToValidate="txtQ18_6_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_6_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator97" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_6_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator153" runat="server" 
                                            ControlToValidate="txtQ18_6_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_6_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator99" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_6_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator154" runat="server" 
                                            ControlToValidate="txtQ18_6_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">g. Number of children who are <u>five years old</u> and White (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_7_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator103" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_7_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator155" runat="server" 
                                            ControlToValidate="txtQ18_7_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_7_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator104" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_7_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator156" runat="server" 
                                            ControlToValidate="txtQ18_7_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_7_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator113" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_7_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator157" runat="server" 
                                            ControlToValidate="txtQ18_7_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">h. Number of Children who are <u>five years old</u> and Multi-racial (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_8_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator87" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_8_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator158" runat="server" 
                                            ControlToValidate="txtQ18_8_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_8_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator88" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_8_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator159" runat="server" 
                                            ControlToValidate="txtQ18_8_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_8_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator89" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_8_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator160" runat="server" 
                                            ControlToValidate="txtQ18_8_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">i. Number of Children where racial identity is unknown</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_9_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator90" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_9_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator161" runat="server" 
                                            ControlToValidate="txtQ18_9_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_9_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator91" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_9_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator162" runat="server" 
                                            ControlToValidate="txtQ18_9_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ18_9_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator92" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ18_9_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator163" runat="server" 
                                            ControlToValidate="txtQ18_9_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>19. Demographic<sup>7</sup> Information for Children who are <u>under 3 years old</u> and enrolled in IPLE Sessions</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:40%"><b>IPLE Children who are under 3 years old</b></td>
                                    <td style="width:20%;text-align:center"><b style="color:red">Anticipated Enrollment<br />October 1, 2016 
                                        <span style="color:red">**</span></b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment<br />December 1, 2016</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment<br />June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">a. Total number of children who are <u>under three years old</u> and enrolled in IPLE Sessions</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_1_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_1_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">b. Number of children who are <u>under three years old</u> and African-American or Black (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator167" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator167" runat="server" 
                                            ControlToValidate="txtQ19_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator168" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator168" runat="server" 
                                            ControlToValidate="txtQ19_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_2_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator169" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator169" runat="server" 
                                            ControlToValidate="txtQ19_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">c. Number of children who are <u>under three years old</u> and Asian (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator170" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator170" runat="server" 
                                            ControlToValidate="txtQ19_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator171" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator171" runat="server" 
                                            ControlToValidate="txtQ19_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_3_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator172" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator172" runat="server" 
                                            ControlToValidate="txtQ19_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">d. Number of children who are <u>under three years old</u> and Hispanic or Latino</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator173" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator173" runat="server" 
                                            ControlToValidate="txtQ19_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator174" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator174" runat="server" 
                                            ControlToValidate="txtQ19_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_4_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator175" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator175" runat="server" 
                                            ControlToValidate="txtQ19_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">e. Number of children who are <u>under three years old</u> and Native American (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator176" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator176" runat="server" 
                                            ControlToValidate="txtQ19_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_5_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator177" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator177" runat="server" 
                                            ControlToValidate="txtQ19_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_5_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator178" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator178" runat="server" 
                                            ControlToValidate="txtQ19_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">f. Number of children who are <u>under three years old</u> and Native Hawaiian or Other Pacific Islander (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_6_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator179" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_6_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator179" runat="server" 
                                            ControlToValidate="txtQ19_6_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_6_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator180" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_6_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator180" runat="server" 
                                            ControlToValidate="txtQ19_6_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_6_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator181" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_6_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator181" runat="server" 
                                            ControlToValidate="txtQ19_6_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">g. Number of children who are <u>under three years old</u> and White (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_7_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator182" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_7_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator182" runat="server" 
                                            ControlToValidate="txtQ19_7_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_7_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator183" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_7_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator183" runat="server" 
                                            ControlToValidate="txtQ19_7_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_7_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator184" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_7_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator184" runat="server" 
                                            ControlToValidate="txtQ19_7_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">h. Number of Children who are <u>under three years old</u> and Multi-racial (Non-Hispanic)</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_8_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator185" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_8_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator185" runat="server" 
                                            ControlToValidate="txtQ19_8_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_8_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator186" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_8_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator186" runat="server" 
                                            ControlToValidate="txtQ19_8_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_8_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator187" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_8_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator187" runat="server" 
                                            ControlToValidate="txtQ19_8_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">i. Number of Children where racial identity is unknown</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_9_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator188" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_9_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator188" runat="server" 
                                            ControlToValidate="txtQ19_9_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_9_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator223" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_9_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator189" runat="server" 
                                            ControlToValidate="txtQ19_9_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ19_9_3" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator224" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ19_9_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator190" runat="server" 
                                            ControlToValidate="txtQ19_9_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b>20. Dual Language Learners by Age<br /><br />
                            Number of Children who have been identified as Dual Language Learners whose home language is not English (DLL/ELL/LEP)</b></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />December 1, 2016</b></td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Age 3</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator190" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_1_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator191" runat="server" 
                                            ControlToValidate="txtQ20_1_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ20_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator191" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_1_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator192" runat="server" 
                                            ControlToValidate="txtQ20_1_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Age 4</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator192" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator193" runat="server" 
                                            ControlToValidate="txtQ20_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ20_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator189" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator194" runat="server" 
                                            ControlToValidate="txtQ20_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Age 5</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator195" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator195" runat="server" 
                                            ControlToValidate="txtQ20_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator196" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator196" runat="server" 
                                            ControlToValidate="txtQ20_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Under 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator199" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator197" runat="server" 
                                            ControlToValidate="txtQ20_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ20_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator200" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ20_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator198" runat="server" 
                                            ControlToValidate="txtQ20_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b>21. Economically Disadvantaged <br /><br />
                            Number of Children who have been identified as economically disadvantaged, Low Income, or, Eligible for free/reduced priced meals</b></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />December 1, 2016</b></td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Age 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_1_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator193" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_1_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator199" runat="server" 
                                            ControlToValidate="txtQ21_1_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ21_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator194" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_1_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator200" runat="server" 
                                            ControlToValidate="txtQ21_1_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Age 4</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator197" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator201" runat="server" 
                                            ControlToValidate="txtQ21_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ21_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator198" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator202" runat="server" 
                                            ControlToValidate="txtQ21_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Age 5</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator201" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator203" runat="server" 
                                            ControlToValidate="txtQ21_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator202" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator204" runat="server" 
                                            ControlToValidate="txtQ21_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Under 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator203" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator205" runat="server" 
                                            ControlToValidate="txtQ21_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ21_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator204" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ21_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator206" runat="server" 
                                            ControlToValidate="txtQ21_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b>22. Homeless Children<br /><br />
                            Number of Children who have been identified as Homeless</b></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />December 1, 2016</b></td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Age 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_1_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator205" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_1_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator207" runat="server" 
                                            ControlToValidate="txtQ22_1_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ22_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator206" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_1_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator208" runat="server" 
                                            ControlToValidate="txtQ22_1_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Age 4</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator207" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator209" runat="server" 
                                            ControlToValidate="txtQ22_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ22_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator208" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator210" runat="server" 
                                            ControlToValidate="txtQ22_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Age 5</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator209" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator211" runat="server" 
                                            ControlToValidate="txtQ22_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator210" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator212" runat="server" 
                                            ControlToValidate="txtQ22_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Under 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator211" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator213" runat="server" 
                                            ControlToValidate="txtQ22_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ22_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator212" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ22_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator214" runat="server" 
                                            ControlToValidate="txtQ22_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><b>23. High Needs Children<br /><br />
                            Number of who have been identified as "High Needs"<sup>8</sup></b></td>
                        
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />December 1, 2016</b></td>
                                    <td style="text-align:center"><b>Actual Enrollment<br />June 1, 2017</b></td>
                                </tr>
                                <tr>
                                    <td style="width:40%">a. Age 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_1_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator213" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_1_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator215" runat="server" 
                                            ControlToValidate="txtQ23_1_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ23_1_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator214" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_1_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator216" runat="server" 
                                            ControlToValidate="txtQ23_1_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">b. Age 4</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_2_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator215" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator217" runat="server" 
                                            ControlToValidate="txtQ23_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="txtQ23_2_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                        <br />
                                        <asp:CompareValidator 
                                            ID="CompareValidator216" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator218" runat="server" 
                                            ControlToValidate="txtQ23_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">c. Age 5</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator217" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator219" runat="server" 
                                            ControlToValidate="txtQ23_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_3_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator218" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator220" runat="server" 
                                            ControlToValidate="txtQ23_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="width:40%">d. Under 3</td>
                                    
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator219" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator221" runat="server" 
                                            ControlToValidate="txtQ23_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ23_4_2" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator220" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ23_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator222" runat="server" 
                                            ControlToValidate="txtQ23_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
        <tr>
            <td style="background-color:#ffffff">&nbsp;</td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
            </td>
        </tr>
    </table>
        <table id="tblCommands" runat="server" cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 80px">
            <tr>
                <td align="center">
                    <asp:LinkButton ID="btnCancelSave" runat="server" Text="Cancel Save" OnClick="btnCancelSave_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSaveHome" CssClass="buttonClass" runat="server" Text="Save Information"
                        CausesValidation="True" OnClick="btnSaveHome_Click" />
                </td>
            </tr>
        </table>
    <table id="tblFootNotes" cellpadding="0" cellspacing="0" border="0" runat="server">
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>1</sup> <b>Program Name</b>: For EEC- Licensed Program, enter the Program Name, as it appears on your EEC License. Public Schools should enter their Program Name as follows "<b>School District: School Name.</b>"   
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>2</sup> <b>Program Number</b> (An EEC Program Number is assigned to each EEC- Licensed Program and appears in the <u>top left hand</u> side of the program's EEC License. Public Schools are assigned a QRIS Program Number; this number appears in parenthesis after the School Name.  
If you do not know your program's EEC Program Number or QRIS Program Number, please contact the EEC Program Quality Technical Desk via the following link: <a href="eecqris@MassMail.State.ma.us">eecqris@MassMail.State.ma.us</a>
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>3</sup> <b>All FY 2016 IPLE-funded sites must have at least one designated QRIS Program Administrator</b>. Please note a current EEC Single Sign In User Name and password, and current profile in the EEC Professional Qualifications Registry (PQR) are required to access EEC's online QRIS application system, the QRIS Program Manager (QPM). 
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>4</sup> The term <b>IPLE-funded session</b> refers to the part of the program day where grant funds are used to support the cost of salaries and fringe benefits of the educators who provide direct program services to a group of preschool-aged children, in a setting that meets grant criteria of an inclusive preschool learning environment. There are three types of IPLE-funded sessions. A <b>Part Day Session</b> refers to a session that meets fewer than four (4) hours per day, for at least 2 or more days per week). <b>School Day Session</b> refers to a session that meets at least four (4) hours per day, but fewer than six (6) hours per day for at least 2 or more days per week), and an <b>Extended day session</b> refers to a session that meets six (6) or more hours per day for at least 2 or more days per week. 
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>5</sup> <b>3-year-old/4-year-old/5-year-old:</b> Children considered to be 3 years old during the 2016-2017 school year are those eligible for entry into kindergarten two years later, during the 2018-2019 school year. Children considered to be 4 years old during the 2016-2017 school year are those eligible for entry into kindergarten one year later, during the 2018-2019 school year. Children considered to be 5 years old during the 2016-2017 school year are 5-year-olds who were already eligible for kindergarten at the beginning of the 2016-2017 program year.  
                  <br /><br />
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                  <sup>6</sup> Race/ Ethnicity Descriptions: 
                    <ul>                  
                        <li>African-American or Black: A person having origins in any of the black racial groups of Africa. (Non-Hispanic)</li>
                        <li>Asian: A person having origins in any of the original peoples of the Far East, Southeast Asia, or the Indian subcontinent. (Non-Hispanic)</li>
                        <li>Hispanic or Latino: A person of Cuban, Mexican, Puerto Rican, South or Central American, or other Spanish culture or origin, regardless of race.</li>
                        <li>Native American: A person having origins in any of the original peoples of North and South America (including Central America), and who maintains tribal affiliation or community attachment. (Non-Hispanic)</li>
                        <li>Native Hawaiian or Other Pacific Islander: A person having origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands. (Non-Hispanic).</li>
                        <li>White: A person having origins in any of the original peoples of Europe, the Middle East, or North Africa. (Non-Hispanic)</li>
                        <li>Multi-race, Non-Hispanic: A person selecting more than one racial category and non-Hispanic.</li>
                    </ul>
            </td>
        </tr>
        <tr>
            <td style="font-size:smaller;font-family:arial">
                <sup>7</sup> For the purposes of this grant, the term "high needs children" is defined as children who have <u>two or more</u> of the following risk factors shown to be <u>linked to poor outcomes</u> in such areas as school performance, health, and mental health: 
                <ol type="i">                  
                    <li>Low-income households/children eligible for free or reduced priced meals;</li>
                    <li>Children with special needs/disability (IEP or 504 Plan);</li>
                    <li>Children and families who previously participated in Early Intervention services (IFSP);</li>
                    <li>Children who are homeless or move more than once per year, as defined under the McKinney-Vento Homeless Education Assistance Improvements Act of 2001;</li>
                    <li>Children who are Dual Language Learners whose home language is not English (DLL/ELL/LEP);</li>
                    <li>Parent(s) with education less than a high school diploma or GED;</li>
                    <li>Parent(s) with chronic illness or disability affecting care-giving ability;</li>
                    <li>Children who have experienced multiple traumas or losses;</li>
                    <li>Young children whose family recently immigrated to the U.S. (parent(s) who came to the U.S. within the past 10 years);</li>
                    <li>Families and children involved with multiple state agencies; and</li>
                    <li>Children with parent(s) who are deployed and are not living on a military base.</li>
                </ol>
            </td>
        </tr>
    </table>
</asp:Content>

