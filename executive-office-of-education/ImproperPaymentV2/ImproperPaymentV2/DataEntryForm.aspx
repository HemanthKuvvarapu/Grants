<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DataEntryForm.aspx.cs" Inherits="DataEntryForm" Title="Data Entry Data" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 600px;
        background-color: #F7F6F3; border-color: #E7E7FF; border-width: 1px; border-style: None;
        border-collapse: collapse;">
        <tr style="background-color: #D5D8E9">
            <td align="center" style="width: 50px">
                <b>Item #</b>
            </td>
            <td align="center" style="width: 450px">
                <b>Item</b>
            </td>
            <td align="center" style="width: 100px">
                <b>Coding</b>
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>1.</b>
            </td>
            <td>
                State
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryState" Text="MA" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>2.</b>
            </td>
            <td>
                County
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryCounty" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>3.</b>
            </td>
            <td>
                Child ID
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryChildID" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>4.</b>
            </td>
            <td>
                Sample Month/Year
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryMonth" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>5.</b>
            </td>
            <td>
                Record Review Date
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryReviewDate" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>6.</b>
            </td>
            <td>
                One or more case errors during sample review month 0=no errors, 1=one or more errors
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryErrorNum" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <!--
        <tr>
            <td align="center">
                <b>7.</b>
            </td>
            <td>
                Total amount of Underauthorization or Overauthorization during sample review month
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryImproperPayment" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>8.</b>
            </td>
            <td>
                Type of improper authorization for payment (U=Underauthorization, O=Overauthorization
                or NA = No Authorization Error)
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryImproperPaymentType" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        -->       
        <tr>
            <td align="center">
                <b>7.</b>
            </td>
            <td>
                Reason for error due to insufficient or missing documentation (Y=Yes, N=No or NA=No
                Error)
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryMissingDoc" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <b>8.</b>
            </td>
            <td>
                Total Authorization Amount during sample review month
            </td>
            <td align="center">
                <asp:Label ID="txtDataEntryTotalPaid" ForeColor="Blue" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3"><b>Reviewer name: </b><asp:Label ID="txtDataEntryReviewerName" ForeColor="Blue" runat="server" /></td>
        </tr>
    </table>
</asp:Content>
