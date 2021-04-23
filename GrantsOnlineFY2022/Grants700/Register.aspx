<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
        .styleLeftCol
        {
            padding-left: 10px;
            font-size: 12px;
            font-family: Arial;
            font-weight: bold;
        }
        .styleRightCol2
        {
            padding-left: 10px;
            font-size: 13px;
            font-family: Arial;
            color: Blue;
        }
        .styleAlt1
        {
            background-color: #FFFFCC;
        }
        .styleSubTitle
        {
            background-color: #956250;
            padding-left: 10px;
            color: #ffffff;
            height: 25px;
            font-size: 13px;
        }
        .inputBox1
        {
            height: 18px;
            margin-top: 1px;
            margin-bottom: 1px;
        }
        .styleInst
        {
            font-size: 13px;
            font-family: Arial;
        }
        .styleSaved
        {
            background-color: #f7f5d2;
            border: solid 1px #398840;
            color: #398840;
            font-size:13px;
            font-family:Arial;
            font-weight:bold;
        }
    </style>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('input:checkbox[id*=chkCopyLAtoGC]').change(function () {
                if ($(this).is(':checked')) {
                    $('input:text[id*=txtFirstnameGC]').val($('input:text[id*=txtFirstnameLA]').val());
                    $('input:text[id*=txtLastnameGC]').val($('input:text[id*=txtLastnameLA]').val());
                    $('input:text[id*=txtAddress1GC]').val($('input:text[id*=txtAddress1LA]').val());
                    $('input:text[id*=txtAddress2GC]').val($('input:text[id*=txtAddress2LA]').val());
                    $('input:text[id*=txtCityGC]').val($('input:text[id*=txtCityLA]').val());
                    $('input:text[id*=txtStateGC]').val($('input:text[id*=txtStateLA]').val());
                    $('input:text[id*=txtZipcodeGC]').val($('input:text[id*=txtZipcodeLA]').val());
                    $('input:text[id*=txtPhoneGC]').val($('input:text[id*=txtPhoneLA]').val());
                    $('input:text[id*=txtFaxGC]').val($('input:text[id*=txtFaxLA]').val());
                    $('input:text[id*=txtEmailGC]').val($('input:text[id*=txtEmailLA]').val());
                }
                else {
                    $('input:text[id*=txtFirstnameGC]').val();
                    $('input:text[id*=txtLastnameGC]').val();
                    $('input:text[id*=txtAddress1GC]').val();
                    $('input:text[id*=txtAddress2GC]').val();
                    $('input:text[id*=txtCityGC]').val();
                    $('input:text[id*=txtStateGC]').val();
                    $('input:text[id*=txtZipcodeGC]').val();
                    $('input:text[id*=txtPhoneGC]').val();
                    $('input:text[id*=txtFaxGC]').val();
                    $('input:text[id*=txtEmailGC]').val();
                }
            }); //chk copy GC to dir
        
            $('input:checkbox[id*=chkCopyGCtoDir]').change(function () {
                if ($(this).is(':checked')) {
                    $('input:text[id*=txtFirstnameDir]').val($('input:text[id*=txtFirstnameGC]').val());
                    $('input:text[id*=txtLastnameDir]').val($('input:text[id*=txtLastnameGC]').val());
                    $('input:text[id*=txtAddress1Dir]').val($('input:text[id*=txtAddress1GC]').val());
                    $('input:text[id*=txtAddress2Dir]').val($('input:text[id*=txtAddress2GC]').val());
                    $('input:text[id*=txtCityDir]').val($('input:text[id*=txtCityGC]').val());
                    $('input:text[id*=txtStateDir]').val($('input:text[id*=txtStateGC]').val());
                    $('input:text[id*=txtZipcodeDir]').val($('input:text[id*=txtZipcodeGC]').val());
                    $('input:text[id*=txtPhoneDir]').val($('input:text[id*=txtPhoneGC]').val());
                    $('input:text[id*=txtFaxDir]').val($('input:text[id*=txtFaxGC]').val());
                    $('input:text[id*=txtEmailDir]').val($('input:text[id*=txtEmailGC]').val());
                }
                else {
                    $('input:text[id*=txtFirstnameDir]').val();
                    $('input:text[id*=txtLastnameDir]').val();
                    $('input:text[id*=txtAddress1Dir]').val();
                    $('input:text[id*=txtAddress2Dir]').val();
                    $('input:text[id*=txtCityDir]').val();
                    $('input:text[id*=txtStateDir]').val();
                    $('input:text[id*=txtZipcodeDir]').val();
                    $('input:text[id*=txtPhoneDir]').val();
                    $('input:text[id*=txtFaxDir]').val();
                    $('input:text[id*=txtEmailDir]').val();
                }
            }); //chk copy GC to dir

            $('input:checkbox[id*=chkCopyDirToSC]').change(function () {
                if ($(this).is(':checked')) {
                    $('input:text[id*=txtFirstnameSC]').val($('input:text[id*=txtFirstnameDir]').val());
                    $('input:text[id*=txtLastnameSC]').val($('input:text[id*=txtLastnameDir]').val());
                    $('input:text[id*=txtAddress1SC]').val($('input:text[id*=txtAddress1Dir]').val());
                    $('input:text[id*=txtAddress2SC]').val($('input:text[id*=txtAddress2Dir]').val());
                    $('input:text[id*=txtCitySC]').val($('input:text[id*=txtCityDir]').val());
                    $('input:text[id*=txtStateSC]').val($('input:text[id*=txtStateDir]').val());
                    $('input:text[id*=txtZipcodeSC]').val($('input:text[id*=txtZipcodeDir]').val());
                    $('input:text[id*=txtPhoneSC]').val($('input:text[id*=txtPhoneDir]').val());
                    $('input:text[id*=txtFaxSC]').val($('input:text[id*=txtFaxDir]').val());
                    $('input:text[id*=txtEmailSC]').val($('input:text[id*=txtEmailDir]').val());
                }
                else {
                    $('input:text[id*=txtFirstnameSC]').val();
                    $('input:text[id*=txtLastnameSC]').val();
                    $('input:text[id*=txtAddress1SC]').val();
                    $('input:text[id*=txtAddress2SC]').val();
                    $('input:text[id*=txtCitySC]').val();
                    $('input:text[id*=txtStateSC]').val();
                    $('input:text[id*=txtZipcodeSC]').val();
                    $('input:text[id*=txtPhoneSC]').val();
                    $('input:text[id*=txtFaxSC]').val();
                    $('input:text[id*=txtEmailSC]').val();
                }
            }); //chk copy dir to sc 

            $('input:checkbox[id*=chkCopySCToFiscal]').change(function () {
                if ($(this).is(':checked')) {
                    $('input:text[id*=txtFirstnameFiscal]').val($('input:text[id*=txtFirstnameSC]').val());
                    $('input:text[id*=txtLastnameFiscal]').val($('input:text[id*=txtLastnameSC]').val());
                    $('input:text[id*=txtAddress1Fiscal]').val($('input:text[id*=txtAddress1SC]').val());
                    $('input:text[id*=txtAddress2Fiscal]').val($('input:text[id*=txtAddress2SC]').val());
                    $('input:text[id*=txtCityFiscal]').val($('input:text[id*=txtCitySC]').val());
                    $('input:text[id*=txtStateFiscal]').val($('input:text[id*=txtStateSC]').val());
                    $('input:text[id*=txtZipcodeFiscal]').val($('input:text[id*=txtZipcodeSC]').val());
                    $('input:text[id*=txtPhoneFiscal]').val($('input:text[id*=txtPhoneSC]').val());
                    $('input:text[id*=txtFaxFiscal]').val($('input:text[id*=txtFaxSC]').val());
                    $('input:text[id*=txtEmailFiscal]').val($('input:text[id*=txtEmailSC]').val());
                }
                else {
                    $('input:text[id*=txtFirstnameFiscal]').val();
                    $('input:text[id*=txtLastnameFiscal]').val();
                    $('input:text[id*=txtAddress1Fiscal]').val();
                    $('input:text[id*=txtAddress2Fiscal]').val();
                    $('input:text[id*=txtCityFiscal]').val();
                    $('input:text[id*=txtStateFiscal]').val();
                    $('input:text[id*=txtZipcodeFiscal]').val();
                    $('input:text[id*=txtPhoneFiscal]').val();
                    $('input:text[id*=txtFaxFiscal]').val();
                    $('input:text[id*=txtEmailFiscal]').val();
                }
            }); //chk copy sc to fiscal
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table cellpadding="0" cellspacing="0" border="0" style="width: 100%; font-family: Arial;
        font-size: 13px">
        <tr>
            <td class="styleInst">
                <b>Instructions:</b>&nbsp;Complete the Agency Information below. <b>Note:&nbsp;</b><i>The
                    fields marked with <font color="red">*</font> are required</i>.
            </td>
        </tr>
    </table>
    <table id="tblData" runat="server" cellpadding="0" style="width: 100%;" cellspacing="0"
        border="0">
        <tr>
            <td colspan="2" class="styleSubTitle">
                <b>Lead Agency Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td class="styleLeftCol" style="width: 35%;padding-top:3px" valign="top">
                            Vendor Name (Your Lead Agency Name):<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtAgencyName" runat="server" Text="" Width="200px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br /><b>Your <span style="color:red">VENDOR NAME</span> needs to match the <span style="color:red">LEGAL NAME</span> that appears on your <span style="color:red">STANDARD CONTRACT FORM</span> or <span style="color:red">W-9 FORM</span></b><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAgencyName"
                                Display="Dynamic" ErrorMessage="Please enter the vendor name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                ControlToValidate="txtAgencyName" Display="Dynamic" 
                                ErrorMessage="CustomValidator" 
                                onservervalidate="CustomValidator1_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol" valign="top" style="padding-top:3px">
                            Program or Lead Agency Legal Address<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyAddress" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br /><b>Your <span style="color:red">LEGAL ADDRESS</span> needs to match the <span style="color:red">LEGAL ADDRESS</span> that appears on your <span style="color:red">STANDARD CONTRACT FORM</span> or <span style="color:red">W-9 FORM</span></b><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAgencyAddress"
                                Display="Dynamic" ErrorMessage="Please enter the lead agency legal address." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyCity" runat="server" Text="" Width="100px" MaxLength="50" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAgencyCity"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" 
                                runat="server" ControlToValidate="txtAgencyCity" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyState" runat="server" Text="" Width="50px" MaxLength="2" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAgencyState"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator27" 
                                runat="server" ControlToValidate="txtAgencyState" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyZipcode" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAgencyZipcode"
                                Display="Dynamic" ErrorMessage="Please enter the zip code." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                                runat="server" ControlToValidate="txtAgencyZipcode" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zip code." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyPhone" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex:
                            617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAgencyPhone"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAgencyPhone"
                                Display="Dynamic" ErrorMessage="Please enter a valid phone number" 
                                ValidationExpression="(\s*)((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}((\s*)x\d{0,})?(\s*)" 
                                SetFocusOnError="True">Please enter a valid phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAgencyEmail" runat="server" Text="" Width="300px" MaxLength="200" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtAgencyEmail"
                                Display="Dynamic" ErrorMessage="Please enter the email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtAgencyEmail"
                                Display="Dynamic" ErrorMessage="Please enter a valid email" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Please enter a valid 
                                    email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="styleLeftCol" style="color:#b5111a;padding-right:100px">
                            Please create a Username and Password before completing the Online Application. This will enable you to retrieve your application and modify answers later if you wish to do so. Please write the username and password down for your reference.
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Username<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Text="" Width="150px" MaxLength="200" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtUsername"
                                Display="Dynamic" ErrorMessage="Please enter the username." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Password<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Text="" Width="150px" MaxLength="200" CssClass="inputBox1" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtPassword"
                                Display="Dynamic" ErrorMessage="Please enter the password." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Re-enter Password<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword2" runat="server" Text="" Width="150px" MaxLength="200" CssClass="inputBox1" TextMode="Password"></asp:TextBox><br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="Password does not match."></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword2"
                                Display="Dynamic" ErrorMessage="Please enter the password." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td align="center" valign="middle" style="height: 100px">
                <asp:LinkButton ID="LinkCancel" runat="server" Text="Cancel Submit" Visible="true" OnClick="btnCancel_Click" CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkSave" runat="server" Text="Submit Information" Visible="true" OnClick="btnSave_Click" CausesValidation="true" CssClass="buttonClass" />
            </td>
        </tr>
    </table>
</asp:Content>
