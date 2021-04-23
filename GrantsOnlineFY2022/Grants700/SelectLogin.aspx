<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SelectLogin.aspx.cs" Inherits="SelectLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
            height: 22px;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divHSLEA" runat="server">
        <fieldset style="height: 100px; width: 90%">
            <legend>FY&nbsp;<%=AppInfo.FiscalYear.ToString()%>&nbsp;<%=AppInfo.GrantName.ToString()%>&nbsp;Grant Applicants</legend>&nbsp;&nbsp;
            Please select your Agency from the following drop-down list:<br />
            &nbsp;&nbsp;
            <asp:DropDownList ID="ddlHSLEA" runat="server" Width="600px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="btnHSLEASelected" runat="server" Text="Continue"
                OnClick="btnHSLEASelected_Click" />
            &nbsp;&nbsp;<br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlHSLEA"
                Display="Dynamic" ErrorMessage="Please select an Agency." InitialValue="-1" SetFocusOnError="True">Please select an Agency.</asp:RequiredFieldValidator>
            <br />
            <br />
        </fieldset>
        <br />
    </div>
    <br />
    <div id="divCreatePassword" runat="server">
        <fieldset style="width: 90%">
            <legend>Create a password</legend>
            <table id="tblRegister" runat="server" width="100%">
                <tr>
                    <td colspan="2">
                        Please create a password before completing the Online Application. This will enable
                        you to retrieve your application and modify answers later if you wish to do so.
                        Please write this password down for your reference. If you need password or technical
                        assistance, please contact <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a>.
                    </td>
                </tr>
                <tr>
                    <td class="LabelCell">
                        Enter a password:
                    </td>
                    <td class="DataCell">
                        <asp:TextBox ID="txtPassword1" runat="server" Width="150px" MaxLength="20" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword1"
                            Display="Dynamic" ErrorMessage="Please enter password!" SetFocusOnError="True">Please enter 
                password!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Re-enter the password:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtPassword2" runat="server" Width="150px" MaxLength="20" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword2"
                            Display="Dynamic" ErrorMessage="Please enter password!" SetFocusOnError="True">Please enter 
                password!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSavePassword" runat="server" Text="Save Password" OnClick="btnSavePassword_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelCreatePwd" runat="server" CausesValidation="False" OnClick="btnCancelCreatePwd_Click"
                            Text="Cancel" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblCreatePwdMsg" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="divConfirmPassword" runat="server">
        <fieldset style="width:90%">
            <legend>Enter your password</legend>
            <table id="tblConfirmPwd" runat="server" width="100%">
                <tr>
                    <td colspan="2" class="style6">
                        Please enter your password to access your Online Application. If you need password
                        assistance, please send an email with name of the grant in the subject line to <a
                            href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a>.
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Enter your password:
                    </td>
                    <td class="DataCell">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" Width="150px" MaxLength="20"
                            TextMode="Password" Style="margin-left: 0px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword"
                            Display="Dynamic" ErrorMessage="Please enter password!" SetFocusOnError="True">Please enter 
                password!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnConfirmPwd" runat="server" Text="Submit" OnClick="btnConfirmPwd_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelConfirmPwd" runat="server" CausesValidation="False" OnClick="btnCancelCreatePwd_Click"
                            Text="Cancel" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <%--<tr>
            <td colspan=2><a href="ForgotPassword.aspx"><span>Forgot your password?</span></a></td>
        </tr>--%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblConfirmPwdMsg" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
