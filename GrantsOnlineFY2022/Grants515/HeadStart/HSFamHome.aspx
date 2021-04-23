<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSFamHome.aspx.cs" Inherits="HeadStart_HSFamHome" %>

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
        background-color: #FFCCCC;
    }
    .style9
    {
        font-weight: bold;
        background-color: #FFCCCC;
    }
    .style10
    {
        height: 23px;
    }
    .style11
    {
        background-color: #FFCCCC;
    }
    .style12
    {
        font-family: Verdana;
    }
    .style13
    {
        font-size: small;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <legend><span class="style13">Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Family Child Care</span></legend>
<table id=tblHSFCC runat=server width=100% border=0>
    
    
				<tr>
					<td>
                        <asp:GridView id="grdHSFCC" runat="server" Width="100%" 
                            DataKeyNames="HeadStartFCCLeadAgencyIDNumber" Font-Size="10pt" AutoGenerateColumns="False" 
                            CellPadding="4" onrowcommand="grdHSFCC_RowCommand" 
                            onrowdeleting="grdHSFCC_RowDeleting" style="text-align: center" 
                            ForeColor="#333333" GridLines="None" onrowdatabound="grdHSFCC_RowDataBound">
							<FooterStyle ForeColor="White" BackColor="#990000" Font-Bold="True"></FooterStyle>
							<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
							<SelectedRowStyle ForeColor="Navy" BackColor="#FFCC66" Font-Bold="True" />
							<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#990000"></HeaderStyle>
							<Columns>
                                <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
							   <asp:CommandField CausesValidation="False" ShowDeleteButton="True" >
                                <HeaderStyle Width="80px" />
                                </asp:CommandField>
								<asp:BoundField DataField="FamilyChildCareProviderName" HeaderText="Family Childcare Provider Name" />
								<asp:BoundField DataField="ProgramNumber" HeaderText="Program Number" />
								<asp:BoundField DataField="Address" HeaderText="Address" />
								<asp:BoundField DataField="ZipCode" HeaderText="Zip Code" />
								<asp:BoundField DataField="LicensedCapacity" HeaderText="FCC Licensed Capacity" />
							</Columns>
                            <AlternatingRowStyle BackColor="White" />
						</asp:GridView></td>
				</tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
                <td align="center" class="auto-style2">
                    <asp:Button ID="btnAddNew" runat="server" Text="Add New Family Child Care" 
                        onclick="btnAddNew_Click" />
                </td>
            </tr>
    <tr id="trHasHSCenterBased" visible="true">
                <td colspan=2 align=center class="style6">
                    <br />
                            <br />
                    <input type="button" onclick="location.href = 'HSSurveyHome.aspx'"  value="Home" />
                    
                    &nbsp;&nbsp;<input type="button" onclick="location.href = 'HSHome.aspx'"  value="Continue" />
                </td>
                </tr>
    </table>
</asp:Content>

