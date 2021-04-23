<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AmendmentHome.aspx.cs" Inherits="AmendmentHome" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td><u><b>General Instructions:</b></u></td>
    </tr>
    <tr>
        <td>
            <ul>
                <li><b>A Budget Amendment must be used if a grantee proposes to increase (+) or decrease (-) a category by more than 10% of the category</b>.</li>
                <li>All sections of the Budget Amendment must be completed and submitted to EEC at least 30 days prior to the proposed change and/or no later than <b><%=AppInfo.LastDateOfAmendment%></b> for final budget amendments. Amendments received after <b><%=AppInfo.LastDateOfAmendment%></b> will <b>NOT</b> be accepted.</li>
                <li>Please note that proposed changes may NOT be implemented until your Budget Amendment has been fiscally and programmatically approved.</li>
                <li><u>Grantees may only amend their budgets up to <b>THREE</b> times per year, unless EEC has required a budget amendment.</u></li>
                <li>Any changes to grant budgets must continue to adhere to the administration cost cap (<b>no more than 
                    10%</b>).</li>
                <li>Grantees must adhere to amendment guidelines and Budget Amendment Instructions for their specified grant program.</li>
                <li>Proposed Programmatic changes:  A Budget Amendment must be filed if the justification for programming and implementation of the grant will change significantly, even if there is no funding change on the line items.</li>
                <li>The Budget Amendment will be reviewed programmatically by the assigned Policy Analyst in tandem with Grants Administration for approval of fiscal revisions.  The approval will not occur until both have reviewed the requested changes.</li>
                <li>Please note that proposed changes may NOT be implemented until your Budget Amendment has been fiscally and programmatically approved.</li>
                <li><b>PLEASE DO NOT SEND ANY HARD COPIES OF YOUR BUDGET AMENDMENT UNTIL YOUR ELECTRONIC VERSION HAS BEEN APPROVED BY EEC.</b></li>
            </ul>
        </td>
    </tr>
    
</table>
<table id="tblLA" runat="server" border="0" cellpadding="0" cellspacing="0" style="background-color:#cccccc;border:solid 1px #333333" width="100%">
            <tr>
                <td align="center"><b>Lead Agency Amendment</b></td>
            </tr>
            <tr>
                <td>
                    <table id="tblLeadAgencyList" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">   
                        <tr>
                            <td style="height:50px"><b>&nbsp;Lead Agency:&nbsp;</b>
                                <asp:DropDownList ID="lstLeadAgency" runat="server"></asp:DropDownList>
                                <asp:Button ID="btnAddNewLA" runat="server" Text="Add New Lead Agency Amendment" onclick="btnAddNewLA_Click" /><br />
                                <b>Please click on box that says "Add New Lead Agency Amendment."</b>
                            </td>
                        </tr>
                    </table>             
                    <asp:GridView ID="grdLA" runat="server" AutoGenerateColumns="False" DataKeyNames="BudgetNarrativeID"
                        AlternatingRowStyle-CssClass="AlternateColor2"
                        Height="42px" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                        GridLines="Vertical" onrowdatabound="grdLA_RowDataBound" 
                        onrowdeleting="grdLA_RowDeleting" onrowcommand="grdLA_RowCommand" 
                        EnableModelValidation="True" Width="100%" >
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" >
                                <HeaderStyle Width="80px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="AgencyName" HeaderText="Lead Agency Name">
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
                            <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
                                <tr>
                                    <td align="center"><b>No Lead Agency Amendment Found</b></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                        <AlternatingRowStyle CssClass="AlternateColor2" BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <br />

