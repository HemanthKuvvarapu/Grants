<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageNEW4.master" AutoEventWireup="true" CodeFile="CPPIProgramInformation.aspx.cs" Inherits="CPPI_2019_CPPIProgramInformation" %>
<%@ MasterType VirtualPath="~/MasterPageNEW4.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" type="text/javascript">
    function deleteConfirm(pubid) {
        var result = confirm('Do you want to delete the record?');
        if (result) {
            return true;
        }
        else {
            return false;
        }
    }

    function GetTotalChildren(Id1, Id2, Id3, totalTxtId) {
        var a1 = document.getElementById(Id1);
        var a2 = document.getElementById(Id2);
        var a3 = document.getElementById(Id3);
        //var a4 = document.getElementById(Id4);

        var a1Value = (a1 == null) ? 0 : parseInt(a1.value);
        var a2Value = (a2 == null) ? 0 : parseInt(a2.value);
        var a3Value = (a3 == null) ? 0 : parseInt(a3.value);
        //var a4Value = (a4 == null) ? 0 : parseInt(a4.value);

        a1Value = (isNaN(a1Value)) ? 0 : a1Value;
        a2Value = (isNaN(a2Value)) ? 0 : a2Value;
        a3Value = (isNaN(a3Value)) ? 0 : a3Value;
        //a4Value = (isNaN(a4Value)) ? 0 : a4Value;

        document.getElementById(totalTxtId).value = a1Value + a2Value + a3Value;  //+ a4Value;
    }
