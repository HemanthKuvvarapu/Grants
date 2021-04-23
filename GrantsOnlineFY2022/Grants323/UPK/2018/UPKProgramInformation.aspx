<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="UPKProgramInformation.aspx.cs" Inherits="UPK_2018_UPKProgramInformation" %>
<%@ MasterType VirtualPath="~/MasterPage4.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </table>
    <table id="tblData" runat="server" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #FFFFCC">
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="font-size: larger;height:25px">&nbsp;&nbsp;<b>Program Summary</b></td>
        </tr>
        <tr>
            <td>
                <table id="tblSysProviders" runat="server" visible="false" width="100%">
                    <tr>
                        <td style="padding-left: 10px;">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                ErrorMessage="CustomValidator" ControlToValidate="txtDummy" 
                                Display="Dynamic" onservervalidate="CustomValidator1_ServerValidate" 
                                SetFocusOnError="True" ValidateEmptyText="True"></asp:CustomValidator>
                            <span style="display:none"><asp:TextBox ID="txtDummy" runat="server">1</asp:TextBox></span>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">
                            <asp:GridView ID="grdSysProviders" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="GrantUpkSystemProvidersId" OnRowDataBound="grdSysProviders_RowDataBound" 
                            OnRowDeleting="grdSysProviders_RowDeleting" 
                                OnRowEditing="grdSysProviders_RowEditing" Width="100%" BackColor="White" 
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                                ForeColor="Black" GridLines="Vertical">
                                <Columns>
                                    <asp:BoundField DataField="Program" HeaderText="Program" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="400px" HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Amount" HeaderText="" >
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="Link" CommandName="Edit" Text="Edit Program">
                                        <ItemStyle Width="130px" />
                                    </asp:ButtonField>
                                    <asp:ButtonField ButtonType="Link" CommandName="Delete" Text="Delete Program">
                                        <ItemStyle Width="130px" />
                                    </asp:ButtonField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="lnkClassrooms" runat="server" Text="" />
                                        </ItemTemplate>
                                        <ItemStyle Width="130px" />
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                                <FooterStyle BackColor="#CCCC99" />
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
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnAddNewProgram" runat="server" Text="Add New Program" OnClick="btnAddNewProgram_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
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
                            <span class="styleErrors">Based on your response, you are not eligible for the FY <%=AppInfo.FiscalYear%> UPK Renewal Grant.<br /><br />
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
        <tr>
            <td>
                <table id="tblCenter" runat="server" style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;&nbsp;<b>Program Name:</b>&nbsp;&nbsp;
                            <asp:TextBox ID="txtProgramName" runat="server" MaxLength="100" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                ControlToValidate="txtProgramName" 
                                ErrorMessage="Please enter the Program Name." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>1. What is your program's EEC Program Number? If you 
                        do not know your program's EEC Program Number, please contact the EEC Help Desk at the following link:
                        <a href="mailto:eechelpdesk@MassMail.State.MA.US">eechelpdesk@MassMail.State.ma.us</a></b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            EEC Program Number:&nbsp;<asp:TextBox ID="txtEECProgramNumber" runat="server" 
                                MaxLength="7"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtEECProgramNumber" 
                                ErrorMessage="Please enter the EEC Program Number." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator14" runat="server" Display="Dynamic" 
                                ErrorMessage="Please enter a valid EEC Program Number." ControlToValidate="txtEECProgramNumber" 
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>2. What is your program's current QRIS status? Please choose a status below:</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rdoQRISLevel" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem Text="Granted Level 3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Granted Level 4" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator6" runat="server" 
                                ControlToValidate="rdoQRISLevel" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." 
                                onservervalidate="CustomValidator6_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>3. Is your program a Head Start 
                            program?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rbtnIsHeadStartProgram" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                ControlToValidate="rbtnIsHeadStartProgram" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." 
                                onservervalidate="CustomValidator2_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>4. Is your program 
                            currently accredited?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rbtnIsAccredited" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnIsAccredited_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                ControlToValidate="rbtnIsAccredited" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." 
                                onservervalidate="CustomValidator3_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator24" runat="server" 
                                onservervalidate="CustomValidator24_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr id="trAccr1" runat="server" visible="true">
                        <td style="padding-left: 20px; background-color: beige;">
                            <br />
                            <b>Please enter the accreditation details.<asp:CustomValidator 
                                ID="CustomValidator5" runat="server" ControlToValidate="ddlAccreditation" 
                                Display="Dynamic" ErrorMessage="Please enter the accreditation details." 
                                onservervalidate="CustomValidator5_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                            </b></td>
                    </tr>
                    <tr id="trAccr2" runat="server" visible="true">
                        <td style="background-color: beige;">
                            <table style="width: 100%;">
                                <tr align="center">
                                    <td>
                                        <asp:DropDownList ID="ddlAccreditation" runat="server" Width="150px" 
                                            AutoPostBack="true" onselectedindexchanged="ddlAccreditation_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="---------"></asp:ListItem>
                                        </asp:DropDownList><br />
                                        <asp:CustomValidator ID="CustomValidator20" runat="server" 
                            ControlToValidate="ddlAccreditation" Display="Dynamic" 
                            ErrorMessage="Please select one of the options" 
                            onservervalidate="CustomValidator20_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationNumber" runat="server" Text="" MaxLength="20"></asp:TextBox><br />
                                                                                <asp:CustomValidator ID="CustomValidator22" runat="server" 
                            ControlToValidate="txtAccreditationNumber" Display="Dynamic" 
                            ErrorMessage="Please input the Accreditation Number" 
                            onservervalidate="CustomValidator22_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
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
                                        <asp:CustomValidator ID="CustomValidator21" runat="server" 
                            ControlToValidate="txtAccreditationEarnDate" Display="Dynamic" 
                            ErrorMessage="Please input the Accreditation Date Earned" 
                            onservervalidate="CustomValidator21_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
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
                                        <asp:CustomValidator ID="CustomValidator23" runat="server" 
                            ControlToValidate="txtAccreditationExpDate" Display="Dynamic" 
                            ErrorMessage="Please input the Accreditation Expiration Date" 
                            onservervalidate="CustomValidator23_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
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
                        <td><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>5. Is your 
                            program currently licensed or license-exempt?</b></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 50px;">
                        <asp:RadioButtonList ID="rbtnIsProgramLicensed" runat="server" 
                                RepeatDirection="Vertical" Height="26px">
                                            <asp:ListItem Text="My program is licensed" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="My program is licensed-exempt" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" 
                                ControlToValidate="rbtnIsProgramLicensed" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." 
                                onservervalidate="CustomValidator4_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
        <tr>
            <td style="background-color:#ffffff">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td colspan="2" style="background-color:#ffffff"><b>Instructions:</b>&nbsp;For each question, please provide information as of December 1, 2016 and the projected enrollment of June 1, 2017.</td>
                </tr>
                <tr style="background-color: #6699FF; color: #FFFFFF">
                    <td style="font-size: larger;height:25px" colspan="2">&nbsp;&nbsp;<b>Program Operation and Enrollment Information</b></td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>1. If your program is a center-based, public school or private school program, please provide the number of 
                        proposed UPK Funded<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preschool Classrooms and non-UPK Preschool Classrooms (ages 2.9 to Kindergarten eligible). If you are a family child care educator,<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;please provide the number of proposed UPK Funded Preschool Classrooms and enter zero for the number of non-UPK Funded Preschool<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Classrooms.</b></td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of proposed UPK Funded Preschool Classrooms:</td>
                    <td>
                        <asp:TextBox ID="txtUpkFundedPreschoolClassrooms" runat="server" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10"
                            runat="server" TargetControlID="txtUpkFundedPreschoolClassrooms" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUpkFundedPreschoolClassrooms"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of non-UPK Funded Preschool Classrooms:</td>
                    <td>
                        <asp:TextBox ID="txtNonUpkFundedPreschoolClassrooms" runat="server" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11"
                            runat="server" TargetControlID="txtNonUpkFundedPreschoolClassrooms" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNonUpkFundedPreschoolClassrooms"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span style="color: red; font-weight: bold;">*</span>&nbsp;<b>2.How many children in your program's 
                        proposed UPK classrooms/Family Child Care homes are:</b>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">3 years old:</td>
                    <td>
                        <asp:TextBox ID="txtChildren3YearOld" runat="server" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15"
                            runat="server" TargetControlID="txtChildren3YearOld" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtChildren3YearOld"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">4 years old:</td>
                    <td>
                        <asp:TextBox ID="txtChildren4YearOld" runat="server" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender16"
                            runat="server" TargetControlID="txtChildren4YearOld" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtChildren4YearOld"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">5 years old:</td>
                    <td>
                        <asp:TextBox ID="txtChildren5YearOld" runat="server" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17"
                            runat="server" TargetControlID="txtChildren5YearOld" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtChildren5YearOld"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>3. How many preschool children (ages 2.9 to Kindergarten eligible) are enrolled in the 
                      proposed UPK classrooms/family child care home.</b><br /><br /></td>
                </tr>
                <tr>
                    <td style="padding-left:50px;width:70%">Number enrolled as of December 1, 2016:</td>
                    <td style="width:30%"><asp:TextBox ID="txtPreschoolChildrenEnrolled" runat="server" 
                            MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                            runat="server" TargetControlID="txtPreschoolChildrenEnrolled" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPreschoolChildrenEnrolled"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:50px ">Projected enrollment on June 1, 2017:</td>
                    <td><asp:TextBox ID="txtPreschoolChildrenProjectedEnrollment" runat="server" 
                            MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                                            runat="server" TargetControlID="txtPreschoolChildrenProjectedEnrollment" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="txtPreschoolChildrenProjectedEnrollment"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr>
                    <td colspan="2">
                        <span style="color:red; font-weight:bold;">*</span>&nbsp;<b>4. How many of those children enrolled in UPK classrooms or UPK family child care home receive Financial Assistance (please count each child once,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;by primary funding source).</b>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:50px ">Number of children receiving Financial Assistance as of December 1, 2016:</td>
                    <td><asp:TextBox ID="txtChildrenWithFinAssistance" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3"
                                            runat="server" TargetControlID="txtChildrenWithFinAssistance" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtChildrenWithFinAssistance"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:50px ">Projected number of children receiving Financial Assitance as of June 1, 2017:</td>
                    <td><asp:TextBox ID="txtProjectedChildrenWithFinAssistance" runat="server" 
                            MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4"
                                            runat="server" TargetControlID="txtProjectedChildrenWithFinAssistance" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtProjectedChildrenWithFinAssistance"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>5. How many preschool children in your program have IEPs? How many children have IEPs 
                      in the proposed UPK classroom(s)?</b></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-left:50px ">Number of preschool children in your program with an IEP:</td>
                    <td><asp:TextBox ID="txtChildrenWithIEP" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5"
                                            runat="server" TargetControlID="txtChildrenWithIEP" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtChildrenWithIEP"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:50px ">Number of children with IEPs in your proposed UPK classroom(s):</td>
                    <td><asp:TextBox ID="txtUPKChildrenWithIEP" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6"
                                            runat="server" TargetControlID="txtUPKChildrenWithIEP" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtUPKChildrenWithIEP"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>6. What EEC-approved assessment instrument is your program using?</b></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px; ">
                        <asp:CheckBoxList ID="chklAssessmentInstrument" runat="server"></asp:CheckBoxList>
                        <asp:CustomValidator ID="CustomValidator17" runat="server" 
                            ControlToValidate="txtAssessmentInstrumentNotes" Display="Dynamic" 
                            ErrorMessage="Please select one of the options" 
                            onservervalidate="CustomValidator17_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px"><b>What date did your program begin using this tool?</b> If your program has been using the selected tool for less than a year, please briefly explain the reason your program switched tools. Please indicate which tool the program switched from and when the switch occurred.</td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px; "><asp:TextBox ID="txtAssessmentInstrumentNotes" runat="server" TextMode="MultiLine" Rows="8" Width="95%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>7. Is your program using the online or paper version of the tool?</b></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px; "><asp:RadioButtonList ID="rbtnUpkVersion" runat="server"></asp:RadioButtonList>
                        <asp:CustomValidator ID="CustomValidator18" runat="server" 
                            ControlToValidate="rbtnUpkVersion" Display="Dynamic" 
                            ErrorMessage="Please select one of the options" 
                            onservervalidate="CustomValidator18_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>8. If you are using the online version of the tool are you currently under the Massachusetts Assessment Tool License?</b></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px; ">
                        <asp:RadioButtonList ID="rbtnIsToolLicensed" runat="server">
                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Not Sure" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:CustomValidator ID="CustomValidator19" runat="server" 
                            ControlToValidate="rbtnIsToolLicensed" Display="Dynamic" 
                            ErrorMessage="Please select one of the options" 
                            onservervalidate="CustomValidator19_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
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
</asp:Content>

