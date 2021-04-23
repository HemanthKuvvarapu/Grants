<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <table id="tblConfirmPwd" runat="server" width="100%">
            <tr>
                <td align="center" >
                    Please enter your Username/Password to login to the Online Application.
                    <table id="tblpwd" runat="server" border="0" cellpadding="0" cellspacing="0" style="background-color:#cccccc;padding:10px;width:350px">
                        <tr>
                            <td width="130px">
                                Username:&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsername" runat="server" Text="" Width="150px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                                    Display="Dynamic" ErrorMessage="Please enter Username." SetFocusOnError="True">Please enter 
                Username.</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" Width="150px" MaxLength="20" TextMode="Password"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword"
                                    Display="Dynamic" ErrorMessage="Please enter Password." SetFocusOnError="True">Please enter 
                Password.</asp:RequiredFieldValidator>
                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="lblConfirmPwdMsg" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height:50px">
                                <asp:Button ID="btnConfirmPwd" runat="server" Text="Login" Width="150px" OnClick="btnConfirmPwd_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><br />
                </td>
            </tr>
            <tr>
                <td>
                    If you have not previously registered for the FY <%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantName%>&nbsp;Grant, please click the Register button. <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="false" OnClick="btnRegister_Click" />
                    <br /><br />
                    If you need password or technical assistance, please contact <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a>.
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            
        </table>
</asp:Content>
