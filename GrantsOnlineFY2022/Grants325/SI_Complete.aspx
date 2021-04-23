﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW.master" AutoEventWireup="true"
    CodeFile="SI_Complete.aspx.cs" Inherits="SI_Complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">

    .leftStyle
    {
        padding-left:5px;
    }
        .auto-style1 {
            height: 70px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="border:1px solid #cccccc;background-color:#ededed">
        <br />
        The Department of Early Education and Care (EEC) would like to thank you for completing
        the online portion of the FY&nbsp;<%=AppInfo.FiscalYear.ToString()%>&nbsp;<%=AppInfo.GrantName.ToString()%>&nbsp;<%=AppInfo.GrantAppType%>.<br />
        <br />
        <table id="printSummaryTable" runat="server" cellpadding="0" cellspacing="0" width="100%" style="border: 3px solid #ff0000;">
            <tr>
                <td style="padding: 5px" class="auto-style1">
                    Click the <b>Print Summary</b> button to <u>Review your Online Application</u> as a PDF.  The PDF must be submmittd as a hard copy with your Grant Application.
                </td>
                <td style="text-align: center; padding: 1px 4px" class="auto-style1">
                    <asp:Button ID="btnPrint" runat="server" CausesValidation="false" Text="Print Summary"
                        OnClick="btnPrint_Click" />
                </td>
            </tr>

<%--            <tr><td colspan="5">
                <b>
                <br />
                Please Note:  The Required Grant Forms will need to be submitted as hard copies and submitted electronically, as these do not print as part of the PDF document. Please download the forms and attach to the hard Copy of the Grant Application.</b>
                </td>
            </tr>
            <tr>
                <td>
                            <asp:DataList ID="dlstFile" runat="server" Width="100%" OnItemDataBound="dlstFile_ItemDataBound" OnItemCommand="dlstFile_ItemCommand">
                            <ItemTemplate>
                                <table style="width:100%;background-color:#dddddd">
                                    <tr>
                                        <td><img src="images/spacer.gif" width="70%" height="1" alt="" /></td>
                                        <td><img src="images/spacer.gif" width="30%" height="1" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td class="leftStyle">
                                            <asp:Literal ID="lblCustomText" runat="server"></asp:Literal>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="trFileUploaded" runat="server">
                                        <td colspan="2" class="leftStyle">
                                            <b>Attached File:</b>&nbsp;&nbsp;<asp:LinkButton ID="lnkFileUploaded" runat="server" Text="FileName.pdf" CommandName="ShowFile"></asp:LinkButton>
                                            <asp:Image ID="imgFileUploadedIcon" runat="server" ImageUrl="images/pdficon_large.gif" Width="30px" Height="30px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                            </asp:DataList>
                    </td>
                </tr>
    --%>
                
            </table>
         <p style="color:red">
             We are not requiring that you submit hard copies of the grant application to EEC.  This means that you need to <b><i>submit the online application electronically</i></b> by the grant submission date, including uploading the required grant forms. <b><i> PLEASE DO NOT SEND ANY HARD COPIES OF THE GRANT APPLICATION TO EEC.</i></b>  We will send an approval email to you once we complete the grant review and the follow-up correspondences.  Once you receive that approval email, you will submit the <b><i>final-approved grant application as a PDF hard copy to EEC.</i></b> 
        </p>
       <p>
                Department of Early Education and Care<br />
                FY&nbsp;<%=AppInfo.FiscalYear%>&nbsp;<%=AppInfo.GrantName%> Grant (Fund Code&nbsp;<%=AppInfo.FundCode%>)<br />
                <asp:Label ID="lblOrgname" runat="server" Text="[Orgname]"></asp:Label>
                <br />
                Attention:&nbsp;<%=AppInfo.Adminstrator%> Grants Administration
                <br />
                50 Milk Street, 14th Floor<br />
                Boston, MA 02109
                <br />
            </p>
    </div>
    <br />
    <br />
    <div align="center">
        &nbsp;&nbsp;
        <asp:Button ID="btnSaveHome" runat="server" Text="Go to EEC grants page" OnClick="btnSaveHome_Click" />
            <br />
    <br />
    </div>

</asp:Content>
