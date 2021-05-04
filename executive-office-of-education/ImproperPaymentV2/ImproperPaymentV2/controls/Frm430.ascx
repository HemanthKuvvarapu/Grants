<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Frm430.ascx.cs" Inherits="controls_Frm430" %>

<table id="frm430" cellspacing="0" border="0" style="border-collapse: collapse;" runat="server">
    <tr>
        <td>
            Case Record Subsidy Amount Authorized:
            <asp:TextBox ID="txtCaseRecordSubsidyAmountAuthorized" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Subsidy Amount Authorized:
            <asp:TextBox ID="txtReviewerSubsidyAmountAuthorized" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordSubsidyAmountAuthorized.ClientID%>');
                
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerSubsidyAmountAuthorized.ClientID%>');
                
                function updateReviewerEntryData430()
                {
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerSubsidyAmountAuthorized.ClientID%>');
                }
            </script>
        </td>
    </tr>
</table>