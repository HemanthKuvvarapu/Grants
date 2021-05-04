<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaymentReport.aspx.cs" Inherits="PaymentReport" Title="Untitled Page" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 620px;
        }

        #table {
            max-width: 2480px;
            width: 100%;
        }

        #table td {
                width: auto;
                overflow: hidden;
                word-wrap: break-word;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 50px; position:absolute">
            <tr>
                <td align="center">
                    <asp:Button ID="btnEdit1" CssClass="buttonClass" runat="server" Text="Edit IP Report"
                        CausesValidation="True" OnClick="btnEdit_Click" />
                </td>
            </tr>
        </table><br />
<asp:Label id="ErrorMsg" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label><br />
   
    <b>Part I. Program Assurances and Certifications</b><br />

                The Lead Agency, named below, assures and certifies the following: 
                <ol>
                    <li>The data collection process, including sample selection and case record reviews, adhered to all requirements of the instructions and regulations for Error Rate Reporting at 45 CFR 98 Subpart K. </li>
                    <li>The reviews were not conducted by persons who make or approve eligibility determinations or who are under the supervision of persons responsible for eligibility determinations.</li>
                    <li>All reviewers have been trained to ensure that the review process is consistent with state policies and that there is consistency within the state in interpretation of what is an error. </li>
                    <li>The state agrees to retain Record Review Worksheets, the State Improper Payments Report and any revisions, and any other records pertinent to the case reviews and submission of error rate reports for five years from the date of submission of the State Improper Payments Report or final revision submitted, whichever date is later. </li>
                    <li>The state understands that this information, including the sampled case records and calculations are subject to federal review.</li>
                </ol>
    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width:500px;background-color: #F7F6F3;border-color:#E7E7FF;border-width:1px;border-style:double;border-collapse:collapse">
       
        <tr>
            <td>
                Submission Date:
            </td>
            <td>
                <asp:Label runat="server" ID="txtSubmissionDate" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                Name:
            </td>
             <td>
                <asp:Label runat="server" ID="txtName" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                Signature:
            </td>
             <td>
                <asp:Label runat="server" ID="txtSignature" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                Title:
            </td>
             <td>
                <asp:Label runat="server" ID="txtTitle" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                State:
            </td>
             <td>
                <asp:Label  runat="server" ID="txtState" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                State Agency:
            </td>
             <td>
                <asp:Label runat="server" ID="txtStateAgency" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                Phone Number:
            </td>
             <td>
                <asp:Label runat="server" ID="txtPhoneNumber" Text="" Enabled="true" ></asp:Label>
            </td>
            </tr>
        <tr>
            <td>
                E-mail:
            </td>
             <td>
                <asp:Label runat="server" ID="txtEmail" Text="" Enabled="true" ></asp:Label>
            </td>

            </tr>
        <tr>
            <td>
                Fiscal Year:
            </td>
             <td>
                <asp:Label runat="server" ID="txtFiscalYear" Text="" Enabled="true" ></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <b>Part II. Error Measures Reporting </b>
    <br />
