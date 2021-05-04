<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormTemplate.ascx.cs" Inherits="controls_FormTemplate" %>

<%@ Register src="RequirementTemplate.ascx" tagname="RequirementTemplate" tagprefix="uc1" %>
<%@ Register Src="ResultTemplate.ascx" tagname="ResultTemplate" tagprefix="uc3" %>
<%@ Register src="PageDetailFooter.ascx" tagname="PageDetailFooter" tagprefix="uc4" %>

<table id="tblForm" class="formtext" cellpadding="0" cellspacing="0" border="0" style="background-color: #D5D8E9;
    display: none" width="100%" runat="server">
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                <asp:Literal ID="sScript" runat="server"></asp:Literal>
            </script>
        </td>
    </tr>
    <tr>
        <td colspan="7" class="tblHeader">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td align="center" style="height: 50px; font-size: larger;">
                        <h3>
                            <asp:Label ID="lblSectionHeader" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <%--<tr>
                    <td align="center">
                        <span style="width: 300px; background-color: #c24736;"><b>
                            <asp:Label ID="lblFormTitle" runat="server" Text="Label" Style="width: 400px; color: #ffffff;
                                padding: 2px; padding-left: 10px; padding-right: 10px"></asp:Label></b></span>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <img src="../images/spacer.gif" width="1px" height="5px" alt="" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="7" style="background-color: #ffffff"><img src="../images/spacer.gif" width="1px" height="3px" alt="" /></td>
    </tr>
    <tr>
        <td class="tblAnalysis" valign="top" style="width: 23%">
            <table valign="top" cellpadding="3" cellspacing="0" border="0" style="width: 100%">
                <tr>
                    <td align="center" class="sectionheader" style="height: 36px">
                        <b>ELEMENTS OF ELIGIBILITY &amp; PAYMENT DETERMINATION (1)</b>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <span style="width: 300px;"><b>
                            <asp:Label ID="lblFormTitle" runat="server" Text="Label" Style="width: 400px; 
                                padding: 2px; padding-left: 10px; padding-right: 10px"></asp:Label></b></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFormDescription" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 1px">
                        <img src="../images/spacer.gif" width="207px" height="1px" alt="" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="background-color: #ffffff">
            <img src="../images/spacer.gif" width="3px" height="1px" alt="" />
        </td>
        <td class="tblRequirements" valign="top" style="width: 32%">
            <table cellpadding="3" cellspacing="0" border="0" style="width: 100%">
                <tr>
                    <td align="center" class="sectionheader" style="height: 36px">
                        <b>ANALYSIS OF CASE RECORD (2)</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <uc1:RequirementTemplate ID="lstRequirements" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Comments:<br />
                        <asp:TextBox ID="txtAnalysis" runat="server" Rows="6" TextMode="MultiLine" Style="width: 98%;
                            height: 100%"></asp:TextBox>
                        <asp:Panel class="hiddenPanel" ID="pnlAnalysis" Style="width: 98%; display: none"
                            runat="server">
                            <table cellpadding="0" cellspacing="0" border="0" style="height: 105px">
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblAnalysis" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="height: 1px">
                        <img src="../images/spacer.gif" width="289px" height="1px" alt="" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="background-color: #ffffff">
            <img src="../images/spacer.gif" width="3px" height="1px" alt="" />
        </td>
        <td class="tblAnalysis" valign="top" style="width: 26%">
            <table cellpadding="3" cellspacing="0" border="0" style="width: 100%">
                <tr>
                    <td align="center" class="sectionheader" style="height: 36px">
                        <b>FINDINGS (3)</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtFindings" runat="server" Rows="20" TextMode="MultiLine" Style="width: 98%;
                            height: 100%"></asp:TextBox>
                        <asp:Panel class="hiddenPanel" ID="pnlFindings" Style="width: 98%; display: none"
                            runat="server">
                            <table cellpadding="0" cellspacing="0" border="0" style="height: 105px">
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblFindings" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="height: 1px">
                        <img src="../images/spacer.gif" width="236px" height="1px" alt="" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="background-color: #ffffff">
            <img src="../images/spacer.gif" width="3px" height="1px" alt="" />
        </td>
        <td class="tblResult" valign="top" style="width: 19%">
            <table cellpadding="3" cellspacing="0" border="0" style="width: 100%">
                <tr>
                    <td align="center" class="sectionheader" style="height: 36px">
                        <b>RESULTS (4)</b>
                    </td>
                </tr>
                <%-- Experiment for setting controls to disabled (not working)
                <tr>
                    <td>
                        <uc3:ResultTemplate ID="lstResults" runat="server" />
                    </td>
                </tr>
                --%>
                <tr>
                    <td>
                        <asp:HiddenField ID="txtResult" runat="server" />
                        <table cellpadding="0" cellspacing="0" rules="all" style="width: 100%; border-collapse: collapse">
                            <tr>
                                <td style="width: 62px">
                                    &nbsp;1.
                                    <asp:DropDownList ID="cboError" style="width: 42px" runat="server" >
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    No Error(0)<br />
                                    Error(1)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;2.
                                    <asp:DropDownList ID="cboMissDoc" style="width: 42px" runat="server">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="Y">Y</asp:ListItem>
                                        <asp:ListItem Value="N">N</asp:ListItem>
                                        <asp:ListItem Value="NA">NA</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </td>

                                <td> 
                                    Missing/Insufficient Documentation
                                    <label id="form410Disable" runat="server" visible="true"><BR />If "Y" is coded answer 2A.</label>
                                    
                                </td>
                            </tr>
                            <tr id="trForm410Disable" runat="server" visible="true">
                                <td>
                                    <BR />
                                    &nbsp;2A. 
                                    <asp:DropDownList ID="cboMidOption" style="width: 42px" runat="server" Enabled="false">
                                        <asp:ListItem Value="N">N</asp:ListItem>
                                        <asp:ListItem Value="Y">Y</asp:ListItem>

                                    </asp:DropDownList>
                                </td>

                                <td> 
                                    <BR />
                                    Potential Improper Payment Error (If “Y” is coded, use the MID Table)
                                </td>
                            </tr>
                        </table>
                        <%--<table id="frm410Only" runat="server" visible="false"> 
                            <tr>
                                <td>
                                    &nbsp;3.
                                    <asp:DropDownList ID="cboErrorAutho" style="width: 42px" runat="server" Enabled="false">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="O">O</asp:ListItem>
                                        <asp:ListItem Value="U">U</asp:ListItem>
                                        <asp:ListItem Value="NA">NA</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    Overpayment/<br />
                                    Underpayment
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;4.&nbsp;<asp:TextBox ID="txtTotalAmountIAP" runat="server" Width="80" Enabled="false"></asp:TextBox>
                                </td>
                                <td>
                                    Total Amount of Improper Payment<br />
                                   
                                </td> 
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;5.&nbsp;<asp:TextBox ID="txtTotalPayment" runat="server" Width="80" Enabled="false"></asp:TextBox>
                                </td>
                                <td>
                                    Total Payment Amount for Sample Month<br />
                                    
                                </td> 
                            </tr>
                        </table>--%>
                        <asp:RadioButtonList ID="rdoResult" runat="server" Height="27px" Width="180px" Style="display: none">
                            <asp:ListItem Value="0">Error</asp:ListItem>
                            <asp:ListItem Value="1">No Error</asp:ListItem>
                            <asp:ListItem Value="2">Insufficient Documentation</asp:ListItem>
                            <asp:ListItem Value="3">Overpayment</asp:ListItem>
                            <asp:ListItem Value="4">Underpayment</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="height: 1px">
                        <img src="../images/spacer.gif" width="180px" height="1px" alt="" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="7" width="100%"><hr /></td>
    </tr>
    <%--<tr id="LastFormFooter" runat="server" visible="false">
        <td colspan="7" width="100%"><uc4:PageDetailFooter runat="server" /></td>
    </tr>--%>
</table>
