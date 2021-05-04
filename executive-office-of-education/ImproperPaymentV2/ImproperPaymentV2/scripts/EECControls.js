var ErrorBackgroundColor = "#ffd";
var arryStyle = new Array();



function EECControlsValidatorGetValue(id) 
{
    var control;
    control = document.getElementById(id);
    if (control.type == "checkbox" || control.type == "radio")
    {
        return (control.checked)?"checked":"";
    }
    else if (typeof(control.value) == "string") 
    {
        return control.value;
    }
    
    return EECControlsValidatorGetValueRecursive(control);
}
function EECControlsValidatorGetValueRecursive(control)
{
    if (typeof(control.value) == "string" && (control.type != "radio" || control.checked == true)) {
        return control.value;
    }
    var i, val;
    for (i = 0; i<control.childNodes.length; i++) {
        val = EECControlsValidatorGetValueRecursive(control.childNodes[i]);
        if (val != "") return val;
    }
    return "";
}
function EECControlsRequiredFieldValidatorEvaluateIsValid(val) 
{
    if (IsInVisibleContainer(document.getElementById(val.controltovalidate)) && !IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        var bresult = (ValidatorTrim(EECControlsValidatorGetValue(val.controltovalidate)) != ValidatorTrim(val.initialvalue));
        SetErrorControlBackground(val.controltovalidate, bresult);
        return bresult;
    }
    
    return true;
}
function EECRequiredAllOrNoneFieldValidatorEvaluateIsValid(val)
{
    emptyFields = new Array();
    allEmptyFields = true;
    arrIndex = 0;
    
    for (var i=0; i<val.controltovalidate.length; i++)
    {
        var sCon = val.controltovalidate[i];
        var sInitValue = val.initialvalue[i];
        
        if (IsInVisibleContainer(document.getElementById(sCon)) && !IsDisabledControl(document.getElementById(sCon)))
        {
            var bresult = (ValidatorTrim(EECControlsValidatorGetValue(sCon)) != ValidatorTrim(sInitValue));
            if (bresult) 
            {
                if (allEmptyFields)
                {
                    allEmptyFields = false;
                }
            }
            else
            {
                arrIndex = emptyFields.length;
                emptyFields[arrIndex] = sCon;
            }
        }
    }
    
    var iLength = emptyFields.length;
        
    if (!allEmptyFields)
    {    
        for (var i=0; i<iLength; i++)
        {
            SetErrorControlBackground(emptyFields[i], bresult);
        }
    }
    
    return allEmptyFields;
}
function EECControlsAgeCompareValidatorEvaluateIsValid(val) 
{
    var value = EECControlsValidatorGetValue(val.controltovalidate);
    if (value.length == 0 || IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        return true;
    }
    else if (IsInVisibleContainer(document.getElementById(val.controltovalidate)) && !IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        var bresult = true;
        if (typeof(val.datetocompare) == "string")
        {
            var datetocompare = val.datetocompare;
            
            if (isDate(value))
            {
                var date1 = new Date(datetocompare);
                var date2 = new Date(value);
                
                if (val.operator == "LessThan")
                    bresult = (date2 > date1);
                else if (val.operator == "LessThanEqual")
                    bresult = (date2 > date1 || (date2.getDate() == date1.getDate() && date2.getMonth() == date1.getMonth() && date2.getFullYear() == date1.getFullYear()));
                else if (val.operator == "Equal")
                    bresult = (date2.getDate() == date1.getDate() && date2.getMonth() == date1.getMonth() && date2.getFullYear() == date1.getFullYear());
                else if (val.operator == "GreaterThan")
                    bresult = (date2 < date1);
                else if (val.operator == "GreaterThanEqual")
                    bresult = (date2 < date1 || (date2.getDate() == date1.getDate() && date2.getMonth() == date1.getMonth() && date2.getFullYear() == date1.getFullYear()));
            }
        }
        SetErrorControlBackground(val.controltovalidate, bresult);
        return bresult;
    }
    
    return true;
}
function EECControlsCompareValidatorEvaluateIsValid(val) 
{
    var value = EECControlsValidatorGetValue(val.controltovalidate);
    if (ValidatorTrim(value).length == 0 || IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        return true;
    }
    else
    {   
        var bresult; 
        var compareTo = "";
        if ((typeof(val.controltocompare) != "string") ||
            (typeof(document.getElementById(val.controltocompare)) == "undefined") ||
            (null == document.getElementById(val.controltocompare))) {
            if (typeof(val.valuetocompare) == "string") {
                compareTo = val.valuetocompare;
            }
        }
        else {
            compareTo = EECControlsValidatorGetValue(val.controltocompare);
        }
        var operator = "Equal";
        if (typeof(val.operator) == "string") {
            operator = val.operator;
        }
        bresult = ValidatorCompare(value, compareTo, operator, val);
        SetErrorControlBackground(val.controltovalidate, bresult);
        return bresult;
    }
}
function EECControlsDateFieldValidatorEvaluateIsValid(val)
{
    var value = EECControlsValidatorGetValue(val.controltovalidate);
    if (ValidatorTrim(value).length == 0 || IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        return true;
    }
    else
    {    
        var bresult = isDate(value);
        SetErrorControlBackground(val.controltovalidate, bresult);
        return bresult;
    }
}
function EECControlsRegularExpressionValidatorEvaluateIsValid(val) 
{
    var value = ValidatorTrim(EECControlsValidatorGetValue(val.controltovalidate));
    if (value.length == 0 || IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        return true;
    }
    else
    {    
        var rx = new RegExp(val.validationexpression);
        var matches = rx.exec(value);
        var bresult = (matches != null && value == matches[0]);
        SetErrorControlBackground(val.controltovalidate, bresult);
        return bresult;
    }
}
function EECControlsRangeValidatorEvaluateIsValid(val) 
{
    var value = EECControlsValidatorGetValue(val.controltovalidate);
    var bresult;
    if (ValidatorTrim(value).length == 0 || IsDisabledControl(document.getElementById(val.controltovalidate)))
    {
        return true;
    }
    else
    {
        bresult = (ValidatorCompare(value, val.minimumvalue, "GreaterThanEqual", val) &&
                   ValidatorCompare(value, val.maximumvalue, "LessThanEqual", val));
        SetErrorControlBackground(val.controltovalidate, bresult)
        return bresult;
    }
}
var uspsAddressInitialize = false;
var addressList;
//addressList[0] = new AddressClass("0", "Applicant Information", "<%=txtAddress1.ClientID%>", "<%=txtAddress2.ClientID%>", "<%=txtCity.ClientID%>", "<%=txtState.ClientID%>", "<%=txtZipcode.ClientID%>", "<%=USPSVerified.ClientID%>");
function EECUSPSAddressValidatorEvaluateIsValid(val)
{
    //we want to make sure no validator is not valid before this validator kick in
    var ii;
    var validator;
    if (Page_Validators.length > 2)
    {
        for (ii = 0; ii < Page_Validators.length - 1; ii++) 
        {
            validator = Page_Validators[ii];
            if (!validator.isvalid)   //if previous validators has invalid value, take care the previous one first.
                return true;
        }
    }
    
    if (!uspsAddressInitialize)
    {
        addressList = new Array();
        var value = val.controltovalidate;
        for (var i=0; i<value.length; i++)
        {
            var addressfields = value[i];
            addressList[i] = new AddressClass(i, addressfields[0], addressfields[1], addressfields[2], addressfields[3], addressfields[4], addressfields[5], addressfields[6]);       
        }
        uspsAddressInitialize = true;
    }
    
    if (!ValidateInputAddresses())
    {
        Array.add(popupList, $get('AddressesBlock'));
        setUSPSAnimations(true);
        return false;
    }
    else
    {
        setUSPSAnimations(false);
    }
    
    return true;
}
function setUSPSAnimations(bSet) 
{
    var animations;
    
    if (bSet)
    {
        animations = "{'AnimationName':'Sequence','AnimationChildren':[{'AnimationName':'ScriptAction','Script':'Cover($get(\\u0027ctl00_ContentPlaceHolder1_btnSubmit\\u0027), $get(\\u0027flyout\\u0027));','AnimationChildren':[]},{'AnimationName':'StyleAction','AnimationTarget':'flyout','Attribute':'display','Value':'block','AnimationChildren':[]},{'AnimationName':'Parallel','AnimationTarget':'flyout','Duration':'.3','Fps':'25','AnimationChildren':[{'AnimationName':'Move','Horizontal':'0','Vertical':'0','AnimationChildren':[]},{'AnimationName':'Move','Horizontal':'0','Vertical':'-170','AnimationChildren':[]},{'AnimationName':'Resize','Width':'2','Height':'340','AnimationChildren':[]},{'AnimationName':'Color','PropertyKey':'backgroundColor','StartValue':'#AAAAAA','EndValue':'#FFFFFF','AnimationChildren':[]}]},{'AnimationName':'Parallel','AnimationTarget':'flyout','Duration':'.3','Fps':'25','AnimationChildren':[{'AnimationName':'Move','Horizontal':'0','Vertical':'0','AnimationChildren':[]},{'AnimationName':'Move','Horizontal':'-280','Vertical':'0','AnimationChildren':[]},{'AnimationName':'Resize','Width':'570','Height':'340','AnimationChildren':[]},{'AnimationName':'Color','PropertyKey':'backgroundColor','StartValue':'#AAAAAA','EndValue':'#FFFFFF','AnimationChildren':[]}]},{'AnimationName':'ScriptAction','Script':'SetFinal($get(\\u0027flyout\\u0027), $get(\\u0027AddressesBlock\\u0027));','AnimationChildren':[]},{'AnimationName':'StyleAction','AnimationTarget':'AddressesBlock','Attribute':'display','Value':'block','AnimationChildren':[]},{'AnimationName':'FadeIn','AnimationTarget':'AddressesBlock','Duration':'.3','AnimationChildren':[]},{'AnimationName':'StyleAction','AnimationTarget':'flyout','Attribute':'display','Value':'none','AnimationChildren':[]}]}";
    }
    else
    {
        animations = "";
    }
    
    var extender = $find("ctl00_ContentPlaceHolder1_USPSAnimationExtender");
    extender.set_OnClick(animations);
}
function IsDisabledControl(ctrl)
{
    return ctrl.disabled;
}
function SetErrorControlBackground(controltovalidate, bresult)
{
    var control = document.getElementById(controltovalidate);
    
    if (control)
    {
        if (!bresult)
        {   
            control.style.backgroundColor = ErrorBackgroundColor; 
            //control.style.borderStyle = "solid";
            //control.style.borderWidth = "1px";
            //control.style.borderColor = "#FF0000";
        }
        else
        {
            control.style.backgroundColor = "#FFFFFF";
            //control.style.borderStyle = "solid";
            if (control.type == "text")
            {
                //control.style.borderWidth = "1px";
            }
            else
            {
                //control.style.borderWidth = "0px";
            }
            //control.style.borderColor = "#7f9db9";
        }
    }
}
function isDate(dateStr) 
{
    var datePat = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
    var matchArray = dateStr.match(datePat); // is the format ok?

    if (matchArray == null) 
    {
        return false;
    }

    month = matchArray[1]; // p@rse date into variables
    day = matchArray[3];
    year = matchArray[5];

    if (year < 1900)
    {
        return false;
    }
    
    if (month < 1 || month > 12) 
    { // check month range
        return false;
    }

    if (day < 1 || day > 31) 
    {
        return false;
    }

    if ((month==4 || month==6 || month==9 || month==11) && day==31) 
    {
        return false;
    }

    if (month == 2) 
    { // check for february 29th leap year
        var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > 29 || (day==29 && !isleap)) 
        {
            return false;
        }
    }
    return true; // date is valid
}