<b>Sample Cases:</b> <asp:Label ID="txtNumOfCaseRecord" runat="server" Text="" ForeColor="Blue"></asp:Label>&nbsp&nbsp;&nbsp;
<b>Cases Completed:</b> <asp:Label ID="txtNumOfCaseComplete" runat="server" Text="" ForeColor="Blue"></asp:Label>
&nbsp;<table cellspacing="0" cellpadding="3" rules="all" border="1" style="width:700px;background-color: #F7F6F3;border-color:#E7E7FF;border-width:1px;border-style:double;border-collapse:collapse">
    <tr style="background-color: #D5D8E9">
        <td align="center" style="width:50px" valign="top"><b>Item #</b></td>
        <td align="center" class="auto-style1" style="width:600px"></td>
        <td align="center" style="width:50px"></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>1.</b>
        <td class="auto-style1">Number of cases sampled</td>
        <td align="center">
            <asp:Label ID="txtNumOfCaseRecordCompete" runat="server" ForeColor="blue"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>2.</b></td>
        <td class="auto-style1">Total number of cases with an error</td>
        <td align="center"><asp:Label ID="txtNumOfErrorCase" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>3.</b></td>
        <td class="auto-style1">Percentage of cases with an error</td>
        <td align="center"><asp:Label ID="txtPercentCasesError" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>4.</b></td>
        <td class="auto-style1">Total number of cases with improper payment</td>
        <td align="center"><asp:Label ID="txtNumCaseImproperPayment" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>5.</b></td>
        <td class="auto-style1">Percentage of cases with improper payment</td>
        <td align="center"><asp:Label ID="txtPercentCaseImproperPayment" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>6.</b></td>
        <td class="auto-style1">Total number of cases with an improper payment due to missing or insufficient documentation (MID)</td>
        <td align="center"><asp:Label ID="txtNumOfIPMID" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>7A.</b></td>
        <td class="auto-style1">Total number of MID errors with identified potential improper payments</td>
        <td align="center"><asp:Label ID="txtTotalMIDErrors" runat="server" ForeColor="Blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>7B.</b></td>
        <td class="auto-style1">Total dollar amount of potential improper payments resulting from the MID errors. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalDollarIPMID" runat="server" ForeColor="Blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>8A.</b></td>
        <td class="auto-style1">Total number of MID potential improper payment errors that was mitigated using an additional inquiry (AI)</td>
        <td align="center"><asp:Label ID="txtNumOfMIDErrorsMitigatedAI" runat="server" ForeColor="Blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>8B.</b></td>
        <td class="auto-style1">Total dollar amount of MID potential improper payments that was mitigated using an AI. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalAmtMIDErrorsMitigatedAI" runat="server" ForeColor="Blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>9A.</b></td>
        <td class="auto-style1">Total number of MID improper payment errors that, after an AI was considered and possibly used, still resulted in an improper payment</td>
        <td align="center"><asp:Label ID="txtNumOfMIDErrorsAfterAI" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>9B.</b></td>
        <td class="auto-style1">Total dollar amount of MID improper payments that resulted even after an AI was considered and possibly used. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalAmtOfMIDAfterAI" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>10.</b></td>
        <td class="auto-style1">Total amount of payments for the sampled cases. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalAmtForSampledCases" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>11.</b></td>
        <td class="auto-style1">Total amount of improper payments for review period (gross amount of underpayments and overpayments)</td>
        <td align="center"><asp:Label ID="txtTotalGrossForReviewPeriod" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
     <tr>
        <td align="center" valign="top"><b>11A.</b></td>
        <td class="auto-style1">Total amount of underpayments for review period. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalAmtOfUnderPaymentsForReviewPeriod" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
     <tr>
        <td align="center" valign="top"><b>11B.</b></td>
        <td class="auto-style1">Total amount of overpayments for review period. Apply the state’s pooling factor if pooled funds were used.</td>
        <td align="center"><asp:Label ID="txtTotalAmtOfOverPaymentsForReviewPeriod" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
   <tr>
        <td align="center" valign="top"><b>12.</b></td>
        <td class="auto-style1">Percentage of the total amount of payments for the sampled cases that are improper payments</td>
        <td align="center"><asp:Label ID="txtPercentageTotalOfPayments" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>13.</b></td>
        <td class="auto-style1">Average amount of improper payments</td>
        <td align="center"><asp:Label ID="txtAvgAmtOfIP" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>14A.</b></td>
        <td class="auto-style1">Total annual amount of CCDF subsidy payments</td>
        <td align="center"><asp:Label ID="txtTotalAmtOfCCDFSubsidyPayment" runat="server" ForeColor="blue"></asp:Label></td>
    </tr>
   
    <tr>
        <td align="center" valign="top"><b>14B.</b></td>
        <td class="auto-style1">Estimated annual amount of improper payments</td>
        <td align="center"><asp:Label runat="server" ID="txtEstAnualAmtOfIP" Text="" ForeColor="blue"></asp:Label></td>
    </tr>

    <tr>
        <td align="center" valign="top"><b>15.</b></td>
        <td class="auto-style1">Check the appropriate response based on whether the state combines or pools funds, and conducted its reviews based on a sample drawn from a universe of cases served by these pooled funds. Check one of the following:<br />
            <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td valign="top">a.</td>
                    <td valign="top"><asp:CheckBox ID="chkNotSampleDrawnFromPooled" runat="server"  Enabled="false"/></td>
                    <td valign="top">The review was not based on a sample drawn from pooled funds.</td>
                </tr>
                <tr>
                    <td valign="top">b.</td>
                    <td valign="top"><asp:CheckBox ID="chkSampleDrawnFromPooled" runat="server" Enabled="false" /></td>
                    <td valign="top">The review was based on a sample drawn from pooled funds, and the state applied pooling factor from the relevant ACF-800 reporting form.<br />
                        b-i. indicate the number of sampled cases that used pooled funds.<br />
                        <asp:Label runat="server" ID="txtNumOfSampledCasesPooled" Text=""></asp:Label>
                        <br />
                        b-ii. indicate the percentage of sampled cases that used pooled funds.<br />                         
                        <asp:Label runat="server" ID="txtPercentageOfSampledCasesPooled" Text=""></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td valign="top">c.</td>
                    <td valign="top"><asp:CheckBox ID="chkSampleDrawnFromPooledButNoPooling" runat="server"  Enabled="false"/></td>
                    <td valign="top">The review was based on a sample drawn from pooled funds, but the state did not apply the pooling factor found on the relevant ACF-800 reporting form.<br />
                        c-i. provide the pooling factor.<br />
                        <asp:Label runat="server" ID="txtPoolingFactor" Text=""></asp:Label><br />
                        c-ii. explain the derivation of this pooling factor. <br />
                        <asp:Label runat="server" ID="txtpoolingFactorDerivation" Text=""></asp:Label><br />
                        c-iii. indicate the number of sampled cases that used pooled funds. <br />
                        <asp:Label runat="server" ID="txtNumOfSampledCasesPooledCiii" Text=""></asp:Label><br />
                        c-iv. indicate the percentage of sampled cases that used pooled funds.<br />
                        <asp:Label runat="server" ID="txtPercentageOfSampledCasesPooledCiv" Text=""></asp:Label>

                    </td>
                </tr>               
            </table>
        </td>
        <td align="center"></td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>16.</b></td>
        <td class="auto-style1" colspan="2">Number of replacement cases used each month of the 12-month review period and reason for each replacement<br />
            <table width="600" cellspacing="2" cellpadding="0" border="1">
                <tr>
                    <th valign="top"><asp:Label ID="lblMonth16A" runat="server" Text="Month"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblReason16B" runat="server" Text="Reason(s) for Replacement Cases (please list)"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblNoOfTimesReason16C" runat="server" Text="# Times Reason Used"></asp:Label></th>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth1" Text="October"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month1" runat="server" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month1" runat="server" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month1" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month1" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month1" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth2" Text="November"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month2" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month2" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month2" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth3" Text="December"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month3" runat="server" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month3" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month3" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month3" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth4" Text="January"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month4" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month4" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month4" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth5" Text="February"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month5" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month5" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month5" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month5" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month5" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month5" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth6" Text="March"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month6" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month6" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month6" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month6" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month6" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month6" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth7" Text="April"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month7" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month7" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month7" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month7" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month7" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month7" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth8" Text="May"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month8" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month8" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month8" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month8" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month8" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month8" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth9" Text="June"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month9" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month9" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month9" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month9" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month9" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month9" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth10" Text="July"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month10" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month10" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month10" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month10" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month10" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month10" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth11" Text="August"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month11" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month11" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month11" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month11" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month11" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month11" Text=""></asp:Label> <br /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label runat="server" ID="lblMonth12" Text="September"></asp:Label></td>
                    <td valign="top" width="400">1.<asp:Label ID="txtReason1Month12" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    2.<asp:Label ID="txtReason2Month12" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br />
                    3.<asp:Label ID="txtReason3Month12" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top">1.<asp:Label runat="server" ID="txtNumOfTimesUsed1Month12" Text=""></asp:Label><br />
                        2.<asp:Label runat="server" ID="txtNumOfTimesUsed2Month12" Text=""></asp:Label><br />
                        3.<asp:Label runat="server" ID="txtNumOfTimesUsed3Month12" Text=""></asp:Label> <br /></td>
                </tr>
             </table>
        </td>

    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
        If there are more than three replacement cases in a single month, and there are more than three reasons, place an asterisk after the name of the month and include the additional information below the table.
            </td>
       
    </tr>
    <tr><td>&nbsp;</td></tr>
    

