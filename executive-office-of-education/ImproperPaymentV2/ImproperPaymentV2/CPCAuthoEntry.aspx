<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CPCAuthoEntry.aspx.cs" Inherits="CPCAuthoEntry" Title="Untitled Page" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<%@ Register assembly="EECControls" namespace="EEC.AspNet.CustomControls" tagprefix="eec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellspacing="0" cellpadding="3" rules="all" border="1" style="width:530px;background-color: #F7F6F3;border-color:#E7E7FF;border-width:1px;border-style:None;border-collapse:collapse;">
    <tr>
        <td style="width:180px"><b>Fee Level</b></td>
        <td style="width:350px">
            <eec:EECTextBox ID="txtFeeLevel" runat="server" MaxLength="2" 
                TextType="Integer" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the fee level" Required="True"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                ControlToValidate="txtFeeLevel" Display="Dynamic" 
                ErrorMessage="Please enter a correct fee level" MaximumValue="50" 
                Type="Integer" MinimumValue="0"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td><b>Family Size</b></td>
        <td><eec:EECTextBox ID="txtFamilySize" runat="server" MaxLength="2" 
                TextType="Integer" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the family size" Required="True"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator3" runat="server" 
                ControlToValidate="txtFamilySize" Display="Dynamic" 
                ErrorMessage="Please enter a correct family size" MaximumValue="15" 
                Type="Integer" MinimumValue="0"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Family Monthly Income</b></td>
        <td><eec:EECTextBox ID="txtFamilyIncome" runat="server"
                TextType="Number" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the family monthly income" Required="True"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator4" runat="server" 
                ControlToValidate="txtFamilyIncome" Display="Dynamic" 
                ErrorMessage="Please enter a correct family monthly income" 
                Type="Double"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Autho Days</b></td>
        <td><eec:EECTextBox ID="txtAuthoDays" runat="server"
                TextType="Number" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the monthly authorization days" MaxLength="2" 
                Required="True"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator5" runat="server" 
                ControlToValidate="txtAuthoDays" Display="Dynamic" 
                ErrorMessage="Please enter a correct authorization days" 
                Type="Double"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Provider Rate</b></td>
        <td><eec:EECTextBox ID="txtProviderRate" runat="server" 
                TextType="Number" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the provider rate" Required="True" 
                MaxLength="5"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator6" runat="server" 
                ControlToValidate="txtProviderRate" Display="Dynamic" 
                ErrorMessage="Please enter a correct provider rate" 
                Type="Double"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Parent Daily Fee</b></td>
        <td><eec:EECTextBox ID="txtParentFee" runat="server"
                TextType="Number" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the parent daily fee" Required="True" 
                MaxLength="5"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="txtParentFee" Display="Dynamic" 
                ErrorMessage="Please enter a correct DAILY Parent Fee" MaximumValue="50.00" 
                Type="Double"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Total Transportation Monthly Amount</b></td>
        <td><eec:EECTextBox ID="txtTransAmount" runat="server"
                TextType="Number" ErrorDisplayInNewLine="True" 
                ErrorMessage="Please enter the total transportation monthly amount" 
                Required="True" MaxLength="4"></eec:EECTextBox>
            <asp:RangeValidator ID="RangeValidator7" runat="server" 
                ControlToValidate="txtTransAmount" Display="Dynamic" 
                ErrorMessage="Please enter a correct transportation amount" 
                Type="Double"></asp:RangeValidator>
                                                </td>
    </tr>
    <tr>
        <td><b>Authorization Type</b></td>
        <td>
            <eec:EECDropDownList ID="cboAuthoType" runat="server">
                <asp:ListItem Value="N">New</asp:ListItem>
                <asp:ListItem Value="R">Renewal</asp:ListItem>
            </eec:EECDropDownList>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2"><asp:Button ID="btnSave" runat="server" 
                Text="Continue" onclick="btnSave_Click" /></td>
    </tr>
</table>
</asp:Content>

