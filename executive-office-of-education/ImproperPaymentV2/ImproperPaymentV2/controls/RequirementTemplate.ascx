<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RequirementTemplate.ascx.cs"
    Inherits="controls_RequirementTemplate" %>
<%@ Register src="Frm430.ascx" tagname="Frm430" tagprefix="uc4" %>
<%@ Register src="FrmDataEntry.ascx" tagname="FrmDataEntry" tagprefix="uc5" %>
<table id="tblParents" cellspacing="0" cellpadding="0" border="0" runat="server"
    visible="false">
    <tr>
        <td id="tab1" style="background-color: #dde9d5; width: 140px; height: 25px; padding-left: 5px"
            runat="server">
            <a href="javascript:changeTab('<%=tab1.ClientID%>','<%=tab2.ClientID%>','<%=blkTab1.ClientID%>','<%=blkTab2.ClientID%>','1')"
                style="text-decoration: none">[Parent 1]</a>
        </td>
        <td id="tab2" style="background-color: #D5D8E9; width: 140px; padding-left: 5px"
            runat="server">
            <a href="javascript:changeTab('<%=tab1.ClientID%>','<%=tab2.ClientID%>','<%=blkTab1.ClientID%>','<%=blkTab2.ClientID%>','2')"
                style="text-decoration: none">[Parent 2]</a>
        </td>
    </tr>
</table>
<div id="blkTab1" runat="server">
    <asp:DataList ID="lstRequirements" runat="server" OnItemDataBound="lstRequirements_ItemDataBound">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="width: 5px">
                        <asp:Image ID="imgspace1" runat="server" ImageUrl="~/images/spacer.gif" Style="width: 5px;
                            height: 1px" />
                    </td>
                    <td style="width: 10px" valign="top">
                        <asp:Image ID="imgspace2" runat="server" ImageUrl="~/images/spacer.gif" Style="width: 1px;
                            height: 1px" />
                        <asp:CheckBox ID="chkItem" runat="server" Style="width: 25px" />
                    </td>
                    <td valign="top">
                        <asp:Label ID="txtItemDesc" runat="server" Text="Label"></asp:Label>
                        <asp:HyperLink ID="LnkHelp" Style="vertical-align: middle" runat="server" ImageUrl="~/images/help.gif"></asp:HyperLink>
                        <asp:Panel ID="pnlHelp" CssClass="helpTipBlock" runat="server" Style="display: none">
                            <asp:Label CssClass="helpTip" ID="lblHelp" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</div>
<div id="blkTab2" style="background-color: #dde9d5; display: none" runat="server">
    <asp:DataList ID="lstRequirements2" runat="server" OnItemDataBound="lstRequirements_ItemDataBound">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="width: 5px">
                        <asp:Image ID="imgspace1" runat="server" ImageUrl="~/images/spacer.gif" Style="width: 5px;
                            height: 1px" />
                    </td>
                    <td style="width: 10px" valign="top">
                        <asp:Image ID="imgspace2" runat="server" ImageUrl="~/images/spacer.gif" Style="width: 1px;
                            height: 1px" />
                        <asp:CheckBox ID="chkItem" runat="server" Style="width: 25px" />
                    </td>
                    <td valign="top">
                        <asp:Label ID="txtItemDesc" runat="server" Text="Label"></asp:Label>
                        <asp:HyperLink ID="LnkHelp" Style="vertical-align: middle" runat="server" ImageUrl="~/images/help.gif"></asp:HyperLink>
                        <asp:Panel ID="pnlHelp" CssClass="helpTipBlock" runat="server" Style="display: none">
                            <asp:Label CssClass="helpTip" ID="lblHelp" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</div>

<script language="javascript" type="text/javascript">
            <asp:Literal ID="sScript" runat="server"></asp:Literal>
