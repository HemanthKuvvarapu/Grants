<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW.master" AutoEventWireup="true"
    CodeFile="CommunitiesServed.aspx.cs" Inherits="CommunitiesServed" %>

<%@ MasterType VirtualPath="~/MasterPageNEW.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="JavaScript" type="text/javascript">
    Number.prototype.format = function (n, x) {
            var re = '(\\d)(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
            return this.toFixed(Math.max(0, ~ ~n)).replace(new RegExp(re, 'g'), '$1,');
        };
        
    function checkAll()
    {
        var txtCensusHouseholds = document.getElementById('<%=txtCensusHouseholds.ClientID%>');
        var txtCensusChildren0to5 = document.getElementById('<%=txtCensusChildren0to5.ClientID%>');
        var txtCensusChildren = document.getElementById('<%=txtCensusChildren.ClientID%>');
        var txtEnglishLanguageLearner = document.getElementById('<%=txtEnglishLanguageLearner.ClientID%>');
        var txtFirstLanguageNotEnglish = document.getElementById('<%=txtFirstLanguageNotEnglish.ClientID%>');
        var txtStudentsWithDisabilities = document.getElementById('<%=txtStudentsWithDisabilities.ClientID%>');
        var txtChildrenWithDisabilities = document.getElementById('<%=txtChildrenWithDisabilities.ClientID%>');
        var txtLicensedPrograms = document.getElementById('<%=txtLicensePrograms.ClientID%>');
        var txtHighNeeds = document.getElementById('<%=txtHighNeeds.ClientID%>');
        var txtTotalFunding = document.getElementById('<%=txtTotalFunding.ClientID%>');
        var txtProvidersFamilies = document.getElementById('<%=txtProvidersFamilies.ClientID%>');
        var txtMedChildrenPerMonth = document.getElementById('<%=txtMedChildrenPerMonth.ClientID%>');
        var txtMedFamiliesPerMonth = document.getElementById('<%=txtMedFamiliesPerMonth.ClientID%>');
        var txtEconomicallyDisadvantaged = document.getElementById('<%=txtEconomicallyDisadvantaged.ClientID%>');

        var checkAllBox = document.getElementById(arguments[0]);
        
        for (i = 1; i < arguments.length; i++) 
        {
            chkBox = document.getElementById(arguments[i]);
            
            if (checkAllBox.checked)
            {
                if (!chkBox.checked)
                {
                    /*increment regular data point*/
                    if (txtCensusHouseholds) txtCensusHouseholds.value = parseInt(txtCensusHouseholds.value) + parseInt(regularDataPoint[arguments[i]][TownCensusHouseholds]);
                    if (txtCensusChildren0to5) txtCensusChildren0to5.value = parseInt(txtCensusChildren0to5.value) + parseInt(regularDataPoint[arguments[i]][TownCensusChildren0to5]);
                    if (txtCensusChildren) txtCensusChildren.value = parseInt(txtCensusChildren.value) + parseInt(regularDataPoint[arguments[i]][TownCensusChildren]);
                    if (txtLicensedPrograms) txtLicensedPrograms.value = parseInt(txtLicensedPrograms.value) + parseInt(regularDataPoint[arguments[i]][TownLicensedPrograms]);
                    if (txtTotalFunding) txtTotalFunding.value = (parseFloat(txtTotalFunding.value.replace(/,/g, '')) + parseFloat(regularDataPoint[arguments[i]][Funding])).toFixed(2);
                    if (txtProvidersFamilies) txtProvidersFamilies.value = parseInt(txtProvidersFamilies.value) + parseInt(regularDataPoint[arguments[i]][AvgNumberProvidersFamilies]);
                    if (txtMedChildrenPerMonth) txtMedChildrenPerMonth.value = parseInt(txtMedChildrenPerMonth.value) + parseInt(regularDataPoint[arguments[i]][MedianNumberofChildrenReceivingServicesPerMonth]);
                    if (txtMedFamiliesPerMonth) txtMedFamiliesPerMonth.value = parseInt(txtMedFamiliesPerMonth.value) + parseInt(regularDataPoint[arguments[i]][MedianNumberofFamiliesReceivingServicesPerMonth]);
                    
                    /*increment special data point*/
                    if (txtEnglishLanguageLearner) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtEnglishLanguageLearner, EnglishLanguageLearner, true);
                    if (txtFirstLanguageNotEnglish) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtFirstLanguageNotEnglish, FirstLanguageNotEnglish, true);
                    if (txtStudentsWithDisabilities) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtStudentsWithDisabilities, StudentsWithDisabilities, true);
                    if (txtChildrenWithDisabilities) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtChildrenWithDisabilities, ChildrenWithDisabilities, true);
                    if (txtHighNeeds) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtHighNeeds, HighNeeds, true);
                    if (txtEconomicallyDisadvantaged) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtEconomicallyDisadvantaged, EconomicallyDisadvantaged, true);
                    
                }
            }
            else    //checkAllBox unchecked
            {
                if (chkBox.checked)
                {
                    /*decrement regular data point*/
                    if (txtCensusHouseholds) txtCensusHouseholds.value = parseInt(txtCensusHouseholds.value) - parseInt(regularDataPoint[arguments[i]][TownCensusHouseholds]);
                    if (txtCensusChildren0to5) txtCensusChildren0to5.value = parseInt(txtCensusChildren0to5.value) - parseInt(regularDataPoint[arguments[i]][TownCensusChildren0to5]);
                    if (txtCensusChildren) txtCensusChildren.value = parseInt(txtCensusChildren.value) - parseInt(regularDataPoint[arguments[i]][TownCensusChildren]);
                    if (txtLicensedPrograms) txtLicensedPrograms.value = parseInt(txtLicensedPrograms.value) - parseInt(regularDataPoint[arguments[i]][TownLicensedPrograms]);
                    if (txtTotalFunding) txtTotalFunding.value = (parseFloat(txtTotalFunding.value.replace(/,/g, '')) - parseFloat(regularDataPoint[arguments[i]][Funding])).toFixed(2);
                    if (txtProvidersFamilies) txtProvidersFamilies.value = parseInt(txtProvidersFamilies.value) - parseInt(regularDataPoint[arguments[i]][AvgNumberProvidersFamilies]);
                    if (txtMedChildrenPerMonth) txtMedChildrenPerMonth.value = parseInt(txtMedChildrenPerMonth.value) - parseInt(regularDataPoint[arguments[i]][MedianNumberofChildrenReceivingServicesPerMonth]);
                    if (txtMedFamiliesPerMonth) txtMedFamiliesPerMonth.value = parseInt(txtMedFamiliesPerMonth.value) - parseInt(regularDataPoint[arguments[i]][MedianNumberofFamiliesReceivingServicesPerMonth]);
                    
                    /*decrement special data point*/
                    if (txtEnglishLanguageLearner) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtEnglishLanguageLearner, EnglishLanguageLearner, false);
                    if (txtFirstLanguageNotEnglish) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtFirstLanguageNotEnglish, FirstLanguageNotEnglish, false);
                    if (txtStudentsWithDisabilities) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtStudentsWithDisabilities, StudentsWithDisabilities, false);
                    if (txtChildrenWithDisabilities) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtChildrenWithDisabilities, ChildrenWithDisabilities, false);
                    if (txtHighNeeds) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtHighNeeds, HighNeeds, false);
                    if (txtEconomicallyDisadvantaged) incrementSpecialDataPoint(regularDataPoint[arguments[i]][TownId], txtEconomicallyDisadvantaged, EconomicallyDisadvantaged, false);
                }
            }
            
            chkBox.checked = (checkAllBox.checked);
        }    
        
        if (txtTotalFunding) txtTotalFunding.value = parseFloat(txtTotalFunding.value.replace(/,/g, '')).format(2);
    }
    
    function UpdateTotals(chk, townId)
    {
        var txtCH = document.getElementById('<%=txtCensusHouseholds.ClientID%>');
        var txtCCOF = document.getElementById('<%=txtCensusChildren0to5.ClientID%>');
        var txtCC = document.getElementById('<%=txtCensusChildren.ClientID%>');
        var txtELL = document.getElementById('<%=txtEnglishLanguageLearner.ClientID%>');
        var txtFLNE = document.getElementById('<%=txtFirstLanguageNotEnglish.ClientID%>');
        var txtSWD = document.getElementById('<%=txtStudentsWithDisabilities.ClientID%>');
        var txtCWD = document.getElementById('<%=txtChildrenWithDisabilities.ClientID%>');
        var txtLP = document.getElementById('<%=txtLicensePrograms.ClientID%>');
        var txtHN = document.getElementById('<%=txtHighNeeds.ClientID%>');
        var txtMedChildrenPerMonth = document.getElementById('<%=txtMedChildrenPerMonth.ClientID%>');
        var txtMedFamiliesPerMonth = document.getElementById('<%=txtMedFamiliesPerMonth.ClientID%>');
        var txtEconomicallyDisadvantaged = document.getElementById('<%=txtEconomicallyDisadvantaged.ClientID%>');
        
        var txtProvidersFamilies = document.getElementById('<%=txtProvidersFamilies.ClientID%>');
        var txtP = document.getElementById('<%=txtTotalProviders.ClientID%>');
        var txtF = document.getElementById('<%=txtTotalFamilies.ClientID%>');
        var txtC = document.getElementById('<%=txtTotalChildren.ClientID%>');
        var txtFund = document.getElementById('<%=txtTotalFunding.ClientID%>');

        try {
            if (chk.checked) 
            {
                if (txtCH)
                {
                    if (txtCH.value == '') txtCH.value = 0;
                    txtCH.value = parseInt(txtCH.value) + parseInt(regularDataPoint[chk.id][TownCensusHouseholds]);
                }
                
                if (txtCCOF)
                {
                    if (txtCCOF.value == '') txtCCOF.value = 0;
                    txtCCOF.value = parseInt(txtCCOF.value) + parseInt(regularDataPoint[chk.id][TownCensusChildren0to5]); 
                }
                
                if (txtCC)
                {
                    if (txtCC.value == '') txtCC.value = 0;
                    txtCC.value = parseInt(txtCC.value) + parseInt(regularDataPoint[chk.id][TownCensusChildren]); 
                }
                
                if (txtProvidersFamilies)
                {
                    if (txtProvidersFamilies.value == '') txtProvidersFamilies.value = 0;
                    txtProvidersFamilies.value = parseInt(txtProvidersFamilies.value) + parseInt(regularDataPoint[chk.id][AvgNumberProvidersFamilies]); 
                }
                
                if (txtMedChildrenPerMonth)
                {
                    if (txtMedChildrenPerMonth.value == '') txtMedChildrenPerMonth.value = 0;
                    txtMedChildrenPerMonth.value = parseInt(txtMedChildrenPerMonth.value) + parseInt(regularDataPoint[chk.id][MedianNumberofChildrenReceivingServicesPerMonth]); 
                }
                
                if (txtMedFamiliesPerMonth)
                {
                    if (txtMedFamiliesPerMonth.value == '') txtMedFamiliesPerMonth.value = 0;
                    txtMedFamiliesPerMonth.value = parseInt(txtMedFamiliesPerMonth.value) + parseInt(regularDataPoint[chk.id][MedianNumberofFamiliesReceivingServicesPerMonth]); 
                }
        
                if (txtELL)
                {
                    if (txtELL.value == '') txtELL.value = 0;
                    incrementSpecialDataPoint(townId, txtELL, EnglishLanguageLearner, true);
                }
                
                if (txtFLNE)
                {
                    if (txtFLNE.value == '') txtFLNE.value = 0;
                    incrementSpecialDataPoint(townId, txtFLNE, FirstLanguageNotEnglish, true);
                }
                
                if (txtSWD)
                {
                    if (txtSWD.value == '') txtSWD.value = 0;
                    incrementSpecialDataPoint(townId, txtSWD, StudentsWithDisabilities, true);
                }
                
                if (txtCWD)
                {
                    if (txtCWD.value == '') txtCWD.value = 0;
                    incrementSpecialDataPoint(townId, txtCWD, ChildrenWithDisabilities, true);
                }
                
                if (txtHN)
                {
                    if (txtHN.value == '') txtHN.value = 0;
                    incrementSpecialDataPoint(townId, txtHN, HighNeeds, true);
                }

                if (txtEconomicallyDisadvantaged)
                {
                    if (txtEconomicallyDisadvantaged.value == '') txtEconomicallyDisadvantaged.value = 0;
                    incrementSpecialDataPoint(townId, txtEconomicallyDisadvantaged, EconomicallyDisadvantaged, true);
                }
                
                if (txtLP)
                {
                    if (txtLP.value == '') txtLP.value = 0;
                    txtLP.value = parseInt(txtLP.value) + parseInt(regularDataPoint[chk.id][TownLicensedPrograms]); 
                }
                
                if (txtP)
                {
                    if (txtP.value == '') txtP.value = 0;
                    txtP.value = parseInt(txtP.value) + parseInt(regularDataPoint[chk.id][TownProviders]); 
                }
                
                if (txtF)
                {
                    if (txtF.value == '') txtF.value = 0;
                    txtF.value = parseInt(txtF.value) + parseInt(regularDataPoint[chk.id][TownFamilies]); 
                }
                
                if (txtC)
                {
                    if (txtC.value == '') txtC.value = 0;
                    txtC.value = parseInt(txtC.value) + parseInt(regularDataPoint[chk.id][TownChildren]); 
                }
                
                if (txtFund)
                {
                    if (txtFund.value == '') txtFund.value = 0;
                    txtFund.value = parseFloat(txtFund.value.replace(/,/g, '')) + parseFloat(regularDataPoint[chk.id][Funding]); 
                }
            }
            else 
            {
                if (txtCH)
                {
                    if (txtCH.value == '') txtCH.value = 0;
                    txtCH.value = parseInt(txtCH.value) - parseInt(regularDataPoint[chk.id][TownCensusHouseholds]); 
                }
                
                if (txtCCOF)
                {
                    if (txtCCOF.value == '') txtCCOF.value = 0;
                    txtCCOF.value = parseInt(txtCCOF.value) - parseInt(regularDataPoint[chk.id][TownCensusChildren0to5]); 
                }
                
                if (txtCC)
                {
                    if (txtCC.value == '') txtCC.value = 0;
                    txtCC.value = parseInt(txtCC.value) - parseInt(regularDataPoint[chk.id][TownCensusChildren]); 
                }
                
                if (txtProvidersFamilies)
                {
                    if (txtProvidersFamilies.value == '') txtProvidersFamilies.value = 0;
                    txtProvidersFamilies.value = parseInt(txtProvidersFamilies.value) - parseInt(regularDataPoint[chk.id][AvgNumberProvidersFamilies]); 
                }
                
                if (txtMedChildrenPerMonth)
                {
                    if (txtMedChildrenPerMonth.value == '') txtMedChildrenPerMonth.value = 0;
                    txtMedChildrenPerMonth.value = parseInt(txtMedChildrenPerMonth.value) - parseInt(regularDataPoint[chk.id][MedianNumberofChildrenReceivingServicesPerMonth]); 
                }
                
                if (txtMedFamiliesPerMonth)
                {
                    if (txtMedFamiliesPerMonth.value == '') txtMedFamiliesPerMonth.value = 0;
                    txtMedFamiliesPerMonth.value = parseInt(txtMedFamiliesPerMonth.value) - parseInt(regularDataPoint[chk.id][MedianNumberofFamiliesReceivingServicesPerMonth]); 
                }
                
                if (txtELL)
                {
                    if (txtELL.value == '') txtELL.value = 0;
                    incrementSpecialDataPoint(townId, txtELL, EnglishLanguageLearner, false);
                }
                
                if (txtFLNE)
                {
                    if (txtFLNE.value == '') txtFLNE.value = 0;
                    incrementSpecialDataPoint(townId, txtFLNE, FirstLanguageNotEnglish, false);
                }
                
                if (txtSWD)
                {
                    if (txtSWD.value == '') txtSWD.value = 0;
                    incrementSpecialDataPoint(townId, txtSWD, StudentsWithDisabilities, false);
                }
                
                if (txtCWD)
                {
                    if (txtCWD.value == '') txtCWD.value = 0;
                    incrementSpecialDataPoint(townId, txtCWD, ChildrenWithDisabilities, false);
                }
                
                if (txtHN)
                {
                    if (txtHN.value == '') txtHN.value = 0;
                    incrementSpecialDataPoint(townId, txtHN, HighNeeds, false);
                }

                if (txtEconomicallyDisadvantaged) {
                    if (txtEconomicallyDisadvantaged.value == '') txtEconomicallyDisadvantaged.value = 0;
                    incrementSpecialDataPoint(townId, txtEconomicallyDisadvantaged, EconomicallyDisadvantaged, false);
                }
                
                if (txtLP)
                {
                    if (txtLP.value == '') txtLP.value = 0;
                    txtLP.value = parseInt(txtLP.value) - parseInt(regularDataPoint[chk.id][TownLicensedPrograms]); 
                }
                
                if (txtP)
                {
                    if (txtP.value == '') txtP.value = 0;
                    txtP.value = parseInt(txtP.value) - parseInt(regularDataPoint[chk.id][TownProviders]); 
                }
                
                if (txtF)
                {
                    if (txtF.value == '') txtF.value = 0;
                    txtF.value = parseInt(txtF.value) - parseInt(regularDataPoint[chk.id][TownFamilies]); 
                }
                
                if (txtC)
                {
                    if (txtC.value == '') txtC.value = 0;
                    txtC.value = parseInt(txtC.value) - parseInt(regularDataPoint[chk.id][TownChildren]); 
                }
                
                if (txtFund)
                {
                    if (txtFund.value == '') txtFund.value = 0;
                    txtFund.value = parseFloat(txtFund.value.replace(/,/g, '')) - parseFloat(regularDataPoint[chk.id][Funding]); 
                }
            }
            
            if (txtFund) txtFund.value = parseFloat(txtFund.value.replace(/,/g, '')).format(2);
        }
        catch (Error) {
            alert(Error.value);
        }
    }
    
        function incrementSpecialDataPointUsed(townId, DataPointIndex)
        {
            var districtList = townIdToDistrict[townId];
            var index;

            if (!districtList) return;
 
            for (index = 0; index < districtList.length; ++index) 
            {                                    
                districtDataUsed[districtList[index]][DataPointIndex]++;
            }
        }
        
        function incrementSpecialDataPoint(townId, targetBox, DataPointIndex, isIncrement)
        {
            var districtList = townIdToDistrict[townId];
            var index;

            if (!districtList) return;

            if (isIncrement)
            {
                for (index = 0; index < districtList.length; ++index) 
                {                        
                    if (districtDataUsed[districtList[index]][DataPointIndex] == 0)
                    { 
                        targetBox.value = parseInt(targetBox.value) + parseInt(districtData[districtList[index]][DataPointIndex]);
                    }
                                
                    districtDataUsed[districtList[index]][DataPointIndex]++;
                }
            }
            else
            {
                for (index = 0; index < districtList.length; ++index) 
                {           
                    districtDataUsed[districtList[index]][DataPointIndex]--;
                                 
                    if (districtDataUsed[districtList[index]][DataPointIndex] == 0)
                    {
                        targetBox.value = parseInt(targetBox.value) - parseInt(districtData[districtList[index]][DataPointIndex]);
                    }
                }
            }
        }
    </script>

    <style type="text/css">
        .style1
        {
            height: 51px;
        }
        .style7
        {
            height: 28px;
        }
        .styleSubTitle
        {
            background-color: #956250;
            padding-left: 10px;
            color: #ffffff;
            height: 25px;
            font-size: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
    <table id="tblRegionTowns" runat="server" style="width: 100%; background-color: #ededed"
        border="0">
        <tr>
                <td colspan="2">
                    <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                        <tr>
                            <td align="center" style="height: 50px; padding-top: 5px">
                                The Information has been SAVED successfully.<br />
                                <br />
                                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="200px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Languages Served (Part 3)"
                                    Visible="true" OnClick="btnNextPart_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="250px" />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                        <tr>
                            <td align="center" style="height: 50px; padding-top: 5px">
                                <span class="styleErrors">The Information has been SAVED with the following error(s).<br />
                                    <span style="font-weight: normal">
                                        <asp:BulletedList ID="lstErrors" runat="server" CssClass="styleErrors">
                                        </asp:BulletedList>
                                    </span></span><span style="text-align: center">
                                        <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Home" Visible="true"
                                            OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                            Width="200px" />
                                    </span>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        <tr id="trTownsAndLevels" runat="server">
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                    <tr>
                        <td class="style1">
                            <table id="tblTownsAndLevels" runat="server" width="100%" border="0">
                                <tr>
                                    <td colspan="2">
                                        <table width="100%">
                                            <tr id="trTotalFunding" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Total Funding ($)</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotalFunding" runat="server" Width="100px" Text="0.00"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trCensusHouseholds" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Total Number of Family Households (Census)</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCensusHouseholds" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trCensusChildren0to5" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Total Number of Children Age 0-5 (Census)</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCensusChildren0to5" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trCensusChildren" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Total Number of Children Ages 0-14 (Census)</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCensusChildren" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trAvgProviders" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Average Number of Providers</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotalProviders" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trAvgProvidersFamilies" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Average Number of Providers in Towns with Families Receiving Subsidized Early Education and Care Services</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProvidersFamilies" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trMedFamiliesPerMonth" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Median Number of Families Receiving Subsidized Early Education and Care Services per Month</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMedFamiliesPerMonth" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trMedChildrenPerMonth" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Median Number of Children Receiving Subsidized Early Education and Care Services per Month</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMedChildrenPerMonth" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trLicensedProviders" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Licensed Early Education and Care Programs</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLicensePrograms" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trEnglishLanguageLearner" runat="server" visible="false">
                                                <td align="right">
                                                    <b>English Language Learners</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEnglishLanguageLearner" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trFirstLanguageNotEnglish" runat="server" visible="false">
                                                <td align="right">
                                                    <b>First Language Not English</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFirstLanguageNotEnglish" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trStudentsWithDisabilities" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Students with Disabilities</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStudentsWithDisabilities" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trChildrenWithDisabilities" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Children With Disabilities (PK 3-5 years)</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtChildrenWithDisabilities" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trHighNeeds" runat="server" visible="false">
                                                <td align="right">
                                                    <b>High Needs</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtHighNeeds" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            

                                            <tr id="trFamilies" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Median Number of Families in Calendar Year 2012</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotalFamilies" runat="server" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trChildren" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Median Number of Children in Calendar Year 2012</b>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotalChildren" runat="server" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="trEconomicallyDisadvantaged" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Economically Disadvantaged</b>:&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEconomicallyDisadvantaged" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="trLevel4Indicator" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Level 4/Level 5 Community</b>:
                                                </td>
                                                <td>
                                                    <span style="color: Red; font-weight: bold;">^</span>
                                                </td>
                                            </tr>
                                            <tr id="trGatewayIndicator" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Gateway Community</b>:
                                                </td>
                                                <td>
                                                    <span style="color:Blue; font-weight: bold;">*</span>
                                                </td>
                                            </tr>
                                            <tr id="trRuralCommunities" runat="server" visible="false">
                                                <td align="right">
                                                    <b>Rural Community</b>:
                                                </td>
                                                <td>
                                                    <b>~</b>
                                                </td>
                                            </tr>
                                            <tr id="trHighRiskText" runat="server" visible="false">
                                                <td align="right" colspan="2">
                                                    <b>High Risk Home Visiting Factor is indicated in parenthesis next to the town.</b>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
            <td>
                <asp:DataList ID="dlRegionList" Width="100%" OnItemDataBound="dlRegionList_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                    <td class="styleSubTitle">
                                        <b>Region:</b> <asp:Label ID="lblRegionName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkSelectAll" runat="server" Text="Select All" />
                                    </td>
                                </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="dlTownList" runat="server" Width="100%" RepeatDirection="Horizontal"
                                            RepeatColumns="4" OnItemDataBound="dlTownList_ItemDataBound">
                                            <ItemStyle Width="200px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblTown" runat="server"></asp:Label>
                                                <asp:CheckBox ID="chkTown" runat="server" />
                                                <asp:Label ID="lblHighRiskFactor" runat="server" Text="()"></asp:Label>
                                                <asp:Label ID="lblLevel4Indicator" runat="server" Text="^" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                <asp:Label ID="lblGatewayIndicator" runat="server" Text="*" ForeColor="Blue"
                                                    Font-Bold="true"></asp:Label>
                                                <asp:Label ID="lblRuralCommunities" runat="server" Text="~" ForeColor="black" Font-Bold="true"></asp:Label>
                                                <asp:HiddenField ID="hfCityTownId" runat="server" />
                                            </ItemTemplate>
                                        </asp:DataList>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <tr>
                                    <td class="style7" style="height: 100px; text-align: center">
                                        <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" OnClick="btnSavePrint_Click"
                                            CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" OnClick="btnCancel_Click"
                                            CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnSave" runat="server" Text="Save Information" OnClick="btnSave_Click"
                                            CssClass="buttonClass" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        
    </table>
</asp:Content>
