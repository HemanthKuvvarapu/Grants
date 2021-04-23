<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSHome.aspx.cs" Inherits="HeadStart_HSHome" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        color: #CC0000;
    }
    .style7
    {
        height: 50px;
        background-color: #99CCFF;
    }
    .style9
    {
        font-weight: bold;
        background-color: #99CCFF;
    }
    .style10
    {
        height: 23px;
    }
    .style11
    {
        background-color: #99CCFF;
    }
    .style12
    {
        background-color: #99CCFF;
    }
    .style13
    {
        background-color: #99CCFF;
        }
    .style14
    {
        height: 50px;
        background-color: #99CCFF;
        }
    .style16
    {
        font-family: Verdana;
    }
    .style17
    {
        font-size: small;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <legend>&nbsp;<span class="style17">Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Home-Based</span></legend>
        <table id=tblHSHome runat=server width=100% border=0>
    
    
				<tr>
					<td>
                        <asp:GridView id="grdHSHSHomeBase" runat="server" Width="100%" 
                            DataKeyNames="HSHBSiteID" Font-Size="10pt" AutoGenerateColumns="False" 
                            CellPadding="4" onrowcommand="grdHSHSHomeBase_RowCommand" 
                            onrowdeleting="grdHSHSHomeBase_RowDeleting" style="text-align: center" 
                            ForeColor="#333333" GridLines="None" onrowdatabound="grdHSHSHomeBase_RowDataBound" EnableModelValidation="True">
							<FooterStyle ForeColor="White" BackColor="#507CD1" Font-Bold="True"></FooterStyle>
							<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
							<SelectedRowStyle ForeColor="#333333" BackColor="#D1DDF1" Font-Bold="True" />
							<RowStyle BackColor="#EFF3FB" />
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#507CD1"></HeaderStyle>
							<Columns>
                                <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
							   <asp:CommandField CausesValidation="False" ShowDeleteButton="True" >
                                <HeaderStyle Width="80px" />
                                </asp:CommandField>
								<asp:BoundField DataField="ProgramName" HeaderText=" Program Name" />
								<asp:BoundField DataField="Address" HeaderText="Address" />
								<asp:BoundField DataField="Zipcode" HeaderText="Zip Code" />
								<asp:BoundField DataField="FundedCapacityHeadstart" HeaderText="Funded Capacity Headstart" />
							    <asp:BoundField DataField="FundedCapacityEarlyHeadStart" HeaderText="Funded capacity Early Head Start" />
							</Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
						</asp:GridView></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
    <tr>
                <td align="center" class="auto-style2">
                    <asp:Button ID="btnAddNew" runat="server" Text="Add New Home-Based Program" 
                        onclick="btnAddNew_Click" />
                </td>
            </tr>
    <tr id="trHasHSCenterBased" visible="true">
                <td colspan=2 align=center class="style6">
                    <br />
                            <br />
                    <input type="button" onclick="location.href = 'HSSurveyHome.aspx'"  value="Home" />
                    
                    &nbsp;&nbsp;
                </td>
                </tr>
    
</table>
</asp:Content>

