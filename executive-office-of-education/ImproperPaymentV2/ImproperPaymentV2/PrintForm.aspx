<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintForm.aspx.cs" Inherits="PrintForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="includes/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="includes/styleprint.css" rel="stylesheet" type="text/css" />
    <style>
        .menutextactive 
        {
	        font-family:Arial;
	        font-size:0.8em;
	        font-weight:normal;
	        text-decoration:none;
	        color:Blue;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function disableControls()//FormID, arrForms)
        {
            var flag = true;
            var FormID = parent.opener.curDisplayFormID;
            var arrForms = parent.opener.arrForms;
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
            document.getElementById(arrForms[FormID][8]).innerHTML = document.getElementById(arrForms[FormID][2]).value;
            document.getElementById(arrForms[FormID][7]).style.display = "block";
            document.getElementById(arrForms[FormID][2]).style.display = "none";            
            document.getElementById(arrForms[FormID][10]).innerHTML = document.getElementById(arrForms[FormID][3]).value;
            document.getElementById(arrForms[FormID][9]).style.display = "block";
            document.getElementById(arrForms[FormID][3]).style.display = "none"; 
       
            document.getElementById(arrForms[FormID][5][0]).disabled = flag;
            document.getElementById(arrForms[FormID][5][1]).disabled = flag;
            //document.getElementById(arrForms[FormID][5][2]).disabled = flag;

            //if (FormID == 410) {
            //    document.getElementById(arrForms[FormID][5][2]).disabled = flag;
            //    document.getElementById(arrForms[FormID][6]).disabled = flag;
            //}
           
            oDiv.style.display = "block";
        }
        
        function copyForm()
        {

            oDiv.innerHTML = " <table>";
            if (parent.opener.curDisplayFormID == "100") {
                oDiv.innerHTML +=
                    //"<tr><td colspan='2'>" + parent.opener.document.getElementById("childInfo1").outerHTML + "</td></tr>" +
                    //"<tr><td colspan='2'>" + parent.opener.document.getElementById("childInfo2").outerHTML + "</td></tr>" +
                    //"<tr><td colspan='2'>" + parent.opener.document.getElementById("childInfo3").outerHTML + "</td></tr>" +
                    "<tr><td colspan='2'>" + parent.opener.document.getElementById("pageTitle").outerHTML + "</td></tr>"
            }
            oDiv.innerHTML += "<tr><td colspan='2'>" + parent.opener.document.getElementById(parent.opener.arrForms[parent.opener.curDisplayFormID][0]).outerHTML + "</td></tr>" +
                    "</table>";
            
            //var arrForms = parent.opener.arrForms;
            //var arrayIndex = Object.keys(arrForms);
            //for (var i = 0; i < arrayIndex.length; i++) {
            //    parent.opener.document.getElementById(parent.opener.arrForms[arrayIndex[i]][0]).style.visibility = "visible";
            //    oDiv.innerHTML += "<tr><td colspan='2'>" + parent.opener.document.getElementById(parent.opener.arrForms[arrayIndex[i]][0]).outerHTML + "</td></tr>";
                
            //    disableControls(arrayIndex[i], arrForms)
            //}
            //oDiv.innerHTML += "</table>";
            //oDiv1.innerHTML = parent.opener.document.getElementById("childInfo").outerHTML; 
            disableControls();
        }

        function disableAndPrint() {
            document.getElementById('btnPrint').hidden = true;
            print();
        }
    </script>
</head>
<body style="background-color:#ffffff" onload="javascript:copyForm()">
    <center><span class="formtext"><input type="button" id="btnPrint" value="Print Form" onclick="javascript:disableAndPrint()"/></span></center>
    <div class="formtext" id="oDiv" style="height:850px;width:920px;display:none">
    
    </div>
</body>
</html>