</script>
<table id="frm340" cellspacing="0" border="0" style="border-collapse: collapse" runat="server" visible="false">
    <tr>
        <td>
           <br /><b><u>Case Worker Determination</u></b><br /><br />
        </td>
    </tr>
    <tr>
        <td>
            Weekly authorized hours:
            <asp:TextBox ID="txtCaseRecordEmploymentType340" runat="server" Width="100px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Program type:
            <asp:TextBox ID="txtCaseRecordProgramType340" runat="server" Width="100px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Part-Time:
            <asp:TextBox ID="txtCaseRecordPartTimeHours340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
           Full-Time:
            <asp:TextBox ID="txtCaseRecordFullTimeHours340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Travel time:
            <asp:TextBox ID="txtCaseRecordTravelTime340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Subsidy Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Subsidy Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount340" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
   <tr>
        <td>
           <br /><b><u>Reviewer’s Determination</u></b><br /><br />
        </td>
    </tr>
    <%--<tr>
        <td>
            Weekly authorized hours:  
            <asp:TextBox ID="txtReviewerEmploymentType340" runat="server" Width="100px"></asp:TextBox>
        </td>
    </tr>--%>
    <tr>
        <td>
            Weekly authorized hours:
            <asp:DropDownList ID="txtReviewerEmploymentType340" runat="server" Width="100px">
                <asp:ListItem Value="Full-Time">Full-Time</asp:ListItem>
                <asp:ListItem Value="Part-Time">Part-Time</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Program type:
<%--            <asp:TextBox ID="txtReviewerProgramType340" runat="server" Width="100px"></asp:TextBox>--%>
             <asp:DropDownList ID="txtReviewerProgramType340" runat="server" Width="100px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Part-Time:
            <asp:TextBox ID="txtReviewerPartTimeHours340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Full-Time:
            <asp:TextBox ID="txtReviewerFullTimeHours340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Travel time:
            <asp:TextBox ID="txtReviewerTravelTime340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr> 
    <tr>
        <td>
            Reviewer Subsidy Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Trans Amount:
            <asp:TextBox ID="txtReviewerTransAmount340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Subsidy Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount340" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
            <script language="javascript" type="text/javascript">
                getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays340.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate340.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount340.ClientID %>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount340.ClientID%>');
                getAuthoInfo('ProgramType', '<%=txtCaseRecordProgramType340.ClientID%>');
                getAuthoInfo('EmploymentType', '<%=txtCaseRecordEmploymentType340.ClientID%>');
                getAuthoInfo('PartTimeHours', '<%=txtCaseRecordPartTimeHours340.ClientID %>');
                getAuthoInfo('FullTimeHours', '<%=txtCaseRecordFullTimeHours340.ClientID%>');
                getAuthoInfo('TravelTime', '<%=txtCaseRecordTravelTime340.ClientID%>');

                getReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays340.ClientID%>');
                getReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate340.ClientID%>');
                getReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount340.ClientID %>');
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount340.ClientID%>');
                getReviewerAuthoInfo('ProgramType', '<%=txtReviewerProgramType340.ClientID%>');
                getReviewerAuthoInfo('EmploymentType', '<%=txtReviewerEmploymentType340.ClientID%>');
                getReviewerAuthoInfo('PartTimeHours', '<%=txtReviewerPartTimeHours340.ClientID %>');
                getReviewerAuthoInfo('FullTimeHours', '<%=txtReviewerFullTimeHours340.ClientID%>');
                getReviewerAuthoInfo('TravelTime', '<%=txtReviewerTravelTime340.ClientID%>');

                function updateReviewerEntryData340() {
                    setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays340.ClientID%>');
                    setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate340.ClientID%>');
                    setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount340.ClientID %>');
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount340.ClientID%>');
                    setReviewerAuthoInfo('ProgramType', '<%=txtReviewerProgramType340.ClientID%>');
                    setReviewerAuthoInfo('EmploymentType', '<%=txtReviewerEmploymentType340.ClientID%>');
                    setReviewerAuthoInfo('PartTimeHours', '<%=txtReviewerPartTimeHours340.ClientID %>');
                    setReviewerAuthoInfo('FullTimeHours', '<%=txtReviewerFullTimeHours340.ClientID%>');
                    setReviewerAuthoInfo('TravelTime', '<%=txtReviewerTravelTime340.ClientID%>');
                }
            </script>
        </td>
    </tr>
