<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" Title="IP Reports Listing" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
				<table width="500" cellspacing="1" cellpadding="1">
					<tr>
						<td>
							<asp:GridView id="grdReports" runat="server" Height="16px" Width="500px" AutoGenerateColumns="False"
                                 onrowdatabound="grdReports_RowDataBound" onrowcommand="grdReports_RowCommand">
								<Columns>
                                    <asp:BoundField HeaderText="Report ID" DataField="ReportID"><HeaderStyle HorizontalAlign="Center" Width="70px"/><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField HeaderText="Report Name" DataField="ReportName" ><HeaderStyle HorizontalAlign="Center" Width="350px"/></asp:BoundField>
                                    <asp:BoundField HeaderText="Report File Name" DataField="ReportFileName" Visible="False" ></asp:BoundField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="false" 
                                                CommandName="" Text="" Width="80px"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="80px"/>
                                    </asp:TemplateField>
                                </Columns>
							</asp:GridView>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center"> &nbsp;</td>
		</tr>
	</table>
</asp:Content>
