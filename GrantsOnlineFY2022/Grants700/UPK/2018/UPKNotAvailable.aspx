<%@ Page Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="UPKNotAvailable.aspx.cs" Inherits="UPK_2018_UPKNotAvailable" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPage4.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style336
        {
        	text-align: center;
            font-weight: bold;
            background-color: #FFCC99;
        }
        .style337
        {
        	text-align: center;
            font-weight: bold;
            background-color: #00FF00;
        }
        .style338
        {
            font-weight: bold;
            background-color: #FF6666;
            text-align: center;
        }
        .style92
        {
        	height: 45px;
            font-weight: bold;
            background-color: #FFCC99;
            text-align: left;
            padding-left:5px;
        }
        .style93
        {
        	height: 45px;
            font-weight: bold;
            background-color: #00FF00;
            text-align: left;
            padding-left:5px;
        }
        .style105
        {
        	height:45px;
            font-weight: bold;
            background-color: #FF6666;
            text-align: left;
            padding-left:5px;
        }
        .style5
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #EFEFEF;
            width: 218px;
        }
        .styleSub0
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 44px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub1
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub2
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FF6666;
        }
        .styleSub3
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#00FF00;
        }
        .style6
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #CDCDCD;
        }

        p.MsoNormal
        {
            margin-bottom: .0001pt;
            font-size: 11.0pt;
            font-family: "Calibri" , "sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="tblError" style="width:100%" runat="server">
            <tr>
                <td>
                    <table id="tblErrorMessage" cellpadding="0" cellspacing="0" border="0" runat="server" style="background-color:Yellow;height:80px;width:100%;border:solid 1px #ff0000;font-family:Arial">
                        <tr>
                            <td style="color:Red;font-weight:bold;padding:5px" align="center">According to the questions answered, your program does not qualify for the FY 2015 UPK Renewal grant.<br /><br />Please view <a href="http://www.mass.gov/edu/government/departments-and-boards/department-of-early-education-and-care/">EEC's website</a> for more grant opportunities.<br /><br /></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                        OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                        Width="200px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


