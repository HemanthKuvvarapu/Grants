<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<fieldset><legend>Reset your password</legend>
    <table id=tblReset runat=server width=100% border=0 cellpadding=0 cellspacing=0 class="BGColor1">
        <tr>
            <td>&nbsp;</td>
            <td colspan=2><i>Please enter the following information for us to retrieve your 
                Username and Password.</i></td>
        </tr>
        <tr><td colspan=3>&nbsp;</td></tr>
         <tr>
                <td>
                </td>
                <td>
                    <b>Agency Name&nbsp;<font color="red">*</font></b>
                </td>
                <td>
                    <asp:TextBox ID="txtAgencyName" runat="server" Text="" Width="300px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAgencyName"
                        Display="Dynamic" ErrorMessage="Please enter the Agency name."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <b>Username&nbsp;<font color="red">*</font></b></td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Text="" Width="150px" MaxLength="20"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtUsername"
                        Display="Dynamic" ErrorMessage="Please enter the Username."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td colspan=3><hr /></td></tr>
            <tr>
                <td></td>
                <td colspan=2>View User Name and Password</td>
            </tr>
            <tr id="trGetUsername" runat="server">
                <td>
                </td>
                <td>
                    <b>User Name</b></td>
                <td>
                    <asp:Label ID="lblUserName" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr id="trGetPwd" runat="server">
                <td>
                </td>
                <td>
                    <b>Confirm Password</b>
                </td>
                <td>
                    <asp:Label ID="lblPWD" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td colspan=3>&nbsp;</td></tr>
            <tr><td colspan=3 align=center><asp:Button ID=btnResetPassword 
                    Text="Retrieve User Name/Password" runat=server onclick="btnResetPassword_Click" />&nbsp;&nbsp;
                    <asp:Button ID=btnContinue runat=server Text="Continue" 
                    CausesValidation=false Visible=false onclick="btnContinue_Click" />
                    </td></tr>
                    <tr><td colspan=3>&nbsp;</td></tr>
                    <tr><td colspan=3><asp:Label ID=lblMessage runat=server Text="" ForeColor=Red Font-Bold=true></asp:Label></td></tr>
    </table>
</fieldset>
</asp:Content>

