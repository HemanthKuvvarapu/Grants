<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Assignments.aspx.cs" Inherits="Assignments" Title="Untitled Page" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="EECAjaxExtender" namespace="EEC.AspNet.CustomAjaxExtender" tagprefix="cc2" %>

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
            <asp:ListItem Value="11/01/2007">11/01/2007</asp:ListItem>
            <asp:ListItem Value="10/01/2007">10/01/2007</asp:ListItem>
            </asp:DropDownList>&nbsp;</td>
        <td><asp:Button ID="btnAssignMonth" runat="server" Text="Select" 
                onclick="btnAssignMonth_Click" /></td>
            </table>
        </td>
    </tr>
    <tr>
        <td><img src="images/spacer.gif" width="1px" height="5px" alt="" /></td>
    </tr>
    <tr>
        <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
            <asp:GridView ID="grdChild" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" CssClass="formtext" ForeColor="#333333" GridLines="None" 
        onrowcommand="grdChild_RowCommand" onrowdatabound="grdChild_RowDataBound" DataSourceID="srcRecords" PageSize="30" AllowPaging="True" AllowSorting="True">
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:BoundField HeaderText="First Name" DataField="FirstName" SortExpression="FirstName">
            <HeaderStyle HorizontalAlign="Left" Width="120px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Last Name" DataField="LastName" SortExpression="LastName">
            <HeaderStyle HorizontalAlign="Left" Width="120px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Selected Month" DataField="ServiceDate" SortExpression="ServiceDate" >
            <HeaderStyle HorizontalAlign="Center" Width="100px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Funding" DataField="Funding" SortExpression="Funding">
            <HeaderStyle HorizontalAlign="Center" Width="80px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Vendor" DataField="VendorName" SortExpression="VendorName">
            <HeaderStyle HorizontalAlign="Left" Width="350px" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Completed" DataField="Completed" >
            <HeaderStyle HorizontalAlign="Center" Width="80px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Assign To">
            <HeaderStyle HorizontalAlign="Center" Width="150px" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="btnAssign" runat="server" CausesValidation="false" 
                    CommandName="" Text="Assign"></asp:LinkButton>
                <cc2:EECModalPopupExtender ID="lnkAssign_ModalPopupExtender" 
                                        runat="server" BackgroundCssClass="modalBackground" 
                                        CancelControlID="ButtonCancel" DisplayCloseAnimation="CenterShrink" 
                                        DisplayOpenAnimation="CenterExpand" DropShadow="True" DynamicServicePath="" 
                                        Enabled="True" OkControlID="ButtonOK" PopupControlID="pnlPopUpWindow" 
                                        TargetControlID="btnAssign" AnimationStartColor="d7d7d7" AnimationEndColor="cccccc">
                                    </cc2:EECModalPopupExtender>
                                    <asp:Panel ID="pnlPopUpWindow" runat="server" style="display:none; width:340px; background-color:#f4f7ec; border:solid 3px #b89c00">
                                        <table align="center" cellspacing="0" cellpadding="0" border="0" style="width:300px">
                                            <tr>
                                                <td><br /></td>
                                            </tr>
                                            <tr>
                                                <td>Assign To <asp:DropDownList ID="cboUser" Width="220px" runat="server">
                            
                                                </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td><br /></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center;">
                                                    <asp:Button ID="ButtonOk" runat="server" Text="OK" Width="80px" 
                                                    CausesValidation="False" UseSubmitBehavior="False"/>
                                                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="80px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><br /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                <asp:HiddenField ID="txtRecID" runat="server" />
                <asp:HiddenField ID="txtServiceDate" runat="server" />
                <asp:HiddenField ID="txtType" runat="server" />
                <asp:HiddenField ID="txtUserID" runat="server" />
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
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cboMonth" Name="month" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>        
</asp:Content>

