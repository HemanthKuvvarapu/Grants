<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSSurveyHome.aspx.cs" Inherits="HeadStart_HSSurveyHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            font-weight: bold;
        }
        .style8
        {
        width: 162px;
    }
        .style9
        {
            width: 162px;
            height: 18px;
        background-color: #FFFFCC;
    }
        .style10
        {
        height: 18px;
        background-color: #FFFFCC;
    }
    .style11
    {
        background-color: #FFFFCC;
    }
    .style12
    {
        width: 162px;
        background-color: #FFFFCC;
    }
    .style13
    {
        text-align: center;
        width: 718px;
        background-color: #FFFFCC;
    }
    .style14
    {
        width: 718px;
    }
    .style15
    {
        width: 718px;
        background-color: #FFFFCC;
    }
    .style16
    {
        height: 18px;
        width: 718px;
        background-color: #FFFFCC;
    }
        .auto-style4
        {
            width: 162px;
            height: 18px;
            background-color: #FFFFCC;
        }
        .auto-style5
        {
            height: 18px;
            width: 718px;
            background-color: #FFFFCC;
        }
        .auto-style6
        {
            height: 18px;
            background-color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <legend>Head Start and Early Head Start Program Site Survey Checklist</legend>
        <table id="tblCheckList" runat="server" cellpadding="0" cellspacing="0" width="100%">
           <tr>
                <td class="style8">
                    &nbsp;
                </td>
                <td class="style14">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Button ID="btnSelectHSCenterBaseSiteSurvey" runat="server" Text="View/Edit" Enabled="true" 
                        Width="100px" onclick="btnSelectHSCenterBaseSiteSurvey_Click" />
                </td>
                <td class="style13">
                     <b>Center-Based Survey
                     </b>
                     <br />
                     <i>If Applicable</i></td>
                <td class="style11">
                    <asp:Image ID="imgPart2" runat="server" ImageUrl="images/0.jpg" />
                </td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;
                </td>
                <td class="style15">
                    &nbsp;
                </td>
                <td class="style11">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Button ID="btnSelectHSFCCSiteSurvey" runat="server" Text="View/Edit" 
                        Enabled="true" Width="100px" onclick="btnSelectHSFCCSiteSurvey_Click" />
                </td>
                <td class="style13">
                    <b>Family Child Care Survey</b><br />
                    <i>If Applicable</i></td>
                <td class="style11">
                    <asp:Image ID="imgPart3" runat="server" ImageUrl="images/0.jpg" />
                </td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;
                </td>
                <td class="style15">
                    &nbsp;
                </td>
                <td class="style11">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Button ID="btnSelectHSHomeBasedSiteSurvey" runat="server" Text="View/Edit" 
                        Enabled="true" Width="100px" onclick="btnSelectHSHomeBasedSiteSurvey_Click" />
                </td>
                <td class="style13">
                    <b>Home-Based Survey</b><br />
                    <i>If Applicable</i></td>
                <td class="style11">
                    <asp:Image ID="imgPart4" runat="server" ImageUrl="images/0.jpg" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;
                </td>
                <td class="auto-style5">
                    &nbsp;
                </td>
                <td class="auto-style6">
                    &nbsp;
                </td>
            </tr>
            <tr style="visibility:hidden">
                <td class="style12">
                    <asp:Button ID="btnSelectHSLocallyDesignedOption" runat="server" Text="View/Edit" Enabled="true" 
                        Width="100px" onclick="btnSelectHSLocallyDesignedOption_Click" />
                </td>
                <td class="style13">
                    <span class="style7">Locally Designed Option Survey</span><br />
                    <i>If Applicable </i></td>
                <td class="style11">
                    <asp:Image ID="imgPart5" runat="server" ImageUrl="images/0.jpg" />
                </td>
            </tr>
        </table>
        </div>
        <div align=center><asp:Button ID=btnSubmit runat=server Text="Finish" 
                onclick="btnSubmit_Click" />&nbsp;&nbsp;<asp:Button ID=btnPrint 
                runat=server Text="Print Summary" onclick="btnPrint_Click" />
                &nbsp;&nbsp;
                </div>
    
</asp:Content>