function RewriteEECFunctions()
{
    eval("ValidationSummaryOnSubmit = EECControlsValidationSummaryOnSubmit");
    eval("ValidatorOnLoad = EECControlsValidatorOnLoad");
}

function EECControlsValidatorOnLoad() 
{
    if (typeof(Page_Validators) == "undefined")
        return;
    var i, val;
    var USPSIndex = -1;
    //begin - new for eec
    for (i = 0; i < Page_Validators.length; i++) 
    {
        val = Page_Validators[i];
        if (typeof(val.evaluationfunction) == "string") 
        {
            if (val.evaluationfunction == "EECUSPSAddressValidatorEvaluateIsValid")
            {
                USPSIndex = i;
                break;
            }
        }
    }
    if (USPSIndex >= 0)     //we have a usps validator, move it to the last one.
    {
        var val1 = Page_Validators[Page_Validators.length - 1];
        var val2 = Page_Validators[USPSIndex];
        Page_Validators[Page_Validators.length - 1] = val2;
        Page_Validators[USPSIndex] = val1;       
    }
    //end - new for eec
    for (i = 0; i < Page_Validators.length; i++) {
        val = Page_Validators[i];
        if (typeof(val.evaluationfunction) == "string") {
            eval("val.evaluationfunction = " + val.evaluationfunction + ";");
        }
        if (typeof(val.isvalid) == "string") {
            if (val.isvalid == "False") {
                val.isvalid = false;
                Page_IsValid = false;
            }
            else {
                val.isvalid = true;
            }
        } else {
            val.isvalid = true;
        }
        if (typeof(val.enabled) == "string") {
            val.enabled = (val.enabled != "False");
        }
        if (typeof(val.controltovalidate) == "string") {
            ValidatorHookupControlID(val.controltovalidate, val);
        }
        if (typeof(val.controlhookup) == "string") {
            ValidatorHookupControlID(val.controlhookup, val);
        }
    }
    Page_ValidationActive = true;
}

