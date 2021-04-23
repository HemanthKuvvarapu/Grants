<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminViewPDF.aspx.cs" Inherits="AdminViewPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 114px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="tblGrant" runat="server" width="100%">
        <tr>
            <td class="style1">Select Grant Type:&nbsp;</td>
            <td><asp:DropDownList ID="ddlGrantType" runat="server"></asp:DropDownList>&nbsp;<asp:Button ID="btnSelectGrantType" runat="server" Text="Go" OnClick="btnSelectGrantType_Click" /></td>
        </tr> 
    </table>
    <table id="tblData" visible="false" runat="server" width="100%" border="0">
        <tr>
            <td colspan="2">
                <i>By default all the agencies are listed below. If you want to search for a specific agency then enter the agency name (at least 3 characters) and click search. </i>
            </td>
        </tr>
        <tr>
            <td>Enter Agency Name:&nbsp;</td>
            <td><asp:TextBox ID="txtAgencyName" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><asp:Button ID="btnFilterData" runat="server" Text="Search" OnClick="btnFilterData_Click" />&nbsp;&nbsp;
                <asp:Button ID="btnGetAllData" runat="server" Text="Get All Agencies" OnClick="btnGetAllData_Click" />
            &nbsp; <a href="AdminView.aspx" target=""> << Back to Home Page</a>
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblGrantInfo" runat="server" Text="Selected Grant" Font-Bold="true"></asp:Label>
                <br /><br />
                <asp:GridView ID="grdData" Width="100%" runat="server" 
                    DataKeyNames="GrantApplicantId" OnRowCommand="grdData_RowCommand" 
                    CellPadding="3" GridLines="Horizontal" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    onrowdatabound="grdData_RowDataBound" >
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:ButtonField Text="Print PDF" ButtonType="Link" CommandName="Print" 
                            ControlStyle-Width="100px" >
                    <ControlStyle Width="100px"></ControlStyle>
                        </asp:ButtonField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <div>No Records Found.</div>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
        </table>   
</asp:Content>