</script>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 52px;
        }
        .auto-style2 {
            width: 622px;
        }
        .auto-style3 {
            width: 622px;
            height: 22px;
        }
        .auto-style4 {
            width: 622px;
            height: 47px;
        }
        .auto-style5 {
            height: 22px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            height: 45px;
        }
        .auto-style8 {
            color: #FF0000;
        }
        </style>
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
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td>
                <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 70px; padding-top: 5px">
                            <br />
                            <span class="styleErrors">Please correct the errors below.
                            </span>
                            <br />
                            <span style="text-align: center">
                                <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Program Summary" Visible="true"
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
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="font-size: larger;height:25px">&nbsp;&nbsp;<b>Program Summary</b></td>
        </tr>
        <tr>
            <td>
                <table id="tblSysProviders" runat="server" visible="false" width="100%">
                    <tr>
                        <td style="padding-left: 10px;">&nbsp;
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
                                DataKeyNames="SystemProviderId" OnRowDataBound="grdSysProviders_RowDataBound" 
                            OnRowDeleting="grdSysProviders_RowDeleting" 
                                OnRowEditing="grdSysProviders_RowEditing" Width="100%" BackColor="White" 
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                                ForeColor="Black" GridLines="Vertical">
                                <Columns>
                                    <asp:BoundField DataField="txtProgramName" HeaderText="Program" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="300px" HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="txtProgContactName" HeaderText="Contact Person" >
                                        <ItemStyle Width="350px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Amount" HeaderText="" >
                                        <ItemStyle Width="120px" />
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
        <%--<tr>
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
        </tr>--%>

        <tr>
            <td>
                <table id="tblCenter" runat="server" style="width: 100%;">
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>1.&nbsp;&nbsp;
                        What is your program name?</b>
                            <asp:TextBox ID="txtProgramName" runat="server" MaxLength="100" Width="350px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                ControlToValidate="txtProgramName" ValidationGroup="validation"
                                ErrorMessage="Please enter the Program Name." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>2.&nbsp;&nbsp;
                        Program Contact Information:</b>
                            <br />
                            <br /><span style="color: red; font-weight: bold;">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Contact Person Name:</b>&nbsp;&nbsp;
                            <asp:TextBox ID="txtProgContactName" runat="server" MaxLength="200" Width="350px" CssClass="auto-style6"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                ControlToValidate="txtProgContactName" ValidationGroup="validation"
                                ErrorMessage="Please enter the Contact Person name." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>&nbsp;&nbsp;
                        Program Address line 1:</b>
                            <asp:TextBox ID="txtProgAddress1" runat="server" MaxLength="200" Width="350px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtProgAddress1" ValidationGroup="validation"
                                ErrorMessage="Please enter the Program Address." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">&nbsp;</span>&nbsp;<b>&nbsp;&nbsp;
                        Program Address line 2:</b>
                            <asp:TextBox ID="txtProgAddress2" runat="server" MaxLength="200" Width="350px"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>&nbsp;&nbsp;
                        Program City:</b>
                            <asp:TextBox ID="txtProgCity" runat="server" MaxLength="100" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                ControlToValidate="txtProgCity" ValidationGroup="validation"
                                ErrorMessage="Please enter the City." Display="Dynamic"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;<b>State: </b>
                            <asp:TextBox ID="txtProgState" runat="server" MaxLength="2" Width="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                ControlToValidate="txtProgState" ValidationGroup="validation"
                                ErrorMessage="Please enter the State." Display="Dynamic"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;<b>Zip Code: </b>
                            <asp:TextBox ID="txtProgZipcode" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                ControlToValidate="txtProgZipcode" ValidationGroup="validation"
                                ErrorMessage="Please enter the Zip code." Display="Dynamic"  ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator100" 
                                        runat="server" 
                                        ControlToValidate="txtProgZipcode"
                                        ErrorMessage="Must be a US Zip Code (5 or 10 characters)" 
                                        SetFocusOnError="True" ValidationGroup="validation" 
                                        ValidationExpression="\d{5}(-\d{4})?">Must be a US Zip Code (5 or 10 characters)</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>&nbsp;&nbsp; Program Phone Number: </b>
                            <asp:TextBox ID="txtProgPhone" runat="server" MaxLength="200" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                ControlToValidate="txtProgPhone" ValidationGroup="validation"
                                ErrorMessage="Please enter the Program Telephone." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;"></span>&nbsp;<b>&nbsp;&nbsp;&nbsp;
                        Program FAX number:&nbsp; </b>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txtProgFAX" runat="server" MaxLength="200" Width="201px"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style4"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>&nbsp;&nbsp;
                        Program Email Address:</b>&nbsp;
                            <asp:TextBox ID="txtProgEmail" runat="server" MaxLength="200" Width="350px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                ControlToValidate="txtProgEmail" ValidationGroup="validation"
                                ErrorMessage="Please enter the Email Address." Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr id="trProgramType" runat="server">
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>3.&nbsp;&nbsp;
                            What program type is your program?</b>
                            <asp:DropDownList ID="cboProgramType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboProgramType_SelectedIndexChanged">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="1">Center-Based</asp:ListItem>
                                <asp:ListItem Value="2">Public School</asp:ListItem>
                                <asp:ListItem Value="3">Private School</asp:ListItem>
                                <asp:ListItem Value="4">Family Child Care System</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="cboProgramType"
                                Display="Dynamic" ErrorMessage="Please enter the program type." ValidationGroup="validation"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>4.&nbsp;&nbsp;Is your program currently licensed or license-exempt?</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                        <asp:RadioButtonList ID="rbtnIsProgramLicensed" runat="server" RepeatDirection="Vertical" Height="26px" AutoPostBack="True" OnSelectedIndexChanged="rbtnIsProgramLicensed_SelectedIndexChanged">
                                            <asp:ListItem Text="My program is licensed" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="My program is licensed-exempt" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" 
                                ControlToValidate="rbtnIsProgramLicensed" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator4_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>5.&nbsp;&nbsp;What is your program's EEC Program Number?</b>&nbsp;&nbsp;
                            <asp:TextBox ID="txtEECProgramNumber" runat="server" MaxLength="8"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtEECProgramNumber" ValidationGroup="validation"
                                ErrorMessage="Please enter the EEC Program Number." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator14" runat="server" Display="Dynamic" 
                                ErrorMessage="Please enter a valid EEC Program Number." ControlToValidate="txtEECProgramNumber" 
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>6.&nbsp;&nbsp;Is your program a Head Start program?</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                            <asp:RadioButtonList ID="rbtnIsHeadStartProgram" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                ControlToValidate="rbtnIsHeadStartProgram" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator2_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>7.&nbsp;&nbsp;Is your program currently accredited?</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                            <asp:RadioButtonList ID="rbtnIsAccredited" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnIsAccredited_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                ControlToValidate="rbtnIsAccredited" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator3_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator24" runat="server" 
                                onservervalidate="CustomValidator24_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr id="trAccr" runat="server" visible="true">
                        <td colspan="1" style="padding-left: 20px; background-color: beige;" class="auto-style2">
                            <table id="tblAccr" style="width: 100%;">
                                <tr>
                                    <td colspan="4"><b>Please enter the accreditation details.</b>
                                    <asp:CustomValidator 
                                    ID="CustomValidator5" runat="server" ControlToValidate="ddlAccreditation" 
                                    Display="Dynamic" ErrorMessage="Please enter the accreditation details." 
                                    onservervalidate="CustomValidator5_ServerValidate" SetFocusOnError="True" 
                                    ValidateEmptyText="True" ValidationGroup="validation"></asp:CustomValidator></td>
                                </tr>
                                <tr align="center">
                                <td>
                                
                                        <asp:DropDownList ID="ddlAccreditation" runat="server" Width="150px" 
                                            AutoPostBack="true" onselectedindexchanged="ddlAccreditation_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="---------"></asp:ListItem>
                                        </asp:DropDownList><br />
                                        <asp:CustomValidator ID="CustomValidator20" runat="server" 
                            ControlToValidate="ddlAccreditation" Display="Dynamic" 
                            ErrorMessage="Please select one of the options"  ValidationGroup="validation"
                            onservervalidate="CustomValidator20_ServerValidate" SetFocusOnError="True" 
                            ValidateEmptyText="True"></asp:CustomValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationNumber" runat="server" Text="" MaxLength="20"></asp:TextBox><br />
                                                                                <asp:CustomValidator ID="CustomValidator22" runat="server" 
                            ControlToValidate="txtAccreditationNumber" Display="Dynamic" 
                            ErrorMessage="Please input the Accreditation Number"  ValidationGroup="validation"
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
                            ErrorMessage="Please input the Accreditation Date Earned" ValidationGroup="validation"
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
                            ErrorMessage="Please input the Accreditation Expiration Date"  ValidationGroup="validation"
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
                            </table>   <%--<td>End of tblAccr</td>--%> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>8.&nbsp;&nbsp;What is your program's current QRIS status? Please choose a status below:</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                            <asp:RadioButtonList ID="rdoQRISLevel" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rdoQRISLevel_SelectedIndexChanged">
                                <asp:ListItem Text="Granted Level 1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Granted Level 2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Granted Level 3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Granted Level 4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Not participating in QRIS" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator6" runat="server" 
                                ControlToValidate="rdoQRISLevel" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator6_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" class="auto-style3"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>9.&nbsp;&nbsp;Does your program have a Continuous Quality Improvement Plan (CQIP)?</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                            <asp:RadioButtonList ID="rbtnIsCQIP" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnIsCQIP_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator7" runat="server" 
                                ControlToValidate="rbtnIsCQIP" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator7_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                           <%-- <asp:CustomValidator ID="CustomValidator88" runat="server" 
                                onservervalidate="CustomValidator24_ServerValidate" ControlToValidate="rbtnIsCQIP" ErrorMessage="If yes, please select one of the options"></asp:CustomValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                            <td style="padding-left: 50px;" class="auto-style2">If yes, when was the CQIP last updated? 
                                        <asp:TextBox ID="txtCQIPLastUpdated" runat="server" Width="100px"></asp:TextBox>
                                        <asp:ImageButton ID="btnCalendarCQIP" runat="server" ImageUrl="~/images/CalendarImage.png" CausesValidation="false" />
                                        <ajaxControlToolkit:MaskedEditExtender runat="server" ID="MaskedEditExtender3" TargetControlID="txtCQIPLastUpdated"
                                            Mask="99/99/9999" MaskType="Date" PromptCharacter="_" ClearMaskOnLostFocus="true">
                                        </ajaxControlToolkit:MaskedEditExtender>
                                        <ajaxControlToolkit:CalendarExtender runat="server" ID="CalendarExtender3" TargetControlID="txtCQIPLastUpdated"
                                            PopupButtonID="btnCalendarCQIP">
                                         </ajaxControlToolkit:CalendarExtender>
                                        <ajaxControlToolkit:TextBoxWatermarkExtender runat="server" ID="TextBoxWatermarkExtender3"
                                            TargetControlID="txtCQIPLastUpdated" WatermarkText="mm/dd/yyyy">
                                        </ajaxControlToolkit:TextBoxWatermarkExtender>
                                        <asp:CompareValidator
                                            id="dateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="txtCQIPLastUpdated"  ValidationGroup="validation"
                                            ErrorMessage="Please enter a valid date." Display="Dynamic"></asp:CompareValidator>
                                <asp:CustomValidator ID="CustomValidator26" runat="server" Display="Dynamic" ValidationGroup="validation" ErrorMessage="Please enter a valid date." OnServerValidate="CustomValidator26_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>
                    <%--<tr>
                        <td style="width:10px;text-align:right">8.</td>
                        <td>Does your program have a formal curriculum?</td>
                    </tr>--%>
                    <%--<tr>
                        <td>&nbsp;</td>
                        <td style="padding-left: 50px;">
                            <asp:RadioButtonList ID="rbtnFormalCurriculum" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rbtnFormalCurriculum_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator9" runat="server" 
                                ControlToValidate="rbtnFormalCurriculum" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." 
                                onservervalidate="CustomValidator9_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator10" runat="server" 
                                onservervalidate="CustomValidator10_ServerValidate" 
                                ErrorMessage="If yes, please select one of the options" ControlToValidate="rbtnFormalCurriculum"></asp:CustomValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td valign="top"; style="text-align:left;" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>10.&nbsp;&nbsp;Please list all curricula you plan to use in your program.</b>
                            <br />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCurriculaPlan" runat="server" TextMode="MultiLine" CssClass="auto-style1" Height="200px" Width="800px"></asp:TextBox>
                            <br />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurriculaPlan" ValidationGroup="validation"
                                Display="Dynamic" ErrorMessage="Please list all curricula you plan to use in your program in the textbox above." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--                    
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    --%>
                    <tr>
                        <td style="text-align:left" class="auto-style2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>11.&nbsp;&nbsp;Does your program currently use an evidence-based screening tool?</b></td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">
                            <asp:RadioButtonList ID="rbtnScreenTool" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rbtnScreenTool_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator ID="CustomValidator11" runat="server" 
                                ControlToValidate="rbtnScreenTool" Display="Dynamic" 
                                ErrorMessage="Please select one of the options." ValidationGroup="validation"
                                onservervalidate="CustomValidator11_ServerValidate" SetFocusOnError="True" 
                                ValidateEmptyText="True"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator12" runat="server" 
                                onservervalidate="CustomValidator12_ServerValidate" ValidationGroup="validation"
                                ErrorMessage="If yes, please select one of the options" ControlToValidate="rbtnScreenTool"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <%--<td>&nbsp;</td>--%>
                        <td style="padding-left: 50px;" class="auto-style2">If yes, please select all screening tools that your program uses:<br />
                            <asp:CheckBox ID="txtQ9YesOption1" runat="server" Text="Ages &amp; Stages Questionnaires®, 3rd Edition (ASQ-3™)" /><br />
                            <asp:CheckBox ID="txtQ9YesOption2" runat="server" Text="Ages &amp; Stages Questionnaires®: Social-Emotional, 2nd Edition (ASQ:SE-2™)" /><br />
                            <asp:CheckBox ID="txtQ9YesOption3" runat="server" Text="Developmental Indicators for the Assessment of Early Learning, 4th Edition (DIAL-4)" /><br />
                            <asp:CheckBox ID="txtQ9YesOption4" runat="server" Text="Early Screening Inventory (ESI)" /><br />
                            <asp:CheckBox ID="txtQ9YesOption5" runat="server" Text="Other" />&nbsp;, please specify: <asp:TextBox ID="txtScreenToolOther" runat="server" Width="400px"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator25" runat="server" 
                                onservervalidate="CustomValidator25_ServerValidate" 
                                ErrorMessage="If other, please specify the screening tool"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="auto-style2">&nbsp;</td>
                    </tr>

            <%--Add Program question section--%>
               <%-- <tr>
                    <td colspan="1" style="background-color:#ffffff"><b>Instructions:</b>&nbsp;For each question, please provide information as of March 1, 2022 and the projected enrollment of June 1, 2022.</td>
                </tr>--%>
                <tr style="background-color: #6699FF; color: #FFFFFF">
                    <td style="font-size: larger;height:25px" colspan="2">&nbsp;&nbsp;<b>Program Operation and Enrollment Information</b></td>
                </tr>

                <tr>
                <td>
                <table id="tblQuestions">
                    <tr>
                    <td colspan="2">
                        <span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Child demographics of your program:</b>
                    </td>
                    <%--<td>&nbsp;</td>--%>
                    </tr>
                    <tr>
                    <td colspan="2">
                    <br />
                        <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                            <tr>
                                <td style="width:40%">&nbsp;</td>
                                <td style="width:20%;text-align:center"><b>TotaTotal Percent of Program
                                    </b></td>
                                <%--<td style="width:20%;text-align:center"><b>Total Percent Enrolled 
                                    <br />
                                    March 1, 2022</b></td>
                                <td style="width:20%;text-align:center"><b>Total Percent Entrolled  
                                    <br />
                                    June 1, 2022</b></td>--%>
                            </tr>
                            <tr><td colspan="4"><b>Ethnicity</td></tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Hispanic or Latino origin
                                    <asp:CustomValidator ID="CustomValidatorHispanic" runat="server" ControlToValidate="txtHispanicPctCommunity" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="The total percentage of children with Hispanic or Latino origin plus the percentage of children with Non-Hispanic or Latino origin must equal 100%. Please double-check the numbers that you have entered and revise accordingly."
                                        OnServerValidate="CustomValidatorHispanic_ServerValidate">
                                    </asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtHispanicPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtHispanicPctCommunity" ValidationGroup="validation"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server"
                                    ControlToValidate="txtHispanicPctCommunity" Display="Dynamic" ValidationGroup="validation"
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                               <%-- <td style="text-align:center"><asp:TextBox ID="txtHispanicPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtHispanicPctMarch1" 
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ControlToValidate="txtHispanicPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtHispanicPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtHispanicPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator3" runat="server"
                                    ControlToValidate="txtHispanicPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>

                            <tr>
                                <td style="height:40px;padding-left:30px;">Non-Hispanic or Latino origin</b>
                                    <asp:CustomValidator ID="CustomValidatorNonHispanic" runat="server" ControlToValidate="txtNonHispanicPctCommunity" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="The total percentage of children with Hispanic or Latino origin plus the percentage of children with Non-Hispanic or Latino origin must equal 100%. Please double-check the numbers that you have entered and revise accordingly."
                                        OnServerValidate="CustomValidatorHispanic_ServerValidate">
                                    </asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtNonHispanicPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" ControlToValidate="txtNonHispanicPctCommunity" ValidationGroup="validation"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator31" runat="server"
                                    ControlToValidate="txtNonHispanicPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtNonHispanicPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator72" runat="server" ControlToValidate="txtNonHispanicPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator32" runat="server"
                                    ControlToValidate="txtNonHispanicPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtNonHispanicPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator73" runat="server" ControlToValidate="txtNonHispanicPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator33" runat="server"
                                    ControlToValidate="txtNonHispanicPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>

                            <tr><td colspan="4"><b>Race</b></td></tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">American Indian or Alaska Native</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtAmericanIndianAlaskaPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtAmericanIndianAlaskaPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator4" runat="server"
                                    ControlToValidate="txtAmericanIndianAlaskaPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                               <%-- <td style="text-align:center"><asp:TextBox ID="txtAmericanIndianAlaskaPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtAmericanIndianAlaskaPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator5" runat="server"
                                    ControlToValidate="txtAmericanIndianAlaskaPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtAmericanIndianAlaskaPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtAmericanIndianAlaskaPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator6" runat="server"
                                    ControlToValidate="txtAmericanIndianAlaskaPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Asian</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtAsianPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtAsianPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator7" runat="server"
                                    ControlToValidate="txtAsianPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtAsianPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtAsianPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator8" runat="server"
                                    ControlToValidate="txtAsianPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtAsianPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtAsianPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator9" runat="server"
                                    ControlToValidate="txtAsianPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Black or African American</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtBlackAfricanPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtBlackAfricanPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator10" runat="server"
                                    ControlToValidate="txtBlackAfricanPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtBlackAfricanPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtBlackAfricanPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator11" runat="server"
                                    ControlToValidate="txtBlackAfricanPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtBlackAfricanPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtBlackAfricanPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator12" runat="server"
                                    ControlToValidate="txtBlackAfricanPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Native Hawaiian of Pacific Islander</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtHawaiianPacificPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtHawaiianPacificPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator13" runat="server"
                                    ControlToValidate="txtHawaiianPacificPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtHawaiianPacificPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtHawaiianPacificPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator14" runat="server"
                                    ControlToValidate="txtHawaiianPacificPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtHawaiianPacificPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtHawaiianPacificPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator15" runat="server"
                                    ControlToValidate="txtHawaiianPacificPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">White or Caucasian</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtWhiteCaucasianPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtWhiteCaucasianPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator16" runat="server"
                                    ControlToValidate="txtWhiteCaucasianPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                               <%-- <td style="text-align:center"><asp:TextBox ID="txtWhiteCaucasianPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtWhiteCaucasianPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator17" runat="server"
                                    ControlToValidate="txtWhiteCaucasianPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtWhiteCaucasianPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtWhiteCaucasianPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator18" runat="server"
                                    ControlToValidate="txtWhiteCaucasianPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Biracial or Multiracial</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtBiracialMultiPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtBiracialMultiPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator19" runat="server"
                                    ControlToValidate="txtBiracialMultiPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtBiracialMultiPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtBiracialMultiPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator20" runat="server"
                                    ControlToValidate="txtBiracialMultiPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtBiracialMultiPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtBiracialMultiPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator21" runat="server"
                                    ControlToValidate="txtBiracialMultiPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Other Race</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtOtherRacePctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtOtherRacePctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator22" runat="server"
                                    ControlToValidate="txtOtherRacePctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtOtherRacePctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtOtherRacePctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator23" runat="server"
                                    ControlToValidate="txtOtherRacePctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtOtherRacePctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtOtherRacePctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator24" runat="server"
                                    ControlToValidate="txtOtherRacePctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px;padding-left:30px;">Unspecified Race</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtUnspecifiedPctCommunity" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtUnspecifiedPctCommunity"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator25" runat="server"
                                    ControlToValidate="txtUnspecifiedPctCommunity" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtUnspecifiedPctMarch1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtUnspecifiedPctMarch1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator26" runat="server"
                                    ControlToValidate="txtUnspecifiedPctMarch1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtUnspecifiedPctJune1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled ="false"></asp:TextBox>
                                <br/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtUnspecifiedPctJune1"
                                    ErrorMessage="Please enter a value."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator27" runat="server"
                                    ControlToValidate="txtUnspecifiedPctJune1" Display="Dynamic" 
                                    ErrorMessage="Invalid Percentage" MaximumValue="100.00" MinimumValue="0.00" 
                                    Type="Double"></asp:RangeValidator>
                                </td>--%>
                            </tr>

                        </table>
                    </td>
                    </tr>


                    <tr>
                    <td colspan="2" class="auto-style5"></td>
                    </tr>

                <%--<tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>3. How many children in your program have IEPs?&nbsp; How many children have IEPs 
                      in the proposed CPPI classroom(s)?</b></td>
                </tr>

                <tr>
                    <td style="padding-left:50px " class="auto-style2">Proposed Number of children with IEPs to be served in your CCPI program</td>
                    <td><asp:TextBox ID="txtChildrenWithIEPProposed" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5"
                                            runat="server" TargetControlID="txtChildrenWithIEPProposed" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtChildrenWithIEPProposed"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:50px " class="auto-style2">Actual Number of children with IEPs as of March 1</td>
                    <td><asp:TextBox ID="txtChildrenWithIEPMarch1" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6"
                                            runat="server" TargetControlID="txtChildrenWithIEPMarch1" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtChildrenWithIEPMarch1"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                    <td style="padding-left:50px " class="auto-style2">Actual Number of children with IEPs as of June 1</td>
                    <td><asp:TextBox ID="txtChildrenWithIEPJune1" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="txtChildrenWithIEPJune1_FilteredTextBoxExtender"
                                            runat="server" TargetControlID="txtChildrenWithIEPJune1" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtChildrenWithIEPJune1"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red; font-weight:bold;">*</span>&nbsp;<b>4. How many children speak a home language other than English?</b></td>
                </tr>
                    <tr>
                    <td style="padding-left:50px " class="auto-style2">Proposed Number of children who speak other than English to be served in your CCPI program</td>
                    <td><asp:TextBox ID="txtChildrenSpeakNonEnglishProposed" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="txtChildrenSpeakNonEnglishProposed_FilteredTextBoxExtender"
                                            runat="server" TargetControlID="txtChildrenSpeakNonEnglishProposed" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtChildrenSpeakNonEnglishProposed"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                    <td style="padding-left:50px " class="auto-style2">Actual Number of children who speak other than English as of March 1</td>
                    <td><asp:TextBox ID="txtChildrenSpeakNonEnglishMarch1" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="txtChildrenSpeakNonEnglishMarch1_FilteredTextBoxExtender"
                                            runat="server" TargetControlID="txtChildrenSpeakNonEnglishMarch1" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtChildrenSpeakNonEnglishMarch1"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                    <td style="padding-left:50px " class="auto-style2">Actual Number of children who speak other than English as of June 1</td>
                    <td><asp:TextBox ID="txtChildrenSpeakNonEnglishJune1" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                        <ajaxControlToolkit:FilteredTextBoxExtender ID="txtChildrenSpeakNonEnglishJune1_FilteredTextBoxExtender"
                                            runat="server" TargetControlID="txtChildrenSpeakNonEnglishJune1" FilterType="Numbers">
                                        </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtChildrenSpeakNonEnglishJune1"
                            ErrorMessage="Please enter a value"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>--%>



                <%--Moved from Classroom to Program Level --%>

                <tr><td colspan="2">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">1. Number of children to be enrolled in this CPPI-funded program by <strong>Age</strong>:<br />
                        <span class="auto-style8"><strong>Note</strong>: If you enter and save 0 for all categories in a column below, you will set the total number of children enrolled in this program to 0 for that column.  Any classrooms that you may have entered earlier with enrollments greater than 0, or any new classrooms you attempt to enter on the Classroom entry page will also be set to 0 number of children.</span><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <br />
                        <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                            <tr>
                                <td style="width:40%">&nbsp;</td>
                                <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                    <br />
                                    </b></td>
                                <%--<td style="width:20%;text-align:center"><b>Actual Enrollment
                                    <br />
                                    March 1, 2021</b></td>
                                <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                    <br />
                                    June 1, 2021</b></td>--%>
                            </tr>
                            <tr>
                                <td class="auto-style7">Total number of preschool-aged children: 2 years, 9 months to 4 years old)</b></td>
                                <td style="text-align:center" class="auto-style7"><asp:TextBox ID="txtQ1_1_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>                                    
                                    <%--<asp:CustomValidator ID="CustomValidator15" runat="server" ControlToValidate="txtQ1_1_1" ValidationGroup="validation" Display="Dynamic" ErrorMessage="You must enter a number greater than 0 in at least one of the boxes below." OnServerValidate="CustomValidator15_ServerValidate"></asp:CustomValidator>--%>
                                    <%--<asp:CompareValidator 
                                        ID="CompareValidator137" runat="server" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="You must enter a number greater than 0 in at least one of the boxes below." ControlToValidate="txtQ1_1_1" 
                                        Operator="GreaterThanEqual" ValueToCompare="1" Type="Integer"></asp:CompareValidator>--%>
                                <br/>
                                                                    </td>
                                <%--<td style="text-align:center" class="auto-style7"><asp:TextBox ID="txtQ1_1_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                    <%--<asp:CompareValidator 
                                        ID="CompareValidator12" runat="server" Display="Dynamic" ValidationGroup="March1"
                                        ErrorMessage="You must enter a number greater than 0 in at least one of the boxes below." ControlToValidate="txtQ1_1_2" 
                                        Operator="GreaterThanEqual" ValueToCompare="1" Type="Integer"></asp:CompareValidator>--%>
                               <%-- <br/>
                                                                    </td>
                                <td style="text-align:center" class="auto-style7"><asp:TextBox ID="txtQ1_1_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                    <%--<asp:CompareValidator 
                                        ID="CompareValidator13" runat="server" Display="Dynamic" ValidationGroup="June1"
                                        ErrorMessage="You must enter a number greater than 0 in at least one of the boxes below." ControlToValidate="txtQ1_1_3" 
                                        Operator="GreaterThanEqual" ValueToCompare="1" Type="Integer"></asp:CompareValidator>
                                <br/>
                                                                    </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>3 year-olds</b> (defined as those eligible for Kindergarten by 2023).</td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_2_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Height="22px"></asp:TextBox>                            
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator137" runat="server" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please enter a valid number." ControlToValidate="txtQ1_2_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator86" runat="server" 
                                        ControlToValidate="txtQ1_2_1" Display="Dynamic" ValidationGroup="validation" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            <%--    <td style="text-align:center"><asp:TextBox ID="txtQ1_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator138" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_2_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator87" runat="server" 
                                        ControlToValidate="txtQ1_2_2" Display="Dynamic"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator139" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_2_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator88" runat="server" 
                                        ControlToValidate="txtQ1_2_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>--%>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>4 year-olds</b> (defined as those eligible for Kindergarten by Sept. 2022)</b>.</td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator140" runat="server" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please enter a valid number." ControlToValidate="txtQ1_3_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator89" runat="server" 
                                        ControlToValidate="txtQ1_3_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtQ1_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator141" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_3_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator90" runat="server" 
                                        ControlToValidate="txtQ1_3_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator142" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_3_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator91" runat="server" 
                                        ControlToValidate="txtQ1_3_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>--%>
                            </tr>
                            <%--<tr>
                                <td style="height:40px">Of the total, number of <b>5 year-olds</b>.</td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator143" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator92" runat="server" 
                                        ControlToValidate="txtQ1_4_1" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_4_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator144" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator93" runat="server" 
                                        ControlToValidate="txtQ1_4_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_4_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator145" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator94" runat="server" 
                                        ControlToValidate="txtQ1_4_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                            --%>
                            <tr>
                                <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)</td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator146" runat="server" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please enter a valid number." ControlToValidate="txtQ1_5_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator95" runat="server" 
                                        ControlToValidate="txtQ1_5_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <%--<td style="text-align:center"><asp:TextBox ID="txtQ1_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator147" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_5_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator96" runat="server" 
                                        ControlToValidate="txtQ1_5_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ1_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator148" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_5_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator97" runat="server" 
                                        ControlToValidate="txtQ1_5_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>--%>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="auto-style5"></td>
                </tr>
                <%--
                <tr>
                    <td colspan="2">2. Number of children to be enrolled in this CPPI-funded program by <b>Age and Disability Status</b>:</td>
                </tr>
                <tr>
                    <td colspan="2">
                    <br />
                        <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                            <tr>
                                <td style="width:40%">&nbsp;</td>
                                <td style="width:20%;text-align:center" colspan="2"><b>Proposed Target Enrollment
                                    </b></td>
                                <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment 
                                    <br />
                                    March 1, 2021</b></td>
                                <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment<br />
                                    June 1 , 2021</b></td>
                            </tr>
                            <tr>
                                <td style="text-align:center;height:25px">&nbsp;</td>
                                <td style="text-align:center;width:10%"><b>Children with IEPs</td>
                                <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                            </tr>
                                
                            <tr>
                                <td style="height:40px">Total number of preschool-aged children: <b>(2 years, 9 months to 4 years old)</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_4" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_5" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_1_6" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>3 year-olds</b><br />
                                    <asp:CustomValidator ID="CustomValidator9" runat="server" ControlToValidate="txtQ2_2_1" ValidationGroup="validation" Display="Dynamic" ErrorMessage="The total number of 3 year-olds with IEPs and without IEPs must equal the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator9_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator133" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" 
                                        ControlToValidate="txtQ2_2_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator134" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" 
                                        ControlToValidate="txtQ2_2_2" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator116" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" 
                                        ControlToValidate="txtQ2_2_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_4" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator117" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_4" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" 
                                        ControlToValidate="txtQ2_2_4" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_5" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator118" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_5" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" 
                                        ControlToValidate="txtQ2_2_5" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_2_6" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator119" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_6" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" 
                                        ControlToValidate="txtQ2_2_6" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>4 year-olds</b><br />
                                    <asp:CustomValidator ID="CustomValidator10" runat="server" ErrorMessage="The total number of 4 year-olds with IEPs and without IEPs must equal the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " ControlToValidate="txtQ2_3_1" ValidationGroup="validation" Display="Dynamic" OnServerValidate="CustomValidator10_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                    <asp:CompareValidator 
                                        ID="CompareValidator120" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" 
                                        ControlToValidate="txtQ2_3_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator121" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" 
                                        ControlToValidate="txtQ2_3_2" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator122" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" 
                                        ControlToValidate="txtQ2_3_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_4" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator123" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_4" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" 
                                        ControlToValidate="txtQ2_3_4" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_5" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator124" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_5" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator69" runat="server" 
                                        ControlToValidate="txtQ2_3_5" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_3_6" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator125" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_6" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator70" runat="server" 
                                        ControlToValidate="txtQ2_3_6" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                                
                            <tr>
                                <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br />
                                    <asp:CustomValidator ID="CustomValidator13" runat="server" ErrorMessage="The total number of children under 3 years old with IEPs and without IEPs must equal the total number of children under 3 year old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " ControlToValidate="txtQ2_5_1" ValidationGroup="validation" Display="Dynamic" OnServerValidate="CustomValidator13_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator1" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" 
                                        ControlToValidate="txtQ2_5_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator2" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" 
                                        ControlToValidate="txtQ2_5_2" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator3" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" 
                                        ControlToValidate="txtQ2_5_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_4" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator4" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_4" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" 
                                        ControlToValidate="txtQ2_5_4" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_5" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator5" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_5" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" 
                                        ControlToValidate="txtQ2_5_5" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ2_5_6" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator6" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_6" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" 
                                        ControlToValidate="txtQ2_5_6" Display="Dynamic" 
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
                    <td colspan="2">3. Number of children who have been identified as <b>Dual Language Learners whose home language is not English (DLL/ELL/LEP)</b>:</td>
                </tr>
                <tr>
                    <td colspan="2">
                    <br />
                        <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                            <tr>
                                <td style="width:40%">&nbsp;</td>
                                <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                    </b></td>
                                <td style="width:20%;text-align:center"><b>Actual Enrollment
                                    <br />
                                    March 1, 2021</b></td>
                                <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                    <br />
                                    June 1, 2021</b></td>
                            </tr>
                            <tr>
                                <td style="height:40px">Total number of preschool-aged children: 2 years, 9 months to 4 years old)</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_1_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_1_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_1_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>3 year-olds</b>.<br />
                                    <asp:CustomValidator ID="CustomValidator14" runat="server" ControlToValidate="txtQ3_2_1" ValidationGroup="validation" Display="Dynamic" ErrorMessage="The total number of 3 year-olds identified as DLL/ELL/LEP cannot exceed the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator14_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_2_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Height="22px"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator7" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtQ3_2_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator8" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtQ3_2_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator9" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtQ3_2_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>4 year-olds</b>.<br />
                                    <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ValidationGroup="validation" ErrorMessage="The total number of 4 year-olds identified as DLL/ELL/LEP cannot exceed the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." ControlToValidate="txtQ3_3_1" OnServerValidate="CustomValidator8_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator10" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="txtQ3_3_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator11" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="txtQ3_3_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator15" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ControlToValidate="txtQ3_3_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>

                            <tr>
                                <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br />
                                    <asp:CustomValidator ID="CustomValidator16" runat="server" Display="Dynamic" ValidationGroup="validation" ErrorMessage="The total number of children under 3 years old identified as DLL/ELL/LEP cannot exceed the total number of children under 3 years old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly. " ControlToValidate="txtQ3_5_1" OnServerValidate="CustomValidator16_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator19" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ControlToValidate="txtQ3_5_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator20" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                        ControlToValidate="txtQ3_5_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ3_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator21" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                        ControlToValidate="txtQ3_5_3" Display="Dynamic" 
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
                    <td colspan="2">4. Number of children who have been identified as <b>economically disadvantaged, low income, or eligible for free/reduced priced meals</b>:</td>
                </tr>
                <tr>
                    <td colspan="2">
                    <br />
                        <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                            <tr>
                                <td style="width:40%">&nbsp;</td>
                                <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                    </b></td>
                                <td style="width:20%;text-align:center"><b>Actual Enrollment
                                    <br />March 1, 2021</b></td>
                                <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                    <br />
                                    June 1, 2021</b></td>
                            </tr>
                            <tr>
                                <td style="height:40px">Total number of preschool-aged children: 2 years, 9 months to 4 years old)</b></td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_1_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_1_2" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_1_3" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>3 year-olds</b>.<br />
                                    <asp:CustomValidator ID="CustomValidator17" runat="server" ControlToValidate="txtQ4_2_1" ValidationGroup="validation" Display="Dynamic" ErrorMessage="The total number of 3 year-olds identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator17_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_2_1" runat="server" 
                                        Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator22" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                                        ControlToValidate="txtQ4_2_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator23" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                                        ControlToValidate="txtQ4_2_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator24" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" 
                                        ControlToValidate="txtQ4_2_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                            <tr>
                                <td style="height:40px">Of the total, number of <b>4 year-olds</b>.<br />
                                    <asp:CustomValidator ID="CustomValidator18" runat="server" Display="Dynamic" ValidationGroup="validation" ErrorMessage="The total number of 4 year-olds identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator18_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator25" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" 
                                        ControlToValidate="txtQ4_3_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator26" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" 
                                        ControlToValidate="txtQ4_3_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator27" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" 
                                        ControlToValidate="txtQ4_3_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>

                            <tr>
                                <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br />
                                    <asp:CustomValidator ID="CustomValidator19" runat="server" Display="Dynamic" ValidationGroup="validation" ErrorMessage="The total number of children under 3 years old identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of children under 3 years old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator19_ServerValidate"></asp:CustomValidator>
                                </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator31" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_1" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" 
                                        ControlToValidate="txtQ4_5_1" Display="Dynamic" ValidationGroup="validation"
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator32" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_2" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" 
                                        ControlToValidate="txtQ4_5_2" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                                <td style="text-align:center"><asp:TextBox ID="txtQ4_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                <br/><asp:CompareValidator 
                                        ID="CompareValidator33" runat="server" Display="Dynamic" 
                                        ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_3" 
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" 
                                        ControlToValidate="txtQ4_5_3" Display="Dynamic" 
                                        ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                    </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                --%>
            </table>   <%--<td>End of tblQuestions</td>--%>
            </td>
            </tr>

        </table>    <%--<td>End of tblcenter</td>--%>
        </td>
        </tr>
    </table>     <%--<td>End of tblData/td>--%>


    <table id="tblCommands" runat="server" cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 80px">
            <tr>
                <td align="center">
                    <asp:LinkButton ID="btnCancelSave" runat="server" Text="Cancel Save" OnClick="btnCancelSave_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSaveHome" CssClass="buttonClass" runat="server" Text="Save Information"
                        CausesValidation="True" OnClick="btnSaveHome_Click" ValidationGroup="validation"  />
                </td>
            </tr>
    </table>
</asp:Content>

