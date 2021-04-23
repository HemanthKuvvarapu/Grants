<%@ Page Language="C#" MasterPageFile="~/MasterPageNEW.master" AutoEventWireup="true" CodeFile="BudgetNarrativeSubcontractorHome.aspx.cs" Inherits="BudgetNarrativeSubcontractorHome" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPageNEW.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        p.MsoNormal
        {
            margin-bottom: .0001pt;
            font-size: 11.0pt;
            font-family: "Calibri" , "sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        .style344
        {
            color: #000099;
        }
        .styleErrors
        {
            color: #ff0000;
        }
        .styleWarnings
        {
        	color: Blue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table id="tblSCs" runat="server" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:GridView ID="grdSCs" runat="server" AutoGenerateColumns="False" DataKeyNames="BudgetNarrativeID"
                        AlternatingRowStyle-CssClass="AlternateColor2"
                        Width="920px" Height="42px" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                        GridLines="Vertical" onrowdatabound="grdSCs_RowDataBound" 
                        onrowdeleting="grdSCs_RowDeleting" onrowcommand="grdSCs_RowCommand" 
                        EnableModelValidation="True" >
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" >
                                <HeaderStyle Width="80px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="SubcontractorName" HeaderText="Subcontractor/Provider Name">
                                <HeaderStyle HorizontalAlign="Left" Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SubcontractorContactName" HeaderText="Fiscal Contact Name">
                                <HeaderStyle HorizontalAlign="Left" Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GrantTotal" DataFormatString="{0:c}" 
                                HeaderText="Total Costs" HtmlEncode="true">
                                <HeaderStyle Width="100px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Error(s)/Warning(s)" >
                                <HeaderStyle Width="220px" />
                            </asp:BoundField>
                            
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="width:100%;color:#ff0000">
                                <tr>
                                    <td align="center"><b>No Subcontractor/Provider Found</b></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                        <AlternatingRowStyle CssClass="AlternateColor2" BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center" style="height:70px">
                    <asp:Button ID="btnAddNew" runat="server" Text="Add New Subcontractor/Provider" 
                        onclick="btnAddNew_Click" />
                </td>
            </tr>
        </table>
</asp:Content>

