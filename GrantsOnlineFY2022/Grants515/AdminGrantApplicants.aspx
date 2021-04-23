<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminGrantApplicants.aspx.cs" Inherits="AdminGrantApplicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div runat="server" id="StartLinkDiv" visible="true">
    <table id=tblAdmin runat=server width=100% cellpadding=0 cellspacing=0 border=0>
    <tr>
        <td>&nbsp;</td>
        <td><asp:Label ID="lblSuccess" runat="server" ForeColor="Green">Save Successfully</asp:Label></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td><asp:Label ID="lblFailed" runat="server" ForeColor="Red">Save Failed</asp:Label></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td><asp:GridView ID="grdApplicants" runat="server" AutoGenerateColumns="False" 
                   BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                   CellPadding="2"  ForeColor="Black" 
                   GridLines="Vertical" Width="900px" 
                onrowdatabound="grdApplicants_RowDataBound" >
                   <RowStyle BackColor="#F7F7DE" />
                   
                   <Columns>
                       <asp:BoundField DataField="GrantApplicantId" HeaderText="Id">
                           <ItemStyle Width="30px" />
                       </asp:BoundField>
                       <asp:TemplateField HeaderText="Awarded">
                           <ItemTemplate>
                               <asp:CheckBox ID="chkAwarded" runat="server" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Agency Name">
                           <ItemTemplate>
                               <asp:TextBox ID="txtAgencyName" runat="server" Width="350"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="350px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Program Name">
                           <ItemTemplate>
                               <asp:TextBox ID="txtProgramName" runat="server" Width="300"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="300px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Total">
                           <ItemTemplate>
                               <asp:TextBox ID="txtEligAmount" runat="server" Width="80" Enabled="false"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="80px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Amount">
                           <ItemTemplate>
                               <asp:TextBox ID="txtOriginalAmount" runat="server" Width="80"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                   ControlToValidate="txtOriginalAmount" Display="Dynamic" 
                                   ErrorMessage="Please input an amount."></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                   ControlToValidate="txtOriginalAmount" Display="Dynamic" 
                                   ErrorMessage="Please enter a valid currency format." Operator="DataTypeCheck" 
                                   Type="Currency"></asp:CompareValidator>
                           </ItemTemplate>
                           <ItemStyle Width="80px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="BA#1">
                           <ItemTemplate>
                               <asp:TextBox ID="txtBA1" runat="server" Width="80"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                   ControlToValidate="txtBA1" Display="Dynamic" 
                                   ErrorMessage="Please input an amount."></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                   ControlToValidate="txtBA1" Display="Dynamic" 
                                   ErrorMessage="Please enter a valid currency format." Operator="DataTypeCheck" 
                                   Type="Currency"></asp:CompareValidator>
                           </ItemTemplate>
                           <ItemStyle Width="80px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="BA#2">
                           <ItemTemplate>
                               <asp:TextBox ID="txtBA2" runat="server" Width="80"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                   ControlToValidate="txtBA2" Display="Dynamic" 
                                   ErrorMessage="Please input an amount."></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                   ControlToValidate="txtBA2" Display="Dynamic" 
                                   ErrorMessage="Please enter a valid currency format." Operator="DataTypeCheck" 
                                   Type="Currency"></asp:CompareValidator>
                           </ItemTemplate>
                           <ItemStyle Width="80px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="BA#3">
                           <ItemTemplate>
                               <asp:TextBox ID="txtBA3" runat="server" Width="80"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                   ControlToValidate="txtBA3" Display="Dynamic" 
                                   ErrorMessage="Please input an amount."></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                   ControlToValidate="txtBA3" Display="Dynamic" 
                                   ErrorMessage="Please enter a valid currency format." Operator="DataTypeCheck" 
                                   Type="Currency"></asp:CompareValidator>
                           </ItemTemplate>
                           <ItemStyle Width="80px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="VendorCode">
                           <ItemTemplate>
                               <asp:TextBox ID="txtVendorCode" runat="server" Width="110"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="110px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="MMarsId">
                           <ItemTemplate>
                               <asp:TextBox ID="txtMMarsId" runat="server" Width="190"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="190px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="ADNumber">
                           <ItemTemplate>
                               <asp:TextBox ID="txtADNumber" runat="server" Width="50"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="50px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Address 1">
                           <ItemTemplate>
                               <asp:TextBox ID="txtAddress1" runat="server" Width="200"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="200px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Address 2">
                           <ItemTemplate>
                               <asp:TextBox ID="txtAddress2" runat="server" Width="200"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="200px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="City">
                           <ItemTemplate>
                               <asp:TextBox ID="txtCity" runat="server" Width="150"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="150px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="State">
                           <ItemTemplate>
                               <asp:TextBox ID="txtState" runat="server" Width="30"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="30px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Zipcode">
                           <ItemTemplate>
                               <asp:TextBox ID="txtZipcode" runat="server" Width="50"></asp:TextBox>
                           </ItemTemplate>
                           <ItemStyle Width="50px" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="PCHP">
                           <ItemTemplate>
                               <asp:CheckBox ID="chkPCHP" runat="server" />
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   
                   <FooterStyle BackColor="#CCCC99" />
                   <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                   <AlternatingRowStyle BackColor="White" />
                    
               </asp:GridView></td>
    </tr>
</table>

        <table>
            <tr>
                <td style="height:100px;width:600px" align="center"><asp:Button ID="Button1" 
                        runat="server" Text="Save Changes" onclick="Button1_Click" /></td>
            </tr>
        </table>
        
    </div>

</asp:Content>
