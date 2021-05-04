<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectchild.aspx.cs" Inherits="selectchild" Title="IAP Sample Child Listing" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0">
    <tr style="background-color:#dde9d5">
        <td>
        <table>
        <tr>
        <td ><b>Month&nbsp;</b></td>
        <td><asp:DropDownList ID="cboMonth" runat="server">
            <asp:ListItem Value="">All</asp:ListItem>
            </asp:DropDownList>&nbsp;</td>
        <td><asp:Button ID="btnSelectMonth" runat="server" Text="Select" 
                onclick="btnSelectMonth_Click" /></td>
            </table>
        </td>
    </tr>
    <tr>
        <td><img src="images/spacer.gif" width="1px" height="5px" alt="" />
            <asp:HiddenField ID="hidHideNames" runat="server" Value="" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
            <asp:GridView ID="grdChild" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" CssClass="formtext" ForeColor="#333333" GridLines="None" 
        onrowcommand="grdChild_RowCommand" onrowdatabound="grdChild_RowDataBound" 
                DataSourceID="srcRecords" PageSize="28" AllowPaging="True" AllowSorting="True">
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:BoundField HeaderText="ID" DataField="SampleID" 
            SortExpression="ID" >
            <HeaderStyle HorizontalAlign="Left" Width="40px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="First Name" DataField="FirstName" 
            SortExpression="FirstName" >
            <HeaderStyle HorizontalAlign="Left" Width="100px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Last Name" DataField="LastName" 
            SortExpression="LastName" >
            <HeaderStyle HorizontalAlign="Left" Width="100px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Selected Month" DataField="ServiceDate" 
            SortExpression="ServiceDate" >
            <HeaderStyle HorizontalAlign="Left" Width="100px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Funding" DataField="Funding" 
            SortExpression="Funding" >
            <HeaderStyle HorizontalAlign="Center" Width="80px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Source" DataField="Source" 
            SortExpression="Source" >
            <HeaderStyle HorizontalAlign="Center" Width="80px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Vendor" DataField="VendorName" 
            SortExpression="VendorName" >
            <HeaderStyle HorizontalAlign="Left" Width="350px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Completed" DataField="Completed" SortExpression="Completed" >
            <HeaderStyle HorizontalAlign="Center" Width="80px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Data Form">
            <ItemTemplate>
                <asp:LinkButton ID="btnView" runat="server" CausesValidation="false" 
                    CommandName="" Text="View"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="false" 
                    CommandName="" Text="Select"></asp:LinkButton>
                <asp:HiddenField ID="txtRecID" runat="server" />
                <asp:HiddenField ID="txtServiceDate" runat="server" />
                <asp:HiddenField ID="txtType" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
        </ContentTemplate>
                        </asp:UpdatePanel>
        </td>
    </tr>
</table>

<asp:ObjectDataSource ID="srcRecords" runat="server" 
                                    SelectMethod="LoadAllChild" TypeName="CChild" 
                                    UpdateMethod="LoadAllChild">
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="cboMonth" Name="month" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="hidHideNames" Name="HideNames" 
                                            PropertyName="Value" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cboMonth" Name="month" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="hidHideNames" Name="HideNames" 
                                            PropertyName="Value" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>    
</asp:Content>