</table>
<table id="frm400" cellspacing="0" border="0" style="border-collapse: collapse" runat="server" visible="false">
    <tr>
        <td>
           <br /><b>Calculate Income and Verify SMI</b><br /><br />
        </td>
    </tr>
    <tr>
        <td>
            Case Record Family Income:
            <asp:TextBox ID="txtCaseRecordIncome400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Case Record Family Size:
            <asp:TextBox ID="txtCaseRecordFamilySize400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Case Record Household meets SMI requirement:
            <asp:DropDownList ID="cboCaseRecordSMIRequirement400" runat="server" Enabled="false">
                <asp:ListItem Value="2">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
                <asp:ListItem Value="0">NA</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Fee Level:
            <asp:TextBox ID="txtCaseRecordFeeLevel400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Parent Daily Fee:
            <asp:TextBox ID="txtCaseRecordParentDailyFee400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <%-- <tr>
        <td>
            Case Record Subsidy Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Case Record Subsidy Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>--%>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Family Income:
            <asp:TextBox ID="txtReviewerIncome400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Family Size:
            <asp:TextBox ID="txtReviewerFamilySize400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Household meets SMI requirement:
            <asp:DropDownList ID="cboReviewerSMIRequirement400" runat="server" Enabled="false">
                <asp:ListItem Value="2">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
                <asp:ListItem Value="0">N/A</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Fee Level:
            <asp:TextBox ID="txtReviewerFeeLevel400" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Parent Daily Fee:
            <asp:TextBox ID="txtReviewerParentDailyFee400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <%--<tr>
        <td>
            Reviewer Subsidy Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Trans Amount:
            <asp:TextBox ID="txtReviewerTransAmount400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
            Reviewer Subsidy Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount400" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>--%>
    <tr>
        <td>
            <br />
            <script language="javascript" type="text/javascript">
                getAuthoInfo('FamilyIncome', '<%=txtCaseRecordIncome400.ClientID%>');
                getAuthoInfo('FamilySize', '<%=txtCaseRecordFamilySize400.ClientID%>');
                getAuthoInfo('SMI', '<%=cboCaseRecordSMIRequirement400.ClientID%>');
                getAuthoInfo('FeeLevel', '<%=txtCaseRecordFeeLevel400.ClientID%>');
                getAuthoInfo('ParentFee', '<%=txtCaseRecordParentDailyFee400.ClientID%>');
                <%--getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays400.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate400.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount400.ClientID %>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount400.ClientID%>');--%>

                getReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerIncome400.ClientID%>');
                getReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize400.ClientID%>');
                getReviewerAuthoInfo('SMI', '<%=cboReviewerSMIRequirement400.ClientID%>');
                getReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel400.ClientID%>');
                getReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee400.ClientID%>');
                <%--getReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays400.ClientID%>');
                getReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate400.ClientID%>');
                getReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount400.ClientID %>');
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount400.ClientID%>');--%>

                function updateReviewerEntryData400() {
                    setReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerIncome400.ClientID%>');
                    setReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize400.ClientID%>');
                    setReviewerAuthoInfo('SMI', '<%=cboReviewerSMIRequirement400.ClientID%>');
                    setReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel400.ClientID%>');
                    setReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee400.ClientID%>');
                   <%-- setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays400.ClientID%>');
                    setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate400.ClientID%>');
                    setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount400.ClientID %>');
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount400.ClientID%>');--%>
                }
            </script>
        </td>
    </tr>
