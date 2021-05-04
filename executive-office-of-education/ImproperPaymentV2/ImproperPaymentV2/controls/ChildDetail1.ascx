<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChildDetail1.ascx.cs" Inherits="controls_ChildDetail1" %>

<table id="childInfo1" class="formtext" cellpadding="5" cellspacing="0" border="0"
    style="width: 100%; background-color: #dde9d5">
    <tr>
        <td style="width: 100%">
            <b>Name: </b>
            <span style="color: blue"><asp:Label ID="txtChildName" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; <b>Date of Birth: </b>
            <span style="color: blue"><asp:Label ID="txtChildDOB" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; <b>SSN: </b>
            <span style="color: blue"><asp:Label ID="txtChildSSN" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td style="width: 100%">
            <b>Vendor: </b><span style="color: blue">
                <asp:Label ID="txtVendorName" runat="server" Text="Label" Style="width: 400px; padding: 2px"
                    ToolTip="Here is the vendor name"></asp:Label></span> &nbsp;&nbsp;&nbsp;&nbsp;
            <b>Service Date: </b><span style="color: blue">
                <asp:Label ID="txtServiceDate" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; <b>Funding: </b><span style="color: blue">
                <asp:Label ID="txtFunding" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; <b>Placement: </b><span style="color: blue">
                <asp:Label ID="txtPlacement" runat="server" Text="INITIAL ASSESSMENT" Style="width: 400px;
                    padding: 2px"></asp:Label></span> &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
</table>
