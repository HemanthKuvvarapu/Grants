<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChildDetail.ascx.cs" Inherits="controls_ChildDetail" %>

<table id="childInfo1" class="formtext" cellpadding="5" cellspacing="0" border="0"
    style="width: 100%; background-color: #dde9d5">
    <tr>
        <td style="width: 100%">
            <b>Child Name: </b>
            <span style="color: blue"><asp:Label ID="txtChildName" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <b>Date of Birth: </b>
            <span style="color: blue"><asp:Label ID="txtChildDOB" runat="server" Text="Label"></asp:Label></span>
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <b>Vendor/Program Name: </b>
            <span style="color: blue"><asp:Label ID="txtVendorName" runat="server" Text="Label" Style="width: 400px; padding: 2px"
                    ToolTip="Here is the vendor name"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td style="width: 100%">
            <b>Autho Start Date: </b><span style="color: blue">
                <asp:Label ID="txtAuthoStartDate" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <b>Autho End Date: </b><span style="color: blue">
                <asp:Label ID="txtAuthoEndDate" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <b>Eligibility: </b><span style="color: blue">
                <asp:Label ID="txtFunding" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <b>Assessment: </b><span style="color: blue">
                <asp:Label ID="txtAssessmentType" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <b>Type: </b><span style="color: blue">
                <asp:Label ID="txtSubsidyType" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>
            <b>Sub Type: </b><span style="color: blue">
                <asp:Label ID="txtSubType" runat="server" Text="Label" Style="width: 400px; padding: 2px"></asp:Label></span>

        </td>
    </tr>
