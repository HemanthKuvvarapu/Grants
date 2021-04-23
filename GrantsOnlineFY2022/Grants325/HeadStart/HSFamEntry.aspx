<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSFamEntry.aspx.cs" Inherits="HeadStart_HSFamEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .auto-style3 {
            color: #009933;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <span style="color:darkblue"><b>Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Family Child Care</b></span>
        <br />
        <table id="tblAddEditProgram" runat="server" width="100%" border="0" style="background-color: #ebebeb">
            <tr style="background-color: #6d8da7; color: #ffffff">
                <th colspan="2" align="left" style="background-color: #CC0000">
                    <asp:Label ID="lblAddEditHeader" runat="server" Text="Add Program Info"></asp:Label></th>
            </tr>
            <tr>
                <td class="style13">Program Number</td>
                <td class="style11">
                    <asp:TextBox ID="txtProgramNumber" runat="server" Width="117px"
                        Height="27px" CssClass="style12"></asp:TextBox>
                    <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18"
                        runat="server" TargetControlID="txtProgramNumber" FilterType="Numbers">
                    </ajaxControlToolkit:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator9"
                        runat="server"
                        ControlToValidate="txtProgramNumber"
                        ErrorMessage='Please enter Program Number'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">Name of Family Child Care Provider</td>
                <td class="style11">
                    <asp:TextBox ID="txtFamilyChildCareProviderName" runat="server" Width="256px"
                        Height="48px" CssClass="style12"></asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtFamilyChildCareProviderName"
                        ErrorMessage='Please enter Name of Family Child Care Provider'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">Address</td>
                <td class="style11">
                    <asp:TextBox ID="txtHSFCCAddress" runat="server" Width="300px"
                        TextMode="MultiLine" CssClass="style12" Height="55px"></asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator27"
                        runat="server"
                        ControlToValidate="txtHSFCCAddress"
                        ErrorMessage='Please enter an Address'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">Zip Code <span class="style13">(*5 digit zip Example: 00000)</span></td>
                <td class="style7">
                    <asp:TextBox ID="txtHSFCCZipCode" runat="server" Width="76px"
                        Height="27px" CssClass="style12"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator29"
                        runat="server"
                        ControlToValidate="txtHSFCCZipCode"
                        ErrorMessage='Please enter a Zip Code'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtHSFCCZipCode" ErrorMessage="Zip code input not correct use 5 digits"
                        ValidationExpression="^\d{5}$|^\d{5}-\d{4}$"></asp:RegularExpressionValidator>
                    <br />


                </td>
            </tr>
            <tr>
                <td class="style13">Number of Licensed Capacity</td>
                <td class="style11">
                    <asp:TextBox ID="txtLicensedCapacity" runat="server"
                        Width="78px" CssClass="style12"></asp:TextBox>
                    <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                        runat="server" TargetControlID="txtLicensedCapacity" FilterType="Numbers">
                    </ajaxControlToolkit:FilteredTextBoxExtender>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator30"
                        runat="server"
                        ControlToValidate="txtLicensedCapacity"
                        ErrorMessage='Please enter Number of Licensed Capacity'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">Number of Children Enrolled in Program</td>
                <td class="style11">
                    <asp:TextBox ID="txtNumberChildrenEnrolledProgram" runat="server" Width="78px"
                        CssClass="style12"></asp:TextBox>
                    <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                        runat="server" TargetControlID="txtNumberChildrenEnrolledProgram" FilterType="Numbers">
                    </ajaxControlToolkit:FilteredTextBoxExtender>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="txtNumberChildrenEnrolledProgram"
                        ErrorMessage='Please enter Number of Children Enrolled in Program'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">Number of Providers in the home</td>
                    <td class="style11">
                        <asp:TextBox ID="txtNumberProvidersHome" runat="server"
                            Width="79px" CssClass="style12"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6"
                            runat="server" TargetControlID="txtNumberProvidersHome" FilterType="Numbers">
                        </ajaxControlToolkit:FilteredTextBoxExtender>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="txtNumberProvidersHome"
                            ErrorMessage='Please enter Number of Providers in the home'
                            EnableClientScript="true"
                            SetFocusOnError="true"
                            Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="style13">Number of Assistant in the home</td>
                <td class="style11">
                    <asp:TextBox ID="txtNumberAssistantHome" runat="server"
                        Width="80px" CssClass="style12"></asp:TextBox>
                    <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7"
                        runat="server" TargetControlID="txtNumberAssistantHome" FilterType="Numbers">
                    </ajaxControlToolkit:FilteredTextBoxExtender>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="txtNumberAssistantHome"
                        ErrorMessage='Please enter Number of Assistant in the home'
                        EnableClientScript="true"
                        SetFocusOnError="true"
                        Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                        <td class="style13">NAEYC Accredited?</td>
                        <td class="style15" align="left">
                            <asp:RadioButtonList ID="ddlNAEYCAccredited" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                onselectedindexchanged="ddlNAEYCAccredited_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator235" runat="server" 
                                ControlToValidate="ddlNAEYCAccredited" Display="Dynamic" 
                                ErrorMessage="Please select one of the options."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="trAccr" runat="server" visible="false">
                        <td style="background-color: beige;" colspan="2">
                            <table style="width: 100%;">
                                <tr>
                                    <td colspan="4" class="style13">Please enter the accreditation details.<asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="ddlAccreditation" Display="Dynamic" ErrorMessage="Please fill in the accreditation details." OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
                                    </td>
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
                <td class="style11">Comments</td>
                    <td class="style11">
                        <asp:TextBox ID="txtCommentsFam" runat="server" Height="110px" TextMode="MultiLine"
                            Width="463px" CssClass="style12"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="style11">
                    <asp:Button ID="btnSaveHSFCCInfo" runat="server"
                        Text="Save Program" OnClick="btnSaveHSFCCInfo_Click" />
                    &nbsp;<input type="button" onclick="location.href = 'HSFamHome.aspx'" value="Cancel" />
                    &nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style9">
                    <asp:Label ID="lblAddEditMsg" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr id="trHasHSFamilyChildcare" visible="false">
                <td colspan="2" align="center" class="style6">
                    <span class="auto-style3">The Family Childcare Program has been SAVED successfully.</span><br />
                    <br />
                    <input type="button" onclick="location.href = 'HSFamHome.aspx'" value="Go back to Family Childcare Program list" />

                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" BackColor="#EFEFEF" />

                </td>

            </tr>
        </table>


    </div>
    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxControlToolkit:ToolkitScriptManager>
</asp:Content>