</table>
<%--FOO--%>
<table id="frm410" cellspacing="0" border="0" style="border-collapse: collapse;"
    runat="server" visible="false">
    <tr>
        <td>
            Eligibility Worker Subsidy Amount:<br />
            <asp:TextBox ID="txtCaseRecordSubsidyAmountAuthorized410" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Reviewer Subsidy Amount:<br />
            <asp:TextBox ID="txtReviewerSubsidyAmountAuthorized410" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    
        <tr>
        <td>
            Sample Month Payment Amount:<br />
            <asp:TextBox ID="txtSamplePaymentAmount410" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Difference between reviewer's subsidy amount and sample month payment amount:&nbsp;&nbsp;&nbsp;
            <br /><asp:TextBox ID="txtReviewerSubsidyAmountVariance410" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordSubsidyAmountAuthorized410.ClientID%>');
                getAuthoInfo('AuthorizedAmount', '<%=txtSamplePaymentAmount410.ClientID%>');
                
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerSubsidyAmountAuthorized410.ClientID%>');
                setReviewerAuthoInfo('VarianceAmount', '<%=txtReviewerSubsidyAmountVariance410.ClientID%>');
                getReviewerAuthoInfo('VarianceAmount', '<%=txtReviewerSubsidyAmountVariance410.ClientID%>');
                
                function updateReviewerEntryData410() {
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerSubsidyAmountAuthorized410.ClientID%>');
                    setReviewerAuthoInfo('VarianceAmount', '<%=txtReviewerSubsidyAmountVariance410.ClientID%>');
                    getReviewerAuthoInfo('VarianceAmount', '<%=txtReviewerSubsidyAmountVariance410.ClientID%>');
                }
            </script>
        </td>
    </tr>
</table>
<table id="frm410Extra" cellspacing="0" border="0" style="border-collapse: collapse;"
    visible="false" runat="server">


</table>
<table id="frm420" cellspacing="0" border="0" style="border-collapse: collapse;"
    visible="false" runat="server">
    <tr>
        <td>
            Amount Authorized for subsidy payment based upon family size, income (Sections 400/410),
            and State Payment Rate Schedule:
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Income:
            <asp:TextBox ID="txtCaseRecordFamilyIncome420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Size:
            <asp:TextBox ID="txtCaseRecordFamilySize420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Fee Level:
            <asp:TextBox ID="txtCaseRecordFeeLevel420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Parent Daily Fee:
            <asp:TextBox ID="txtCaseRecordParentDailyFee420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Subsidy Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Subsidy Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount420" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Income:
            <asp:TextBox ID="txtReviewerFamilyIncome420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Size:
            <asp:TextBox ID="txtReviewerFamilySize420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Fee Level:
            <asp:TextBox ID="txtReviewerFeeLevel420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Parent Daily Fee:
            <asp:TextBox ID="txtReviewerParentDailyFee420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Subsidy Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Trans Amount:
            <asp:TextBox ID="txtReviewerTransAmount420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Subsidy Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount420" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('FamilyIncome', '<%=txtCaseRecordFamilyIncome420.ClientID%>');
                getAuthoInfo('FamilySize', '<%=txtCaseRecordFamilySize420.ClientID%>');
                getAuthoInfo('FeeLevel', '<%=txtCaseRecordFeeLevel420.ClientID%>');
                getAuthoInfo('ParentFee', '<%=txtCaseRecordParentDailyFee420.ClientID%>');
                getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays420.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate420.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount420.ClientID%>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount420.ClientID%>');
                
                getReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerFamilyIncome420.ClientID%>');
                getReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize420.ClientID%>');
                getReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel420.ClientID%>');
                getReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee420.ClientID%>');
                getReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420.ClientID%>');
                getReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420.ClientID%>');
                getReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420.ClientID%>');
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420.ClientID%>');
                
                function updateReviewerEntryData420()
                {
                    setReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerFamilyIncome420.ClientID%>');
                    setReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize420.ClientID%>');
                    setReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel420.ClientID%>');
                    setReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee420.ClientID%>');
                    setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420.ClientID%>');
                    setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420.ClientID%>');
                    setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420.ClientID%>');
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420.ClientID%>');
                }
            </script>
        </td>
    </tr>