</table>
    <b>Part III. State Response to Error-Measures Findings </b><br />
    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width:700px;background-color: #F7F6F3;border-color:#E7E7FF;border-width:1px;border-style:double;border-collapse:collapse">
    <tr style="background-color: #D5D8E9">
        <td align="center" style="width:50px" valign="top"><b>Item #</b></td>
        <td align="center" class="auto-style1" style="width:600px"></td>
        <td align="center" style="width:50px"></td>
    </tr>
    
    <tr>
        <td align="center" valign="top"><b>17.</b></td>
        <td class="auto-style1" colspan="2">Describe lessons learned or improvements made in implementation of the review process during the current review cycle.<br />
            <asp:Label ID="txtLessonsLearned" runat="server" Text="" TextMode="MultiLine" cols="30" rows="5" Width="450" MaxLines="8" TextWrapping="Wrap"></asp:Label>
            <br /><br /><br /></td>
    </tr>
        <tr>
        <td align="center" valign="top"><b>18.</b></td>
        <td class="auto-style1" colspan="2">For each potential improper payment error due to missing or insufficient documentation, enter the following:<br />
            <em> a. the Element number of the RRW where the error was identified;<br />
                b. a description of what documentation was missing or insufficient;<br />
                c. the dollar amount of the potential improper payment; <br />
                d. a description of the AI that was done or an explanation of why there was no appropriate AI; <br />
                e. (if an AI was used) the dollar amount (if any) that was able to be mitigated; <br />
                f. (if an AI was used) how the state determined whether or not the potential improper payment could be mitigated.<br />
            </em>
            <table width="600" cellspacing="0" cellpadding="0" border="1">
                <tr>
                    <th valign="top">a) <asp:Label ID="lblElement18A" runat="server" Text="Element #"></asp:Label></th>
                    <th valign="top">b) <asp:Label ID="lblMID18B" runat="server" Text="What was the MID?"></asp:Label></th>
                    <th valign="top">c) <asp:Label ID="lblAmtIP18C" runat="server" Text="Dollar amount of potential IP"></asp:Label></th>
                    <th valign="top">d) <asp:Label ID="lblInfoAIUsed18D" runat="server" Text="AI used? Describe why or why not"></asp:Label></th>
                    <th valign="top">e) <asp:Label ID="lblAmtMitigated18E" runat="server" Text="How much mitigated?"></asp:Label></th>
                    <th valign="top">f) <asp:Label ID="lblExplanation18F" runat="server" Text="Explain how state determined whether or not the potential IP could be mitigated"></asp:Label></th>
                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtElement1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtMID1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtOfIP1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtInfoAIUsed1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtMitigated1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtExplanation1" runat="server" Text=""  TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                </tr>
               <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtElement2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtMID2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtOfIP2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtInfoAIUsed2" runat="server" Text=""  TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtMitigated2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtExplanation2" runat="server" Text=""  TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                </tr>
                 <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtElement3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtMID3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtOfIP3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtInfoAIUsed3" runat="server" Text=""  TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtMitigated3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtExplanation3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                </tr>
               <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtElement4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtMID4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtOfIP4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtInfoAIUsed4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtMitigated4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtExplanation4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtElement5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtMID5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtOfIP5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtInfoAIUsed5" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtAmtMitigated5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtExplanation5" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                </tr>
            </table>

        </td>

    </tr>
        <tr>
        <td align="center" valign="top"><b>19.</b></td>
        <td class="auto-style1" colspan="2">Identify all causes of improper payments (see Item 4 above). List each cause, the number of cases with an error due to this cause, an example of an error, and whether this cause involved missing or insufficient documentation.

            <table width="600" cellspacing="0" cellpadding="0" border="1">
                <tr>
                    <th valign="top"><asp:Label ID="lblCause19A" runat="server" Text="Cause"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblNoOfCases19B" runat="server" Text="#Cases"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblExample19C" runat="server" Text="Example"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblIsMID19D" runat="server" Text="MID? (Y/N)"></asp:Label></th>
                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtCause1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtNoOfCases1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtExample1" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="rbIsMID1" runat="server"> </asp:Label>&nbsp;<br /><br />
                        </td>
                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtCause2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtNoOfCases2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtExample2" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="rbIsMID2" runat="server"></asp:Label>&nbsp;<br /><br />
                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtCause3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtNoOfCases3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtExample3" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="rbIsMID3" runat="server"></asp:Label>&nbsp;<br /><br />
                    </td>

                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtCause4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtNoOfCases4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtExample4" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="rbIsMID4" runat="server"></asp:Label>&nbsp;<br /><br />
                    </td>

                </tr>
                <tr>
                    <td valign="middle" width="400"><asp:Label ID="txtCause5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400"><asp:Label ID="txtNoOfCases5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle"><asp:Label ID="txtExample5" runat="server" Text=""></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="rbIsMID5" runat="server"></asp:Label>&nbsp;<br /><br />
                    </td>
                </tr>
            </table>
        </td>
            
    </tr>
        <tr>
        <td align="center" valign="top"><b>20.</b></td>
        <td class="auto-style1" colspan="2">List the causes of improper payment errors identified in Item 19. For each cause, describe the action steps planned in between review cycles in order to reach the targeted reductions identified in Item 23, the timeline for implementing the action steps, and method(s) that will be used to measure progress and the impact of the action steps.<br /><br /><br /><br />
            <table width="600" cellspacing="0" cellpadding="0" border="1">
                <tr>
                    <th valign="top"><asp:Label ID="lblError20A" runat="server" Text="Error"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblCause20B" runat="server" Text="Cause of Error"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblAction20C" runat="server" Text="Action Steps"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblTimeLine20D" runat="server" Text="Timeline"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblProgress20E" runat="server" Text="Progress Measurement"></asp:Label></th>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorA" runat="server" Text="1."></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtCauseA" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtActionA" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtTimeLineA" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtProgressMeasurementA" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorB" runat="server" Text="2."></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtCauseB" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtActionB" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtTimeLineB" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtProgressMeasurementB" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorC" runat="server" Text="3."></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtCauseC" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtActionC" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtTimeLineC" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtProgressMeasurementC" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorD" runat="server" Text="4."></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtCauseD" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtActionD" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtTimeLineD" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="middle" width="400">
                        <asp:Label ID="txtProgressMeasurementD" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                
            </table>

        </td>
       </tr>
        <tr>
        <td align="center" valign="top"><b>21A.</b></td>
        <td class="auto-style1" colspan="2">State the amount of improper payments the state expects to recover as a result of the review. If the amount is less than the total amount of overpayments (see Item 11B above), provide a summary of the reasons limiting the collections.<br />
            <asp:Label ID="txtExpectedIPToRecover" runat="server" Text="" TextMode="MultiLine" cols="30" Rows="5" Width="800" MaxLines="8" TextWrapping="Wrap"></asp:Label>
        </td>

             
    </tr>
        <tr>
        <td align="center" valign="top"><b>21B.</b></td>
        <td class="auto-style1" colspan="2">State the amount of improper payments the state recovered as a result of the previous review. If the amount is less than the total amount expected to have been recovered according to the previous report, describe the reasons.<br />
            <asp:Label ID="txtAmtOfIPRecoved" runat="server" Text="" TextMode="MultiLine" cols="30" Rows="5" Width="800" MaxLines="8" TextWrapping="Wrap"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>22.</b></td>
        <td class="auto-style1" colspan="2">Describe the information systems and other infrastructure that assist the state in identifying and reducing improper payments. If the Lead Agency does not have these tools, describe actions to be taken to acquire the necessary information systems and other infrastructure.<br />
            <asp:Label ID="txtInfoSysAndInfraDesc" runat="server" Text="" TextMode="MultiLine" cols="30" Rows="5" Width="800" MaxLines="8" TextWrapping="Wrap"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>23.</b></td>
        <td class="auto-style1" colspan="2">Provide the findings for the current cycle, data and targets for the prior and current cycles, and targets for the next cycle for percentage of cases with an error, percentage of cases with an improper payment, percentage of improper payments, average amount of improper payments, and estimated annual amount of improper payments.
             <table width="600" cellspacing="0" cellpadding="0" border="1">
                <tr>
                    <th valign="top"><asp:Label ID="lblErrorMeasurement23A" runat="server" Text="Error Measures"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblPriorCycleData23B" runat="server" Text="Prior Cycle Data"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblPriorCycleTarget23C" runat="server" Text="Prior Cycle Target"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblCurrentCycleData23D" runat="server" Text="Current Cycle Data"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblCurrentCycleTarget23E" runat="server" Text="Current Cycle Target"></asp:Label></th>
                    <th valign="top"><asp:Label ID="lblNextCycletarget23F" runat="server" Text="Target for Next Cycle"></asp:Label></th>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorMeasurement1" runat="server" Text="Percentage of cases with an error"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleData1" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleTarget1" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCucleData1" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCycleTarget1" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtTagetForNextCycle1" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorMeasurement2" runat="server" Text="Percentage of cases with an improper payment"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleData2" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleTarget2" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCucleData2" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCycleTarget2" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtTagetForNextCycle2" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorMeasurement3" runat="server" Text="Percentage of total amount of payments for the sample that are improper payments"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleData3" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleTarget3" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCucleData3" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCycleTarget3" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtTagetForNextCycle3" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorMeasurement4" runat="server" Text="Average amount of improper payments"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleData4" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleTarget4" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCucleData4" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCycleTarget4" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtTagetForNextCycle4" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lblErrorMeasurement5" runat="server" Text="Estimated annual amount of improper payments"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleData5" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtPriorCycleTarget5" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCucleData5" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtCurrentCycleTarget5" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                    <td valign="top"><asp:Label ID="txtTagetForNextCycle5" runat="server" Text="" TextWrapping="Wrap"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td align="center" valign="top"><b>24.</b></td>
        <td class="auto-style1" colspan="2">If any targets were not met, provide an explanation of why the state did not meet these targets and describe how the actions outlined in Item 20 will address these areas.<br />
            <asp:Label ID="txtExpOfTargetsNotMet" runat="server" Text="" TextMode="MultiLine" cols="30" Rows="5" Width="800" MaxLines="8" TextWrapping="Wrap"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"><b>25.</b></td>
        <td class="auto-style1" colspan="2">List the causes of improper payment errors identified in the previous cycle (item 17 in the 2015 ACF-404 or item 20 in the 2018 ACF-404) and for each cause, describe the action steps that were taken, (including dates), to correct the cause, whether the action steps reduced the identified errors, and how any progress was measured. Discuss any barriers to the effectiveness of the action steps to reduce improper payments.<br /><br /><br /><br />
            <table width="600" cellspacing="0" cellpadding="0" border="1">
                <tr>
                    <th valign="top">Improper Payment Error</th>
                    <th valign="top">Action steps and dates when taken</th>
                    <th valign="top">Did the action steps reduce the identified errors?</th>
                    <th valign="top">How did you measure your progress in reducing the identified errors?</th>
                    <th valign="top">Barriers to reducing error</th>
                </tr>
                <tr>
                     <td valign="top"><asp:Label ID="txtIPError1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtActionsIPError1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="rbActionStepsReduceErrors1" runat="server"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtHowMeasured1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtBarriersToReduceErrors1" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                 
                </tr>
                <tr>
                      <td valign="top"><asp:Label ID="txtIPError2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtActionsIPError2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="rbActionStepsReduceErrors2" runat="server"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtHowMeasured2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtBarriersToReduceErrors2" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                 
                </tr>
                <tr>
                      <td valign="top"><asp:Label ID="txtIPError3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtActionsIPError3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="rbActionStepsReduceErrors3" runat="server"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtHowMeasured3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtBarriersToReduceErrors3" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                 
                </tr>
                <tr>
                      <td valign="top"><asp:Label ID="txtIPError4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtActionsIPError4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="rbActionStepsReduceErrors4" runat="server"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtHowMeasured4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                    <td valign="top"><asp:Label ID="txtBarriersToReduceErrors4" runat="server" Text="" TextWrapping="Wrap"></asp:Label>&nbsp;<br /><br /></td>
                 
                </tr>
                
            </table>

        </td>
    </tr>
        </table>
    "THE PAPERWORK REDUCTION ACT OF 1995" Public reporting for this collection of information is estimated to average 639 hours per response, including the time for reviewing instructions, gathering and maintaining the data needed, and reviewing the collection of information.

    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 80px">
            <tr>
                <td align="center">
                    <asp:Button ID="btnEdit" CssClass="buttonClass" runat="server" Text="Edit IP Report"
                        CausesValidation="True" OnClick="btnEdit_Click" />
                </td>
            </tr>
        </table>
</asp:Content>



