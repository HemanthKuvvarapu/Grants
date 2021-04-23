<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSPrintOut.aspx.cs" Inherits="HeadStart_HSPrintOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            font-weight: bold;
        }
        .style8
        {
            text-align: center;
    }
        .style9
        {
        width: 147px;
    }
    .style10
    {
        width: 259px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <legend>Print Summary FY <%=AppInfo.FiscalYear%> Head Start Site Survey</legend>
        <br />
        <table id="printSummaryTable" runat="server" cellpadding="0" cellspacing="0" width="100%" style="border: 3px solid #ff0000;">
            <tr>
                <td style="padding: 5px" class="style2">
                    Click the <b>Print </b>buttons below to <u>Review your Online Site Survey</u> as a 
                    PDF. These PDFs must be submitted as a hard copy with your Grant Application.
                </td>
                <td style="text-align: center; padding: 1px 4px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <br />
                </td>
            </tr>
        </table>
    
<br />
    
Please click the "<img src="images/pdfIcon.gif" style="width: 18px; height: 18px" />” 
    button to Select a Summary Report<br />
        <br />
    
    
    <table style="width: 100%;">
        <tr>
            <td class="style10">
                <b>Center-Based Survey
                     </b>
            </td>
            <td class="style9">
                &nbsp;
                    <b> 
                    <asp:ImageButton ID="HSCenterBaseSurveybtn" runat="server" Height="19px" 
                        ImageUrl="~/images/pdfIcon.gif" Width="19px" 
                        onclick="HSCenterBaseSurveybtn_Click" />
                    </b>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                <b>Family Child Care Survey</b></td>
            <td class="style9">
                &nbsp;
                    <b> 
                    <asp:ImageButton ID="HSFCCSurveyBtn" runat="server" Height="19px" 
                        ImageUrl="~/images/pdfIcon.gif" Width="19px" 
                        onclick="HSFCCSurveyBtn_Click" />
                    </b>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                    <b>Home-Based Survey</b></td>
            <td class="style9">
                    <b>&nbsp; 
                    <asp:ImageButton ID="HSHomeBasedSurveybtn" runat="server" Height="19px" 
                        ImageUrl="~/images/pdfIcon.gif" Width="19px" 
                        onclick="HSHomeBasedSurveybtn_Click" />
                    </b>
            </td>
            <td>
                &nbsp;</td>
        </tr>
         <tr style="visibility:hidden">
            <td class="style10">
                    <b>Locally Designed Option Survey </b></td>
            <td class="style9">
                    <b>&nbsp; 
                    <asp:ImageButton ID="HSLocallyDesigned" runat="server" Height="19px" 
                        ImageUrl="~/images/pdfIcon.gif" Width="19px" 
                        onclick="HSLocallyDesignedbtn_Click" />
                    </b>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
            
                    &nbsp;</td>
            <td class="style9">
                   &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
            
                   <asp:Button ID="btnBackprevious1" runat="server" Text="Home" 
                onclick="btnBackprevious1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                onclick="btnContinue_Click" />&nbsp; &nbsp;</td>
        </tr>
       
    </table>
</asp:Content>


