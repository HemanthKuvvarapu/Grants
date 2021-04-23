<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageNEW4.master" AutoEventWireup="true" CodeFile="CPPIDistrictInformation.aspx.cs" Inherits="CPPI_2020_CPPIDistrictInformation" %>
<%@ MasterType VirtualPath="~/MasterPageNEW4.master" %>

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
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back Home" Visible="true"
                                OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lnkProgramData" runat="server" Text="Go to Program Information" Visible="true"
                                OnClick="btnGotoProgram_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table id="tblDistrictSummary" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #FFFFCC">
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="font-size: larger;height:25px">&nbsp;&nbsp;<b>District Summary</b></td>
        </tr>
        <tr>
            <td>
                <table id="tblDistrict" runat="server" visible="true" width="100%">
                   <tr>
                        <td style="width:10px;text-align:right">1.</td>
                        <td style="text-align:left">District name&nbsp;&nbsp;
                            <asp:TextBox ID="txtDistrictName" runat="server" MaxLength="100" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtDistrictName" 
                                ErrorMessage="Please enter the District Name." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">2.</td>
                        <td style="text-align:left">Total District Enrollment&nbsp;&nbsp;
                            <asp:TextBox ID="txtTotalEnrollment" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtTotalEnrollment" 
                                ErrorMessage="Please enter the total enrollment." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="IntegerValidator" runat="server" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"
                                ControlToValidate="txtTotalEnrollment" ErrorMessage="Value must be a positive whole number" />

                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">3.</td>
                        <td style="text-align:left">High School Graduation rate&nbsp;&nbsp;
                            <asp:TextBox ID="txtHSGradRate" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtHSGradRate" 
                                ErrorMessage="Please enter the High School graduation rate." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="PctRangeValidator1" runat="server"
                                ControlToValidate="txtHSGradRate" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">4.</td>
                        <td style="text-align:left">Percent meeting or exceeding expectations in 3rd grade&nbsp;&nbsp;
                            <asp:TextBox ID="txtPctMeetExceed3rdGrade" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtPctMeetExceed3rdGrade" 
                                ErrorMessage="Please enter percent meeting or exceeding expectations in 3rd grade." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server"
                                ControlToValidate="txtPctMeetExceed3rdGrade" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">5.</td>
                        <td style="text-align:left">Percent meeting or exceeding ELA&nbsp;&nbsp;
                            <asp:TextBox ID="txtPctMeetExceedELA" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPctMeetExceedELA" 
                                ErrorMessage="Please enter the the percent meeting or exceeding ELA." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator3" runat="server"
                                ControlToValidate="txtPctMeetExceedELA" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">6.</td>
                        <td style="text-align:left">Percent meeting or exceeding Mathematics&nbsp;&nbsp;
                            <asp:TextBox ID="txtPctMeetExceedMath" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtPctMeetExceedMath" 
                                ErrorMessage="Please enter the the percent meeting or exceeding Mathematics." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator4" runat="server"
                                ControlToValidate="txtPctMeetExceedMath" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">7.</td>
                        <td style="text-align:left">Percent Retention in the early grades (K-2)&nbsp;&nbsp;
                            <asp:TextBox ID="txtPctRetentionEarlyK2" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txtPctRetentionEarlyK2" 
                                ErrorMessage="Please enter percent retention in early grades (K-2)." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator5" runat="server"
                                ControlToValidate="txtPctRetentionEarlyK2" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:10px;text-align:right">8.</td>
                        <td style="text-align:left">Percent Suspension in K-5&nbsp;&nbsp;
                            <asp:TextBox ID="txtPctSuspensionK5" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtPctSuspensionK5" 
                                ErrorMessage="Please enter the percent suspension in K-5." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator6" runat="server"
                                ControlToValidate="txtPctSuspensionK5" Display="Dynamic" 
                                ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                Type="Double"></asp:RangeValidator>
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
                <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 70px; padding-top: 5px">
                            <br />
                            <span class="styleErrors">Please correct the following errors.
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