</table>
<table id="frm420DTA" cellspacing="0" border="0" style="border-collapse: collapse;"
    visible="false" runat="server">
    <tr>
        <td>
            Amount Authorized for subsidy payment based upon family size, income (Sections 400/410),
            and State Payment Rate Schedule:
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <b>TAFDC</b>
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Income: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Size: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Fee Level: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Parent Daily Fee: N/A
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays420TAFDCDTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate420TAFDCDTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount420TAFDCDTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount420TAFDCDTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Income: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Size: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Fee Level: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Parent Daily Fee: N/A
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays420TAFDCDTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate420TAFDCDTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Trans Amount:
            <asp:TextBox ID="txtReviewerTransAmount420TAFDCDTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount420TAFDCDTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <b>Transitional</b>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Income: 
            <asp:TextBox ID="txtCaseRecordFamilyIncome420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Size: 
            <asp:TextBox ID="txtCaseRecordFamilySize420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Fee Level: 
            <asp:TextBox ID="txtCaseRecordFeeLevel420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Parent Daily Fee: 
            <asp:TextBox ID="txtCaseRecordParentDailyFee420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount420DTA" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Income: 
            <asp:TextBox ID="txtReviewerFamilyIncome420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Size: 
            <asp:TextBox ID="txtReviewerFamilySize420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Fee Level: 
            <asp:TextBox ID="txtReviewerFeeLevel420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height:25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Parent Daily Fee: 
            <asp:TextBox ID="txtReviewerParentDailyFee420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Trans Amount:
            <asp:TextBox ID="txtReviewerTransAmount420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount420DTA" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays420TAFDCDTA.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate420TAFDCDTA.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount420TAFDCDTA.ClientID%>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount420TAFDCDTA.ClientID%>');
                
                getReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerFamilyIncome420DTA.ClientID%>');
                getReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize420DTA.ClientID%>');
                getReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel420DTA.ClientID%>');
                getReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee420DTA.ClientID%>');
                
                getReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420TAFDCDTA.ClientID%>');
                getReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420TAFDCDTA.ClientID%>');
                getReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420TAFDCDTA.ClientID%>');
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420TAFDCDTA.ClientID%>');
                
                function updateReviewerEntryData420()
                {               
                    setReviewerAuthoInfo('FamilyIncome', '<%=txtReviewerFamilyIncome420DTA.ClientID%>');
                    setReviewerAuthoInfo('FamilySize', '<%=txtReviewerFamilySize420DTA.ClientID%>');
                    setReviewerAuthoInfo('FeeLevel', '<%=txtReviewerFeeLevel420DTA.ClientID%>');
                    setReviewerAuthoInfo('ParentFee', '<%=txtReviewerParentDailyFee420DTA.ClientID%>');
                        
                    setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420TAFDCDTA.ClientID%>');
                    setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420TAFDCDTA.ClientID%>');
                    setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420TAFDCDTA.ClientID%>');
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420TAFDCDTA.ClientID%>');
                    
                    if (document.getElementById('<%=txtReviewerAuthorizedDays420TAFDCDTA.ClientID%>').value.trim() == "")
                    {
                        setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420DTA.ClientID%>');
                    }
                    
                    if (document.getElementById('<%=txtReviewerProviderRate420TAFDCDTA.ClientID%>').value.trim() == "")
                    {
                        setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420DTA.ClientID%>');
                    }
                    
                    if (document.getElementById('<%=txtReviewerTransAmount420TAFDCDTA.ClientID%>').value.trim() == "")
                    {
                        setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420DTA.ClientID%>');
                    }
                    
                    if (document.getElementById('<%=txtReviewerAuthorizedAmount420TAFDCDTA.ClientID%>').value.trim() == "")
                    {
                        setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420DTA.ClientID%>');
                    }
                }
            </script>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('FamilyIncome', '<%=txtCaseRecordFamilyIncome420DTA.ClientID%>');
                getAuthoInfo('FamilySize', '<%=txtCaseRecordFamilySize420DTA.ClientID%>');
                getAuthoInfo('FeeLevel', '<%=txtCaseRecordFeeLevel420DTA.ClientID%>');
                getAuthoInfo('ParentFee', '<%=txtCaseRecordParentDailyFee420DTA.ClientID%>');
                getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays420DTA.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate420DTA.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount420DTA.ClientID%>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount420DTA.ClientID%>');
            </script>
        </td>
    </tr>