<table id="tblSCs" runat="server" border="0" cellpadding="0" cellspacing="0" style="background-color:#cccccc;border:solid 1px #333333" width="100%">
            
            <tr>
                <td align="center"><b>Subcontractor Amendment List</b></td>
            </tr>
            <tr>
                <td>
                    <table id="tblSubContractorList" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">   
                        <tr>
                            <td style="height:50px"><b>&nbsp;Subcontractor:&nbsp;</b>
                                <asp:DropDownList ID="lstSubcontractor" runat="server"></asp:DropDownList>
                                <asp:Button ID="btnAddNewSC" runat="server" Text="Add New Subcontractor Amendment" onclick="btnAddNewSC_Click" /> <br /><br />
                                <b>
                                    Instructions: <br />
                                    Grantees must select the subcontractor budget amendment even if they are not amending any subcontractor budgets. <br />
                                    Please select the subcontractor from the dropdown list. <br /> 
                                    If you are not making any changes, click save on the bottom of the subcontractor budget. <br />
                                    The entire PDF needs to include all subcontractors and lead agency budget.
                                </b>
                            </td>
                        </tr>
                    </table>             
                    <asp:GridView ID="grdSCs" runat="server" AutoGenerateColumns="False" DataKeyNames="BudgetNarrativeID"
                        AlternatingRowStyle-CssClass="AlternateColor2"
                        Width="100%" Height="42px" BackColor="White" BorderColor="#DEDFDE" 
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
                            <asp:BoundField DataField="AgencyName" HeaderText="Subcontractor Name">
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
                            <table cellpadding="0" cellspacing="0" border="0" style="width:100%">
                                <tr>
                                    <td align="center"><b>No Subcontractor Amendment Found</b></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                        <AlternatingRowStyle CssClass="AlternateColor2" BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br /><br />
        
        
        <table id="tblSummary" runat="server" border="0" cellpadding="0" cellspacing="0" style="background-color:#cccccc;border:solid 1px #333333" width="100%">
            <tr>
                <td>        
                    <asp:GridView ID="grdSummary" runat="server" AutoGenerateColumns="False"
                        AlternatingRowStyle-CssClass="AlternateColor2"
                        Width="100%" Height="42px" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                        GridLines="Vertical" onrowdatabound="grdSummary_RowDataBound" 
                        EnableModelValidation="True" >
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:HyperLinkField Text="View Only">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="False" >
                                <HeaderStyle Width="80px" />
                            </asp:CommandField>
                            <asp:BoundField HeaderText="">
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
                                    <td align="center"><b>No Amendment Summary Found</b></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                        <AlternatingRowStyle CssClass="AlternateColor2" BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <table id="tblCoverPage" runat="server" border="0" cellpadding="0" cellspacing="0" style="background-color:#cccccc;border:solid 1px #333333" width="100%">
            <tr>
                <td>        
                    <asp:GridView ID="grdCover" runat="server" AutoGenerateColumns="False"
                        AlternatingRowStyle-CssClass="AlternateColor2"
                        Width="100%" Height="42px" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                        GridLines="Vertical" onrowdatabound="grdCover_RowDataBound" 
                        EnableModelValidation="True" onrowcommand="grdCover_RowCommand" >
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:HyperLinkField Text="View/Edit">
                                <HeaderStyle Width="80px" />
                            </asp:HyperLinkField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="False" >
                                <HeaderStyle Width="80px" />
                            </asp:CommandField>
                            <asp:BoundField HeaderText="">
                                <HeaderStyle HorizontalAlign="Left" Width="400px" />
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
                                    <td align="center"><b>No Amendment Cover Page Found</b><br />
                                                       <asp:Button ID="btnNewCoverPage" Text="New Amendment Cover Page" 
                                            runat="server" CommandName="New" />
                                </td>
                                </tr>
                                
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                                <tr>
                                    <td align="center">
                                        <b>Please click on box that says “New Amendment Cover Page.”</b>
                                    </td>
                                </tr>
                            </table>
                            
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                        <AlternatingRowStyle CssClass="AlternateColor2" BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <table id="tblSubmit" style="border: 1px solid #cccccc; background-color: #cccccc" runat="server" width="100%">
            <tr>
                <td style="padding: 5px; width: 85%">
                1. Please click the <b>SUBMIT</b> button when you have completed your Budget Amendment.<br />
                2. The <b>SUBMIT</b> button must be clicked in order for EEC to process your amendment.<br />
                3. Budget Amendments that do not have a submission date will not be processed.<br />
                4. Please send an email to <a href="mailto:EECSubmission@mass.gov">EECSubmission@mass.gov</a> to notify EEC that your amendment has been submitted.
                </td>  
                <td style="width: 15%;text-align:center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <br />
        <table id="printSummaryTable" runat="server" cellpadding="0" cellspacing="0" width="100%" style="background-color:#e6e6fa">
            <tr>
                <td style="padding: 5px" class="style6">
                    Click the <b>Print Summary</b> button to review your Budget Amendment as
                    a PDF. This PDF must be submitted as a hard copy with your Budget Amendment Cover Page.
                </td>
                <td style="text-align: center; padding: 1px 4px">
                    <asp:Button ID="btnPrintAllAmendment" runat="server" CausesValidation="false" Text="Print Summary"
                        OnClick="btnPrintAllAmendment_Click" />
                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0" border="0" >
             <tr>
                <td><u><b>Budget Amendment Process:</b></u></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>To alert EEC of your grant submission, please email <a href="EECSubmission@mass.gov">EECSubmission@mass.gov</a> with the subject line “<strong>FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment Submission Confirmation - <em>Your Agency Name</em></strong>”.</li>
                        <li>The "contact name" each grantee indicates on the Budget Amendment will be notified via email once the request has been approved or denied.</li>
                        <li><b>Grantees can begin to implement activities/funding changes ONLY AFTER the approval email is received.  You cannot spend your funds prior to this approval.</b></li>
                        <li>Grants Administration will forward all approved Budget Amendments to EEC’s 
                            Grants Contract staff for fiscal processing.  Grants Contract staff will mail a hard copy of the approved Budget Amendment to the designated contact.  The signed copy of the approved Budget Amendment Request Form should be received within two weeks of receiving an approval email from Grants Administration.</li>
                        <li>If you receive the email notice that your Budget Amendment has been approved but have not yet received a copy of the signed and approved request from EEC after two weeks, contact the Grants 
                            Contract Staff:<br />
                            <ul>
                            <li>Barbara Boyd&nbsp;&nbsp;617.988.2438&nbsp;&nbsp;<a href="mailto:barbara.boyd@mass.gov">barbara.boyd@mass.gov</a></li>
                            <li>Janee Carroll&nbsp;&nbsp;617.988.2439&nbsp;&nbsp;<a href="mailto:janee.carroll@mass.gov">janee.carroll@mass.gov</a></li>
                            <%--<li>Loida Marquez&nbsp;&nbsp;617.988.2443&nbsp;&nbsp;<a href="mailto:loida.marquez@mass.gov">loida.marquez@mass.gov</a> (Grants 391 & 262 only)</li>--%>
                        </ul>
                        </li>
                        <li><b>Important:</b> The "contact name" indicated on the Budget Amendment is responsible for communicating all approved budget changes to the Lead Agency grant program coordinators, fiscal staff, and any subcontractors.</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><u><b>Mail Instructions:</b></u></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>Upon receipt of the EEC's emailed response that your electronic copy has been approved, the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> Cover Page must be completed and requires the original signature of lead agency authorized representative.</li>
                        <li>Mail one (1) <u>original</u> of the entire PDF that includes the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> and the Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> Cover page with an original signature in <span style="color:blue">blue</span> ink.</li>
                        <li>All signed Budget Amendment #<%=ViewState["AmendmentVersion"].ToString()%> should be mailed to: <br />
                            <span style="color:Blue">
                            Department of Early Education and Care<br />
                            FY <%=AppInfo.FiscalYear%> <%=AppInfo.GrantName%> Budget Amendment<br />
                            Grants Administration:  <%=AppInfo.AmendmentAdministrator%><br />
                            51 Sleeper St., 4th floor<br />
                            Boston, MA 02210<br />
                            <%=Session["Lead Agency Name"].ToString()%>&nbsp;Budget Amendment
                            </span>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><b>Budget Amendments that do not contain all of these documents will NOT be processed.</b><br /><br /></td>
            </tr>
           
            
        </table>
</asp:Content>

