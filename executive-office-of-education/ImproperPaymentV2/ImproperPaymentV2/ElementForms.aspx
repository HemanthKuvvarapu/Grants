<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ElementForms.aspx.cs" Inherits="_ElementForms" Title="Form 400 Worksheet" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> 

<%@ Register src="controls/PageDetailTitle.ascx" tagname="PageDetailTitle" tagprefix="uc3" %>
<%@ Register src="controls/FormTemplate.ascx" tagname="FormTemplate" tagprefix="uc2" %>
<%@ Register src="controls/ChildDetail.ascx" tagname="ChildDetail" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<%@ Register assembly="EECAjaxExtender" namespace="EEC.AspNet.CustomAjaxExtender" tagprefix="cc1" %>
<%@ Register Assembly="EECControls" Namespace="EEC.AspNet.CustomControls" TagPrefix="cc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript"> 
	    (function(i, s, o, g, r, a, m) { 
	    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function() { 
	    (i[r].q = i[r].q || []).push(arguments) 
	    }, i[r].l = 1 * new Date(); a = s.createElement(o), 
	    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) 
	    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga'); 
	
	    ga('create', 'UA-47744845-9', 'auto'); 
	    ga('send', 'pageview'); 
	</script>

    <script language="javascript" type="text/javascript">
            function changeTab(tab1ID, tab2ID, blkTab1ID, blkTab2ID, targetTab)
            {
                if (targetTab == '1')
                {
                    document.getElementById(tab1ID).style.backgroundColor = "#dde9d5";
                    document.getElementById(tab2ID).style.backgroundColor = "#D5D8E9";
                    document.getElementById(blkTab1ID).style.display = "block";
                    document.getElementById(blkTab2ID).style.display = "none";
                }
                else
                {
                    document.getElementById(tab1ID).style.backgroundColor = "#D5D8E9";
                    document.getElementById(tab2ID).style.backgroundColor = "#dde9d5";
                    document.getElementById(blkTab1ID).style.display = "none";
                    document.getElementById(blkTab2ID).style.display = "block";
                }
            }
        </script>
<script language="javascript" type="text/javascript">
function newWin(page, width, height) {
            try {
                // Open a new window
                var newPage = page;
                var sFeatures = "width=" + width + ",height=" + height + ",scrollbars=yes,resizable=yes";
                window.open(newPage, "", sFeatures);
            } catch (e) {
                alert(e);
            }
        }
</script>
<script language="javascript" type="text/javascript">
function newWinAll(page,width,height,top,left) {
	try {
		// Open a new window
		var newPage = page;
		var sFeatures = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",scrollbars=yes,resizable=yes"; //,toolbar=yes,menubar=1,location=1";
		window.open(newPage, "", sFeatures);		
	} catch (e) {
		alert(e);
	}
}
</script> 
<script language="javascript" type="text/javascript">

    function pausecomp(ms) {
        ms += new Date().getTime();
        while (new Date() < ms) { }
    } 

</script>
<script language="javascript" type="text/javascript">

    function selectChild(hidNames) {
        var url = "selectChild.aspx?hn=" + hidNames;
        window.location.assign(url);
    }
    
</script>    
<script language="javascript" type="text/javascript">    
var retValue = "";

function OnComplete(args)
{
    retValue = args;
}
function OnTimeout(args)
{
//    alert("Timeout occurred!");
}
function OnError()
{
    alert("Error occurred!");
}
</script>
<script language="javascript" type="text/javascript">
    var lstForms = '<%=lstForms.ClientID %>';
    var curDisplayFormID = '';
    var arrForms = new Array();
    var arrItemValue = new Array();
    var recID = '<%=RecID%>';
    var serviceDate = '<%=ServiceDate%>';
    var completed = '<%=Completed%>';
    var recType = '<%=RecType%>';
    var funding = '<%=Funding%>';
    var eID = '<%=eID%>';
    var arrMenuItem = new Array();
    
    arrMenuItem['100'] = '<%=lnkMenu100.ClientID%>';
    arrMenuItem['200'] = '<%=lnkMenu200.ClientID%>';
    arrMenuItem['300'] = '<%=lnkMenu300.ClientID%>';
    arrMenuItem['310'] = '<%=lnkMenu310.ClientID%>';
    arrMenuItem['320'] = '<%=lnkMenu320.ClientID%>';
    arrMenuItem['330'] = '<%=lnkMenu330.ClientID%>';
    arrMenuItem['340'] = '<%=lnkMenu340.ClientID%>';
    arrMenuItem['350'] = '<%=lnkMenu350.ClientID%>';
    //arrMenuItem['360'] = '<%=lnkMenu360.ClientID%>';
    arrMenuItem['400'] = '<%=lnkMenu400.ClientID%>';
    arrMenuItem['410'] = '<%=lnkMenu410.ClientID%>';
    //arrMenuItem['420'] = '<%=lnkMenu420.ClientID%>';
    //arrMenuItem['430'] = '<%=lnkMenu430.ClientID%>';

    //arrMenuItem['490'] = '<%=lnkMenu490.ClientID%>';
    //arrMenuItem['500'] = '<%=lnkMenu500.ClientID%>';
    
    var isSaveClicked = "";
    
    function displayReviewerForm()
    {
        newWin("ReviewerComment.aspx?recID=" + recID, "550", "500");
        //var win = window.open("ReviewerComment.aspx?recID=" + recID, "ReviewerComment");
    }

    function displayMIDTableForm()
    {
        newWin("MIDTableForm.aspx?recID=" + recID, "1550", "1600");

    }

    function displayCaseSummary() {
        newWin("CaseSummaryForm.aspx?recID=" + recID, "1000", "800");

    }
    
    function displayHelp(helpBlockID)
    {
        if (document.getElementById(helpBlockID).style.display == "none")
        {
            document.getElementById(helpBlockID).style.display = "block";
        }
        else
        {
            document.getElementById(helpBlockID).style.display = "none";
        }
    }
    
    function changeMenuItemStatus(FormID, completed)
    {
        var id = arrMenuItem[FormID];
        var item = document.getElementById(id);
        
        if (item)
        {
            if (completed == '1') 
                item.className = "menutextdeactive";
            else
                item.className = "menutextactive";
        }
    }
    
    function displayAllCompleted()
    {
        displayCompletedForm(100, true);
        displayCompletedForm(200, true);
        displayCompletedForm(300, true);
        displayCompletedForm(310, true);
        displayCompletedForm(320, true);
        displayCompletedForm(330, true);
        displayCompletedForm(340, true);
        displayCompletedForm(350, true);
        //displayCompletedForm(360, true);    //Removed in V2
        displayCompletedForm(400, true);
        displayCompletedForm(410, true);
        //displayCompletedForm(420, true);    //Removed in V2
        //displayCompletedForm(430, true);    //Removed in V2

        //displayCompletedForm(490, true);
        //displayCompletedForm(500, true);
    }
    
    function displayCompletedForm(FormID, flag)
    {
        var arrItem = arrForms[FormID][1];
        
        for (var i=0; i<arrItem.length; i++)
        {
            document.getElementById(arrItem[i][1]).disabled = flag;
        }
        
        var arrResults = arrForms[FormID][4];
        
        for (var i=0; i<arrResults.length; i++)
        {
            document.getElementById(arrResults[i]).disabled = flag;
        }
        
        document.getElementById(arrForms[FormID][2]).disabled = flag;
        document.getElementById(arrForms[FormID][3]).disabled = flag;
        //document.getElementById(arrForms[FormID][6]).disabled = flag;
                            
        document.getElementById(arrForms[FormID][5][0]).disabled = flag;
        document.getElementById(arrForms[FormID][5][1]).disabled = flag;
        //document.getElementById(arrForms[FormID][5][2]).disabled = flag;

        //if (FormID == "410") 
        //{
        //    //document.getElementById(arrForms[FormID][5][2]).disabled = true;
        //    document.getElementById(arrForms[FormID][5][2]).disabled = false;
        //    document.getElementById(arrForms[FormID][6]).disabled = true;
        //}
        
        if (flag == true)
        {
            document.getElementById('<%=btnSaveForm.ClientID%>').disabled = true;
            document.getElementById(arrForms[FormID][8]).innerHTML = document.getElementById(arrForms[FormID][2]).value;
            document.getElementById(arrForms[FormID][7]).style.display = "block";
            document.getElementById(arrForms[FormID][2]).style.display = "none";            
            document.getElementById(arrForms[FormID][10]).innerHTML = document.getElementById(arrForms[FormID][3]).value;
            document.getElementById(arrForms[FormID][9]).style.display = "block";
            document.getElementById(arrForms[FormID][3]).style.display = "none";   
            //document.getElementById(arrForms[FormID][11]).style.display = "block";   
        }
        
        changeMenuItemStatus(FormID, completed);
    }
    
    function changeResultValue(checked, value)
    {
        if (checked) document.getElementById(arrForms[curDisplayFormID][5]).value = value;
    }

    function changeItemValue(id, value)
    {
        arrItemValue[id] = value;
    }

    function IsValidAmount(tblID)
    {
        var hasResult = true;
        //if (tblID == "410") 
        //{
        //    var txtAmount = document.getElementById(arrForms[tblID][6]).value;
        //    var improperAutho = document.getElementById(arrForms[tblID][5][2]);

        //    if ((improperAutho.value == "U" || improperAutho.value == "O") && (txtAmount.trim() == "")) {
        //        alert("Please enter a corrected total improper amount");
        //        hasResult = false;
        //    }
        //    else if (txtAmount.trim() != "" && txtAmount.trim() != "0.00" && txtAmount.trim() != "0" && (improperAutho.value == "NA" || improperAutho.value.trim() == "")) {
        //        alert("Please select an overauthorization or underauthorization option");
        //        hasResult = false;
        //    }
        //    //            else if (txtAmount.trim() != "") {
        //    //                if (!txtAmount.match("^\\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$")) {
        //    //                    alert("Please enter a corrected total improper amount (just numbers and decimal, no negative sign, etc.)");
        //    //                    hasResult = false;
        //    //                }
        //    //            }
        //}
        return hasResult;
    }
    
    function IsCompletedForm(tblID) 
    {
        var hasResult = true;
        
        arrResultValue = arrForms[tblID][5];

        //2020 - added an extra form item 2A but it has no value
        for (var i=0; i<arrForms[tblID][5].length; i++)
        {
            if (document.getElementById(arrForms[tblID][5][i]).value == "")
            {
                hasResult = false;
                alert("Form " + tblID + " is incomplete.");
                break;
            }
        }

//      10/2014 - Following is not needed, as we now pre-calculate and fill in the txtAmount value 

//        if (!hasResult)
//        {
//            //alert("Please choose a valid Result");
//        }
//        else {
//            if (tblID == "410") {

//                var txtAmount = document.getElementById(arrForms["410"][6]).value;

//                if (txtAmount.trim() != "") {
//                    if (!txtAmount.match("^\\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$")) {
//                        alert("Please enter a valid total amount");
//                        hasResult = false;
//                    }
//                }
//            }
//        }
        
        return hasResult;
    }

    function btnSaveClick(tblID) 
    {
        isSaveClicked = "1";
        saveInfo(tblID);
    }
    
    function saveInfo(tblID)
    {
        if (completed == '1') return;   //already completed, don't need to save
        
        window.status = "saving...";
        
        var chkXML = "";
        var elementXML = "";
        
        if (tblID == 420 || tblID == 430)
        {
            if (tblID == 420)
                updateReviewerEntryData420();
            else if (tblID == 430)
                updateReviewerEntryData430();
                    
            setReviewerEntryDataInfo();
            //return;   //form 420 or 430 don't need to save
        }
        else
        {
            var itemValue;
            var chkboxes = arrForms[tblID][1];
            
            //begin - build a item checkboxes xml
            chkXML = "<Items>";
            for (var i=0; i<chkboxes.length; i++)
            {
                if (arrItemValue[chkboxes[i][0]])
                {
                    itemValue = (arrItemValue[chkboxes[i][0]] == true)?"1":"0";
                }
                else
                {
                    itemValue = 0;
                }
                
                chkXML = chkXML + "<Item><ID>" + chkboxes[i][0] + "</ID><Value>" + itemValue + "</Value></Item>";
            }
            chkXML = chkXML + "</Items>";
            //end - build a item checkboxes xml
        }
        
        //begin - build a element xml
        var txtAnalysis = document.getElementById(arrForms[tblID][2]).value;
        var txtFindings = document.getElementById(arrForms[tblID][3]).value;
        var txtResult1 = document.getElementById(arrForms[tblID][5][0]).value;
        var txtResult2 = document.getElementById(arrForms[tblID][5][1]).value;
        var txtResult3 = tblID!="410" ? document.getElementById(arrForms[tblID][5][2]).value : "";
        var txtAmount = "";  //document.getElementById(arrForms[tblID][6]).value;

        //if (tblID == "410") 
        //{
        //    txtResult3 = document.getElementById(arrForms[tblID][5][2]).value;
        //    txtAmount = document.getElementById(arrForms[tblID][6]).value;
        //}
        elementXML = "<data>";
        elementXML = elementXML + "<Analysis><![CDATA[" + txtAnalysis + "]]></Analysis>";
        elementXML = elementXML + "<Findings><![CDATA[" + txtFindings + "]]></Findings>";
        elementXML = elementXML + "<Result1>" + txtResult1 + "</Result1>";
        elementXML = elementXML + "<Result2>" + txtResult2 + "</Result2>";
        elementXML = elementXML + "<Result3>" + txtResult3 + "</Result3>";
        elementXML = elementXML + "<Amount><![CDATA[" + txtAmount + "]]></Amount>";
        elementXML = elementXML + "<FormID>" + tblID + "</FormID>";
        elementXML = elementXML + "</data>";
        //end - build a element xml

        var sessionID = document.getElementById('<%=hidSessionID.ClientID%>').value;
        
        useAsyncRequest = false;
        IPServices.SaveFormInfo(recID, tblID, chkXML, elementXML, sessionID, OnComplete, OnTimeout, OnError);
                                          
        //if (tblID == 340 || tblID == 410 || tblID == 400)
        {
            if (tblID == 340) {
                if (typeof (updateReviewerEntryData340) == "function") {
                    updateReviewerEntryData340();
                    //also updates VarianceAmount on screen
                    if (curDisplayFormID == 340 && isSaveClicked == "1") {
                        isSaveClicked = "";
                        document.location.href = "ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding + "&completed=" + completed + "&eid=" + eID + "&lp=1";
                    }
                }
            }
            else if (tblID == 410) {
                if (typeof (updateReviewerEntryData410) == "function") {
                    updateReviewerEntryData410();
                    //also updates VarianceAmount on screen
                    if (curDisplayFormID == 410 && isSaveClicked == "1") {
                        isSaveClicked = "";
                        document.location.href = "ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding + "&completed=" + completed + "&eid=" + eID + "&lp=1";
                    }
                }
            }
            else if (tblID == 400) {
                if (typeof (updateReviewerEntryData400) == "function") {
                    updateReviewerEntryData400();
                    setReviewerEntryDataInfo();
                    document.getElementById('<%=hidLastFormID.ClientID%>').value = curDisplayFormID;
                    if (curDisplayFormID == 400 && isSaveClicked == "1") {
                        isSaveClicked = "";
                        document.location.href = "ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding + "&completed=" + completed + "&eid=" + eID + "&lp=1";
                    }
                }
            }
            else {  // JN 9/2020 do for all forms after Save
                if (isSaveClicked == "1") {
                    isSaveClicked = "";
                    document.location.href = "ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding + "&completed=" + completed + "&eid=" + eID + "&lp=1";
                }
            }
            setReviewerEntryDataInfo();
        }
        
        window.status = "";
    }

    function setReviewerEntryDataInfo()
    {
        useAsyncRequest = false;
        IPServices.SaveReviewerInfo(recID, 
                                    document.getElementById(reviewerEntryInfo[0][1]).value, 
                                    document.getElementById(reviewerEntryInfo[1][1]).value, 
                                    document.getElementById(reviewerEntryInfo[2][1]).value, 
                                    document.getElementById(reviewerEntryInfo[3][1]).value, 
                                    document.getElementById(reviewerEntryInfo[4][1]).value, 
                                    document.getElementById(reviewerEntryInfo[5][1]).value, 
                                    document.getElementById(reviewerEntryInfo[6][1]).value, 
                                    document.getElementById(reviewerEntryInfo[7][1]).value, 
                                    document.getElementById(reviewerEntryInfo[8][1]).value,
                                    document.getElementById(reviewerEntryInfo[9][1]).value,
                                    document.getElementById(reviewerEntryInfo[12][1]).value,
                                    document.getElementById(reviewerEntryInfo[13][1]).value,
                                    document.getElementById(reviewerEntryInfo[14][1]).value,
                                    document.getElementById(reviewerEntryInfo[15][1]).value,
                                    document.getElementById(reviewerEntryInfo[16][1]).value);
    }

    function resetCaseIncomplete() 
    {
        useAsyncRequest = false;
        IPServices.ResetCaseIncomplete(recID);

        completed = '0';
        selectChild(0);
        //window.location.assign ("selectChild.aspx?hn=0");
       
    }
    
    function SetCurrentForm(tblID)
    { 
        document.getElementById(arrForms[tblID][0]).style.display = "block";
        curDisplayFormID = tblID;
        document.getElementById('<%=hidCurFormID.ClientID%>').Value = tblID;
        ChangeFormStatus(tblID);
        
    }
    
    function ChangeFormStatus(tblID)
    {
        if (completed == '0')
        {
            displayCompletedForm(tblID, false);
            document.getElementById('<%=btnSaveForm.ClientID%>').disabled = false;
        }
        else    //completed = 1
        {
            displayCompletedForm(tblID, true);
            document.getElementById('<%=btnSaveForm.ClientID%>').disabled = true;
        }
    }
    
    function fnToggle(tblID) 
    {   
        if (IsValidAmount(curDisplayFormID))
        {
            //document.getElementById('<%=hidLastFormID.ClientID%>').value = curDisplayFormID;
            ChangeFormStatus(tblID);
            saveInfo(curDisplayFormID);
            
            //oDiv - the Filter to slide the tabs (style="filter: progid:DXImageTransform.Microsoft.Slide()") is no longer supported after IE 9; broke on Production server 12/2017
            //DX filters are (by default) disabled for the Internet Zone and enabled for the Local Intranet and Trusted Sites zones

            //oDiv.filters[0].slideStyle = 'HIDE';
            //oDiv.filters[0].Apply();   

            // After setting Apply, changes to the oDiv object 
            // are not displayed until Play is called.

            if (curDisplayFormID != "")
            {
                document.getElementById(arrForms[curDisplayFormID][0]).style.display = "none";
                document.getElementById(arrForms[tblID][0]).style.display = "block";
             }
                
            SetCurrentForm(tblID);
            //oDiv.filters[0].Play();
        }

        //var username = '<%=hidUserName.Value.ToString()%>';
        var isReadOnly = '<%=hidIsReadOnly.Value.ToString()%>'
        //var isReadOnly = '<%=Session["IsReadOnly"].ToString()%>';

        if (isReadOnly == "1")
        {
            displayAllCompleted();
            btnMarkCaseComplete.Disabled = true;
            btnReviewerForm.Disabled = true;
            btnSaveForm.Disabled = true;
        }
        
    }

    //function fnToggleAll() {
    //    var arrayIndex = Object.keys(arrForms);
    //    for (var i = 0; i < arrayIndex.length; i++) {

    //        if (arrayIndex[i] != curDisplayFormID) {
    //            //document.getElementById(arrForms[arrForms[i]).style.display = "none";
    //            document.getElementById(arrForms[arrayIndex[i]][0]).style.display = "block";
    //            document.getElementById(arrForms[arrayIndex[i]][0]).style.visibility = "hidden";
    //        }
    //    }
    //    //document.getElementById(curDisplayFormID).style.visibility = "visible";
    //    newWin('PrintForm.aspx', '820', '500');

    //}

    //function changeResultOptions(cboError, cboMissDocID, cboErrorAuthoID)
    function changeResultOptions(cboError, cboMissDocID)
    {
        if (cboError.value != "0")
        {
            //document.getElementById(cboMissDocID).value = "";
            //document.getElementById(cboErrorAuthoID).value = "";
            document.getElementById(cboMissDocID).disabled = false;
            //document.getElementById(cboErrorAuthoID).disabled = false;
        }
    }

    function changeMidResultOptions(cboMissDoc, cboMissDocID) {

        if (cboMissDoc.value == "N" || cboMissDoc.value == "") {
            document.getElementById(cboMissDocID).value = "N";
            document.getElementById(cboMissDocID).disabled = true;
        }
        else {
            document.getElementById(cboMissDocID).value = "Y";
            //document.getElementById(cboErrorAuthoID).value = "";
            document.getElementById(cboMissDocID).disabled = false;
            //document.getElementById(cboErrorAuthoID).disabled = false;
        }

    }

    function changePage()
    {
        saveInfo(curDisplayFormID);
    }


    function setCaseComplete() {

        saveInfo(curDisplayFormID);
        
        document.getElementById("tblError").style.display = "none";
        document.getElementById("tblDataEntryForm").style.display = "block";
        
        var arrFrm = new Array(100, 200, 300, 310, 320, 330, 340, 350, 400, 410);
        
        for (var i=0; i<arrFrm.length; i++)
        {
            if (!IsCompletedForm(arrFrm[i]))
            {
                document.getElementById("tblError").style.display = "block";
                document.getElementById("tblDataEntryForm").style.display = "none";
                return;
            }
        }
        
        //newWin("CheckFormsComplete.aspx?recID=" + recID, "550", "900");

    }


    function setDataEntryForm()
    {
        saveInfo(curDisplayFormID);
        
        document.getElementById("tblError").style.display = "none";
        document.getElementById("tblDataEntryForm").style.display = "block";
        
        //var arrFrm = new Array(100, 200, 300, 310, 320, 330, 340, 350, 360, 400, 410, 420, 430);
        var arrFrm = new Array(100, 200, 300, 310, 320, 330, 340, 350, 400, 410);
        
        for (var i=0; i<arrFrm.length; i++)
        {
            if (!IsCompletedForm(arrFrm[i]))
            {
                document.getElementById("tblError").style.display = "block";
                document.getElementById("tblDataEntryForm").style.display = "none";
                return;
            }
        }

        var txtResult1 = document.getElementById(arrForms[400][5][0]).value;
        var txtResult2 = document.getElementById(arrForms[400][5][1]).value;
        
        var txtResult3 = document.getElementById(arrForms[400][5][2]).value;
        var txtAmount = document.getElementById(arrForms[410][6]).value;
        
        if (txtAmount.trim() == "")
            txtAmount = "0.00";
            
        //document.getElementById('<%=txtDataEntryErrorNum.ClientID%>').innerText = txtResult1;
        //document.getElementById('<%=txtDataEntryMissingDoc.ClientID%>').innerText = txtResult2;

//        document.getElementById('<%=txtDataEntryImproperPaymentType.ClientID%>').innerText = txtResult3;
//        document.getElementById('<%=txtDataEntryImproperPayment.ClientID%>').innerText = "$" + txtAmount;
        document.getElementById(arrForms[400][5][2]).innerText = txtResult3;
        document.getElementById(arrForms[410][6]).innerText = "$" + txtAmount;
       
        //document.getElementById('<%=txtDataEntryErrorNumField.ClientID%>').value = txtResult1;
        //document.getElementById('<%=txtDataEntryMissingDocField.ClientID%>').value = txtResult2;
//        document.getElementById('<%=txtDataEntryImproperPaymentTypeField.ClientID%>').value = txtResult3;
//        document.getElementById('<%=txtDataEntryImproperPaymentField.ClientID%>').value = txtAmount;
//        document.getElementById(arrForms[410][5][2]).value = txtResult3;
//        document.getElementById(arrForms[410][6]).value = "$" + txtAmount;

    }

    function setFormComplete() 
    {
        var txtResult1 = document.getElementById(arrForms[400][5][0]).value;
        var txtResult2 = document.getElementById(arrForms[400][5][1]).value;
        
        var txtResult3 = document.getElementById(arrForms[400][5][2]).value;
        var txtAmount = document.getElementById(arrForms[410][6]).value;
        
        if (txtAmount.trim() == "")
            txtAmount = "0.00";
            
        //document.getElementById('<%=txtDataEntryErrorNum.ClientID%>').innerText = txtResult1;
        //document.getElementById('<%=txtDataEntryMissingDoc.ClientID%>').innerText = txtResult2;

//        document.getElementById('<%=txtDataEntryImproperPaymentType.ClientID%>').innerText = txtResult3;
//        document.getElementById('<%=txtDataEntryImproperPayment.ClientID%>').innerText = "$" + txtAmount;
        document.getElementById(arrForms[410][5][2]).innerText = txtResult3;
        document.getElementById(arrForms[410][6]).innerText = "$" + txtAmount;
       
        //document.getElementById('<%=txtDataEntryErrorNumField.ClientID%>').value = txtResult1;
        //document.getElementById('<%=txtDataEntryMissingDocField.ClientID%>').value = txtResult2;
//        document.getElementById('<%=txtDataEntryImproperPaymentTypeField.ClientID%>').value = txtResult3;
//        document.getElementById('<%=txtDataEntryImproperPaymentField.ClientID%>').value = txtAmount;
//        document.getElementById(arrForms[410][5][2]).value = txtResult3;
//        document.getElementById(arrForms[410][6]).value = "$" + txtAmount;

    }

    window.onunload = changePage;
    
</script>
<asp:Literal id="arrFormsInfo" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/WebServices/IPServices.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/scripts/eecajax.js" />
        </Scripts>
    </asp:ScriptManager>
    <table style="width: 920px" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <uc1:ChildDetail ID="childDetail" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <uc3:PageDetailTitle ID="pageDetailTitle" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="hidSessionID" runat="server" />
                <asp:HiddenField ID="hidLastFormID" runat="server" />
                <asp:HiddenField id="hidCurFormID" runat="server"/>
                <asp:HiddenField ID="hidUserName" runat="server" />
                <asp:HiddenField ID="hidIsReadOnly" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table id="menu" cellpadding="0" cellspacing="0" border="0" style="width: 100%; background-color: #eeeeee">
                    <tr>
                        <td>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu100" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('100')">100 APPLICATION/REDETERMINATION FORMS</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu200" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('200')">200 PRIORITY GROUP PLACEMENT</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu300" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('300')">300 QUALIFYING HEAD OF HOUSEHOLD</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu310" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('310')">310 RESIDENCY</asp:HyperLink></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu320" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('320')">320 PARENTAL WORK/TRAINING STATUS</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu330" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('330')">330 QUALIFYING CHILD</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu340" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('340')">340 QUALIFYING CARE</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu350" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('350')">350 QUALIFYING CARE AND PROVIDER ARRANGEMENT</asp:HyperLink></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu360" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('360')">360 PROVIDER REQUIREMENTS</asp:HyperLink></span>
                            -->
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu400" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('400')">400 FINANCIAL REQUIREMENTS</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu410" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('410')">410 PAYMENTS</asp:HyperLink></span>
                            <!--
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu420" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('420')">420 PAYMENT AMOUNT AUTHORIZED</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu430" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('430')">430 AUTHORIZATIONS/COMPUTATIONS</asp:HyperLink></span>
                            -->
                            <!-- 
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu490" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('490')">MID TABLE</asp:HyperLink></span>
                            <span style="background-color: #F0F5F2; border: solid 1px #D5D8E9; height: 25px;
                                padding-top: 3px; padding-bottom: 3px; padding-left: 15px; padding-right: 15px">
                                <asp:HyperLink ID="lnkMenu500" CssClass="menutextactive" runat="server" NavigateUrl="javascript:fnToggle('500')">500 CASE SUMMARY</asp:HyperLink></span>
                            -->
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" style="width: 947px; height: 30px;
                    background-color: #eeeeee">
                    <tr>
                        <td style="width: 600px">
                            <input type="button" id="btnMarkCaseComplete" value="Mark Case Complete" style="width: 150px" onclick="javascript:setDataEntryForm()" runat="server" enabled="false"/>
                            <%--<input type="button" id="btnMarkCaseComplete" value="Mark Case Complete" style="width: 150px" onclick="javascript:setCaseComplete()" runat="server" />--%>

                            <input type="button" ID="btnMarkCaseIncomplete" runat="server" style="width: 150px" onclick="javascript:resetCaseIncomplete();" 
                                value="Re-set Case InComplete" visible="false" />
                                
                            <input type="button" id="btnReviewerForm" value="Show Reviewer Form" style="width: 150px" onclick="javascript:displayReviewerForm();" runat="server" />

                            <input type="button" id="btnMIDTable" value="MID Table" style="width: 150px" onclick="javascript:displayMIDTableForm();" runat="server" />

                        </td>
                        <td align="right" style="width: 600px">
                            <!--
                            <input type="button" id="btnPrintFormAll" value="Print Form All" style="width: 150px" runat="server" 
                            onclick="javascript:fnToggle('100');javascript:newWinAll('PrintForm.aspx', '820', '500', 0, 0);javascript:pausecomp(500);javascript:fnToggle('200');javascript:newWinAll('PrintForm.aspx', '820', '500', 10, 10);javascript:pausecomp(500);javascript:fnToggle('300');javascript:newWinAll('PrintForm.aspx', '820', '500', 20, 20);javascript:pausecomp(500);javascript:fnToggle('310');javascript:newWinAll('PrintForm.aspx', '820', '500', 30, 30);javascript:pausecomp(500);javascript:fnToggle('320');javascript:newWinAll('PrintForm.aspx', '820', '500', 40, 40);javascript:pausecomp(500);javascript:fnToggle('330');javascript:newWinAll('PrintForm.aspx', '820', '500', 50, 50);javascript:pausecomp(500);javascript:fnToggle('340');javascript:newWinAll('PrintForm.aspx', '820', '500', 60, 60);javascript:pausecomp(500);javascript:fnToggle('350');javascript:newWinAll('PrintForm.aspx', '820', '500', 70, 70);javascript:pausecomp(500);javascript:fnToggle('400');javascript:newWinAll('PrintForm.aspx', '820', '500', 80, 80);javascript:pausecomp(500);javascript:fnToggle('
                                ');javascript:newWinAll('PrintForm.aspx', '820', '500', 90, 90)" 
                            />fnToggleAll
                            -->
                            <%--<input type="button" id="btnAllPrint" value="Print Form All" style="width: 150px" runat="server" 
                            onclick="javascript: fnToggleAll()" />--%>
                            <input type="button" id="btnCaseSummary" value="500 Case Summary" style="width: 150px" onclick="javascript:displayCaseSummary();" runat="server" />     
                            <input type="button" id="btnPrintForm" value="Print Form" style="width: 150px" onclick="javascript:newWin('PrintForm.aspx', '820', '500')"
                                runat="server" />
                            <input type="button" id="btnSaveForm" value="Save" style="width: 150px" onclick="javascript:btnSaveClick(curDisplayFormID)"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr>
            <td align="center">
                <span style="width: 100%; background-color: #1EB30E"><b>
                    <asp:Label ID="lblMIDTableIncomplete" Text="MID Table or Case Summary Incomplete" Style="display:block;width: 920px;
                                padding: 1px; padding-left: 10px; padding-right: 10px; color: #000000; background-color:red" Visible="false" runat="server"></asp:Label></b>               
               </span>

            </td>
        </tr>
        <tr>
            <td align="center">
                <span style="width: 100%; background-color: #1EB30E"><b>
                    <asp:Label ID="lblCompleted" Text="Case Record Completed" Style="display:block;width: 920px;
                                padding: 1px; padding-left: 10px; padding-right: 10px; color: #000000; background-color:#1EB30E" Visible="false" runat="server"></asp:Label></b>               
               </span>

            </td>
        </tr>
        <tr>
            <td>
                <div id="oDiv" style="width: 920px; filter: progid:DXImageTransform.Microsoft.Slide(duration=.7, bands='1');">
                    <asp:DataList Style="display: block" ID="lstForms" runat="server" OnItemDataBound="lstForms_ItemDataBound">
                        <ItemTemplate>
                            <uc2:FormTemplate ID="frmTemplate" runat="server" />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </td>
        </tr>
    </table>
    <cc1:EECModalPopupExtender ID="lnkEdit_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
        CancelControlID="btnEditCancel" DropShadow="True" DynamicServicePath="" Enabled="True"
        OkControlID="btnEditOK" PopupControlID="pnlEdit" TargetControlID="btnMarkCaseComplete"
        DisplayCloseAnimation="CenterShrink" DisplayOpenAnimation="CenterExpand" AnimationStartColor="d7d7d7"
        AnimationEndColor="cccccc">
    </cc1:EECModalPopupExtender>
    <asp:Panel ID="pnlEdit" runat="server" Style="display: none;background-color: #f4f7ec;
        border: solid 3px #b89c00; padding: 20px;">
        <table cellpadding="0" cellspacing="0" style="width:600px" id="tblError">
            <tr>
                <td style="background-color:Red">
                    Please complete all the results columns before finalizing this case record.
                    <asp:Label ID="ErrMsg" Text="" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table id="tblDataEntryForm" cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 600px;
            background-color: #F7F6F3; border-color: #E7E7FF; border-width: 1px; border-style: None;
            border-collapse: collapse;">
            <tr>
                <td colspan="3" align="center"><b><span style="background-color:#999999;color:#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;Data Entry Form&nbsp;&nbsp;&nbsp;&nbsp;</span></b></td>
            </tr>
            <tr style="background-color: #D5D8E9">
                <td align="center" style="width: 50px">
                    <b>Item #</b>
                </td>
                <td align="center" style="width: 450px">
                    <b>Item</b>
                </td>
                <td align="center" style="width: 100px">
                    <b>Coding</b>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>1.</b>
                </td>
                <td>
                    State
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryState" Text="MA" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryStateField" Value="MA" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>2.</b>
                </td>
                <td>
                    County
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryCounty" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryCountyField" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>3.</b>
                </td>
                <td>
                    Child ID
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryChildID" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryChildIDField" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>4.</b>
                </td>
                <td>
                    Sample Month/Year
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryMonth" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryMonthField" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>5.</b>
                </td>
                <td>
                    Record Review Date
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryReviewDate" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryReviewDateField" runat="server" />
                </td>
            </tr>
            <tr>
                <%--<td align="center">
                    <b>6.</b>
                </td>
                <td>
                    One or more case errors during sample review month 0=no errors, 1=one or more errors
                </td>--%>
                <td align="center">
                    <%--<asp:Label ID="txtDataEntryErrorNum" ForeColor="Blue" runat="server" />--%>
                    <asp:TextBox ID="txtDataEntryErrorNum" ForeColor="Blue" runat="server" Visible="false"/>
                    <asp:HiddenField ID="txtDataEntryErrorNumField" runat="server" />
                </td>
            </tr>
            <!--
            <tr>
                <td align="center">
                    <b>7.</b>
                </td>
                <td>
                    Total amount of Underauthorization or Overauthorization during sample review month
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryImproperPayment" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryImproperPaymentField" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>8.</b>
                </td>
                <td>
                    Type of improper authorization for payment (U=Underauthorization, O=Overauthorization
                    or NA = No Authorization Error)
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryImproperPaymentType" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryImproperPaymentTypeField" runat="server" />
                </td>
            </tr>
            -->
            <tr>
                <%--<td align="center">
                    <b>7.</b>
                </td>
                <td>
                    Reason for error due to insufficient or missing documentation (Y=Yes, N=No or NA=No
                    Error)
                </td>--%>
                <td align="center">
                    <%--<asp:Label ID="txtDataEntryMissingDoc" ForeColor="Blue" runat="server" />--%>
                    <asp:TextBox ID="txtDataEntryMissingDoc" ForeColor="Blue" runat="server" Visible="false"/>
                    <asp:HiddenField ID="txtDataEntryMissingDocField" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>8.</b>
                </td>
                <td>
                    Total Authorization Amount during sample review month
                </td>
                <td align="center">
                    <asp:Label ID="txtDataEntryTotalPaid" ForeColor="Blue" runat="server" />
                    <asp:HiddenField ID="txtDataEntryTotalPaidField" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table cellspacing="0" cellpadding="3" rules="all" border="0" width="600" style="background-color: #dde9d5">
                    <tr style="background-color: #dde9d5">
                        <td><b>Reviewer:</b> <cc3:EECTextBox ID="txtReviewerName" runat="server" Required="True" ErrorMessage="Please enter a valid name" ErrorDisplayInNewLine="true"></cc3:EECTextBox>&nbsp;&nbsp;</td>
                        <td><b>Date:</b> <cc3:EECTextBox ID="txtReviewDate" width="80px" runat="server" Required="True" ErrorMessage="Please enter a valid date" ErrorDisplayInNewLine="true"></cc3:EECTextBox>&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnMarkComplete" runat="server" onclick="btnMarkComplete_Click" 
                                Text="Mark Case Complete" />
                            <cc2:MaskedEditExtender ID="txtReviewDate_MaskedEditExtender" runat="server" 
                                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                        Mask="99/99/9999" MaskType="Date" TargetControlID="txtReviewDate">
                                    </cc2:MaskedEditExtender>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td align="center"><button id="btnEditOK" style="width:100px;display:none">OK</button><button id="btnEditCancel" style="width:100px">Close</button></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

