<%@ Page Title="Cover Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AmendmentCoverPage.aspx.cs" Inherits="AmendmentCoverPage" %>
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
                    <b style="font-size:14pt">BUDGET AMENDMENT COVER PAGE</b>
                </td>
            </tr>
        </table>
    
    <table id="tblCoverPage" runat="server" cellpadding="0" cellspacing="0" width="100%" border="0" style="padding-top:5px;padding-bottom:5px;border:solid 1px #333333">
            <tr>
                <td>&nbsp;</td>
                <td style="width:320px"><b>Vendor Name (Your program or agency name):</b></td>
                <td><asp:Label ID="lblApplicantName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Program or Agency Legal Address:</b></td>
                <td><asp:Label ID="lblAgencyAddress" 
                        runat="server"></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>City, State, Zip Code:</b></td>
                <td><asp:Label ID="lblCityZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>Name of person completing this Amendment:</b></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr runat="server">
                <td>&nbsp;</td>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:</b></td>
                <td><asp:TextBox ID="txtContactName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtContactName" Display="Dynamic" 
                        ErrorMessage="Please enter the name"></asp:RequiredFieldValidator>
                        
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Title:</b></td>
                <td><asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtTitle" Display="Dynamic" 
                        ErrorMessage="Please enter the title"></asp:RequiredFieldValidator>
                        
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Address:</b></td>
                <td><asp:TextBox ID="txtEmailAddress" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailAddress"
                            Display="Dynamic" ErrorMessage="Please enter the email address"></asp:RequiredFieldValidator>
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
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number:</b></td> 
                <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                   &nbsp; (ex: 617-988-6000 or 617-988-6000 x123)
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone"
                            Display="Dynamic" ErrorMessage="Please enter the phone number"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Invalid Phone Number" 
                            ValidationExpression="(\s*)((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}((\s*)x\d{0,})?(\s*)">Invalid 
                        Phone</asp:RegularExpressionValidator>
                </td>
            </tr>
     </table>
     <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
            <tr>
                <td height="80px" align="center" style="width:100%">
                    <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" onclick="btnSavePrint_Click" CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" onclick="btnCancel_Click" CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSave" runat="server" Text="Save and Go Back Amendment Home" onclick="btnSave_Click" CausesValidation="true" CssClass="buttonClass" />
                </td>
            </tr>
     </table>
    
</asp:Content>


