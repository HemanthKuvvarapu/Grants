<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHelp.aspx.cs" Inherits="AdminHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id=tblAdmin runat=server width=100% cellpadding=0 cellspacing=0 border=0>
    <tr>
        <td>&nbsp;</td>
        <td><asp:GridView ID="grdApplicants" runat="server" AutoGenerateColumns="true" 
                   BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                   CellPadding="2"  ForeColor="Black" 
                   GridLines="Vertical" Width="100%" >
                   <RowStyle BackColor="#F7F7DE" />
                   
                   <FooterStyle BackColor="#CCCC99" />
                   <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                   <AlternatingRowStyle BackColor="White" />
                    
               </asp:GridView></td>
    </tr>
</table>
</asp:Content>


