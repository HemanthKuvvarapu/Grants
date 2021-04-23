<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="CenterBaseHome.aspx.cs" Inherits="HeadStart_CenterBaseHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
        }
        .auto-style2
        {
            height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <legend><span class="style13">Head Start and Early Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Center-Based</span></legend>
<div>
<table id="tblHSCenterbased" runat="server" width=100% border=0>
    
    <tr>
        
        <%--<td><span class="style5">Enter number of&nbsp; Head Start Centerbase programs :&nbsp;</span><br 
                class="style5" />
            <span class="style5">Please enter zero and click &quot;save program&quot; and &quot;continue&quot; 
            if their are no Head Start Centerbased programs</span></td>
        <td><asp:TextBox ID="txtTotalCbPrograms" runat="server" MaxLength="2" Width="75px" 
                AutoPostBack="True" ontextchanged="txtTotalCbPrograms_TextChanged" 
                style="text-align: center"></asp:TextBox>
                <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17"
                                    runat="server" TargetControlID="txtTotalCbPrograms" FilterType="Numbers">
                                </ajaxControlToolkit:FilteredTextBoxExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtTotalCbPrograms" Display="Dynamic" 
                ErrorMessage="Please enter a value">Please enter a value</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtTotalCbPrograms" Display="Dynamic" 
                ErrorMessage="Invalid Number" Operator="DataTypeCheck" SetFocusOnError="True" 
                Type="Integer">Invalid Number</asp:CompareValidator>
        </td>--%>
    </tr>
    
				<tr>
					<td colSpan="2">
                        <asp:GridView id="grdHSCenterbase" runat="server" Width="100%" 
                            DataKeyNames="HeadStartCBLeadAgencyIDNumber" Font-Size="10pt" AutoGenerateColumns="False" 
                            CellPadding="4" onrowcommand="grdHSCenterbase_RowCommand" 
                            onrowdeleting="grdHSCenterbase_RowDeleting" style="text-align: Center" 
                            ForeColor="#333333" GridLines="Vertical" onrowdatabound="grdHSCenterbase_RowDataBound" EnableModelValidation="True" >
							<FooterStyle ForeColor="White" BackColor="#1C5E55" Font-Bold="True"></FooterStyle>
							<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
							<SelectedRowStyle ForeColor="#333333" BackColor="#C5BBAF" Font-Bold="True" />
							<RowStyle BackColor="#E3EAEB" />
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#1C5E55"></HeaderStyle>
							<Columns>
                            <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
							   <asp:CommandField CausesValidation="False" ShowDeleteButton="True" >
                                <HeaderStyle Width="80px" />
                                </asp:CommandField>
								<asp:BoundField DataField="HeadStartFacilityName" HeaderText="Program Name" />
								<asp:BoundField DataField="ProgramNumber" HeaderText="Program Number" />
								<asp:BoundField DataField="Address" HeaderText="Address" />
								<asp:BoundField DataField="City" HeaderText="City" />
								<asp:BoundField DataField="EECLicensedCapacity" HeaderText="EEC Licensed Capacity" />
							    <asp:BoundField DataField="TotalNumberClassrooms" HeaderText="Total # of Classrooms" />
							</Columns>
						    <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
						</asp:GridView></td>
				</tr>
				<tr><td colspan=2>&nbsp;</td></tr>
               <tr>
                <td align="center" class="auto-style2">
                    <asp:Button ID="btnAddNew" runat="server" Text="Add Center-Based Program(s)" 
                        onclick="btnAddNew_Click" />
                </td>
            </tr>
    <tr id="trHasHSCenterBased" visible="true">
                <td colspan=2 align=center class="style6">
                    <br />
                            <br />
                    <input type="button" onclick="location.href = 'HSSurveyHome.aspx'"  value="Home" />
                    
                    &nbsp;&nbsp;&nbsp;<input type="button" onclick="location.href = 'HSFamHome.aspx'"  value="Continue" />
                </td>
                </tr>
    </table>    
    </div>
</asp:Content>


