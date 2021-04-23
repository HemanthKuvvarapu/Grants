<%@ Page Title="Cover Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CoverPage.aspx.cs" Inherits="CoverPage" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        #ctl00_PageTitle1_txtPageTitle
        {
            text-align: center;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br /><br />
        <table ID="ProcureInformation" runat="server" cellpadding="0" cellspacing="0" width="100%" border="0" style="padding:5px">
             <tr valign="middle">
                <td style="text-align: center" >
                    <b style="font-size:14pt">PROCUREMENT INFORMATION</b>
                </td>
            </tr>
        </table>
        <p>
        <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
    </p>
    <table id="tblCoverPage" runat="server" cellpadding="0" cellspacing="0" width="100%" border="0" style="padding-top:5px;padding-bottom:5px;border:solid 1px #333333">
            <tr>
                <td>&nbsp;</td>
                <td><b>Vendor Name (Your program or agency name):</b> <asp:Label ID="lblApplicantName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Program or Agency Legal Address:</b>&nbsp;<asp:Label ID="lblAgencyAddress" 
                        runat="server"></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>City, State, Zip Code:</b>&nbsp;<asp:Label ID="lblCityZip" 
                        runat="server"></asp:Label></td>
            </tr>
            <tr id="covercontact" runat="server" visible="false">
                <td>&nbsp;</td>
                <td><b>Grant Contact Name: 
                    <asp:TextBox ID="txtContactName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtContactName" Display="Dynamic" 
                        ErrorMessage="Invalid Contact Name"></asp:RequiredFieldValidator>
                        
                    </b></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Email Address:</b>&nbsp; 
                    <asp:TextBox ID="txtEmailAddress" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailAddress"
                            Display="Dynamic" ErrorMessage="Please enter email!"></asp:RequiredFieldValidator>
						 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                            runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" 
                            ErrorMessage="Invalid Email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid 
                        Email</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Phone Number:</b> 
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                   &nbsp; (ex: 617-988-6000)
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone"
                            Display="Dynamic" ErrorMessage="Please enter phone number!"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Invalid Phone Number" 
                            ValidationExpression="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$((x){0,1}([0-9]){1,5}){0,1}$">Invalid 
                        Phone</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Federal Tax ID:</b> 
                    <asp:TextBox ID="txtTaxId" runat="server" MaxLength="10"></asp:TextBox>
                   &nbsp; (ex: 00-0000000)
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTaxId"
                            Display="Dynamic" ErrorMessage="Please enter the federal tax Id!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtTaxId" Display="Dynamic" 
                        ErrorMessage="Invalid Federal Tax Id" ValidationExpression="\d{2}-\d{7}"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
     </table>
     <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
            <tr>
                <td height="80px" align="center" style="width:100%">
                    <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" onclick="btnSavePrint_Click" CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" onclick="btnCancel_Click" CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSave" runat="server" Text="Save and Go Back Home" onclick="btnSave_Click" CausesValidation="true" CssClass="buttonClass" />
                </td>
            </tr>
     </table>
    
</asp:Content>