</table>
<table id="frm420DCF" cellspacing="0" border="0" style="border-collapse: collapse;"
    visible="false" runat="server">
    <tr>
        <td>
            Amount Authorized for subsidy payment based upon family size, income (Sections 400/410),
            and State Payment Rate Schedule:
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Income: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Family Size: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Fee Level: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Parent Daily Fee: N/A
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Days:
            <asp:TextBox ID="txtCaseRecordAuthorizedDays420DCF" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Provider Rate:
            <asp:TextBox ID="txtCaseRecordProviderRate420DCF" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Trans Amount:
            <asp:TextBox ID="txtCaseRecordTransAmount420DCF" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Supportive Services:
            <asp:TextBox ID="txtCaseRecordSupportiveServices420DCF" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Case Record Authorized Amount:
            <asp:TextBox ID="txtCaseRecordAuthorizedAmount420DCF" runat="server" Width="50px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Income: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Family Size: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Fee Level: N/A
        </td>
    </tr>
    <tr>
        <td style="height:24px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Parent Daily Fee: N/A
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Days:
            <asp:TextBox ID="txtReviewerAuthorizedDays420DCF" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Provider Rate:
            <asp:TextBox ID="txtReviewerProviderRate420DCF" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Transportation Amount:
            <asp:TextBox ID="txtReviewerTransAmount420DCF" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Supportive Services:
            <asp:TextBox ID="txtReviewerSupportiveServices420DCF" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer Authorized Amount:
            <asp:TextBox ID="txtReviewerAuthorizedAmount420DCF" runat="server" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <script language="javascript" type="text/javascript">
                getAuthoInfo('Days', '<%=txtCaseRecordAuthorizedDays420DCF.ClientID%>');
                getAuthoInfo('ProviderRate', '<%=txtCaseRecordProviderRate420DCF.ClientID%>');
                getAuthoInfo('TransportationAmount', '<%=txtCaseRecordTransAmount420DCF.ClientID%>');
                getAuthoInfo('AuthorizedAmount', '<%=txtCaseRecordAuthorizedAmount420DCF.ClientID%>');
                getAuthoInfo('SupportiveService', '<%=txtCaseRecordSupportiveServices420DCF.ClientID%>');
                
                getReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420DCF.ClientID%>');
                getReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420DCF.ClientID%>');
                getReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420DCF.ClientID%>');
                getReviewerAuthoInfo('ReviewerSupportiveServices', '<%=txtReviewerSupportiveServices420DCF.ClientID%>');
                getReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420DCF.ClientID%>');
                
                function updateReviewerEntryData420()
                {                    
                    setReviewerAuthoInfo('Days', '<%=txtReviewerAuthorizedDays420DCF.ClientID%>');
                    setReviewerAuthoInfo('ProviderRate', '<%=txtReviewerProviderRate420DCF.ClientID%>');
                    setReviewerAuthoInfo('TransportationAmount', '<%=txtReviewerTransAmount420DCF.ClientID%>');
                    setReviewerAuthoInfo('ReviewerSupportiveServices', '<%=txtReviewerSupportiveServices420DCF.ClientID%>');
                    setReviewerAuthoInfo('AuthorizedAmount', '<%=txtReviewerAuthorizedAmount420DCF.ClientID%>');
                }
            </script>
        </td>
    </tr>
</table>
<uc4:Frm430 ID="frm430" Visible="false" runat="server" />