function EECControlsValidationSummaryOnSubmit(validationGroup) {
    if (typeof(Page_ValidationSummaries) == "undefined")
        return;
    var summary, sums, s;
    for (sums = 0; sums < Page_ValidationSummaries.length; sums++) {
        summary = Page_ValidationSummaries[sums];
        summary.style.display = "none";
        if (!Page_IsValid && IsValidationGroupMatch(summary, validationGroup)) {
            var i;
            if (summary.showsummary != "False") {
                summary.style.display = "";
                if (typeof(summary.displaymode) != "string") {
                    summary.displaymode = "BulletList";
                }
                switch (summary.displaymode) {
                    case "List":
                        headerSep = "<br>";
                        first = "";
                        pre = "";
                        post = "<br>";
                        end = "";
                        break;
                    case "BulletList":
                    default:
                        headerSep = "";
                        first = "<ul>";
                        pre = "<li>";
                        post = "</li>";
                        end = "</ul>";
                        break;
                    case "SingleParagraph":
                        headerSep = " ";
                        first = "";
                        pre = "";
                        post = " ";
                        end = "<br>";
                        break;
                }
                s = "";
                //new
                var scontent = new Array();
                for (i=0; i<Page_Validators.length; i++) {
                    if (!Page_Validators[i].isvalid && typeof(Page_Validators[i].errormessage) == "string") 
                    {
                        if (ValidatorTrim(Page_Validators[i].errormessage).length > 0)
                        {
                            scontent[scontent.length] = Page_Validators[i].errormessage;
                        }    
                    }
                }
                if (scontent.length > 0)
                {
                    summary.style.display = "block";
                    
                    if (typeof(summary.headertext) == "string") {
                        s += summary.headertext + headerSep;
                    }
                    s += first;
                    for (i=0; i<Page_Validators.length; i++) {
                        if (!Page_Validators[i].isvalid && typeof(Page_Validators[i].errormessage) == "string") {
                            s += pre + Page_Validators[i].errormessage + post;
                        }
                    }
                    s += end;
                    summary.innerHTML = s;
                    window.scrollTo(0,0);
                }
                else
                {
                    summary.style.display = "none";
                }
            }
            if (summary.showmessagebox == "True") {
                s = "";
                if (typeof(summary.headertext) == "string") {
                    s += summary.headertext + "\r\n";
                }
                var lastValIndex = Page_Validators.length - 1;
                for (i=0; i<=lastValIndex; i++) {
                    if (!Page_Validators[i].isvalid && typeof(Page_Validators[i].errormessage) == "string") {
                        switch (summary.displaymode) {
                            case "List":
                                s += Page_Validators[i].errormessage;
                                if (i < lastValIndex) {
                                    s += "\r\n";
                                }
                                break;
                            case "BulletList":
                            default:
                                s += "- " + Page_Validators[i].errormessage;
                                if (i < lastValIndex) {
                                    s += "\r\n";
                                }
                                break;
                            case "SingleParagraph":
                                s += Page_Validators[i].errormessage + " ";
                                break;
                        }
                    }
                }
                alert(s);
            }
        }
    }
}

