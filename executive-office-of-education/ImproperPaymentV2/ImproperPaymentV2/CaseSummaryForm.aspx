<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage0.master"  CodeFile="CaseSummaryForm.aspx.cs" Inherits="CaseSummaryForm" Title="500 Case Summary Form" %>
<%@ MasterType  virtualPath="~/MasterPage0.master"%> 

<%@ Register src="controls/PageDetailTitle.ascx" tagname="PageDetailTitle" tagprefix="uc3" %>
<%@ Register src="controls/PageDetailFooter.ascx" tagname="PageDetailFooter" tagprefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 384px;
        }
        .auto-style3 {
            width: 50%;
        }
    </style>
    <script type="text/javascript">
        function fnPrint() {
            document.getElementById('printClosenSave').hidden = true;
            print();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 800px;
            /*background-color: #F0F5F2;*/ 
            border-color: #E7E7FF; border-width: 1px; border-style: None;
            border-collapse: collapse;">
   <%-- <tr>
        <td style="text-align:left" colspan="4"><b>Sample ID:</b>&nbsp;&nbsp;<asp:Label ID="lblSampleID" runat="server" Text="">&nbsp;</asp:Label></td>
    </tr>
    <tr>
        <td style="text-align:left" colspan="4"><b>Child Name:</b>&nbsp;&nbsp<asp:Label ID="lblChildName" runat="server" Text=""></asp:Label></td>
    </tr>--%>
    <%--<tr>
        <td colspan="4">
            <uc3:PageDetailTitle ID="pageDetailTitle" runat="server" />
        </td>
    </tr>--%>
    <tr>
        <td  style="text-align:left;border:none" colspan="2">
            <asp:Label ID="lblErrMsg" ForeColor="Red" runat="server" Text =""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="auto-style2">
            <table border="1">
                <tr>
                    <th width="50%" valign="top" bgcolor="#c0c0c0"><b>FINDINGS (1)</b> </th>

                    <th valign="top" bgcolor="#c0c0c0" class="auto-style3"><b>RESULTS (2)</b> </th>
                </tr>
                <tr>
                    <td valign="top"><b>500 CASE SUMMARY</b><br />
                        <asp:HiddenField ID="hidRecID" runat="server" Value="<%=RecID%>" />
                        <asp:TextBox ID="txtCaseSummaryFindings" TextMode="MultiLine" cols="40" rows="20" Width="350px" MaxLines="10" TextWrapping="Wrap" runat="server" Text=""></asp:TextBox> 
                    </td>
                    <td valign="top" class="auto-style3"><b>500 RESULTS</b><br />
                            <ol>
                                <li>
                                <table cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td style="width: 250px">
                                        No Error(0) / Error(1)
                                    </td>
                                    <td style="width: 100px">
                                        <asp:DropDownList ID="cboError" style="width: 42px" runat="server" Enabled="false">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>                                 
                                </tr>
                                </table>
                                </li>
                                <li>
                                    <table cellpadding="0" cellspacing="0">
                                       <tr>
                                           <td style="width: 250px">Missing/Insufficient Documentation</td>
                                           <td>
                                               <asp:DropDownList ID="cboMissDoc" style="width: 50px" runat="server" Enabled="false">
                                                   <asp:ListItem Value="0">NA</asp:ListItem>
                                            <asp:ListItem Value="1">N</asp:ListItem>
                                            <asp:ListItem Value="2">Y</asp:ListItem>
                                        </asp:DropDownList>
                                           </td>
                                       </tr> 
                                        
                                        </table>
                                    <ul style="list-style: none">
                                    <li><table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 400px">2A: Number of MID potential improper payment errors identified</td>
                                            <td style="width: 100px"><asp:TextBox ID="txtMIDErrorNum" Width="80px" Text="0" runat="server" Enabled="false"></asp:TextBox></td>
                                        </tr>
                                        </table>
                                    </li>
                                    <li><table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 400px">2B: Total Amount of MID potential improper payment errors</td>
                                            <td style="width: 100px"><asp:TextBox ID="txtMIDErrorAmount" Width="80px" Text="0" runat="server" Enabled="false"></asp:TextBox></td>
                                        </tr>
                                        </table>
                                    </li>
                                    <li><table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 400px">2C: Number of times an additional inquiry was used</td>
                                            <td style="width: 100px"><asp:TextBox ID="txtTimesAddInquiryUsed" Width="80px" Text="0" runat="server" Enabled="false"></asp:TextBox></td>
                                         </tr>
                                        </table>
                                    </li>
                                    <li><table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 400px">2D: Number of times the additional inquiry mitigated the potential improper payment error</td>
                                            <td style="width: 100px"><asp:TextBox ID="txtTimesAddInquiryMitigated" Width="80px" Text="0" runat="server" Enabled="false"></asp:TextBox></td>
                                        </tr>
                                        </table>
                                    </li>
                                    <li><table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 400px">2E: Total amount of improper payments mitigated</td>
                                            <td style="width: 100px"><asp:TextBox ID="txtIPAmountMitigated" Width="80px" Text="0" runat="server" Enabled="false"></asp:TextBox></td>
                                        </tr>
                                        </table>                                            
                                    </li>
                                    </ul>
                                </li>
                                <li><table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 400px" valign="bottom">
                                            Overpayment / Underpayment
                                        </td>
                                        <td style="width: 100px" valign="bottom" >
                                            <asp:DropDownList ID="cboErrorAutho" style="width: 42px" runat="server" Enabled="false">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="O">O</asp:ListItem>
                                            <asp:ListItem Value="U">U</asp:ListItem>
                                            <asp:ListItem Value="NA">NA</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>                                        
                                    </table>
                                </li>
                                <li><table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 400px" valign="bottom">Total Amount of Improper Payment</td>
                                        <td style="width: 100px" align="right"><asp:TextBox ID="txtTotalAmountIP" Width="80px" runat="server" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    </table>
                                </li>
                                <li><table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 400px" valign="bottom">Total Payment Amount for Sample Month</td>
                                        <td style="width: 100px" align="right"><asp:TextBox ID="txtTotalPayment" Width="80px" runat="server" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    </table>
                                 </li>
                            </ol>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="LastFormFooter" runat="server">
        <td colspan="7" width="100%"><uc4:PageDetailFooter runat="server" /></td>
    </tr>
    <tr id="printClosenSave">
        <td colspan="2" align="right">
            
        </td>
        <td align="center">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="80" onclick="btnSave_Click" />
            <button id="btnCancel" style="width:100px" onclick="javascript:window.close();">Cancel/Close</button>
            <button id="btnPrint" style="width:80px" onclick="javascript:fnPrint();">Print</button>

        </td>
        <td colspan="2" align="right">
            
        </td>
    </tr>
    <tr>
        <td  align="center">
        </td>
    </tr>
        
</table>
</asp:Content>

