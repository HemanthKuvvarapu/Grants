<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage0.master" CodeFile="MIDTableForm.aspx.cs" Inherits="MIDTableForm" Title="Improper Payment MID Table" %>
<%@ MasterType  virtualPath="~/MasterPage0.master"%> 


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <script type="text/javascript">
        function fnPrint() {
            document.getElementById('savePrintnCancel').hidden = true;
            print();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 500px;
            background-color: #F0F5F2; border-color: #E7E7FF; border-width: 1px; border-style: None;
            border-collapse: collapse;">
    <%--<tr>
        <td style="text-align:left"><b>Child Name:</b>&nbsp;&nbsp<asp:Label ID="lblChildName" runat="server" Text=""></asp:Label></td>
    </tr>--%>
    <tr>
        <td style="text-align:left"><b>Child ID:</b>&nbsp;&nbsp<asp:Label ID="lblChildId" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="9" style="text-align:left">
            <asp:Label ID="lblErrMsg" ForeColor="Red" runat="server" Text =""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="9" class="auto-style1">
        <asp:GridView ID="grdMIDList" runat="server" AllowSorting="False" AutoGenerateColumns="False" border="1" CellPadding="1" CellSpacing="1"  
                   BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" ForeColor="Black" 
                   GridLines="Vertical"
                   onrowdatabound="grdMIDList_RowDataBound" >
<%--            <RowStyle BackColor="#F7F7DE" />--%>
                              
            <columns>                
                
                <asp:TemplateField HeaderText="1">
                    <ItemTemplate>
                        <asp:TextBox ID="txtElementID" runat="server" Width="40" VerticalAlign="top"   ReadOnly="true" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="40px"/>
                    <ItemStyle VerticalAlign="Top" />
                    <ItemStyle BackColor="LightGray" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="2">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion2" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120" TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="3">
                       <ItemTemplate>
                        <asp:TextBox ID="txtQuestion3" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120" TextWrapping="Wrap" Font-Size="10px" ></asp:TextBox>
                        <asp:CompareValidator ID="Q3ValidMoney" runat="server" ValidationGroup="MoneyValidationGroup" Type="Currency" Operator="DataTypeCheck" SetFocusOnError="true" ErrorMessage="Please enter a valid money amount, no $ sign" Display="Dynamic" ControlToValidate="txtQuestion3" EnableClientScript="false"></asp:CompareValidator>
                        </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="4">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion4" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="5">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion5" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="6">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion6" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="7">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion7" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="8">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion8" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                        <asp:CompareValidator ID="Q8ValidMoney" runat="server" ValidationGroup="MoneyValidationGroup" Type="Currency" Operator="DataTypeCheck" SetFocusOnError="true" ErrorMessage="Please enter a valid money amount, no $ sign" Display="Dynamic" ControlToValidate="txtQuestion8"></asp:CompareValidator>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="9">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuestion9" runat="server" TextMode="MultiLine" cols="30" rows="2" Height="150px" Width="120"  TextWrapping="Wrap" Font-Size="10px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                    <ItemStyle Wrap="true" />
                </asp:TemplateField>
             </columns>

            <HeaderStyle BackColor="Silver" CssClass="button"/>
            <RowStyle CssClass="pagetext" Font-Size="Small"/>
            <AlternatingRowStyle BackColor="#FFFFC0" />
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />


        </asp:GridView>
        </td>
    </tr>
       
    <tr id="savePrintnCancel">
        <td colspan="2" align="right">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="80" 
                onclick="btnSave_Click"  />
        </td>
        <td align="left"><button id="btnCancel" style="width:100px" onclick="javascript:window.close();">Cancel/Close</button></td>
        <td align="left"><button id="btnPrint" style="width:100px" onclick="javascript:fnPrint();">Print</button></td>
    </tr>
</table>
</asp:Content>