//for ajax
var popupList = [];

            function appendPopup(win)
            {
                Array.add(popupList, win);
                displayPopup(win);
            }
            function displayPopup(element)
            {
                element.style.display = "block";
                element.style.position = "absolute";
               
                centerObject();
            }
            function centerObject()
            {
                var element;
                
                for (var i=0; i<popupList.length; i++)
                {
                    element = popupList[i];
                    
                    if (element && (element.style.display != "none"))
                    {
                        var clientWinBounds = GetClientBounds();
                        var popupWinBounds = Sys.UI.DomElement.getBounds(element);
                        var x = clientWinBounds.x + Math.round(clientWinBounds.width / 2) - Math.round(popupWinBounds.width / 2);
                        var y = clientWinBounds.y + Math.round(clientWinBounds.height / 2) - Math.round(popupWinBounds.height / 2);	    
                        Sys.UI.DomElement.setLocation(element, x, y);
                    }
                }
            }
            function GetClientBounds() 
            {
                var clientWidth;
                var clientHeight;
                switch(Sys.Browser.agent) {
                    case Sys.Browser.InternetExplorer:
                        clientWidth = document.documentElement.clientWidth;
                        clientHeight = document.documentElement.clientHeight;
                        break;
                    case Sys.Browser.Safari:
                        clientWidth = window.innerWidth;
                        clientHeight = window.innerHeight;
                        break;
                    case Sys.Browser.Opera:
                        clientWidth = Math.min(window.innerWidth, document.body.clientWidth);
                        clientHeight = Math.min(window.innerHeight, document.body.clientHeight);
                        break;
                    default:  // Sys.Browser.Firefox, etc.
                        clientWidth = Math.min(window.innerWidth, document.documentElement.clientWidth);
                        clientHeight = Math.min(window.innerHeight, document.documentElement.clientHeight);
                        break;
                }
                var scrollLeft = (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
                var scrollTop = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
                return new Sys.UI.Bounds(scrollLeft, scrollTop, clientWidth, clientHeight);
            } 