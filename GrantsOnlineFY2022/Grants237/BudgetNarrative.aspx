<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BudgetNarrative.aspx.cs" Inherits="BudgetNarrative" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="javascript" type="text/javascript">

        function CalcColValue(obj) {
            if (event.keyCode == 13)    //enter key
            {
                CalcColumnCTotal(obj);
            }
        }

        function SumColToSubTotalFloatKey() {
            if (event.keyCode == 13)    //enter key
            {
                var val = 0;
                var txtBox;

                for (i = 1; i < arguments.length; i++) {
                    txtBox = document.getElementById(arguments[i]);

                    if (txtBox.value == "") txtBox.value = "0.00";

                    if (!isNaN(parseFloat(txtBox.value))) {
                        txtBox.value = parseFloat(txtBox.value).toFixed(2);

                        if (txtBox.value >= 0) {
                            val += parseFloat(txtBox.value);
                        }
                    }
                }

                document.getElementById(arguments[0]).innerHTML = parseFloat(val).toFixed(2);
            }
        }

        function SumColToSubTotalIntKey() {
            if (event.keyCode == 13) {

                var val = 0;
                var txtBox;

                for (i = 1; i < arguments.length; i++) {
                    txtBox = document.getElementById(arguments[i]);

                    if (txtBox.value == "") txtBox.value = "0";

                    if (!isNaN(Math.round(txtBox.value))) {
                        txtBox.value = parseInt(Math.round(txtBox.value));

                        if (txtBox.value >= 0) {
                            val += parseInt(txtBox.value);
                        }
                    }
                }

                document.getElementById(arguments[0]).innerHTML = val;
            }
        }

        function CalcColIndirectCostValue(obj) {
            if (event.keyCode == 13)    //enter key
            {
                CalcColumnIndirectCosts(obj);
            }
        }

        Number.prototype.format = function (n, x) {
            var re = '(\\d)(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
            return this.toFixed(Math.max(0, ~ ~n)).replace(new RegExp(re, 'g'), '$1,');
        };

        function UpdateToFloatValueKey() {
            if (event.keyCode == 13)    //enter key
            {
                var obj = document.getElementById(arguments[0]);

                if (obj) {
                
                    if (obj.value == "") obj.value = "0.00";
                    
                    if (!isNaN(Math.round(obj.value))) {
                        obj.value = parseFloat(obj.value).toFixed(2);
                    }
                }
            }
        }

        function UpdateToFloatValue() {
            var obj = document.getElementById(arguments[0]);

            if (obj) {
                if (obj.value == "") obj.value = "0.00";
                if (!isNaN(Math.round(obj.value))) {
                    obj.value = parseFloat(obj.value).toFixed(2);
                }
            }
        }

        function SumColToSubTotalInt() {
            var val = 0;
            var txtBox;

            for (i = 1; i < arguments.length; i++) {
                txtBox = document.getElementById(arguments[i]);

                if (txtBox.value == "") txtBox.value = "0";

                if (!isNaN(Math.round(txtBox.value))) {
                    txtBox.value = parseInt(Math.round(txtBox.value));

                    if (txtBox.value >= 0) {
                        val += parseInt(txtBox.value);
                    }
                }
            }

            document.getElementById(arguments[0]).innerHTML = val;
        }

        function SumColToSubTotalFloat() {
            var val = 0;
            var txtBox;

            for (i = 1; i < arguments.length; i++) {
                txtBox = document.getElementById(arguments[i]);

                if (txtBox.value == "") txtBox.value = "0.00";

                if (!isNaN(parseFloat(txtBox.value))) {
                    txtBox.value = parseFloat(txtBox.value).toFixed(2);

                    if (txtBox.value >= 0) {
                        val += parseFloat(txtBox.value);
                    }
                }
            }

            document.getElementById(arguments[0]).innerHTML = parseFloat(val).toFixed(2);
        }

        function CalcColumnIndirectCosts(obj) {
            var regStr = new RegExp(/^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/);

            if (obj.value == "") obj.value = "0";

            if (regStr.test(obj.value).toString() == 'true') {
                obj.value = obj.value.replace(/,/g, '').replace('$', '');

                if (!isNaN(Math.round(obj.value))) {

                    obj.value = Math.round(obj.value);
                    obj.value = parseInt(obj.value).format();

                    CalcTotals();

                    CalcRateHWDFTENOS();
                }
            }
        }

        function CalcColumnCTotal(txtDorF) {
            var idText = txtDorF.id.replace(/ColD/, "").replace(/ColF/, "");
            var txt = document.getElementById(idText);
            var txtColD = document.getElementById(idText + "ColD");
            var txtColF = document.getElementById(idText + "ColF");
            var regStr = new RegExp(/^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/);

            if (txtColD.value == "") txtColD.value = "0";
            if (txtColF.value == "") txtColF.value = "0";

            if (regStr.test(txtColD.value).toString() == 'true' && regStr.test(txtColF.value).toString() == 'true') {
                txtColD.value = txtColD.value.replace(/,/g, '').replace('$', '');
                txtColF.value = txtColF.value.replace(/,/g, '').replace('$', '');

                if (!(isNaN(Math.round(txtColD.value)) || isNaN(Math.round(txtColF.value)))) {
                    txtColD.value = Math.round(txtColD.value);
                    txtColF.value = Math.round(txtColF.value);

                    txt.value = parseInt(txtColD.value) + parseInt(txtColF.value);

                    txtColD.value = parseInt(txtColD.value).format();
                    txtColF.value = parseInt(txtColF.value).format();
                    txt.value = parseInt(txt.value).format();

                    CalcTotals();

                    CalcRateHWDFTENOS();
                }
            }
        }

        function CalcTotals() {

            CalcAdminSubTotalColD();

            CalcAdminSubTotalColF();
            CalcAdminSubTotal();

            CalcIPSSubTotalColD();
            CalcIPSSubTotalColF();
            CalcIPSSubTotal();

            CalcSSSubTotalColD();
            CalcSSSubTotalColF();
            CalcSSSubTotal();

            CalcFBSubTotalColD();
            CalcFBSubTotalColF();
            CalcFBSubTotal();

            CalcCSSubTotalColD();
            CalcCSSubTotalColF();
            CalcCSSubTotal();

            CalcSMSubTotalColD();
            CalcSMSubTotalColF();
            CalcSMSubTotal();

            CalcTravelSubTotalColD();
            CalcTravelSubTotalColF();
            CalcTravelSubTotal();

            CalcOCSubTotalColD();
            CalcOCSubTotalColF();
            CalcOCSubTotal();

            CalcCBSubTotalColD();
            CalcCBSubTotalColF();
            CalcCBSubTotal();

            CalcIndirectCostsSubTotal();

            CalcEqSubTotalColD();
            CalcEqSubTotalColF();
            CalcEqSubTotal();

            CalcGrantTotalColD();
            CalcGrantTotalColF();


            CalcGrantTotal();
            //CopyGrandTotal();



        }
        function CalcRateHWDFTENOS() {

            CalcAdminSubTotalFTE();
            CalcAdminSubTotalNumofStaff();
            CalcIPSSubTotalFTE();
            CalcIPSSubTotalNumofStaff();
            CalcSSSubTotalFTE();
            CalcSSSubTotalNumofStaff();
            CalcFBSubTotalFTE();
            CalcFBSubTotalNumofStaff();
        }



        function CalcGrantTotal() {
            var asum1 = document.getElementById('<%=txtGrantTotalColD.ClientID %>');
            var asum2 = document.getElementById('<%=txtGrantTotalColF.ClientID %>');

            var gTotal = document.getElementById('<%=txtGrantTotal.ClientID %>');

            gTotal.innerHTML = (isNaN(parseInt(asum1.innerHTML)) ? parseInt(0) : parseInt(asum1.innerHTML.replace(/,/g, '')))
                             + (isNaN(parseInt(asum2.innerHTML)) ? parseInt(0) : parseInt(asum2.innerHTML.replace(/,/g, '')));

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);
        }

        function CalcGrantTotalColD() {
            var pasum1 = document.getElementById('<%=txtAdminSubTotalColD.ClientID %>');
            var pasum2 = document.getElementById('<%=txtIPSSubTotalColD.ClientID %>');
            var pasum3 = document.getElementById('<%=txtSSSubTotalColD.ClientID %>');
            var pasum4 = document.getElementById('<%=txtFBSubTotalColD.ClientID %>');
            var pasum5 = document.getElementById('<%=txtCSSubTotalColD.ClientID %>');
            var pasum6 = document.getElementById('<%=txtSMSubTotalColD.ClientID %>');
            var pasum7 = document.getElementById('<%=txtTravelSubTotalColD.ClientID %>');
            var pasum8 = document.getElementById('<%=txtOCSubTotalColD.ClientID %>');
            var pasum9 = document.getElementById('<%=txtCBSubTotalColD.ClientID %>');
            var pasum11 = document.getElementById('<%=txtEqSubTotalColD.ClientID %>');

            var gTotal = document.getElementById('<%=txtGrantTotalColD.ClientID %>');

            gTotal.innerHTML = (isNaN(parseInt(pasum1.innerHTML)) ? parseInt(0) : parseInt(pasum1.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum2.innerHTML)) ? parseInt(0) : parseInt(pasum2.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum3.innerHTML)) ? parseInt(0) : parseInt(pasum3.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum4.innerHTML)) ? parseInt(0) : parseInt(pasum4.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum5.innerHTML)) ? parseInt(0) : parseInt(pasum5.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum6.innerHTML)) ? parseInt(0) : parseInt(pasum6.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum7.innerHTML)) ? parseInt(0) : parseInt(pasum7.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum8.innerHTML)) ? parseInt(0) : parseInt(pasum8.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum9.innerHTML)) ? parseInt(0) : parseInt(pasum9.innerHTML.replace(/,/g, '')))
                            + (isNaN(parseInt(pasum11.innerHTML)) ? parseInt(0) : parseInt(pasum11.innerHTML.replace(/,/g, '')))

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);

        }

        function CalcGrantTotalColF() {
            var pasum1 = document.getElementById('<%=txtAdminSubTotalColF.ClientID %>');
            var pasum2 = document.getElementById('<%=txtIPSSubTotalColF.ClientID %>');
            var pasum3 = document.getElementById('<%=txtSSSubTotalColF.ClientID %>');
            var pasum4 = document.getElementById('<%=txtFBSubTotalColF.ClientID %>');
            var pasum5 = document.getElementById('<%=txtCSSubTotalColF.ClientID %>');
            var pasum6 = document.getElementById('<%=txtSMSubTotalColF.ClientID %>');
            var pasum7 = document.getElementById('<%=txtTravelSubTotalColF.ClientID %>');
            var pasum8 = document.getElementById('<%=txtOCSubTotalColF.ClientID %>');
            var pasum9 = document.getElementById('<%=txtCBSubTotalColF.ClientID %>');
            var pasum10 = document.getElementById('<%=txtIndirectCostsSubTotal.ClientID %>');
            var pasum11 = document.getElementById('<%=txtEqSubTotalColF.ClientID %>');

            var gTotal = document.getElementById('<%=txtGrantTotalColF.ClientID %>');

            gTotal.innerHTML = (isNaN(parseInt(pasum1.innerHTML)) ? parseInt(0) : parseInt(pasum1.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum2.innerHTML)) ? parseInt(0) : parseInt(pasum2.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum3.innerHTML)) ? parseInt(0) : parseInt(pasum3.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum4.innerHTML)) ? parseInt(0) : parseInt(pasum4.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum5.innerHTML)) ? parseInt(0) : parseInt(pasum5.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum6.innerHTML)) ? parseInt(0) : parseInt(pasum6.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum7.innerHTML)) ? parseInt(0) : parseInt(pasum7.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum8.innerHTML)) ? parseInt(0) : parseInt(pasum8.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum9.innerHTML)) ? parseInt(0) : parseInt(pasum9.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum10.innerHTML)) ? parseInt(0) : parseInt(pasum10.innerHTML.replace(/,/g, '')))
                        + (isNaN(parseInt(pasum11.innerHTML)) ? parseInt(0) : parseInt(pasum11.innerHTML.replace(/,/g, '')))

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);
        }




        function CalcAdminSubTotal() {

            var a1 = document.getElementById('<%=txtSupervisorDirector.ClientID %>');
            var a2 = document.getElementById('<%=txtProjectCoordinator.ClientID %>');
            var a3 = document.getElementById('<%=txtStipend.ClientID %>');
            var a4 = document.getElementById('<%=txtOther.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a3.value)) ? parseInt(0) : parseInt(a3.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a4.value)) ? parseInt(0) : parseInt(a4.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();

        }

        function CalcAdminSubTotalColD() {
            var a1 = document.getElementById('<%=txtSupervisorDirectorColD.ClientID %>');
            var a2 = document.getElementById('<%=txtProjectCoordinatorColD.ClientID %>');
            var a3 = document.getElementById('<%=txtStipendColD.ClientID %>');
            var a4 = document.getElementById('<%=txtOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a3.value)) ? parseInt(0) : parseInt(a3.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a4.value)) ? parseInt(0) : parseInt(a4.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcAdminSubTotalColF() {
            var a1 = document.getElementById('<%=txtSupervisorDirectorColF.ClientID %>');
            var a2 = document.getElementById('<%=txtProjectCoordinatorColF.ClientID %>');
            var a3 = document.getElementById('<%=txtStipendColF.ClientID %>');
            var a4 = document.getElementById('<%=txtOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a3.value)) ? parseInt(0) : parseInt(a3.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a4.value)) ? parseInt(0) : parseInt(a4.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format(); ;
        }

        function CalcAdminSubTotalNumofStaff() {
            var a166 = document.getElementById('<%=txtSupervisorDirectorNumofStaff.ClientID %>');
            var a167 = document.getElementById('<%=txtProjectCoordinatorNumofStaff.ClientID %>');
            var a168 = document.getElementById('<%=txtOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a166.value)) ? parseInt(0) : parseInt(a166.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a167.value)) ? parseInt(0) : parseInt(a167.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a168.value)) ? parseInt(0) : parseInt(a168.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        function CalcAdminSubTotalFTE() {
            var a180 = document.getElementById('<%=txtSupervisorDirectorFTE.ClientID %>');
            var a181 = document.getElementById('<%=txtProjectCoordinatorFTE.ClientID %>');
            var a183 = document.getElementById('<%=txtOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(a180.value)) ? parseFloat(0) : parseFloat(a180.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a181.value)) ? parseFloat(0) : parseFloat(a181.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a183.value)) ? parseFloat(0) : parseFloat(a183.value.replace(/,/g, '')))

            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        function CalcIPSSubTotal() {
            var a5 = document.getElementById('<%=txtAdvisor.ClientID %>');
            var a6 = document.getElementById('<%=txtClinician.ClientID %>');
            var a7 = document.getElementById('<%=txtCoordinator.ClientID %>');
            var a8 = document.getElementById('<%=txtEducatorInstructor.ClientID %>');
            var a9 = document.getElementById('<%=txtHomeVisitor.ClientID %>');
            var a10 = document.getElementById('<%=txtSpecialist.ClientID %>');
            var a11 = document.getElementById('<%=txtIPSStipend.ClientID %>');
            var a12 = document.getElementById('<%=txtIPSOther.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a5.value)) ? parseInt(0) : parseInt(a5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a6.value)) ? parseInt(0) : parseInt(a6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a7.value)) ? parseInt(0) : parseInt(a7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a8.value)) ? parseInt(0) : parseInt(a8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a9.value)) ? parseInt(0) : parseInt(a9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a10.value)) ? parseInt(0) : parseInt(a10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a11.value)) ? parseInt(0) : parseInt(a11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a12.value)) ? parseInt(0) : parseInt(a12.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcIPSSubTotalColD() {
            var a5 = document.getElementById('<%=txtAdvisorColD.ClientID %>');
            var a6 = document.getElementById('<%=txtClinicianColD.ClientID %>');
            var a7 = document.getElementById('<%=txtCoordinatorColD.ClientID %>');
            var a8 = document.getElementById('<%=txtEducatorInstructorColD.ClientID %>');
            var a9 = document.getElementById('<%=txtHomeVisitorColD.ClientID %>');
            var a10 = document.getElementById('<%=txtSpecialistColD.ClientID %>');
            var a11 = document.getElementById('<%=txtIPSStipendColD.ClientID %>');
            var a12 = document.getElementById('<%=txtIPSOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a5.value)) ? parseInt(0) : parseInt(a5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a6.value)) ? parseInt(0) : parseInt(a6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a7.value)) ? parseInt(0) : parseInt(a7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a8.value)) ? parseInt(0) : parseInt(a8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a9.value)) ? parseInt(0) : parseInt(a9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a10.value)) ? parseInt(0) : parseInt(a10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a11.value)) ? parseInt(0) : parseInt(a11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a12.value)) ? parseInt(0) : parseInt(a12.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcIPSSubTotalColF() {
            var a5 = document.getElementById('<%=txtAdvisorColF.ClientID %>');
            var a6 = document.getElementById('<%=txtClinicianColF.ClientID %>');
            var a7 = document.getElementById('<%=txtCoordinatorColF.ClientID %>');
            var a8 = document.getElementById('<%=txtEducatorInstructorColF.ClientID %>');
            var a9 = document.getElementById('<%=txtHomeVisitorColF.ClientID %>');
            var a10 = document.getElementById('<%=txtSpecialistColF.ClientID %>');
            var a11 = document.getElementById('<%=txtIPSStipendColF.ClientID %>');
            var a12 = document.getElementById('<%=txtIPSOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a5.value)) ? parseInt(0) : parseInt(a5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a6.value)) ? parseInt(0) : parseInt(a6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a7.value)) ? parseInt(0) : parseInt(a7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a8.value)) ? parseInt(0) : parseInt(a8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a9.value)) ? parseInt(0) : parseInt(a9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a10.value)) ? parseInt(0) : parseInt(a10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a11.value)) ? parseInt(0) : parseInt(a11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a12.value)) ? parseInt(0) : parseInt(a12.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcIPSSubTotalNumofStaff() {
            var a169 = document.getElementById('<%=txtAdvisorNumofStaff.ClientID %>');
            var a170 = document.getElementById('<%=txtClinicianNumofStaff.ClientID %>');
            var a171 = document.getElementById('<%=txtCoordinatorNumofStaff.ClientID %>');
            var a172 = document.getElementById('<%=txtEducatorInstructorNumofStaff.ClientID %>');
            var a173 = document.getElementById('<%=txtHomeVisitorNumofStaff.ClientID %>');
            var a174 = document.getElementById('<%=txtSpecialistNumofStaff.ClientID %>');
            var a175 = document.getElementById('<%=txtIPSOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a169.value)) ? parseInt(0) : parseInt(a169.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a170.value)) ? parseInt(0) : parseInt(a170.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a171.value)) ? parseInt(0) : parseInt(a171.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a172.value)) ? parseInt(0) : parseInt(a172.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a173.value)) ? parseInt(0) : parseInt(a173.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a174.value)) ? parseInt(0) : parseInt(a174.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a175.value)) ? parseInt(0) : parseInt(a175.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        function CalcIPSSubTotalFTE() {
            var a184 = document.getElementById('<%=txtAdvisorFTE.ClientID %>');
            var a185 = document.getElementById('<%=txtClinicianFTE.ClientID %>');
            var a186 = document.getElementById('<%=txtCoordinatorFTE.ClientID %>');
            var a187 = document.getElementById('<%=txtEducatorInstructorFTE.ClientID %>');
            var a188 = document.getElementById('<%=txtHomeVisitorFTE.ClientID %>');
            var a189 = document.getElementById('<%=txtSpecialistFTE.ClientID %>');
            var a191 = document.getElementById('<%=txtIPSOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(a184.value)) ? parseFloat(0) : parseFloat(a184.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a185.value)) ? parseFloat(0) : parseFloat(a185.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a186.value)) ? parseFloat(0) : parseFloat(a186.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a187.value)) ? parseFloat(0) : parseFloat(a187.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a188.value)) ? parseFloat(0) : parseFloat(a188.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a189.value)) ? parseFloat(0) : parseFloat(a189.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a191.value)) ? parseFloat(0) : parseFloat(a191.value.replace(/,/g, '')))

            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        function CalcSSSubTotal() {
            var a13 = document.getElementById('<%=txtAideParaprofessional.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeper.ClientID %>');
            var a15 = document.getElementById('<%=txtSSStipend.ClientID %>');
            var a16 = document.getElementById('<%=txtSSOther.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a16.value)) ? parseInt(0) : parseInt(a16.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSSSubTotalColD() {
            var a13 = document.getElementById('<%=txtAideParaprofessionalColD.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperColD.ClientID %>');
            var a15 = document.getElementById('<%=txtSSStipendColD.ClientID %>');
            var a16 = document.getElementById('<%=txtSSOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a16.value)) ? parseInt(0) : parseInt(a16.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSSSubTotalColF() {
            var a13 = document.getElementById('<%=txtAideParaprofessionalColF.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperColF.ClientID %>');
            var a15 = document.getElementById('<%=txtSSStipendColF.ClientID %>');
            var a16 = document.getElementById('<%=txtSSOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a16.value)) ? parseInt(0) : parseInt(a16.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSSSubTotalNumofStaff() {
            var a13 = document.getElementById('<%=txtAideParaprofessionalNumofStaff.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperNumofStaff.ClientID %>');
            var a15 = document.getElementById('<%=txtSSOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        function CalcSSSubTotalFTE() {
            var a13 = document.getElementById('<%=txtAideParaprofessionalFTE.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperFTE.ClientID %>');
            var a15 = document.getElementById('<%=txtSSOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(a13.value)) ? parseFloat(0) : parseFloat(a13.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a14.value)) ? parseFloat(0) : parseFloat(a14.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a15.value)) ? parseFloat(0) : parseFloat(a15.value.replace(/,/g, '')))

            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        function CalcFBSubTotal() {
            var a17 = document.getElementById('<%=txtFringeBenefits.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcFBSubTotalColD() {
            var a17 = document.getElementById('<%=txtFringeBenefitsColD.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcFBSubTotalColF() {
            var a17 = document.getElementById('<%=txtFringeBenefitsColF.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcFBSubTotalNumofStaff() {
            var a179 = document.getElementById('<%=txtFringeBenefitsNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a179.value)) ? parseInt(0) : parseInt(a179.value.replace(/,/g, '')))
            asum.innerHTML = parseInt(asum.innerHTML);
        }

        function CalcFBSubTotalFTE() {
            var a196 = document.getElementById('<%=txtFringeBenefitsFTE.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(a196.value)) ? parseFloat(0) : parseFloat(a196.value.replace(/,/g, '')))
            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        function CalcCSSubTotal() {
            var a18 = document.getElementById('<%=txtCSAdvisor.ClientID %>');
            var a19 = document.getElementById('<%=txtCSClinician.ClientID %>');
            var a20 = document.getElementById('<%=txtCSConsultant.ClientID %>');
            var a21 = document.getElementById('<%=txtCSEducatorInstructor.ClientID %>');
            var a22 = document.getElementById('<%=txtCSHomeVisitor.ClientID %>');
            var a23 = document.getElementById('<%=txtCSSpecialist.ClientID %>');
            var a24 = document.getElementById('<%=txtCSSpeaker.ClientID %>');
            var a25 = document.getElementById('<%=txtCSSubstitute.ClientID %>');
            var a26 = document.getElementById('<%=txtCSStipend.ClientID %>');
            var a27 = document.getElementById('<%=txtCSOther.ClientID %>');
            var asum = document.getElementById('<%=txtCSSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a18.value)) ? parseInt(0) : parseInt(a18.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a19.value)) ? parseInt(0) : parseInt(a19.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a20.value)) ? parseInt(0) : parseInt(a20.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a21.value)) ? parseInt(0) : parseInt(a21.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a22.value)) ? parseInt(0) : parseInt(a22.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a23.value)) ? parseInt(0) : parseInt(a23.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a24.value)) ? parseInt(0) : parseInt(a24.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a25.value)) ? parseInt(0) : parseInt(a25.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a26.value)) ? parseInt(0) : parseInt(a26.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a27.value)) ? parseInt(0) : parseInt(a27.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcCSSubTotalColD() {
            var a18 = document.getElementById('<%=txtCSAdvisorColD.ClientID %>');
            var a19 = document.getElementById('<%=txtCSClinicianColD.ClientID %>');
            var a20 = document.getElementById('<%=txtCSConsultantColD.ClientID %>');
            var a21 = document.getElementById('<%=txtCSEducatorInstructorColD.ClientID %>');
            var a22 = document.getElementById('<%=txtCSHomeVisitorColD.ClientID %>');
            var a23 = document.getElementById('<%=txtCSSpecialistColD.ClientID %>');
            var a24 = document.getElementById('<%=txtCSSpeakerColD.ClientID %>');
            var a25 = document.getElementById('<%=txtCSSubstituteColD.ClientID %>');
            var a26 = document.getElementById('<%=txtCSStipendColD.ClientID %>');
            var a27 = document.getElementById('<%=txtCSOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtCSSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a18.value)) ? parseInt(0) : parseInt(a18.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a19.value)) ? parseInt(0) : parseInt(a19.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a20.value)) ? parseInt(0) : parseInt(a20.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a21.value)) ? parseInt(0) : parseInt(a21.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a22.value)) ? parseInt(0) : parseInt(a22.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a23.value)) ? parseInt(0) : parseInt(a23.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a24.value)) ? parseInt(0) : parseInt(a24.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a25.value)) ? parseInt(0) : parseInt(a25.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a26.value)) ? parseInt(0) : parseInt(a26.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a27.value)) ? parseInt(0) : parseInt(a27.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcCSSubTotalColF() {
            var a18 = document.getElementById('<%=txtCSAdvisorColF.ClientID %>');
            var a19 = document.getElementById('<%=txtCSClinicianColF.ClientID %>');
            var a20 = document.getElementById('<%=txtCSConsultantColF.ClientID %>');
            var a21 = document.getElementById('<%=txtCSEducatorInstructorColF.ClientID %>');
            var a22 = document.getElementById('<%=txtCSHomeVisitorColF.ClientID %>');
            var a23 = document.getElementById('<%=txtCSSpecialistColF.ClientID %>');
            var a24 = document.getElementById('<%=txtCSSpeakerColF.ClientID %>');
            var a25 = document.getElementById('<%=txtCSSubstituteColF.ClientID %>');
            var a26 = document.getElementById('<%=txtCSStipendColF.ClientID %>');
            var a27 = document.getElementById('<%=txtCSOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtCSSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a18.value)) ? parseInt(0) : parseInt(a18.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a19.value)) ? parseInt(0) : parseInt(a19.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a20.value)) ? parseInt(0) : parseInt(a20.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a21.value)) ? parseInt(0) : parseInt(a21.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a22.value)) ? parseInt(0) : parseInt(a22.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a23.value)) ? parseInt(0) : parseInt(a23.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a24.value)) ? parseInt(0) : parseInt(a24.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a25.value)) ? parseInt(0) : parseInt(a25.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a26.value)) ? parseInt(0) : parseInt(a26.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a27.value)) ? parseInt(0) : parseInt(a27.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSMSubTotal() {
            var a28 = document.getElementById('<%=txtEducationalInstructionalMaterials.ClientID %>');
            var a29 = document.getElementById('<%=txtInstructionalTechnologySoftware.ClientID %>');
            var a30 = document.getElementById('<%=txtNonInstructionalSupplies.ClientID %>');
            var a31 = document.getElementById('<%=txtSMOther.ClientID %>');
            var asum = document.getElementById('<%=txtSMSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a28.value)) ? parseInt(0) : parseInt(a28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a29.value)) ? parseInt(0) : parseInt(a29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a30.value)) ? parseInt(0) : parseInt(a30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a31.value)) ? parseInt(0) : parseInt(a31.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSMSubTotalColD() {
            var a28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColD.ClientID %>');
            var a29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColD.ClientID %>');
            var a30 = document.getElementById('<%=txtNonInstructionalSuppliesColD.ClientID %>');
            var a31 = document.getElementById('<%=txtSMOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtSMSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a28.value)) ? parseInt(0) : parseInt(a28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a29.value)) ? parseInt(0) : parseInt(a29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a30.value)) ? parseInt(0) : parseInt(a30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a31.value)) ? parseInt(0) : parseInt(a31.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcSMSubTotalColF() {
            var a28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColF.ClientID %>');
            var a29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColF.ClientID %>');
            var a30 = document.getElementById('<%=txtNonInstructionalSuppliesColF.ClientID %>');
            var a31 = document.getElementById('<%=txtSMOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtSMSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a28.value)) ? parseInt(0) : parseInt(a28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a29.value)) ? parseInt(0) : parseInt(a29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a30.value)) ? parseInt(0) : parseInt(a30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a31.value)) ? parseInt(0) : parseInt(a31.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcTravelSubTotal() {
            var a32 = document.getElementById('<%=txtSupervisoryStaff.ClientID %>');
            var a33 = document.getElementById('<%=txtInstructionalStaff.ClientID %>');
            var a34 = document.getElementById('<%=txtTravelOther.ClientID %>');
            var asum = document.getElementById('<%=txtTravelSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a32.value)) ? parseInt(0) : parseInt(a32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a33.value)) ? parseInt(0) : parseInt(a33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a34.value)) ? parseInt(0) : parseInt(a34.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcTravelSubTotalColD() {
            var a32 = document.getElementById('<%=txtSupervisoryStaffColD.ClientID %>');
            var a33 = document.getElementById('<%=txtInstructionalStaffColD.ClientID %>');
            var a34 = document.getElementById('<%=txtTravelOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtTravelSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a32.value)) ? parseInt(0) : parseInt(a32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a33.value)) ? parseInt(0) : parseInt(a33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a34.value)) ? parseInt(0) : parseInt(a34.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcTravelSubTotalColF() {
            var a32 = document.getElementById('<%=txtSupervisoryStaffColF.ClientID %>');
            var a33 = document.getElementById('<%=txtInstructionalStaffColF.ClientID %>');
            var a34 = document.getElementById('<%=txtTravelOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtTravelSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a32.value)) ? parseInt(0) : parseInt(a32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a33.value)) ? parseInt(0) : parseInt(a33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a34.value)) ? parseInt(0) : parseInt(a34.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }


        function CalcOCSubTotal() {
            var a35 = document.getElementById('<%=txtAdvertising.ClientID %>');
            var a36 = document.getElementById('<%=txtEquipmentRental.ClientID %>');
            var a37 = document.getElementById('<%=txtMaintenanceRepairs.ClientID %>');
            var a38 = document.getElementById('<%=txtMembershipSubscriptions.ClientID %>');
            var a39 = document.getElementById('<%=txtPrintingReproduction.ClientID %>');
            var a40 = document.getElementById('<%=txtStaffTraining.ClientID %>');
            var a41 = document.getElementById('<%=txtRentalofSpace.ClientID %>');
            var a42 = document.getElementById('<%=txtTelephoneUtilities.ClientID %>');
            var a43 = document.getElementById('<%=txtDirectServiceTransportation.ClientID %>');
            var a44 = document.getElementById('<%=txtOCOther.ClientID %>');
            var asum = document.getElementById('<%=txtOCSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a35.value)) ? parseInt(0) : parseInt(a35.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a36.value)) ? parseInt(0) : parseInt(a36.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a37.value)) ? parseInt(0) : parseInt(a37.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a38.value)) ? parseInt(0) : parseInt(a38.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a39.value)) ? parseInt(0) : parseInt(a39.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a40.value)) ? parseInt(0) : parseInt(a40.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a41.value)) ? parseInt(0) : parseInt(a41.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a42.value)) ? parseInt(0) : parseInt(a42.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a43.value)) ? parseInt(0) : parseInt(a43.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a44.value)) ? parseInt(0) : parseInt(a44.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcOCSubTotalColD() {
            var a35 = document.getElementById('<%=txtAdvertisingColD.ClientID %>');
            var a36 = document.getElementById('<%=txtEquipmentRentalColD.ClientID %>');
            var a37 = document.getElementById('<%=txtMaintenanceRepairsColD.ClientID %>');
            var a38 = document.getElementById('<%=txtMembershipSubscriptionsColD.ClientID %>');
            var a39 = document.getElementById('<%=txtPrintingReproductionColD.ClientID %>');
            var a40 = document.getElementById('<%=txtStaffTrainingColD.ClientID %>');
            var a41 = document.getElementById('<%=txtRentalofSpaceColD.ClientID %>');
            var a42 = document.getElementById('<%=txtTelephoneUtilitiesColD.ClientID %>');
            var a43 = document.getElementById('<%=txtDirectServiceTransportationColD.ClientID %>');
            var a44 = document.getElementById('<%=txtOCOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtOCSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a35.value)) ? parseInt(0) : parseInt(a35.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a36.value)) ? parseInt(0) : parseInt(a36.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a37.value)) ? parseInt(0) : parseInt(a37.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a38.value)) ? parseInt(0) : parseInt(a38.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a39.value)) ? parseInt(0) : parseInt(a39.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a40.value)) ? parseInt(0) : parseInt(a40.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a41.value)) ? parseInt(0) : parseInt(a41.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a42.value)) ? parseInt(0) : parseInt(a42.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a43.value)) ? parseInt(0) : parseInt(a43.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a44.value)) ? parseInt(0) : parseInt(a44.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcOCSubTotalColF() {
            var a35 = document.getElementById('<%=txtAdvertisingColF.ClientID %>');
            var a36 = document.getElementById('<%=txtEquipmentRentalColF.ClientID %>');
            var a37 = document.getElementById('<%=txtMaintenanceRepairsColF.ClientID %>');
            var a38 = document.getElementById('<%=txtMembershipSubscriptionsColF.ClientID %>');
            var a39 = document.getElementById('<%=txtPrintingReproductionColF.ClientID %>');
            var a40 = document.getElementById('<%=txtStaffTrainingColF.ClientID %>');
            var a41 = document.getElementById('<%=txtRentalofSpaceColF.ClientID %>');
            var a42 = document.getElementById('<%=txtTelephoneUtilitiesColF.ClientID %>');
            var a43 = document.getElementById('<%=txtDirectServiceTransportationColF.ClientID %>');
            var a44 = document.getElementById('<%=txtOCOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtOCSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a35.value)) ? parseInt(0) : parseInt(a35.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a36.value)) ? parseInt(0) : parseInt(a36.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a37.value)) ? parseInt(0) : parseInt(a37.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a38.value)) ? parseInt(0) : parseInt(a38.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a39.value)) ? parseInt(0) : parseInt(a39.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a40.value)) ? parseInt(0) : parseInt(a40.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a41.value)) ? parseInt(0) : parseInt(a41.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a42.value)) ? parseInt(0) : parseInt(a42.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a43.value)) ? parseInt(0) : parseInt(a43.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a44.value)) ? parseInt(0) : parseInt(a44.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcCBSubTotal() {
            var a45 = document.getElementById('<%=txtProfessionalDevelopOpportunities.ClientID %>');
            var a46 = document.getElementById('<%=txtApplicationFees.ClientID %>');
            var a47 = document.getElementById('<%=txtCEUCourses.ClientID %>');
            var a48 = document.getElementById('<%=txtCollegeCourses.ClientID %>');
            var a49 = document.getElementById('<%=txtCBOther.ClientID %>');
            var asum = document.getElementById('<%=txtCBSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a45.value)) ? parseInt(0) : parseInt(a45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a46.value)) ? parseInt(0) : parseInt(a46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a47.value)) ? parseInt(0) : parseInt(a47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a48.value)) ? parseInt(0) : parseInt(a48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a49.value)) ? parseInt(0) : parseInt(a49.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcCBSubTotalColD() {
            var a45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColD.ClientID %>');
            var a46 = document.getElementById('<%=txtApplicationFeesColD.ClientID %>');
            var a47 = document.getElementById('<%=txtCEUCoursesColD.ClientID %>');
            var a48 = document.getElementById('<%=txtCollegeCoursesColD.ClientID %>');
            var a49 = document.getElementById('<%=txtCBOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtCBSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a45.value)) ? parseInt(0) : parseInt(a45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a46.value)) ? parseInt(0) : parseInt(a46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a47.value)) ? parseInt(0) : parseInt(a47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a48.value)) ? parseInt(0) : parseInt(a48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a49.value)) ? parseInt(0) : parseInt(a49.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcCBSubTotalColF() {
            var a45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColF.ClientID %>');
            var a46 = document.getElementById('<%=txtApplicationFeesColF.ClientID %>');
            var a47 = document.getElementById('<%=txtCEUCoursesColF.ClientID %>');
            var a48 = document.getElementById('<%=txtCollegeCoursesColF.ClientID %>');
            var a49 = document.getElementById('<%=txtCBOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtCBSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a45.value)) ? parseInt(0) : parseInt(a45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a46.value)) ? parseInt(0) : parseInt(a46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a47.value)) ? parseInt(0) : parseInt(a47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a48.value)) ? parseInt(0) : parseInt(a48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a49.value)) ? parseInt(0) : parseInt(a49.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcIndirectCostsSubTotal() {
            document.getElementById('<%=txtIndirectCostsSubTotal.ClientID %>').innerHTML = parseInt(document.getElementById('<%=txtIndirectCosts.ClientID %>').value.replace(/,/g, '')).format();
        }


        function CalcEqSubTotal() {
            var a51 = document.getElementById('<%=txtInstructionalEquipment.ClientID %>');
            var a52 = document.getElementById('<%=txtNoninstructionalEquipment.ClientID %>');
            var a53 = document.getElementById('<%=txtEqOther.ClientID %>');
            var asum = document.getElementById('<%=txtEqSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a52.value)) ? parseInt(0) : parseInt(a52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a53.value)) ? parseInt(0) : parseInt(a53.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcEqSubTotalColD() {
            var a51 = document.getElementById('<%=txtInstructionalEquipmentColD.ClientID %>');
            var a52 = document.getElementById('<%=txtNoninstructionalEquipmentColD.ClientID %>');
            var a53 = document.getElementById('<%=txtEqOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtEqSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a52.value)) ? parseInt(0) : parseInt(a52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a53.value)) ? parseInt(0) : parseInt(a53.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcEqSubTotalColF() {
            var a51 = document.getElementById('<%=txtInstructionalEquipmentColF.ClientID %>');
            var a52 = document.getElementById('<%=txtNoninstructionalEquipmentColF.ClientID %>');
            var a53 = document.getElementById('<%=txtEqOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtEqSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a52.value)) ? parseInt(0) : parseInt(a52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a53.value)) ? parseInt(0) : parseInt(a53.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }
	
        enableEnterKey = true;
    </script>
    <style type="text/css">
        .style41
        {
            padding-left: 5px;
            height: 54px;
            background-color: #FFFFCC;
        }
        .style42
        {
            padding-left: 5px;
            height: 54px;
            background-color: #CCFFFF;
        }
        .style315
        {
            text-align: center;
            height: 54px;
            background-color: #FFFFCC;
        }
        .style316
        {
            text-align: center;
            height: 54px;
            background-color: #CCFFFF;
        }
        .style336
        {
            text-align: center;
            font-weight: bold;
            background-color: #FFCC99;
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
            padding-left: 5px;
        }
        .style254
        {
            height: 30px;
            font-weight: bold;
            text-align: left;
            padding-left: 5px;
            background-color: #956250;
            color: #ffffff;
        }
        .style105
        {
            height: 45px;
            font-weight: bold;
            background-color: #FF6666;
            text-align: left;
            padding-left: 5px;
        }
        .style5
        {
            font-weight: bold;
            text-align: center;
            background-color: #EFEFEF;
        }
        .style6
        {
            font-weight: bold;
            text-align: center;
            background-color: #CDCDCD;
        }
        .styleSub1
        {
            text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #FFCC99;
        }
        .styleSub2
        {
            text-align: right;
            width: 80px;
            height: 22px;
            border-style: none;
            background-color: #FF6666;
        }
        .style15
        {
            background-color: #FFCC99;
            width: 218px;
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
        .style116
        {
            font-size: xx-small;
            font-weight: bold;
        }
        .styleHighlight
        {
            border: 2px solid #ff0000;
        }
        .styleUnHighlight
        {
            border: 1px solid #666666;
            border-style: solid;
        }
        .styleErrors
        {
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table id="tblHSBudget" style="width: 100%; font-family: Arial; font-size: 13px">
            <tr>
                <td>
                    <img src="images/spacer.gif" width="200px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="90px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="90px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="95px" height="1px" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="268px" height="1px" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                        <tr>
                            <td align="center" style="height: 50px; padding-top: 5px">
                                The Lead Agency Budget has been SAVED successfully.<br />
                                <br />
                                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="200px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to ParentChild+ Budget (Part 4a)"
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
                <td colspan="7">
                    <table id="tblFailed" cellpadding="0" cellspacing="0" border="0" class="styleFailed"
                        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                        <tr>
                            <td align="center" style="height: 50px; padding-top: 5px">
                                <span class="styleErrors">The Lead Agency Budget has been SAVED with the following error(s).<br />
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
            <tr>
                <td colspan="7">
                    <table id="tblWarnings" cellpadding="0" cellspacing="0" border="0" class="styleWarning"
                        style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                        <tr>
                            <td align="center" style="height: 50px; padding-top: 5px">
                                <span class="styleErrors">The Lead Agency Budget has been SAVED with the following warning(s).<br />
                                    <ul style="font-weight: normal">
                                        <li>Line 4: Fringe is over 35%. Please provide a breakdown in the budget narrative to
                                            account for this percentage.</li></ul>
                                </span><span style="text-align: center">
                                    <asp:LinkButton ID="lnkBackToHomeWarning" runat="server" Text="Go back to Home" Visible="true"
                                        OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                        Width="200px" />
                                </span>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>1. Administrators</b>
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
                    Column G
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
                    Program<br />
                    Costs
                </td>
                <td class="style6">
                    Admin<br />
                    Costs
                </td>
                <td class="style6">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style6">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisor/Director
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisorDirectorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtSupervisorDirectorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisorDirectorFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtSupervisorDirectorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSupervisorDirectorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSupervisorDirectorColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirector" runat="server" Width="73px" Height="22px"
                        Style="text-align: right;" Enabled="True" ReadOnly="true">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisorDirectorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Project Coordinator</td>
                <td class="style316">
                    <asp:TextBox ID="txtProjectCoordinatorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="txtProjectCoordinatorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtProjectCoordinatorFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtProjectCoordinatorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtProjectCoordinatorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtProjectCoordinatorColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinator" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtProjectCoordinatorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtStipendColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtStipendColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtStipendDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtOtherNumofStaff" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="txtOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator13" runat="server" ControlToValidate="txtOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtOtherColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtOtherColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Administrators Sub-Total
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalNumofStaff" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtAdminSubTotalFTE" runat="server" CssClass="styleSub1">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAdminSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>2. Instructional/Professional Staff</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Advisor
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAdvisorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator18" runat="server" ControlToValidate="txtAdvisorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAdvisorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator17" runat="server" ControlToValidate="txtAdvisorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtAdvisorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                        ControlToValidate="txtAdvisorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisor" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAdvisorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Clinician
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtClinicianNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator19" runat="server" ControlToValidate="txtClinicianNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtClinicianFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator20" runat="server" ControlToValidate="txtClinicianFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                        ControlToValidate="txtClinicianColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                        ControlToValidate="txtClinicianColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinician" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtClinicianDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Coordinator
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCoordinatorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator26" runat="server" ControlToValidate="txtCoordinatorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCoordinatorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator25" runat="server" ControlToValidate="txtCoordinatorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                        ControlToValidate="txtCoordinatorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                        ControlToValidate="txtCoordinatorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinator" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCoordinatorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Educator/Instructor
                </td>
                <td class="style316" >
                    <asp:TextBox ID="txtEducatorInstructorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator30" runat="server" ControlToValidate="txtEducatorInstructorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtEducatorInstructorFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator29" runat="server" ControlToValidate="txtEducatorInstructorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                        ControlToValidate="txtEducatorInstructorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                        ControlToValidate="txtEducatorInstructorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructor" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtEducatorInstructorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Home Visitor
                </td>
                <td class="style315" >
                    <asp:TextBox ID="txtHomeVisitorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator34" runat="server" ControlToValidate="txtHomeVisitorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtHomeVisitorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator33" runat="server" ControlToValidate="txtHomeVisitorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
                        ControlToValidate="txtHomeVisitorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                        ControlToValidate="txtHomeVisitorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitor" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtHomeVisitorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Specialist
                </td>
                <td class="style316" >
                    <asp:TextBox ID="txtSpecialistNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator35" runat="server" ControlToValidate="txtSpecialistNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSpecialistFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator36" runat="server" ControlToValidate="txtSpecialistFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server"
                        ControlToValidate="txtSpecialistColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server"
                        ControlToValidate="txtSpecialistColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialist" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSpecialistDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server"
                        ControlToValidate="txtIPSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server"
                        ControlToValidate="txtIPSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtIPSStipendDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316" >
                    <asp:TextBox ID="txtIPSOtherNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator44" runat="server" ControlToValidate="txtIPSOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtIPSOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator43" runat="server" ControlToValidate="txtIPSOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server"
                        ControlToValidate="txtIPSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server"
                        ControlToValidate="txtIPSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtIPSOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Instructional/<br />
                    Professional Staff<br />
                    Sub-Total
                </td>
                <td class="style336" >
                    <asp:Label ID="txtIPSSubTotalNumofStaff" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtIPSSubTotalFTE" runat="server" CssClass="styleSub1">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIPSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style15">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>3. Support Staff</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    #of<br />
                    Staff
                </td>
                <td class="style5">
                    FTE
                </td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Aide/Paraprofessional
                </td>
                <td class="style315" >
                    <asp:TextBox ID="txtAideParaprofessionalNumofStaff" runat="server" Height="22px"
                        Width="44px" Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator48" runat="server" ControlToValidate="txtAideParaprofessionalNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAideParaprofessionalFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator47" runat="server" ControlToValidate="txtAideParaprofessionalFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server"
                        ControlToValidate="txtAideParaprofessionalColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server"
                        ControlToValidate="txtAideParaprofessionalColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessional" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAideParaprofessionalDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Secretary/Bookkeeper
                </td>
                <td class="style316" >
                    <asp:TextBox ID="txtSecretaryBookkeeperNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator49" runat="server" ControlToValidate="txtSecretaryBookkeeperNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSecretaryBookkeeperFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator50" runat="server" ControlToValidate="txtSecretaryBookkeeperFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server"
                        ControlToValidate="txtSecretaryBookkeeperColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                        ControlToValidate="txtSecretaryBookkeeperColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeper" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSecretaryBookkeeperDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator29" runat="server"
                        ControlToValidate="txtSSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator30" runat="server"
                        ControlToValidate="txtSSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSSStipendDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316" >
                    <asp:TextBox ID="txtSSOtherNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator55" runat="server" ControlToValidate="txtSSOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSSOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator56" runat="server" ControlToValidate="txtSSOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator31" runat="server"
                        ControlToValidate="txtSSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator32" runat="server"
                        ControlToValidate="txtSSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSSOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Support Staff Sub-Total
                </td>
                <td class="style336" >
                    <asp:Label ID="txtSSSubTotalNumofStaff" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtSSSubTotalFTE" runat="server" CssClass="styleSub1">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>4. Fringe Benefits</b>
                </td>
            </tr>
            <tr>
                <td class="style5">&nbsp;</td>
                <td class="style5" colspan="2" style="font-size:x-small;font-weight:normal;text-align:left">
                    Please enter the total number of Staff and FTE that are being paid fringe.</td>
                <td class="style5" colspan="3">&nbsp;</td>
                <td class="style5" colspan="1" style="font-size:x-small;font-weight:normal;text-align:left;line-height:13px">
                    Please provide a narrative that includes the components of the fringe benefits, 
                    if applicable: Federal Tax, State Tax, FICA, Mass Unemployment, Health 
                    Insurance, Worker&#39;s Compensation, Medicare, SUTA, Other Retirement Systems, 
                    Other. If the amount is coming from another source, please provide the name of the source(s) in Budget Narrative.</td>
            </tr>
            <tr>
                <td class="style41">
                    Fringe Benefits
                    <br />
                </td>
                <td class="style315" >
                    <asp:TextBox ID="txtFringeBenefitsNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator62" runat="server" ControlToValidate="txtFringeBenefitsNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtFringeBenefitsFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0.00</asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator61" runat="server" ControlToValidate="txtFringeBenefitsFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator33" runat="server"
                        ControlToValidate="txtFringeBenefitsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator34" runat="server"
                        ControlToValidate="txtFringeBenefitsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefits" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtFringeBenefitsDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Fringe Benefits Sub-Total
                </td>
                <td class="style336" >
                    <asp:Label ID="txtFBSubTotalNumofStaff" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <asp:Label ID="txtFBSubTotalFTE" runat="server" CssClass="styleSub1">0.00</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtFBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>5. Contractual Services</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    Rate
                </td>
                <td class="style5">
                    Hour/Day/<br />
                    Week/Year/<br />
                    Flat
                    Fee</td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td colspan="6" class="style5">&nbsp;</td>
                <td colspan="1" style="font-size:x-small;font-weight:normal;text-align:left;line-height:13px" 
                    class="style5">
                    Please list the Number (#) of Hr/Day/Wk/Yr/Flat Fee the contractual service position 
                    is getting paid. (For example, if the agency is paying a consultant a rate of 
                    $100/day and the total amount requested is $500, then the agency would list in 
                    the budget narrative that the consultant is getting paid for 5 days).</td>
            </tr>
            <tr>
                <td class="style41">
                    Advisor
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtCSAdvisorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator109" runat="server"
                        ControlToValidate="txtCSAdvisorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSAdvisorHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator35" runat="server"
                        ControlToValidate="txtCSAdvisorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator36" runat="server"
                        ControlToValidate="txtCSAdvisorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisor" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCSAdvisorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Clinician
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSClinicianRate" runat="server" Height="22px" 
                        Width="70px" Style="text-align: right"
                        MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator110" runat="server"
                        ControlToValidate="txtCSClinicianRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSClinicianHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator37" runat="server"
                        ControlToValidate="txtCSClinicianColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator38" runat="server"
                        ControlToValidate="txtCSClinicianColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinician" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCSClinicianDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Consultant
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtCSConsultantRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator111" runat="server"
                        ControlToValidate="txtCSConsultantRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSConsultantHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator39" runat="server"
                        ControlToValidate="txtCSConsultantColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator40" runat="server"
                        ControlToValidate="txtCSConsultantColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultant" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCSConsultantDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Educator/Instructor
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSEducatorInstructorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator112" runat="server"
                        ControlToValidate="txtCSEducatorInstructorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSEducatorInstructorHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator41" runat="server"
                        ControlToValidate="txtCSEducatorInstructorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator42" runat="server"
                        ControlToValidate="txtCSEducatorInstructorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructor" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCSEducatorInstructorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Home Visitor
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtCSHomeVisitorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator113" runat="server"
                        ControlToValidate="txtCSHomeVisitorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSHomeVisitorHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator43" runat="server"
                        ControlToValidate="txtCSHomeVisitorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server"
                        ControlToValidate="txtCSHomeVisitorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitor" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCSHomeVisitorDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Specialist
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSSpecialistRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator114" runat="server"
                        ControlToValidate="txtCSSpecialistRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSSpecialistHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server"
                        ControlToValidate="txtCSSpecialistColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator46" runat="server"
                        ControlToValidate="txtCSSpecialistColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialist" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCSSpecialistDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Speaker
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtCSSpeakerRate" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator115" runat="server"
                        ControlToValidate="txtCSSpeakerRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSSpeakerHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator47" runat="server"
                        ControlToValidate="txtCSSpeakerColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator48" runat="server"
                        ControlToValidate="txtCSSpeakerColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeaker" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCSSpeakerDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Substitute
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSSubstituteRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator116" runat="server"
                        ControlToValidate="txtCSSubstituteRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSSubstituteHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator49" runat="server"
                        ControlToValidate="txtCSSubstituteColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator50" runat="server"
                        ControlToValidate="txtCSSubstituteColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstitute" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCSSubstituteDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Stipend
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator51" runat="server"
                        ControlToValidate="txtCSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator52" runat="server"
                        ControlToValidate="txtCSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipend" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCSStipendDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other<%if (AppInfo.FundCode == 390 && AppInfo.FiscalYear == 2018) {%>: Coaches <% } %>
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSOtherRate" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator117" runat="server"
                        ControlToValidate="txtCSOtherRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSOtherHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator53" runat="server"
                        ControlToValidate="txtCSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator54" runat="server"
                        ControlToValidate="txtCSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCSOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Contractual<br />
                    Services Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCSSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>6. Supplies &amp; Materials</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Educational & Instructional Materials
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColD" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server"
                        ControlToValidate="txtEducationalInstructionalMaterialsColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator56" runat="server"
                        ControlToValidate="txtEducationalInstructionalMaterialsColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterials" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtEducationalInstructionalMaterialsDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Instructional Technology
                    <br />
                    including Software
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColD" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator57" runat="server"
                        ControlToValidate="txtInstructionalTechnologySoftwareColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator58" runat="server"
                        ControlToValidate="txtInstructionalTechnologySoftwareColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftware" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtInstructionalTechnologySoftwareDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Non-Instructional Supplies &nbsp;
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    <br />
                    .
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator59" runat="server"
                        ControlToValidate="txtNonInstructionalSuppliesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator60" runat="server"
                        ControlToValidate="txtNonInstructionalSuppliesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSupplies" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtNonInstructionalSuppliesDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator61" runat="server"
                        ControlToValidate="txtSMOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator62" runat="server"
                        ControlToValidate="txtSMOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSMOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Supplies &amp; Materials
                    <br />
                    Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtSMSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>7. Travel</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    Mileage<br />
                    Rate
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisory Staff
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtSupervisoryStaffMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator106" runat="server"
                        ControlToValidate="txtSupervisoryStaffMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator63" runat="server"
                        ControlToValidate="txtSupervisoryStaffColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator64" runat="server"
                        ControlToValidate="txtSupervisoryStaffColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaff" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisoryStaffDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Instructional Staff
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtInstructionalStaffMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator107" runat="server"
                        ControlToValidate="txtInstructionalStaffMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator65" runat="server"
                        ControlToValidate="txtInstructionalStaffColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator66" runat="server"
                        ControlToValidate="txtInstructionalStaffColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaff" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtInstructionalStaffDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtTravelOtherMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10">0.00</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator108" runat="server"
                        ControlToValidate="txtTravelOtherMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator67" runat="server"
                        ControlToValidate="txtTravelOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator68" runat="server"
                        ControlToValidate="txtTravelOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtTravelOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Travel Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtTravelSubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style15">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>8. Other Costs</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Advertising
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator69" runat="server"
                        ControlToValidate="txtAdvertisingColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator70" runat="server"
                        ControlToValidate="txtAdvertisingColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertising" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAdvertisingDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Equipment Rental
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator71" runat="server"
                        ControlToValidate="txtEquipmentRentalColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator72" runat="server"
                        ControlToValidate="txtEquipmentRentalColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRental" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtEquipmentRentalDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Maintenance/Repairs
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator73" runat="server"
                        ControlToValidate="txtMaintenanceRepairsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator74" runat="server"
                        ControlToValidate="txtMaintenanceRepairsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairs" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtMaintenanceRepairsDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Membership/Subscriptions
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator75" runat="server"
                        ControlToValidate="txtMembershipSubscriptionsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator76" runat="server"
                        ControlToValidate="txtMembershipSubscriptionsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptions" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtMembershipSubscriptionsDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Printing/Reproduction
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator77" runat="server"
                        ControlToValidate="txtPrintingReproductionColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator78" runat="server"
                        ControlToValidate="txtPrintingReproductionColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproduction" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtPrintingReproductionDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Staff Training
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator79" runat="server"
                        ControlToValidate="txtStaffTrainingColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator80" runat="server"
                        ControlToValidate="txtStaffTrainingColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTraining" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtStaffTrainingDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Rental of Space
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator81" runat="server"
                        ControlToValidate="txtRentalofSpaceColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator82" runat="server"
                        ControlToValidate="txtRentalofSpaceColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpace" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtRentalofSpaceDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Telephone/Utilities
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator83" runat="server"
                        ControlToValidate="txtTelephoneUtilitiesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator84" runat="server"
                        ControlToValidate="txtTelephoneUtilitiesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilities" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtTelephoneUtilitiesDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Direct Service<br />
                    Transportation
                </td>
                <td class="style315" >
                    <span id="blkNumberOfChildren" runat="server">
                    Number of<br />children<br />
                    <asp:TextBox ID="txtNumberOfChildren" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6">0</asp:TextBox>
                    </span>
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColD" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator85" runat="server"
                        ControlToValidate="txtDirectServiceTransportationColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator86" runat="server"
                        ControlToValidate="txtDirectServiceTransportationColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportation" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtDirectServiceTransportationDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Other
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator87" runat="server"
                        ControlToValidate="txtOCOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator88" runat="server"
                        ControlToValidate="txtOCOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtOCOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Other Costs Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtOCSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>9. Capacity Building</b>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Column A
                </td>
                <td class="style6" >
                    Column B
                </td>
                <td class="style6">
                    Column C
                </td>
                <td class="style6">
                    Column D
                </td>
                <td class="style6">
                    Column E
                </td>
                <td class="style6">
                    Column F
                </td>
                <td class="style6">
                    Column G
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Expenditure Category
                </td>
                <td class="style5" >
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style5">
                    Program<br />
                    Costs
                </td>
                <td class="style5">
                    Admin<br />
                    Costs
                </td>
                <td class="style5">
                    Total Grant<br />
                    Budget
                </td>
                <td class="style5">
                    Budget Narrative: Please give a brief explanation of the associated cost and how
                    it aligns with the specific activities of this Grant. Character limit is 400 including
                    spaces.
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Professional Development Opportunities
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColD" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator89" runat="server"
                        ControlToValidate="txtProfessionalDevelopOpportunitiesColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator90" runat="server"
                        ControlToValidate="txtProfessionalDevelopOpportunitiesColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunities" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtProfessionalDevelopOpportunitiesDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Application Fees
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator91" runat="server"
                        ControlToValidate="txtApplicationFeesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator92" runat="server"
                        ControlToValidate="txtApplicationFeesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFees" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtApplicationFeesDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    CEU Courses
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator93" runat="server"
                        ControlToValidate="txtCEUCoursesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator94" runat="server"
                        ControlToValidate="txtCEUCoursesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCourses" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCEUCoursesDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    College Courses
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator95" runat="server"
                        ControlToValidate="txtCollegeCoursesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator96" runat="server"
                        ControlToValidate="txtCollegeCoursesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCourses" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtCollegeCoursesDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other<%if (AppInfo.FundCode == 390 && AppInfo.FiscalYear == 2018) {%>: Coaches <% } %>
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator97" runat="server"
                        ControlToValidate="txtCBOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator98" runat="server"
                        ControlToValidate="txtCBOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCBOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Capacity Building
                    <br />
                    Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtCBSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>10. Indirect Costs<br /></b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Indirect Costs
                </td>
                <td class="style315" colspan="2" style="text-align: left; padding-left: 10px">
                    <span class="style116">Approved Rate:<br />(You must enter your agency's approved rate and submit an indirect cost approval letter if you are claiming indirect costs.)</span>
                    <asp:TextBox ID="txtIndirectPercent" runat="server" Width="50px" MaxLength="6" Height="22px"
                        Style="text-align: right" Enabled="True">0.00</asp:TextBox>
                    <span>%</span><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator148" runat="server" ControlToValidate="txtIndirectPercent"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="LessThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="100"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtIndirectPercent"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td class="style315">
                    <br />
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIndirectCosts" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator99" runat="server"
                        ControlToValidate="txtIndirectCosts" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    <br />
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtIndirectCostsDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Indirect Costs Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style15">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>11. Equipment</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Instructional Equipment
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator100" runat="server"
                        ControlToValidate="txtInstructionalEquipmentColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator101" runat="server"
                        ControlToValidate="txtInstructionalEquipmentColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipment" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtInstructionalEquipmentDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    Non-instructional Equipment
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator102" runat="server"
                        ControlToValidate="txtNoninstructionalEquipmentColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator103" runat="server"
                        ControlToValidate="txtNoninstructionalEquipmentColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipment" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtNoninstructionalEquipmentDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Other
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator104" runat="server"
                        ControlToValidate="txtEqOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator105" runat="server"
                        ControlToValidate="txtEqOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOther" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtEqOtherDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Equipment Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtEqSubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>12. Ancillary Services</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Ancillary Services
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator118" runat="server"
                        ControlToValidate="txtAncillaryColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True">0</asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator119" runat="server"
                        ControlToValidate="txtAncillaryColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillary" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAncillaryDescr" runat="server" Height="50px" TextMode="MultiLine"
                        Width="95%" Style="margin-top: 1px; margin-bottom: 1px" MaxLength="400" 
                        Font-Names="Arial"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style92">
                    Ancillary Services Sub-Total
                </td>
                <td class="style336" >
                    &nbsp;
                </td>
                <td class="style336">
                    &nbsp;
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColD" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtAncillarySubTotal" runat="server" CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style105">
                    Lead Agency TOTAL
                </td>
                <td class="style338" >
                    &nbsp;
                </td>
                <td class="style338">
                    &nbsp;
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColD" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotalColF" runat="server"
                        CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    <span class="styleSub2">$</span><asp:Label ID="txtGrantTotal" runat="server" CssClass="styleSub2">0</asp:Label>
                </td>
                <td class="style338">
                    &nbsp;
                </td>
            </tr>
            <tr>    
                <td class="style244" colspan="7">
                    <asp:Literal ID="lblDocId" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 80px">
            <tr>
                <td align="center">
                    <asp:LinkButton ID="btnPrintHSBudget" runat="server" Text="Save and Print" OnClick="btnPrintHSBudget_Click"
                        CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancelSave" runat="server" Text="Cancel Save" OnClick="btnCancelSave_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSaveHome" CssClass="buttonClass" runat="server" Text="Save Lead Agency Budget"
                        CausesValidation="True" OnClick="btnSaveHome_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