</table>
<br />
<table id="childInfo2" class="formtext" cellpadding="0" cellspacing="0" border="0"
    style="width: 100%; background-color: #dde9d5">
    <tr>
        <td align="center" style="height:23px"><b>Fee Level</b></td>
        <td align="center"><b>Family Size</b></td>
        <td align="center"><b>Family Income</b></td>
        <td align="center"><b>Service Code</b></td>
        <td align="center"><b>Autho Days</b></td>
        <td align="center"><b>Program Type</b></td>
        <td align="center"><b>Provider Rate</b></td>
        <td align="center"><b>QRIS Inc?</b></td>
        <td align="center"><b>Parent Daily<br />Base Fee</b></td>
        <td align="center"><b>Trans. Amount</b></td>
        <td align="center"><b>Add-on</b></td>
        <td align="center"><b>Total Paid</b></td>
        <!--<td align="center"><b>Autho Type</b></td>-->
    </tr>
    <tr>
        <td align="center" style="color:blue"><asp:Label ID="txtFeeLevel" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Fee Level"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtFamilySize" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Family Size"></asp:Label></td>
        <td align="center" style="color:blue">$<asp:Label ID="txtFamilyIncome" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Family Income"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtServiceCode" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Family Income"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtDays" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Authorized Days"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtProgramType" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Program Type"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtProviderRate" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Provider Rate"></asp:Label></td>
        <td align="center" style="color:blue"><asp:Label ID="txtQRISInc" runat="server" Text="" Style="padding: 2px"
                    ToolTip="QRIS Inc"></asp:Label></td>
        <td align="center" style="color:blue">$<asp:Label ID="txtParentFee" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Total Parent Fee"></asp:Label></td>
        <td align="center" style="color:blue">$<asp:Label ID="txtTransportationAmount" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Transportation Amount"></asp:Label></td>
        <td align="center" style="color:blue">$<asp:Label ID="txtAddonAmt" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Add-on Amount"></asp:Label></td>
        <td align="center" style="color:blue">$<asp:Label ID="txtAuthorizedAmount" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Authorized Amount"></asp:Label></td>
        <!--<td align="center" style="color:blue"><asp:Label ID="txtAuthoType" runat="server" Text="" Style="padding: 2px"
                    ToolTip="Authorized Type"></asp:Label></td>-->
    </tr>
    <tr>
        <td>
            <asp:HiddenField ID="txtFeeLevelField" runat="server" />
            <asp:HiddenField ID="txtFamilySizeField" runat="server" />
            <asp:HiddenField ID="txtFamilyIncomeField" runat="server" />
            <asp:HiddenField ID="txtDaysField" runat="server" />
            <asp:HiddenField ID="txtProviderRateField" runat="server" />
            <asp:HiddenField ID="txtQRISIncField" runat="server" />
            <asp:HiddenField ID="txtParentFeeField" runat="server" />
            <asp:HiddenField ID="txtSupServiceField" runat="server" />
            <asp:HiddenField ID="txtAddonAmtField" runat="server" />
            <asp:HiddenField ID="txtTransportationAmountField" runat="server" />
            <asp:HiddenField ID="txtAuthorizedAmountField" runat="server" />
            
            <asp:HiddenField ID="txtReviewerFamilyIncomeField" runat="server" />
            <asp:HiddenField ID="txtReviewerFamilySizeField" runat="server" />
            <asp:HiddenField ID="txtReviewerFeeLevelField" runat="server" />
            <asp:HiddenField ID="txtReviewerParentFeeField" runat="server" />
            <asp:HiddenField ID="txtReviewerDaysField" runat="server" />
            <asp:HiddenField ID="txtReviewerProviderRateField" runat="server" />
            <asp:HiddenField ID="txtReviewerQRISIncField" runat="server" />
            <asp:HiddenField ID="txtReviewerTransAmountField" runat="server" />
            <asp:HiddenField ID="txtReviewerTotalAmountField" runat="server" />
            <asp:HiddenField ID="txtReviewerVarianceAmountField" runat="server" />
            <asp:HiddenField ID="txtReviewerSMIField" runat="server" />
            <asp:HiddenField ID="txtReviewerSupportiveServicesField" runat="server" />
            
                
            <script language="javascript" type="text/javascript">
                var authoInfo = new Array(new Array('FeeLevel','<%=txtFeeLevelField.ClientID%>'),
                                          new Array('FamilySize','<%=txtFamilySizeField.ClientID%>'),
                                          new Array('FamilyIncome','<%=txtFamilyIncomeField.ClientID%>'),
                                          new Array('Days','<%=txtDaysField.ClientID%>'),
                                          new Array('ProviderRate', '<%=txtProviderRateField.ClientID%>'),
                                          new Array('ParentFee','<%=txtParentFeeField.ClientID%>'),
                                          new Array('TransportationAmount','<%=txtTransportationAmountField.ClientID%>'),
                                          new Array('AuthorizedAmount','<%=txtAuthorizedAmountField.ClientID%>'),
                                          new Array('SupportiveService', '<%=txtSupServiceField.ClientID%>'));


                var reviewerEntryInfo = new Array(new Array('FeeLevel', '<%=txtReviewerFeeLevelField.ClientID%>'),
                                          new Array('FamilySize', '<%=txtReviewerFamilySizeField.ClientID%>'),
                                          new Array('FamilyIncome', '<%=txtReviewerFamilyIncomeField.ClientID%>'),
                                          new Array('Days', '<%=txtReviewerDaysField.ClientID%>'),
                                          new Array('ProviderRate', '<%=txtReviewerProviderRateField.ClientID%>'),
                                          new Array('ParentFee', '<%=txtReviewerParentFeeField.ClientID%>'),
                                          new Array('TransportationAmount', '<%=txtReviewerTransAmountField.ClientID%>'),
                                          new Array('AuthorizedAmount', '<%=txtReviewerTotalAmountField.ClientID%>'),
                                          new Array('SMI', '<%=txtReviewerSMIField.ClientID%>'),
                                          new Array('ReviewerSupportiveServices', '<%=txtReviewerSupportiveServicesField.ClientID%>'),
                                          new Array('VarianceAmount', '<%=txtReviewerVarianceAmountField.ClientID%>'),
                                          new Array('TotalAmountIAP', '<%=txtReviewerVarianceAmountField.ClientID %>'));
                                          
                                                                  
                function getAuthoInfo(type, target)
                {
                    for (var i=0; i<authoInfo.length; i++)
                    {
                        if (type == authoInfo[i][0])
                        {
                            document.getElementById(target).value = document.getElementById(authoInfo[i][1]).value;
                        }
                    }
                }
                
                function getReviewerAuthoInfo(type, target)
                {
                    for (var i=0; i<reviewerEntryInfo.length; i++)
                    {
                        if (type == reviewerEntryInfo[i][0])
                        { 
                            document.getElementById(target).value = document.getElementById(reviewerEntryInfo[i][1]).value;
                        }
                    }
                }
                
                function setReviewerAuthoInfo(type, source)
                {
                    for (var i=0; i<reviewerEntryInfo.length; i++)
                    {
                        if (type == reviewerEntryInfo[i][0])
                        {
                            if (type == "VarianceAmount") {
                                if (document.getElementById(reviewerEntryInfo[7][1]).value != "") {
                                    document.getElementById(reviewerEntryInfo[i][1]).value =
                                    (document.getElementById(authoInfo[7][1]).value.replace(",", "") - document.getElementById(reviewerEntryInfo[7][1]).value.replace(",", "")).toFixed(2);
                                }
                                else {
                                    document.getElementById(reviewerEntryInfo[i][1]).value = "0.00";
                                }   
                            }
                            //GET FEELEVEL AND SMI!!!
                            else {
                                document.getElementById(reviewerEntryInfo[i][1]).value = document.getElementById(source).value;
                            }
                        }
                    }
                }
            </script>
        </td>
    </tr>
