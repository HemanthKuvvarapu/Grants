<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW.master" AutoEventWireup="true" CodeFile="BudgetNarrativeSummary.aspx.cs" Inherits="BudgetNarrativeSummary" %>
<%@ MasterType VirtualPath="~/MasterPageNEW.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function showDetail(lnkObj, section) {
            var obj = document.getElementById(lnkObj);
            var tblRow = document.getElementById(section);

            if (tblRow && obj) {
                if (tblRow.style.display == "none") {
                    tblRow.style.display = "block";
                    obj.innerHTML = "Hide Detail";
                }
                else {
                    tblRow.style.display = "none";
                    obj.innerHTML = "Show Detail";
                }
            }
        }
    </script>
    <style type="text/css">
        .style336
        {
        	text-align: center;
            font-weight: bold;
            background-color: #FFCC99;
        }
        .style337
        {
        	text-align: center;
            font-weight: bold;
            background-color: #00FF00;
        }
        .style338
        {
            font-weight: bold;
            background-color: #FF6666;
            text-align: center;
        }
        .style92
        {
        	height: 45px;
            font-weight: bold;
            background-color: #FFCC99;
            text-align: left;
            padding-left:5px;
        }
        .style93
        {
        	height: 45px;
            font-weight: bold;
            background-color: #00FF00;
            text-align: left;
            padding-left:5px;
        }
        .style105
        {
        	height:45px;
            font-weight: bold;
            background-color: #FF6666;
            text-align: left;
            padding-left:5px;
        }
        .style5
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #cccccc;
            width: 218px;
        }
        .styleSub0
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 44px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub1
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FFCC99;
        }
        .styleSub2
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#FF6666;
        }
        .styleSub3
        {
        	text-align: right;
        	font-size: small;
        	font-family: Arial;
        	width: 80px;
        	height: 22px;
        	border-style:none;
        	background-color:#00FF00;
        }
        .style6
        {
            font-size: small;
            font-weight: bold;
            text-align: center;
            background-color: #ababab;
        }

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
        .style244
        {
            font-weight: bold;
            background-color: #FFFFFF;
            text-align: left;
        }
        .styleSubHeader
        {
        	font-size:13px;
        	font-family:Arial;
        	font-weight:normal;
        }
        .styleSubContent
        {
        	font-size:13px;
        	font-family:Arial;
        	font-weight:normal;
        	height:23px;
        }
        .styleErrors
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
            style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
            <tr>
                <td align="center" style="height: 50px; padding-top: 5px">
                    <span class="styleErrors">
                    Please correct the following error(s).<br />
                    <span style="font-weight:normal">
                    <asp:BulletedList ID="lstErrors" runat="server" CssClass="styleErrors">
                    </asp:BulletedList>
                    </span>
                    </span>
                    <br />
                </td>
            </tr>
        </table>
        <table id="tblError" style="width:100%" runat="server">
            <tr>
                <td>
                    <table id="tblErrorMessage" cellpadding="0" cellspacing="0" border="0" runat="server" style="background-color:Yellow;height:40px;width:100%;border:solid 1px #ff0000;font-family:Arial">
                        <tr>
                            <td style="color:Red;font-weight:bold;padding:5px">Please complete the Lead Agency/Subcontractors Budgets before generating the FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Summary.</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table id="tblHSBudget" style="width: 100%;" runat="server">
            <tr>
                <td><img src="images/spacer.gif" width="200px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="103px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="103px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="120px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="120px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="120px" height="1px" alt="" /></td>
                <td><img src="images/spacer.gif" width="88px" height="1px" alt="" /></td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Column A
                </td>
                <td class="style5">
                    Column B
                </td>
                <td class="style5">
                    Column C
                </td>
                <td class="style5">
                    Column D
                </td>
                <td class="style5">
                    Column E
                </td>
                <td class="style5">
                    Column F
                </td>
                <td class="style5">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Expenditure Category
                </td>
                <td class="style6">
                    #of<br />
                    Staff
                </td>
                <td class="style6">
                    FTE
                </td>
                <td class="style6">
                    Program<br /> Costs
                </td>
                <td class="style6">
                    Admin<br /> Costs
                </td>
                <td class="style6">
                    Total Grant<br /> Budget
                </td>
                <td class="style6">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style92">
                    1. Administrators
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailAdmin" runat="server" CssClass="buttonClass3">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewAdmin" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewAdmin_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    2. Instructional/<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Professional Staff
                </td>
                <td class="style336">
                    <asp:Label ID="txtIPSSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtIPSSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailIP" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewIP" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewIP_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    3. Support Staff
                </td>
                <td class="style336">
                    <asp:Label ID="txtSSSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtSSSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailSS" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewSS" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewSS_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    4. Fringe Benefits
                </td>
                <td class="style336">
                    <asp:Label ID="txtFBSubTotalNumofStaff" runat="server" CssClass="styleSub0">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtFBSubTotalFTE" runat="server" CssClass="styleSub0">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailFB" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewFB" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewFB_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    5. Contractual Services
                </td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailCS" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewCS" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewCS_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    6. Supplies &amp; Materials
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailSM" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewSM" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewSM_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    7. Travel
                </td>
                <td class="style336">
                    &nbsp;</td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailTravel" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewTravel" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewTravel_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    8. Other Costs
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailOC" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewOC" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewOC_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    9. Capacity Building
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailCB" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewCB" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewCB_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    10. Indirect Costs
                </td>
                <td class="style336" colspan="2"><span style="font-weight:normal">Lead Agency<br />Approved Rate:</span>&nbsp;<asp:Label ID="txtIndirectPercent" runat="server" CssClass="styleSub1">0</asp:Label>%</td>
                <td class="style336">&nbsp;</td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCosts" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCosts2" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailIndirect" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewIndirect" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewIndirect_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    11. Equipment
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailEquipment" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewEquipment" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewEquipment_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    12. Ancillary Services
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColD" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColF" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:HyperLink ID="lnkShowDetailAncillary" runat="server" CssClass="buttonClass3" NavigateUrl="">Show Detail</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdViewAncillary" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" EnableModelValidation="True" 
                        onrowdatabound="grdViewAncillary_RowDataBound" CellSpacing="2" 
                        ForeColor="Black" style="display:none">
                        <Columns>
                            <asp:BoundField HeaderText="Lead Agency/Subcontractor">
                            <HeaderStyle Width="192px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="# of Staff">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="FTE">
                            <HeaderStyle Width="105px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Program Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Admin Costs">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Requested Amount">
                            <HeaderStyle Width="121px" CssClass="styleSubHeader" />
                            <ItemStyle CssClass="styleSubContent" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="View/Edit" CssClass="buttonClass3"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleSubHeader" Width="85px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#956250" Font-Bold="True" ForeColor="White" Font-Size="11px" Font-Names="Arial" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style105">
                    GRAND TOTAL
                </td>
                <td class="style338">
                    &nbsp;
                </td>
                <td class="style338">
                    &nbsp;
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalD" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalF" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotal" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style93">
                    ELIGIBILITY AMOUNT
                </td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">&nbsp;</td>
                <td class="style337">
                    <span class="styleSub3">$</span><asp:Label ID="txtAllocationFund" runat="server" CssClass="styleSub3">0.00</asp:Label>
                </td>
                <td class="style337">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="7">&nbsp;</td>
            </tr>
            <tr>
                <td class="style244" colspan="7">
                    <asp:Literal ID="lblDocId" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
            <tr>
                <td align="center" style="height:100px">
                <asp:LinkButton ID="btnPrintBudgetSummary" runat="server" Text="Print Budget Summary" OnClick="btnPrintBudgetSummary_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnGoHome" 
                        Text="Go Back to Home" runat="server" onclick="btnGoHome_Click" CssClass="buttonClass" CausesValidation="False" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
