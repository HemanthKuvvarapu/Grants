<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ApplicantInfo.aspx.cs" Inherits="ApplicantInfo" %>

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
                <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
        style="width: 100%;margin-bottom:5px" runat="server" visible="false">
        <tr>
            <td align="center" style="height:50px;padding-top:5px">
                The information has been SAVED successfully.<br /><br />
                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2" Width="200px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Languages Served (Part 3)"
                                    Visible="true" OnClick="btnNextPart_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="250px" />
                <br /><br />
            </td>
        </tr>
    </table>
    <table id="tblData" runat="server" cellpadding="0" style="width: 100%;" cellspacing="0"
        border="0">
        <tr>
            <td colspan="2" class="styleSubTitle">
                <b>Lead Agency Contact Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td class="styleLeftCol" style="width: 35%">
                            First Name<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtFirstnameLA" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstnameLA"
                                Display="Dynamic" ErrorMessage="Please enter the first name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Last Name<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastnameLA" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtLastnameLA"
                                Display="Dynamic" ErrorMessage="Please enter the last name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 1<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1LA" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1LA"
                                Display="Dynamic" ErrorMessage="Please enter the mailing address line 1." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 2
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2LA" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCityLA" runat="server" Text="" Width="100px" MaxLength="50" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCityLA"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" 
                                runat="server" ControlToValidate="txtCityLA" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStateLA" runat="server" Text="" Width="50px" MaxLength="2" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStateLA"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator27" 
                                runat="server" ControlToValidate="txtStateLA" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipcodeLA" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtZipcodeLA"
                                Display="Dynamic" ErrorMessage="Please enter the zipcode." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                                runat="server" ControlToValidate="txtZipcodeLA" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zipcode." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneLA" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex:
                            617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhoneLA"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhoneLA"
                                Display="Dynamic" ErrorMessage="Invalid phone number" 
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxLA" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                                ControlToValidate="txtFaxLA" Display="Dynamic" ErrorMessage="Invalid fax number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                                    fax number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailLA" runat="server" Text="" Width="300px" MaxLength="200" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtEmailLA"
                                Display="Dynamic" ErrorMessage="Please enter email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailLA"
                                Display="Dynamic" ErrorMessage="Invalid email" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Invalid 
                                    email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="25px" class="styleSubTitle">
                <b>Grant Coordinator Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td colspan="2" align="right" class="styleRightCol2" style="padding-right: 10px;">
                            <asp:CheckBox ID="chkCopyLAtoGC" Text="Same as above" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol" style="width: 35%">
                            First Name<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtFirstnameGC" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFirstnameGC"
                                Display="Dynamic" ErrorMessage="Please enter the first name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Last Name<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastnameGC" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLastnameGC"
                                Display="Dynamic" ErrorMessage="Please enter the last name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 1<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1GC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddress1GC"
                                Display="Dynamic" ErrorMessage="Please enter the mailing ddress line 1." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 2
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2GC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCityGC" runat="server" Text="" Width="100px" MaxLength="50" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtCityGC"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator23" 
                                runat="server" ControlToValidate="txtCityGC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStateGC" runat="server" Text="" Width="50px" MaxLength="2" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtStateGC"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator28" 
                                runat="server" ControlToValidate="txtStateGC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipcodeGC" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtZipcodeGC"
                                Display="Dynamic" ErrorMessage="Please enter the zipcode." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                                runat="server" ControlToValidate="txtZipcodeGC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zipcode." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneGC" runat="server" Text="" Width="150px" MaxLength="20"
                                CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex: 617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtPhoneGC"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneGC"
                                Display="Dynamic" ErrorMessage="Invalid phone number" 
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                                    phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxGC" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                ControlToValidate="txtFaxGC" Display="Dynamic" ErrorMessage="Invalid fax number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                                    fax number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailGC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtEmailGC"
                                Display="Dynamic" ErrorMessage="Please enter email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmailGC"
                                Display="Dynamic" ErrorMessage="Invalid Email" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Invalid 
                                    email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="styleSubTitle">
                <b>Superintendent or Executive Director Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td colspan="2" align="right" class="styleRightCol2" style="padding-right: 10px;">
                            <asp:CheckBox ID="chkCopyGCtoDir" Text="Same as above" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol" style="width: 35%">
                            First Name<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtFirstnameDir" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFirstnameDir"
                                Display="Dynamic" ErrorMessage="Please enter the first name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Last Name<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastnameDir" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtLastnameDir"
                                Display="Dynamic" ErrorMessage="Please enter the last name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 1<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1Dir" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAddress1Dir"
                                Display="Dynamic" ErrorMessage="Please enter the mailing address line 1." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 2
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2Dir" runat="server" Text="" Width="300px" MaxLength="200"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCityDir" runat="server" Text="" Width="100px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtCityDir"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator24" 
                                runat="server" ControlToValidate="txtCityDir" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStateDir" runat="server" Text="" Width="50px" MaxLength="2" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtStateDir"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator29" 
                                runat="server" ControlToValidate="txtStateDir" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipcodeDir" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtZipcodeDir"
                                Display="Dynamic" ErrorMessage="Please enter the zipcode." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator19" 
                                runat="server" ControlToValidate="txtZipcodeDir" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zipcode." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneDir" runat="server" Text="" Width="150px" MaxLength="20"
                                CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex: 617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtPhoneDir"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhoneDir"
                                Display="Dynamic" ErrorMessage="Invalid phone number" 
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                                    phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxDir" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                                ControlToValidate="txtFaxDir" Display="Dynamic" ErrorMessage="Invalid fax number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                                    fax number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailDir" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtEmailDir"
                                Display="Dynamic" ErrorMessage="Please enter email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmailDir"
                                Display="Dynamic" ErrorMessage="Invalid email" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Invalid 
                                    email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="styleSubTitle">
                <b>Summer Contact Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td colspan="2" align="right" class="styleRightCol2" style="padding-right: 10px;">
                            <asp:CheckBox ID="chkCopyDirToSC" Text="Same as above" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol" style="width: 35%">
                            First Name<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtFirstnameSC" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtFirstnameSC"
                                Display="Dynamic" ErrorMessage="Please enter the first name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Last Name<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastnameSC" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtLastnameSC"
                                Display="Dynamic" ErrorMessage="Please enter the last name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 1<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1SC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtAddress1SC"
                                Display="Dynamic" ErrorMessage="Please enter the mailing address line 1." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 2
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2SC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCitySC" runat="server" Text="" Width="100px" MaxLength="50" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtCitySC"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator25" 
                                runat="server" ControlToValidate="txtCitySC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStateSC" runat="server" Text="" Width="50px" MaxLength="2" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtStateSC"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator30" 
                                runat="server" ControlToValidate="txtStateSC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipcodeSC" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtZipcodeSC"
                                Display="Dynamic" ErrorMessage="Please enter the zipcode." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" 
                                runat="server" ControlToValidate="txtZipcodeSC" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zipcode." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneSC" runat="server" Text="" Width="150px" MaxLength="20"
                                CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex: 617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtPhoneSC"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtPhoneSC"
                                Display="Dynamic" ErrorMessage="Invalid phone" 
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                        phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxSC" runat="server" Text="" Width="150px" MaxLength="20" CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                ControlToValidate="txtFaxSC" Display="Dynamic" ErrorMessage="Invalid fax number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                        fax number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailSC" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtEmailSC"
                                Display="Dynamic" ErrorMessage="Please enter email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtEmailSC"
                                Display="Dynamic" ErrorMessage="Invalid email" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Invalid 
                        email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="styleSubTitle">
                <b>Fiscal Contact Information</b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" class="styleAlt1" style="width: 100%">
                    <tr>
                        <td colspan="2" align="right" class="styleRightCol2" style="padding-right: 10px;">
                            <asp:CheckBox ID="chkCopySCToFiscal" Text="Same as above" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol" style="width: 35%">
                            First Name<font color="red">*</font>
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="txtFirstnameFiscal" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtFirstnameFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the first name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Last Name<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastnameFiscal" runat="server" Text="" Width="200px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtLastnameFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the last name." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 1<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1Fiscal" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtAddress1Fiscal"
                                Display="Dynamic" ErrorMessage="Please enter the mailing address line 1." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Mailing Address Line 2
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2Fiscal" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            City<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCityFiscal" runat="server" Text="" Width="100px" MaxLength="50"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtCityFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the city." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator26" 
                                runat="server" ControlToValidate="txtCityFiscal" Display="Dynamic" 
                                ErrorMessage="Please enter a valid city." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            State<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStateFiscal" runat="server" Text="" Width="50px" MaxLength="2"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtStateFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the state." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator31" 
                                runat="server" ControlToValidate="txtStateFiscal" Display="Dynamic" 
                                ErrorMessage="Please enter a valid state." 
                                ValidationExpression="^([a-zA-z\s]{2,})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Zip Code<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipcodeFiscal" runat="server" Text="" Width="100px" MaxLength="10"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtZipcodeFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the zipcode." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator21" 
                                runat="server" ControlToValidate="txtZipcodeFiscal" Display="Dynamic" 
                                ErrorMessage="Please enter a valid zipcode." 
                                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Phone<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneFiscal" runat="server" Text="" Width="150px" MaxLength="20"
                                CssClass="inputBox1"></asp:TextBox>&nbsp;(Ex: 617-111-2222)
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtPhoneFiscal"
                                Display="Dynamic" ErrorMessage="Please enter the phone number." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                ControlToValidate="txtPhoneFiscal" Display="Dynamic" ErrorMessage="Invalid phone number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                        phone number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxFiscal" runat="server" Text="" Width="150px" MaxLength="20"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                                ControlToValidate="txtFaxFiscal" Display="Dynamic" ErrorMessage="Invalid fax number"
                                
                                ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$" 
                                SetFocusOnError="True">Invalid 
                        fax number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleLeftCol">
                            Email<font color="red">*</font>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailFiscal" runat="server" Text="" Width="300px" MaxLength="200"
                                CssClass="inputBox1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtEmailFiscal"
                                Display="Dynamic" ErrorMessage="Please enter email." 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                ControlToValidate="txtEmailFiscal" Display="Dynamic" ErrorMessage="Invalid email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True">Invalid 
                        email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td align="center" valign="middle" style="height: 100px">
                <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" onclick="btnSavePrint_Click" CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkCancel" runat="server" Text="Cancel Save" Visible="true" OnClick="btnCancel_Click" CausesValidation="false" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkSave" runat="server" Text="Save Information" Visible="true" OnClick="btnSave_Click" CausesValidation="true" CssClass="buttonClass" />
            </td>
        </tr>
    </table>
</asp:Content>