<%--    <tr>
        <td><br /></td>
    </tr>
    <tr><td>
        <table id="childInfo3"class="formtext" cellpadding="0" cellspacing="0" border="0"style="width: 100%; background-color: #dde9d5">--%>    
</table>
<table id="breakTable" runat="server"><tr><td><br /></td></tr></table>
<table id="childInfo3" runat="server" class="formtext" cellpadding="0" cellspacing="0" border="0"
style="width: 100%; background-color: #dde9d5">
    <tr>
        <td style="vertical-align:top"><b>Total Paid Detail</b></td>
        <td colspan="12">
        <asp:GridView ID="grdChildList" runat="server" AllowSorting="False" AutoGenerateColumns="False" border="1" CellPadding="1" CellSpacing="1" > 
                <columns> 
                
                <asp:BoundField DataField="RecID" Visible="False"/> 
                <asp:BoundField DataField="PlaceID" Visible="False"/>
                <asp:BoundField DataField="BillingDate" HeaderText= "Billing Date" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="PlaceStart" HeaderText= "Placement Start" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="PlaceEnd" HeaderText= "Placement End" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="ProgDesc" HeaderText= "Program Desc" />
                <asp:BoundField DataField="Rate" HeaderText= "Program Rate" />
                <asp:BoundField DataField="QRIS" HeaderText= "QRIS ?" />
                <asp:BoundField DataField="ParentFee" HeaderText= "Parent Fee"  />
                <asp:BoundField DataField="TransRate" HeaderText= "Trans Rate" />
                <asp:BoundField DataField="Days" HeaderText= "Days" />
                <asp:BoundField DataField="Units" HeaderText= "Units" />
                <asp:BoundField DataField="Total" HeaderText="Total Amount"/>
                
                </columns>
                    <HeaderStyle BackColor="Silver" CssClass="button"/>
                    <RowStyle CssClass="pagetext" Font-Size="Small"/>
                    <AlternatingRowStyle BackColor="#FFFFC0" />
        </asp:GridView>
        </td>
    </tr>
</table>
<%--<table id="breakTable2" runat="server"><tr><td><br /></td></tr></table>
<table id="childInfo4" class="formtext" cellpadding="0" cellspacing="0" border="0"
style="width: 100%; background-color: #dde9d5">
    <tr>
        <td style="vertical-align:top"><b>Total Paid Detail</b></td>
        <td colspan="12">
        <asp:GridView ID="grdChildDetail" runat="server" AllowSorting="False" AutoGenerateColumns="False" border="1" CellPadding="1" CellSpacing="1" > 
                <columns> 
                
                <asp:BoundField DataField="RecID" Visible="False"/> 
                <asp:BoundField DataField="PlaceID" Visible="False"/>
                <asp:BoundField DataField="BillingDate" HeaderText= "Billing Date" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="PlaceStart" HeaderText= "Placement Start" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="PlaceEnd" HeaderText= "Placement End" dataformatstring="{0:MM/dd/yyyy}" htmlencode="false" />
                <asp:BoundField DataField="ProgDesc" HeaderText= "Program Desc" />
                <asp:BoundField DataField="Rate" HeaderText= "Program Rate" />
                <asp:BoundField DataField="QRIS" HeaderText= "QRIS ?" />
                <asp:BoundField DataField="ParentFee" HeaderText= "Parent Fee"  />
                <asp:BoundField DataField="TransRate" HeaderText= "Trans Rate" />
                <asp:BoundField DataField="Days" HeaderText= "Days" />
                <asp:BoundField DataField="Units" HeaderText= "Units" />
                <asp:BoundField DataField="Total" HeaderText="Total Amount"/>
                
                </columns>
                    <HeaderStyle BackColor="Silver" CssClass="button"/>
                    <RowStyle CssClass="pagetext" Font-Size="Small"/>
                    <AlternatingRowStyle BackColor="#FFFFC0" />
        </asp:GridView>
        </td>
    </tr>
</table>

--%>
