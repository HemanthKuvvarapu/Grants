<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BudgetAmendmentPCHP.aspx.cs" Inherits="BudgetAmendmentPCHP" %>

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

                    //if (txtBox.value == "") txtBox.value = "0.00";

                    if (!isNaN(parseFloat(txtBox.value))) {
                        txtBox.value = parseFloat(txtBox.value).toFixed(2);

                        //if (txtBox.value >= 0) {
                            val += parseFloat(txtBox.value);
                        //}
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

                    //if (txtBox.value == "") txtBox.value = "0";

                    if (!isNaN(Math.round(txtBox.value))) {
                        txtBox.value = parseInt(Math.round(txtBox.value));

                        //if (txtBox.value >= 0) {
                            val += parseInt(txtBox.value);
                        //}
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
                    //if (obj.value == "") obj.value = "0.00";
                    
                    if (!isNaN(Math.round(obj.value))) {
                    
                        if (trimAll(obj.value) != '')
                        {
                            obj.value = parseFloat(obj.value).toFixed(2);
                        }
                    }
                }
            }
        }

        function UpdateToFloatValue() {
            var obj = document.getElementById(arguments[0]);
            
            if (obj) {
                //if (obj.value == "") obj.value = "0.00";
                if (!isNaN(Math.round(obj.value))) {
                    if (trimAll(obj.value) != '')
                    {
                        obj.value = parseFloat(obj.value).toFixed(2);
                    }
                }
            }
        }

        function SumColToSubTotalInt() {
            var val = 0;
            var txtBox;

            for (i = 1; i < arguments.length; i++) {
                txtBox = document.getElementById(arguments[i]);

                //if (txtBox.value == "") txtBox.value = "0";

                if (trimAll(txtBox.value) != '')
                {
                    if (!isNaN(Math.round(txtBox.value))) {
                        txtBox.value = parseInt(Math.round(txtBox.value));

                        //if (txtBox.value >= 0) {
                            val += parseInt(txtBox.value);
                        //}
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

                //if (txtBox.value == "") txtBox.value = "0.00";

                if (!isNaN(parseFloat(txtBox.value))) {
                    txtBox.value = parseFloat(txtBox.value).toFixed(2);

                    //if (txtBox.value >= 0) {
                        val += parseFloat(txtBox.value);
                    //}
                }
            }

            document.getElementById(arguments[0]).innerHTML = parseFloat(val).toFixed(2);
        }

        function CalcColumnIndirectCosts(obj) {
            var regStr = new RegExp(/^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/);

            //if (obj.value == "") obj.value = "0";

            if (regStr.test(obj.value).toString() == 'true') {
                obj.value = obj.value.replace(/,/g, '').replace('$', '');

                var a1 = document.getElementById('<%=txtIndirectCostsColFOrg.ClientID %>');
                var asum = document.getElementById('<%=txtIndirectCosts.ClientID %>');

                if (!isNaN(Math.round(obj.value))) {

                    asum.value = a1.value;
                    
                    if (trimAll(obj.value) != '')
                    {
                        obj.value = Math.round(obj.value);
                        
                        asum.value = parseInt(obj.value) + (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '').replace('$', '')));
                        asum.value = parseInt(asum.value).format();
                        
                        obj.value = parseInt(obj.value).format();
                    }
                    
                    CalcTotals();

                    CalcRateHWDFTENOS();
                }
            }
        }

        //done
        function CalcColumnCTotal(txtDorF) {
            var idText = txtDorF.id.replace(/ColD/, "").replace(/ColF/, "");
            var txt = document.getElementById(idText);
            var txtColD = document.getElementById(idText + "ColD");
            var txtColF = document.getElementById(idText + "ColF");
            var txtColDOrg = document.getElementById(idText + "ColDOrg");
            var txtColFOrg = document.getElementById(idText + "ColFOrg");
            var regStr = new RegExp(/^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/);

            //if (txtColD.value == "") txtColD.value = "0";
            //if (txtColF.value == "") txtColF.value = "0";
            if (txtColDOrg.value == "") txtColDOrg.value = "0";
            if (txtColFOrg.value == "") txtColFOrg.value = "0";
            
            if (regStr.test(txtColD.value).toString() == 'true' && regStr.test(txtColF.value).toString() == 'true' && regStr.test(txtColDOrg.value).toString() == 'true' && regStr.test(txtColFOrg.value).toString() == 'true') {
                txtColD.value = trimAll(txtColD.value.replace(/,/g, '').replace('$', ''));
                txtColF.value = trimAll(txtColF.value.replace(/,/g, '').replace('$', ''));
                txtColDOrg.value = txtColDOrg.value.replace(/,/g, '').replace('$', '');
                txtColFOrg.value = txtColFOrg.value.replace(/,/g, '').replace('$', '');
                
                if (!(isNaN(Math.round(txtColD.value)) || isNaN(Math.round(txtColF.value)) || isNaN(Math.round(txtColDOrg.value)) || isNaN(Math.round(txtColFOrg.value)))) {
                    
                    if (txtColD.value != '') txtColD.value = Math.round(txtColD.value);
                    if (txtColF.value != '') txtColF.value = Math.round(txtColF.value);
                    txtColDOrg.value = Math.round(txtColDOrg.value);
                    txtColFOrg.value = Math.round(txtColFOrg.value);
                    
                    txt.value = (isNaN(parseInt(txtColD.value)) ? parseInt(0) : parseInt(txtColD.value.replace(/,/g, ''))) + 
                                (isNaN(parseInt(txtColF.value)) ? parseInt(0) : parseInt(txtColF.value.replace(/,/g, ''))) + 
                                parseInt(txtColDOrg.value) + 
                                parseInt(txtColFOrg.value);
                    
                    if (!isNaN(parseInt(txtColD.value))) txtColD.value = parseInt(txtColD.value).format();
                    if (!isNaN(parseInt(txtColF.value))) txtColF.value = parseInt(txtColF.value).format();
                    
                    txt.value = parseInt(txt.value).format();
                    
                    CalcTotals();

                    CalcRateHWDFTENOS();
                }
            }
        }

        //done
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

            CalcAncillarySubTotalColD();
            CalcAncillarySubTotalColF();
            CalcAncillarySubTotal();

            CalcGrantTotalColD();
            CalcGrantTotalColF();


            CalcGrantTotal();
            //CopyGrandTotal();
        }
        
        //done
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


        //done
        function CalcGrantTotal() {
            var asum1 = document.getElementById('<%=txtGrantTotalColD.ClientID %>');
            var asum2 = document.getElementById('<%=txtGrantTotalColF.ClientID %>');

            var gTotal = document.getElementById('<%=txtGrantTotal.ClientID %>');

            gTotal.innerHTML = (isNaN(parseInt(asum1.innerHTML)) ? parseInt(0) : parseInt(asum1.innerHTML.replace(/,/g, '')))
                             + (isNaN(parseInt(asum2.innerHTML)) ? parseInt(0) : parseInt(asum2.innerHTML.replace(/,/g, '')));

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);
        }

        //done
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
            var pasum12 = document.getElementById('<%=txtAncillarySubTotalColD.ClientID %>');

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
                            + (isNaN(parseInt(pasum12.innerHTML)) ? parseInt(0) : parseInt(pasum12.innerHTML.replace(/,/g, '')));

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);

        }

        //done
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
            var pasum12 = document.getElementById('<%=txtAncillarySubTotalColF.ClientID %>');

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
                        + (isNaN(parseInt(pasum12.innerHTML)) ? parseInt(0) : parseInt(pasum12.innerHTML.replace(/,/g, '')));

            gTotal.innerHTML = parseInt(gTotal.innerHTML).format(2);
        }



        //done
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

        //done
        function CalcAdminSubTotalColD() {
            var o1 = document.getElementById('<%=txtSupervisorDirectorColDOrg.ClientID %>');
            var o2 = document.getElementById('<%=txtProjectCoordinatorColDOrg.ClientID %>');
            var o3 = document.getElementById('<%=txtStipendColDOrg.ClientID %>');
            var o4 = document.getElementById('<%=txtOtherColDOrg.ClientID %>');
            
            var a1 = document.getElementById('<%=txtSupervisorDirectorColD.ClientID %>');
            var a2 = document.getElementById('<%=txtProjectCoordinatorColD.ClientID %>');
            var a3 = document.getElementById('<%=txtStipendColD.ClientID %>');
            var a4 = document.getElementById('<%=txtOtherColD.ClientID %>');
            
            var asum = document.getElementById('<%=txtAdminSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o1.value)) ? parseInt(0) : parseInt(o1.value.replace(/,/g, '')))
                            + (isNaN(parseInt(o2.value)) ? parseInt(0) : parseInt(o2.value.replace(/,/g, '')))
                            + (isNaN(parseInt(o3.value)) ? parseInt(0) : parseInt(o3.value.replace(/,/g, '')))
                            + (isNaN(parseInt(o4.value)) ? parseInt(0) : parseInt(o4.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a3.value)) ? parseInt(0) : parseInt(a3.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a4.value)) ? parseInt(0) : parseInt(a4.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcAdminSubTotalColF() {
            var o1 = document.getElementById('<%=txtSupervisorDirectorColFOrg.ClientID %>');
            var o2 = document.getElementById('<%=txtProjectCoordinatorColFOrg.ClientID %>');
            var o3 = document.getElementById('<%=txtStipendColFOrg.ClientID %>');
            var o4 = document.getElementById('<%=txtOtherColFOrg.ClientID %>');
            var a1 = document.getElementById('<%=txtSupervisorDirectorColF.ClientID %>');
            var a2 = document.getElementById('<%=txtProjectCoordinatorColF.ClientID %>');
            var a3 = document.getElementById('<%=txtStipendColF.ClientID %>');
            var a4 = document.getElementById('<%=txtOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o1.value)) ? parseInt(0) : parseInt(o1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o2.value)) ? parseInt(0) : parseInt(o2.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o3.value)) ? parseInt(0) : parseInt(o3.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o4.value)) ? parseInt(0) : parseInt(o4.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a3.value)) ? parseInt(0) : parseInt(a3.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a4.value)) ? parseInt(0) : parseInt(a4.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseInt(asum.innerHTML).format(); ;
        }

        //done
        function CalcAdminSubTotalNumofStaff() {
            var o166 = document.getElementById('<%=txtSupervisorDirectorNumofStaffOrg.ClientID %>');
            var o167 = document.getElementById('<%=txtProjectCoordinatorNumofStaffOrg.ClientID %>');
            var o168 = document.getElementById('<%=txtOtherNumofStaffOrg.ClientID %>');
            var a166 = document.getElementById('<%=txtSupervisorDirectorNumofStaff.ClientID %>');
            var a167 = document.getElementById('<%=txtProjectCoordinatorNumofStaff.ClientID %>');
            var a168 = document.getElementById('<%=txtOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o166.value)) ? parseInt(0) : parseInt(o166.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o167.value)) ? parseInt(0) : parseInt(o167.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o168.value)) ? parseInt(0) : parseInt(o168.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a166.value)) ? parseInt(0) : parseInt(a166.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a167.value)) ? parseInt(0) : parseInt(a167.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a168.value)) ? parseInt(0) : parseInt(a168.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        //done
        function CalcAdminSubTotalFTE() {
            var o180 = document.getElementById('<%=txtSupervisorDirectorFTEOrg.ClientID %>');
            var o181 = document.getElementById('<%=txtProjectCoordinatorFTEOrg.ClientID %>');
            var o183 = document.getElementById('<%=txtOtherFTEOrg.ClientID %>');
            var a180 = document.getElementById('<%=txtSupervisorDirectorFTE.ClientID %>');
            var a181 = document.getElementById('<%=txtProjectCoordinatorFTE.ClientID %>');
            var a183 = document.getElementById('<%=txtOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtAdminSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(o180.value)) ? parseFloat(0) : parseFloat(o180.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o181.value)) ? parseFloat(0) : parseFloat(o181.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o183.value)) ? parseFloat(0) : parseFloat(o183.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a180.value)) ? parseFloat(0) : parseFloat(a180.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a181.value)) ? parseFloat(0) : parseFloat(a181.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a183.value)) ? parseFloat(0) : parseFloat(a183.value.replace(/,/g, '')))


            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        //done
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

        //done
        function CalcIPSSubTotalColD() {
            var o5 = document.getElementById('<%=txtAdvisorColDOrg.ClientID %>');
            var o6 = document.getElementById('<%=txtClinicianColDOrg.ClientID %>');
            var o7 = document.getElementById('<%=txtCoordinatorColDOrg.ClientID %>');
            var o8 = document.getElementById('<%=txtEducatorInstructorColDOrg.ClientID %>');
            var o9 = document.getElementById('<%=txtHomeVisitorColDOrg.ClientID %>');
            var o10 = document.getElementById('<%=txtSpecialistColDOrg.ClientID %>');
            var o11 = document.getElementById('<%=txtIPSStipendColDOrg.ClientID %>');
            var o12 = document.getElementById('<%=txtIPSOtherColDOrg.ClientID %>');
            
            var a5 = document.getElementById('<%=txtAdvisorColD.ClientID %>');
            var a6 = document.getElementById('<%=txtClinicianColD.ClientID %>');
            var a7 = document.getElementById('<%=txtCoordinatorColD.ClientID %>');
            var a8 = document.getElementById('<%=txtEducatorInstructorColD.ClientID %>');
            var a9 = document.getElementById('<%=txtHomeVisitorColD.ClientID %>');
            var a10 = document.getElementById('<%=txtSpecialistColD.ClientID %>');
            var a11 = document.getElementById('<%=txtIPSStipendColD.ClientID %>');
            var a12 = document.getElementById('<%=txtIPSOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o5.value)) ? parseInt(0) : parseInt(o5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o6.value)) ? parseInt(0) : parseInt(o6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o7.value)) ? parseInt(0) : parseInt(o7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o8.value)) ? parseInt(0) : parseInt(o8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o9.value)) ? parseInt(0) : parseInt(o9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o10.value)) ? parseInt(0) : parseInt(o10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o11.value)) ? parseInt(0) : parseInt(o11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o12.value)) ? parseInt(0) : parseInt(o12.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a5.value)) ? parseInt(0) : parseInt(a5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a6.value)) ? parseInt(0) : parseInt(a6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a7.value)) ? parseInt(0) : parseInt(a7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a8.value)) ? parseInt(0) : parseInt(a8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a9.value)) ? parseInt(0) : parseInt(a9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a10.value)) ? parseInt(0) : parseInt(a10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a11.value)) ? parseInt(0) : parseInt(a11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a12.value)) ? parseInt(0) : parseInt(a12.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }
        
        //done
        function CalcIPSSubTotalColF() {
            var o5 = document.getElementById('<%=txtAdvisorColFOrg.ClientID %>');
            var o6 = document.getElementById('<%=txtClinicianColFOrg.ClientID %>');
            var o7 = document.getElementById('<%=txtCoordinatorColFOrg.ClientID %>');
            var o8 = document.getElementById('<%=txtEducatorInstructorColFOrg.ClientID %>');
            var o9 = document.getElementById('<%=txtHomeVisitorColFOrg.ClientID %>');
            var o10 = document.getElementById('<%=txtSpecialistColFOrg.ClientID %>');
            var o11 = document.getElementById('<%=txtIPSStipendColFOrg.ClientID %>');
            var o12 = document.getElementById('<%=txtIPSOtherColFOrg.ClientID %>');
            var a5 = document.getElementById('<%=txtAdvisorColF.ClientID %>');
            var a6 = document.getElementById('<%=txtClinicianColF.ClientID %>');
            var a7 = document.getElementById('<%=txtCoordinatorColF.ClientID %>');
            var a8 = document.getElementById('<%=txtEducatorInstructorColF.ClientID %>');
            var a9 = document.getElementById('<%=txtHomeVisitorColF.ClientID %>');
            var a10 = document.getElementById('<%=txtSpecialistColF.ClientID %>');
            var a11 = document.getElementById('<%=txtIPSStipendColF.ClientID %>');
            var a12 = document.getElementById('<%=txtIPSOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o5.value)) ? parseInt(0) : parseInt(o5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o6.value)) ? parseInt(0) : parseInt(o6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o7.value)) ? parseInt(0) : parseInt(o7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o8.value)) ? parseInt(0) : parseInt(o8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o9.value)) ? parseInt(0) : parseInt(o9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o10.value)) ? parseInt(0) : parseInt(o10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o11.value)) ? parseInt(0) : parseInt(o11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o12.value)) ? parseInt(0) : parseInt(o12.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a5.value)) ? parseInt(0) : parseInt(a5.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a6.value)) ? parseInt(0) : parseInt(a6.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a7.value)) ? parseInt(0) : parseInt(a7.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a8.value)) ? parseInt(0) : parseInt(a8.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a9.value)) ? parseInt(0) : parseInt(a9.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a10.value)) ? parseInt(0) : parseInt(a10.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a11.value)) ? parseInt(0) : parseInt(a11.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a12.value)) ? parseInt(0) : parseInt(a12.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcIPSSubTotalNumofStaff() {
            var o169 = document.getElementById('<%=txtAdvisorNumofStaffOrg.ClientID %>');
            var o170 = document.getElementById('<%=txtClinicianNumofStaffOrg.ClientID %>');
            var o171 = document.getElementById('<%=txtCoordinatorNumofStaffOrg.ClientID %>');
            var o172 = document.getElementById('<%=txtEducatorInstructorNumofStaffOrg.ClientID %>');
            var o173 = document.getElementById('<%=txtHomeVisitorNumofStaffOrg.ClientID %>');
            var o174 = document.getElementById('<%=txtSpecialistNumofStaffOrg.ClientID %>');
            var o175 = document.getElementById('<%=txtIPSOtherNumofStaffOrg.ClientID %>');
            
            var a169 = document.getElementById('<%=txtAdvisorNumofStaff.ClientID %>');
            var a170 = document.getElementById('<%=txtClinicianNumofStaff.ClientID %>');
            var a171 = document.getElementById('<%=txtCoordinatorNumofStaff.ClientID %>');
            var a172 = document.getElementById('<%=txtEducatorInstructorNumofStaff.ClientID %>');
            var a173 = document.getElementById('<%=txtHomeVisitorNumofStaff.ClientID %>');
            var a174 = document.getElementById('<%=txtSpecialistNumofStaff.ClientID %>');
            var a175 = document.getElementById('<%=txtIPSOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o169.value)) ? parseInt(0) : parseInt(o169.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o170.value)) ? parseInt(0) : parseInt(o170.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o171.value)) ? parseInt(0) : parseInt(o171.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o172.value)) ? parseInt(0) : parseInt(o172.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o173.value)) ? parseInt(0) : parseInt(o173.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o174.value)) ? parseInt(0) : parseInt(o174.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o175.value)) ? parseInt(0) : parseInt(o175.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a169.value)) ? parseInt(0) : parseInt(a169.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a170.value)) ? parseInt(0) : parseInt(a170.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a171.value)) ? parseInt(0) : parseInt(a171.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a172.value)) ? parseInt(0) : parseInt(a172.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a173.value)) ? parseInt(0) : parseInt(a173.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a174.value)) ? parseInt(0) : parseInt(a174.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a175.value)) ? parseInt(0) : parseInt(a175.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        //done
        function CalcIPSSubTotalFTE() {
            var o184 = document.getElementById('<%=txtAdvisorFTEOrg.ClientID %>');
            var o185 = document.getElementById('<%=txtClinicianFTEOrg.ClientID %>');
            var o186 = document.getElementById('<%=txtCoordinatorFTEOrg.ClientID %>');
            var o187 = document.getElementById('<%=txtEducatorInstructorFTEOrg.ClientID %>');
            var o188 = document.getElementById('<%=txtHomeVisitorFTEOrg.ClientID %>');
            var o189 = document.getElementById('<%=txtSpecialistFTEOrg.ClientID %>');
            var o191 = document.getElementById('<%=txtIPSOtherFTEOrg.ClientID %>');
            
            var a184 = document.getElementById('<%=txtAdvisorFTE.ClientID %>');
            var a185 = document.getElementById('<%=txtClinicianFTE.ClientID %>');
            var a186 = document.getElementById('<%=txtCoordinatorFTE.ClientID %>');
            var a187 = document.getElementById('<%=txtEducatorInstructorFTE.ClientID %>');
            var a188 = document.getElementById('<%=txtHomeVisitorFTE.ClientID %>');
            var a189 = document.getElementById('<%=txtSpecialistFTE.ClientID %>');
            var a191 = document.getElementById('<%=txtIPSOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtIPSSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(o184.value)) ? parseFloat(0) : parseFloat(o184.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o185.value)) ? parseFloat(0) : parseFloat(o185.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o186.value)) ? parseFloat(0) : parseFloat(o186.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o187.value)) ? parseFloat(0) : parseFloat(o187.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o188.value)) ? parseFloat(0) : parseFloat(o188.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o189.value)) ? parseFloat(0) : parseFloat(o189.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o191.value)) ? parseFloat(0) : parseFloat(o191.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a184.value)) ? parseFloat(0) : parseFloat(a184.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a185.value)) ? parseFloat(0) : parseFloat(a185.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a186.value)) ? parseFloat(0) : parseFloat(a186.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a187.value)) ? parseFloat(0) : parseFloat(a187.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a188.value)) ? parseFloat(0) : parseFloat(a188.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a189.value)) ? parseFloat(0) : parseFloat(a189.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a191.value)) ? parseFloat(0) : parseFloat(a191.value.replace(/,/g, '')))

            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        //done
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

        //done
        function CalcSSSubTotalColD() {
            var o13 = document.getElementById('<%=txtAideParaprofessionalColDOrg.ClientID %>');
            var o14 = document.getElementById('<%=txtSecretaryBookkeeperColDOrg.ClientID %>');
            var o15 = document.getElementById('<%=txtSSStipendColDOrg.ClientID %>');
            var o16 = document.getElementById('<%=txtSSOtherColDOrg.ClientID %>');
            var a13 = document.getElementById('<%=txtAideParaprofessionalColD.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperColD.ClientID %>');
            var a15 = document.getElementById('<%=txtSSStipendColD.ClientID %>');
            var a16 = document.getElementById('<%=txtSSOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o13.value)) ? parseInt(0) : parseInt(o13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o14.value)) ? parseInt(0) : parseInt(o14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o15.value)) ? parseInt(0) : parseInt(o15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o16.value)) ? parseInt(0) : parseInt(o16.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a16.value)) ? parseInt(0) : parseInt(a16.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcSSSubTotalColF() {
            var o13 = document.getElementById('<%=txtAideParaprofessionalColFOrg.ClientID %>');
            var o14 = document.getElementById('<%=txtSecretaryBookkeeperColFOrg.ClientID %>');
            var o15 = document.getElementById('<%=txtSSStipendColFOrg.ClientID %>');
            var o16 = document.getElementById('<%=txtSSOtherColFOrg.ClientID %>');
            var a13 = document.getElementById('<%=txtAideParaprofessionalColF.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperColF.ClientID %>');
            var a15 = document.getElementById('<%=txtSSStipendColF.ClientID %>');
            var a16 = document.getElementById('<%=txtSSOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o13.value)) ? parseInt(0) : parseInt(o13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o14.value)) ? parseInt(0) : parseInt(o14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o15.value)) ? parseInt(0) : parseInt(o15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o16.value)) ? parseInt(0) : parseInt(o16.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a16.value)) ? parseInt(0) : parseInt(a16.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcSSSubTotalNumofStaff() {
            var o13 = document.getElementById('<%=txtAideParaprofessionalNumofStaffOrg.ClientID %>');
            var o14 = document.getElementById('<%=txtSecretaryBookkeeperNumofStaffOrg.ClientID %>');
            var o15 = document.getElementById('<%=txtSSOtherNumofStaffOrg.ClientID %>');
            
            var a13 = document.getElementById('<%=txtAideParaprofessionalNumofStaff.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperNumofStaff.ClientID %>');
            var a15 = document.getElementById('<%=txtSSOtherNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o13.value)) ? parseInt(0) : parseInt(o13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o14.value)) ? parseInt(0) : parseInt(o14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o15.value)) ? parseInt(0) : parseInt(o15.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a13.value)) ? parseInt(0) : parseInt(a13.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a14.value)) ? parseInt(0) : parseInt(a14.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a15.value)) ? parseInt(0) : parseInt(a15.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML);
        }

        //done
        function CalcSSSubTotalFTE() {
            var o13 = document.getElementById('<%=txtAideParaprofessionalFTEOrg.ClientID %>');
            var o14 = document.getElementById('<%=txtSecretaryBookkeeperFTEOrg.ClientID %>');
            var o15 = document.getElementById('<%=txtSSOtherFTEOrg.ClientID %>');
            var a13 = document.getElementById('<%=txtAideParaprofessionalFTE.ClientID %>');
            var a14 = document.getElementById('<%=txtSecretaryBookkeeperFTE.ClientID %>');
            var a15 = document.getElementById('<%=txtSSOtherFTE.ClientID %>');
            var asum = document.getElementById('<%=txtSSSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(o13.value)) ? parseFloat(0) : parseFloat(o13.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o14.value)) ? parseFloat(0) : parseFloat(o14.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(o15.value)) ? parseFloat(0) : parseFloat(o15.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a13.value)) ? parseFloat(0) : parseFloat(a13.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a14.value)) ? parseFloat(0) : parseFloat(a14.value.replace(/,/g, '')))
                        + (isNaN(parseFloat(a15.value)) ? parseFloat(0) : parseFloat(a15.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        //done
        function CalcFBSubTotal() {
            var a17 = document.getElementById('<%=txtFringeBenefits.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcFBSubTotalColD() {
            var o17 = document.getElementById('<%=txtFringeBenefitsColDOrg.ClientID %>');
            var a17 = document.getElementById('<%=txtFringeBenefitsColD.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o17.value)) ? parseInt(0) : parseInt(o17.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))
                            
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcFBSubTotalColF() {
            var o17 = document.getElementById('<%=txtFringeBenefitsColFOrg.ClientID %>');
            var a17 = document.getElementById('<%=txtFringeBenefitsColF.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o17.value)) ? parseInt(0) : parseInt(o17.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a17.value)) ? parseInt(0) : parseInt(a17.value.replace(/,/g, '')))
                            
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcFBSubTotalNumofStaff() {
            var o179 = document.getElementById('<%=txtFringeBenefitsNumofStaffOrg.ClientID %>');
            var a179 = document.getElementById('<%=txtFringeBenefitsNumofStaff.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalNumofStaff.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o179.value)) ? parseInt(0) : parseInt(o179.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a179.value)) ? parseInt(0) : parseInt(a179.value.replace(/,/g, '')))
                            
            asum.innerHTML = parseInt(asum.innerHTML);
        }

        //done
        function CalcFBSubTotalFTE() {
            var o196 = document.getElementById('<%=txtFringeBenefitsFTEOrg.ClientID %>');
            var a196 = document.getElementById('<%=txtFringeBenefitsFTE.ClientID %>');
            var asum = document.getElementById('<%=txtFBSubTotalFTE.ClientID %>');

            asum.innerHTML = (isNaN(parseFloat(o196.value)) ? parseFloat(0) : parseFloat(o196.value.replace(/,/g, '')))
                            + (isNaN(parseFloat(a196.value)) ? parseFloat(0) : parseFloat(a196.value.replace(/,/g, '')))
                            
            asum.innerHTML = parseFloat(asum.innerHTML).toFixed(2);
        }

        //done
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

        //done
        function CalcCSSubTotalColD() {
            var o18 = document.getElementById('<%=txtCSAdvisorColDOrg.ClientID %>');
            var o19 = document.getElementById('<%=txtCSClinicianColDOrg.ClientID %>');
            var o20 = document.getElementById('<%=txtCSConsultantColDOrg.ClientID %>');
            var o21 = document.getElementById('<%=txtCSEducatorInstructorColDOrg.ClientID %>');
            var o22 = document.getElementById('<%=txtCSHomeVisitorColDOrg.ClientID %>');
            var o23 = document.getElementById('<%=txtCSSpecialistColDOrg.ClientID %>');
            var o24 = document.getElementById('<%=txtCSSpeakerColDOrg.ClientID %>');
            var o25 = document.getElementById('<%=txtCSSubstituteColDOrg.ClientID %>');
            var o26 = document.getElementById('<%=txtCSStipendColDOrg.ClientID %>');
            var o27 = document.getElementById('<%=txtCSOtherColDOrg.ClientID %>');
            
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

            asum.innerHTML = (isNaN(parseInt(o18.value)) ? parseInt(0) : parseInt(o18.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o19.value)) ? parseInt(0) : parseInt(o19.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o20.value)) ? parseInt(0) : parseInt(o20.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o21.value)) ? parseInt(0) : parseInt(o21.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o22.value)) ? parseInt(0) : parseInt(o22.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o23.value)) ? parseInt(0) : parseInt(o23.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o24.value)) ? parseInt(0) : parseInt(o24.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o25.value)) ? parseInt(0) : parseInt(o25.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o26.value)) ? parseInt(0) : parseInt(o26.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o27.value)) ? parseInt(0) : parseInt(o27.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a18.value)) ? parseInt(0) : parseInt(a18.value.replace(/,/g, '')))
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

        //done
        function CalcCSSubTotalColF() {
            var o18 = document.getElementById('<%=txtCSAdvisorColFOrg.ClientID %>');
            var o19 = document.getElementById('<%=txtCSClinicianColFOrg.ClientID %>');
            var o20 = document.getElementById('<%=txtCSConsultantColFOrg.ClientID %>');
            var o21 = document.getElementById('<%=txtCSEducatorInstructorColFOrg.ClientID %>');
            var o22 = document.getElementById('<%=txtCSHomeVisitorColFOrg.ClientID %>');
            var o23 = document.getElementById('<%=txtCSSpecialistColFOrg.ClientID %>');
            var o24 = document.getElementById('<%=txtCSSpeakerColFOrg.ClientID %>');
            var o25 = document.getElementById('<%=txtCSSubstituteColFOrg.ClientID %>');
            var o26 = document.getElementById('<%=txtCSStipendColFOrg.ClientID %>');
            var o27 = document.getElementById('<%=txtCSOtherColFOrg.ClientID %>');
            
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

            asum.innerHTML = (isNaN(parseInt(o18.value)) ? parseInt(0) : parseInt(o18.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o19.value)) ? parseInt(0) : parseInt(o19.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o20.value)) ? parseInt(0) : parseInt(o20.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o21.value)) ? parseInt(0) : parseInt(o21.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o22.value)) ? parseInt(0) : parseInt(o22.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o23.value)) ? parseInt(0) : parseInt(o23.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o24.value)) ? parseInt(0) : parseInt(o24.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o25.value)) ? parseInt(0) : parseInt(o25.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o26.value)) ? parseInt(0) : parseInt(o26.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o27.value)) ? parseInt(0) : parseInt(o27.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a18.value)) ? parseInt(0) : parseInt(a18.value.replace(/,/g, '')))
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

        //done
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

        //done
        function CalcSMSubTotalColD() {
            var o28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColDOrg.ClientID %>');
            var o29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColDOrg.ClientID %>');
            var o30 = document.getElementById('<%=txtNonInstructionalSuppliesColDOrg.ClientID %>');
            var o31 = document.getElementById('<%=txtSMOtherColDOrg.ClientID %>');
            var a28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColD.ClientID %>');
            var a29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColD.ClientID %>');
            var a30 = document.getElementById('<%=txtNonInstructionalSuppliesColD.ClientID %>');
            var a31 = document.getElementById('<%=txtSMOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtSMSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o28.value)) ? parseInt(0) : parseInt(o28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o29.value)) ? parseInt(0) : parseInt(o29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o30.value)) ? parseInt(0) : parseInt(o30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o31.value)) ? parseInt(0) : parseInt(o31.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a28.value)) ? parseInt(0) : parseInt(a28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a29.value)) ? parseInt(0) : parseInt(a29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a30.value)) ? parseInt(0) : parseInt(a30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a31.value)) ? parseInt(0) : parseInt(a31.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcSMSubTotalColF() {
            var o28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColFOrg.ClientID %>');
            var o29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColFOrg.ClientID %>');
            var o30 = document.getElementById('<%=txtNonInstructionalSuppliesColFOrg.ClientID %>');
            var o31 = document.getElementById('<%=txtSMOtherColFOrg.ClientID %>');
            var a28 = document.getElementById('<%=txtEducationalInstructionalMaterialsColF.ClientID %>');
            var a29 = document.getElementById('<%=txtInstructionalTechnologySoftwareColF.ClientID %>');
            var a30 = document.getElementById('<%=txtNonInstructionalSuppliesColF.ClientID %>');
            var a31 = document.getElementById('<%=txtSMOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtSMSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o28.value)) ? parseInt(0) : parseInt(o28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o29.value)) ? parseInt(0) : parseInt(o29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o30.value)) ? parseInt(0) : parseInt(o30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o31.value)) ? parseInt(0) : parseInt(o31.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a28.value)) ? parseInt(0) : parseInt(a28.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a29.value)) ? parseInt(0) : parseInt(a29.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a30.value)) ? parseInt(0) : parseInt(a30.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a31.value)) ? parseInt(0) : parseInt(a31.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
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

        //done
        function CalcTravelSubTotalColD() {
            var o32 = document.getElementById('<%=txtSupervisoryStaffColDOrg.ClientID %>');
            var o33 = document.getElementById('<%=txtInstructionalStaffColDOrg.ClientID %>');
            var o34 = document.getElementById('<%=txtTravelOtherColDOrg.ClientID %>');
            var a32 = document.getElementById('<%=txtSupervisoryStaffColD.ClientID %>');
            var a33 = document.getElementById('<%=txtInstructionalStaffColD.ClientID %>');
            var a34 = document.getElementById('<%=txtTravelOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtTravelSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o32.value)) ? parseInt(0) : parseInt(o32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o33.value)) ? parseInt(0) : parseInt(o33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o34.value)) ? parseInt(0) : parseInt(o34.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a32.value)) ? parseInt(0) : parseInt(a32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a33.value)) ? parseInt(0) : parseInt(a33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a34.value)) ? parseInt(0) : parseInt(a34.value.replace(/,/g, '')))
                        
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcTravelSubTotalColF() {
            var o32 = document.getElementById('<%=txtSupervisoryStaffColFOrg.ClientID %>');
            var o33 = document.getElementById('<%=txtInstructionalStaffColFOrg.ClientID %>');
            var o34 = document.getElementById('<%=txtTravelOtherColFOrg.ClientID %>');
            var a32 = document.getElementById('<%=txtSupervisoryStaffColF.ClientID %>');
            var a33 = document.getElementById('<%=txtInstructionalStaffColF.ClientID %>');
            var a34 = document.getElementById('<%=txtTravelOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtTravelSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o32.value)) ? parseInt(0) : parseInt(o32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o33.value)) ? parseInt(0) : parseInt(o33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o34.value)) ? parseInt(0) : parseInt(o34.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a32.value)) ? parseInt(0) : parseInt(a32.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a33.value)) ? parseInt(0) : parseInt(a33.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a34.value)) ? parseInt(0) : parseInt(a34.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
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

        //done
        function CalcOCSubTotalColD() {
            var o35 = document.getElementById('<%=txtAdvertisingColDOrg.ClientID %>');
            var o36 = document.getElementById('<%=txtEquipmentRentalColDOrg.ClientID %>');
            var o37 = document.getElementById('<%=txtMaintenanceRepairsColDOrg.ClientID %>');
            var o38 = document.getElementById('<%=txtMembershipSubscriptionsColDOrg.ClientID %>');
            var o39 = document.getElementById('<%=txtPrintingReproductionColDOrg.ClientID %>');
            var o40 = document.getElementById('<%=txtStaffTrainingColDOrg.ClientID %>');
            var o41 = document.getElementById('<%=txtRentalofSpaceColDOrg.ClientID %>');
            var o42 = document.getElementById('<%=txtTelephoneUtilitiesColDOrg.ClientID %>');
            var o43 = document.getElementById('<%=txtDirectServiceTransportationColDOrg.ClientID %>');
            var o44 = document.getElementById('<%=txtOCOtherColDOrg.ClientID %>');
            
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

            asum.innerHTML = (isNaN(parseInt(o35.value)) ? parseInt(0) : parseInt(o35.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o36.value)) ? parseInt(0) : parseInt(o36.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o37.value)) ? parseInt(0) : parseInt(o37.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o38.value)) ? parseInt(0) : parseInt(o38.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o39.value)) ? parseInt(0) : parseInt(o39.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o40.value)) ? parseInt(0) : parseInt(o40.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o41.value)) ? parseInt(0) : parseInt(o41.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o42.value)) ? parseInt(0) : parseInt(o42.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o43.value)) ? parseInt(0) : parseInt(o43.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o44.value)) ? parseInt(0) : parseInt(o44.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a35.value)) ? parseInt(0) : parseInt(a35.value.replace(/,/g, '')))
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

        //done
        function CalcOCSubTotalColF() {
            var o35 = document.getElementById('<%=txtAdvertisingColFOrg.ClientID %>');
            var o36 = document.getElementById('<%=txtEquipmentRentalColFOrg.ClientID %>');
            var o37 = document.getElementById('<%=txtMaintenanceRepairsColFOrg.ClientID %>');
            var o38 = document.getElementById('<%=txtMembershipSubscriptionsColFOrg.ClientID %>');
            var o39 = document.getElementById('<%=txtPrintingReproductionColFOrg.ClientID %>');
            var o40 = document.getElementById('<%=txtStaffTrainingColFOrg.ClientID %>');
            var o41 = document.getElementById('<%=txtRentalofSpaceColFOrg.ClientID %>');
            var o42 = document.getElementById('<%=txtTelephoneUtilitiesColFOrg.ClientID %>');
            var o43 = document.getElementById('<%=txtDirectServiceTransportationColFOrg.ClientID %>');
            var o44 = document.getElementById('<%=txtOCOtherColFOrg.ClientID %>');
            
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

            asum.innerHTML = (isNaN(parseInt(o35.value)) ? parseInt(0) : parseInt(o35.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o36.value)) ? parseInt(0) : parseInt(o36.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o37.value)) ? parseInt(0) : parseInt(o37.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o38.value)) ? parseInt(0) : parseInt(o38.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o39.value)) ? parseInt(0) : parseInt(o39.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o40.value)) ? parseInt(0) : parseInt(o40.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o41.value)) ? parseInt(0) : parseInt(o41.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o42.value)) ? parseInt(0) : parseInt(o42.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o43.value)) ? parseInt(0) : parseInt(o43.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o44.value)) ? parseInt(0) : parseInt(o44.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a35.value)) ? parseInt(0) : parseInt(a35.value.replace(/,/g, '')))
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

        //done
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

        //done
        function CalcCBSubTotalColD() {
            var o45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColDOrg.ClientID %>');
            var o46 = document.getElementById('<%=txtApplicationFeesColDOrg.ClientID %>');
            var o47 = document.getElementById('<%=txtCEUCoursesColDOrg.ClientID %>');
            var o48 = document.getElementById('<%=txtCollegeCoursesColDOrg.ClientID %>');
            var o49 = document.getElementById('<%=txtCBOtherColDOrg.ClientID %>');
            
            var a45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColD.ClientID %>');
            var a46 = document.getElementById('<%=txtApplicationFeesColD.ClientID %>');
            var a47 = document.getElementById('<%=txtCEUCoursesColD.ClientID %>');
            var a48 = document.getElementById('<%=txtCollegeCoursesColD.ClientID %>');
            var a49 = document.getElementById('<%=txtCBOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtCBSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o45.value)) ? parseInt(0) : parseInt(o45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o46.value)) ? parseInt(0) : parseInt(o46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o47.value)) ? parseInt(0) : parseInt(o47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o48.value)) ? parseInt(0) : parseInt(o48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o49.value)) ? parseInt(0) : parseInt(o49.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a45.value)) ? parseInt(0) : parseInt(a45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a46.value)) ? parseInt(0) : parseInt(a46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a47.value)) ? parseInt(0) : parseInt(a47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a48.value)) ? parseInt(0) : parseInt(a48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a49.value)) ? parseInt(0) : parseInt(a49.value.replace(/,/g, '')))
            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcCBSubTotalColF() {
            var o45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColFOrg.ClientID %>');
            var o46 = document.getElementById('<%=txtApplicationFeesColFOrg.ClientID %>');
            var o47 = document.getElementById('<%=txtCEUCoursesColFOrg.ClientID %>');
            var o48 = document.getElementById('<%=txtCollegeCoursesColFOrg.ClientID %>');
            var o49 = document.getElementById('<%=txtCBOtherColFOrg.ClientID %>');
            var a45 = document.getElementById('<%=txtProfessionalDevelopOpportunitiesColF.ClientID %>');
            var a46 = document.getElementById('<%=txtApplicationFeesColF.ClientID %>');
            var a47 = document.getElementById('<%=txtCEUCoursesColF.ClientID %>');
            var a48 = document.getElementById('<%=txtCollegeCoursesColF.ClientID %>');
            var a49 = document.getElementById('<%=txtCBOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtCBSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o45.value)) ? parseInt(0) : parseInt(o45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o46.value)) ? parseInt(0) : parseInt(o46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o47.value)) ? parseInt(0) : parseInt(o47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o48.value)) ? parseInt(0) : parseInt(o48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o49.value)) ? parseInt(0) : parseInt(o49.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a45.value)) ? parseInt(0) : parseInt(a45.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a46.value)) ? parseInt(0) : parseInt(a46.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a47.value)) ? parseInt(0) : parseInt(a47.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a48.value)) ? parseInt(0) : parseInt(a48.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a49.value)) ? parseInt(0) : parseInt(a49.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcIndirectCostsSubTotal() {
        
            var a1 = document.getElementById('<%=txtIndirectCostsColFOrg.ClientID %>');
            var a2 = document.getElementById('<%=txtIndirectCostsColF.ClientID%>');
            var asum = document.getElementById('<%=txtIndirectCostsSubTotalColF.ClientID%>');
            var asum2 = document.getElementById('<%=txtIndirectCostsSubTotal.ClientID%>');
            
            asum.innerHTML = (isNaN(parseInt(a1.value)) ? parseInt(0) : parseInt(a1.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a2.value)) ? parseInt(0) : parseInt(a2.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
            asum2.innerHTML = asum.innerHTML;
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

        //done
        function CalcEqSubTotalColD() {
            var o51 = document.getElementById('<%=txtInstructionalEquipmentColDOrg.ClientID %>');
            var o52 = document.getElementById('<%=txtNoninstructionalEquipmentColDOrg.ClientID %>');
            var o53 = document.getElementById('<%=txtEqOtherColDOrg.ClientID %>');
            var a51 = document.getElementById('<%=txtInstructionalEquipmentColD.ClientID %>');
            var a52 = document.getElementById('<%=txtNoninstructionalEquipmentColD.ClientID %>');
            var a53 = document.getElementById('<%=txtEqOtherColD.ClientID %>');
            var asum = document.getElementById('<%=txtEqSubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o51.value)) ? parseInt(0) : parseInt(o51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o52.value)) ? parseInt(0) : parseInt(o52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o53.value)) ? parseInt(0) : parseInt(o53.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a52.value)) ? parseInt(0) : parseInt(a52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a53.value)) ? parseInt(0) : parseInt(a53.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcEqSubTotalColF() {
            var o51 = document.getElementById('<%=txtInstructionalEquipmentColFOrg.ClientID %>');
            var o52 = document.getElementById('<%=txtNoninstructionalEquipmentColFOrg.ClientID %>');
            var o53 = document.getElementById('<%=txtEqOtherColFOrg.ClientID %>');
            var a51 = document.getElementById('<%=txtInstructionalEquipmentColF.ClientID %>');
            var a52 = document.getElementById('<%=txtNoninstructionalEquipmentColF.ClientID %>');
            var a53 = document.getElementById('<%=txtEqOtherColF.ClientID %>');
            var asum = document.getElementById('<%=txtEqSubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o51.value)) ? parseInt(0) : parseInt(o51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o52.value)) ? parseInt(0) : parseInt(o52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(o53.value)) ? parseInt(0) : parseInt(o53.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a52.value)) ? parseInt(0) : parseInt(a52.value.replace(/,/g, '')))
                        + (isNaN(parseInt(a53.value)) ? parseInt(0) : parseInt(a53.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }
	
        function CalcAncillarySubTotal()
        {
            var a51 = document.getElementById('<%=txtAncillary.ClientID %>');

            var asum = document.getElementById('<%=txtAncillarySubTotal.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')));

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        function CalcAncillarySubTotalColD()
        {
            var o51 = document.getElementById('<%=txtAncillaryColDOrg.ClientID %>');
            var a51 = document.getElementById('<%=txtAncillaryColD.ClientID %>');
            var asum = document.getElementById('<%=txtAncillarySubTotalColD.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o51.value)) ? parseInt(0) : parseInt(o51.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')));

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

        //done
        function CalcAncillarySubTotalColF()
        {
            var o51 = document.getElementById('<%=txtAncillaryColFOrg.ClientID %>');
            var a51 = document.getElementById('<%=txtAncillaryColF.ClientID %>');
            var asum = document.getElementById('<%=txtAncillarySubTotalColF.ClientID %>');

            asum.innerHTML = (isNaN(parseInt(o51.value)) ? parseInt(0) : parseInt(o51.value.replace(/,/g, '')))
                            + (isNaN(parseInt(a51.value)) ? parseInt(0) : parseInt(a51.value.replace(/,/g, '')))

            asum.innerHTML = parseInt(asum.innerHTML).format();
        }

	    function checkAmendValueInt(source, arguments)
	    {
	        var o1 = document.getElementById(source.controltovalidate);
            var o2 = document.getElementById(source.controltovalidate + "Org");
            
            var v1 = (isNaN(parseInt(o1.value)) ? parseInt(0) : parseInt(o1.value.replace(/,/g, '')))
            var v2 = (isNaN(parseInt(o2.value)) ? parseInt(0) : parseInt(o2.value.replace(/,/g, '')))
            
            if ((trimAll(o1.value) == "-") || (trimAll(o1.value) == "$"))
            {
                arguments.IsValid = false;
            }
            else if (trimAll(o1.value) == "$")
            {
                o1.value = "";
                arguments.IsValid = true;
            }
            else
            {
                if (v1 + v2 < 0)
                {
                    arguments.IsValid = false;
                }
                else
                {
	                arguments.IsValid = true;
	            }
	        }
	    }
	    
	    function checkAmendValueFloat(source, arguments)
	    {
	        var o1 = document.getElementById(source.controltovalidate);
            var o2 = document.getElementById(source.controltovalidate + "Org");
            
            var v1 = (isNaN(parseFloat(o1.value)) ? parseFloat(0) : parseFloat(o1.value.replace(/,/g, '')))
            var v2 = (isNaN(parseFloat(o2.value)) ? parseFloat(0) : parseFloat(o2.value.replace(/,/g, '')))
            
            if ((trimAll(o1.value) == "-"))
            {
                arguments.IsValid = false;
            }
            else if (trimAll(o1.value) == "$")
            {
                o1.value = "";
                arguments.IsValid = true;
            }
            else
            {
                if (v1 + v2 < 0)
                {
                    arguments.IsValid = false;
                }
                else
                {
	                arguments.IsValid = true;
	            }
	        }
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
        .style244
        {
            font-weight: bold;
            background-color: #FFFFFF;
            text-align: left;
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
        .styleDisplayOnly1
        {
        	background-color: #FFFFCC;
        	border-style:none;
        }
        .styleDisplayOnly2
        {
        	background-color: #CCFFFF;
        	border-style:none;
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
                                The ParentChild+ Budget has been SAVED successfully.<br />
                                <br />
                                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Amendment Home" Visible="true"
                                    OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                    Width="200px" />
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
                                <span class="styleErrors">The PCHP Budget has been SAVED with the following error(s).<br />
                                    <span style="font-weight: normal">
                                        <asp:BulletedList ID="lstErrors" runat="server" CssClass="styleErrors">
                                        </asp:BulletedList>
                                    </span></span><span style="text-align: center">
                                        <asp:LinkButton ID="lnkBackToHomeError" runat="server" Text="Go back to Amendment Home" Visible="true"
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
                                <span class="styleErrors">The PCHP Budget has been SAVED with the following warning(s).<br />
                                    <ul style="font-weight: normal">
                                        <li>Line 4: Fringe is over 35%. Please provide a breakdown in the budget narrative to
                                            account for this percentage.</li></ul>
                                </span><span style="text-align: center">
                                    <asp:LinkButton ID="lnkBackToHomeWarning" runat="server" Text="Go back to Amendment Home" Visible="true"
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
                    <b>Instructions:</b>&nbsp;Please reference the Budget Amendment Instructions with screen shots that are posted on the EEC Website, as well as the fund use section within the Grant Application and Appendix B: Budget Guidelines for specific information regarding the budget, including program and admin costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET.</b>
                </td>
            </tr>
            <tr>
                <td class="style254" colspan="7">
                    <b>1. Adminstrators</b>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1) if you are decreasing the # of Staff.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1.0) if you are decreasing the # of FTE.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisor/Director
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisorDirectorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        CssClass="styleDisplayOnly1" Style="text-align: right" MaxLength="6" ReadOnly="true">0</asp:TextBox><br />
                    <asp:TextBox ID="txtSupervisorDirectorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtSupervisorDirectorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CompareValidator3" runat="server" ControlToValidate="txtSupervisorDirectorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtSupervisorDirectorFTEOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="true" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtSupervisorDirectorFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtSupervisorDirectorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator119" runat="server" ControlToValidate="txtSupervisorDirectorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="true" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSupervisorDirectorColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator118" runat="server" ControlToValidate="txtSupervisorDirectorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtSupervisorDirectorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisorDirectorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="true" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSupervisorDirectorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator119" runat="server" ControlToValidate="txtSupervisorDirectorColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtSupervisorDirectorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtProjectCoordinatorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtProjectCoordinatorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtProjectCoordinatorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtProjectCoordinatorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtProjectCoordinatorFTEOrg" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtProjectCoordinatorFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="txtProjectCoordinatorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator120" runat="server" ControlToValidate="txtProjectCoordinatorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtProjectCoordinatorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator120" runat="server" ControlToValidate="txtProjectCoordinatorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="txtProjectCoordinatorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtProjectCoordinatorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtProjectCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator121" runat="server" ControlToValidate="txtProjectCoordinatorColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="txtProjectCoordinatorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator122" runat="server" ControlToValidate="txtStipendColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="txtStipendColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtStipendColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator123" runat="server" ControlToValidate="txtStipendColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtStipendColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtOtherNumofStaffOrg" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtOtherNumofStaff" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="txtOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="txtOtherNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtOtherFTEOrg" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="txtOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator121" runat="server" ControlToValidate="txtOtherFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator124" runat="server" ControlToValidate="txtOtherColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator9" runat="server" ControlToValidate="txtOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator125" runat="server" ControlToValidate="txtOtherColF"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator10" runat="server" ControlToValidate="txtOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtAdvisorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    <asp:TextBox ID="txtAdvisorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="txtAdvisorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator11" runat="server" ControlToValidate="txtAdvisorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAdvisorFTEOrg" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtAdvisorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="txtAdvisorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator122" runat="server" ControlToValidate="txtAdvisorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColDOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator126" runat="server" ControlToValidate="txtAdvisorColD"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator12" runat="server" ControlToValidate="txtAdvisorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvisorColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator127" runat="server"
                        ControlToValidate="txtAdvisorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator13" runat="server" ControlToValidate="txtAdvisorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtClinicianNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtClinicianNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator16" runat="server" ControlToValidate="txtClinicianNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator14" runat="server" ControlToValidate="txtClinicianNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtClinicianFTEOrg" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtClinicianFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator21" runat="server" ControlToValidate="txtClinicianFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator123" runat="server" ControlToValidate="txtClinicianFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator128" runat="server"
                        ControlToValidate="txtClinicianColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator15" runat="server" ControlToValidate="txtClinicianColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtClinicianColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtClinicianColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator129" runat="server"
                        ControlToValidate="txtClinicianColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator16" runat="server" ControlToValidate="txtClinicianColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtCoordinatorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    <asp:TextBox ID="txtCoordinatorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator22" runat="server" ControlToValidate="txtCoordinatorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator17" runat="server" ControlToValidate="txtCoordinatorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtCoordinatorFTEOrg" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtCoordinatorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator23" runat="server" ControlToValidate="txtCoordinatorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator124" runat="server" ControlToValidate="txtCoordinatorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCoordinatorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator130" runat="server"
                        ControlToValidate="txtCoordinatorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator18" runat="server" ControlToValidate="txtCoordinatorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCoordinatorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCoordinatorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator131" runat="server"
                        ControlToValidate="txtCoordinatorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator19" runat="server" ControlToValidate="txtCoordinatorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtEducatorInstructorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtEducatorInstructorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator24" runat="server" ControlToValidate="txtEducatorInstructorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator20" runat="server" ControlToValidate="txtEducatorInstructorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtEducatorInstructorFTEOrg" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtEducatorInstructorFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator27" runat="server" ControlToValidate="txtEducatorInstructorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator125" runat="server" ControlToValidate="txtEducatorInstructorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator132" runat="server"
                        ControlToValidate="txtEducatorInstructorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator21" runat="server" ControlToValidate="txtEducatorInstructorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEducatorInstructorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator133" runat="server"
                        ControlToValidate="txtEducatorInstructorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator22" runat="server" ControlToValidate="txtEducatorInstructorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtHomeVisitorNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    <asp:TextBox ID="txtHomeVisitorNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator28" runat="server" ControlToValidate="txtHomeVisitorNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator23" runat="server" ControlToValidate="txtHomeVisitorNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtHomeVisitorFTEOrg" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtHomeVisitorFTE" runat="server" Height="22px" Width="44px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator31" runat="server" ControlToValidate="txtHomeVisitorFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator126" runat="server" ControlToValidate="txtHomeVisitorFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtHomeVisitorColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator134" runat="server"
                        ControlToValidate="txtHomeVisitorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator24" runat="server" ControlToValidate="txtHomeVisitorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtHomeVisitorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator135" runat="server"
                        ControlToValidate="txtHomeVisitorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator25" runat="server" ControlToValidate="txtHomeVisitorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtSpecialistNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtSpecialistNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator32" runat="server" ControlToValidate="txtSpecialistNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator26" runat="server" ControlToValidate="txtSpecialistNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSpecialistFTEOrg" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtSpecialistFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator37" runat="server" ControlToValidate="txtSpecialistFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator127" runat="server" ControlToValidate="txtSpecialistFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSpecialistColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator136" runat="server"
                        ControlToValidate="txtSpecialistColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator27" runat="server" ControlToValidate="txtSpecialistColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSpecialistColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSpecialistColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator137" runat="server"
                        ControlToValidate="txtSpecialistColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator28" runat="server" ControlToValidate="txtSpecialistColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtIPSStipendColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtIPSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator138" runat="server"
                        ControlToValidate="txtIPSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator29" runat="server" ControlToValidate="txtIPSStipendColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIPSStipendColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtIPSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator139" runat="server"
                        ControlToValidate="txtIPSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator30" runat="server" ControlToValidate="txtIPSStipendColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtIPSOtherNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtIPSOtherNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator38" runat="server" ControlToValidate="txtIPSOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator31" runat="server" ControlToValidate="txtIPSOtherNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtIPSOtherFTEOrg" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtIPSOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator39" runat="server" ControlToValidate="txtIPSOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator128" runat="server" ControlToValidate="txtIPSOtherFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtIPSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator140" runat="server"
                        ControlToValidate="txtIPSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator32" runat="server" ControlToValidate="txtIPSOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtIPSOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtIPSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator141" runat="server"
                        ControlToValidate="txtIPSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator33" runat="server" ControlToValidate="txtIPSOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1) if you are decreasing the # of Staff.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1.0) if you are decreasing the # of FTE.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Aide/Paraprofessional
                </td>
                <td class="style315" >
                    <asp:TextBox ID="txtAideParaprofessionalNumofStaffOrg" runat="server" Height="22px"
                        Width="44px" Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    <asp:TextBox ID="txtAideParaprofessionalNumofStaff" runat="server" Height="22px"
                        Width="44px" Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator40" runat="server" ControlToValidate="txtAideParaprofessionalNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator34" runat="server" ControlToValidate="txtAideParaprofessionalNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAideParaprofessionalFTEOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtAideParaprofessionalFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator41" runat="server" ControlToValidate="txtAideParaprofessionalFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator129" runat="server" ControlToValidate="txtAideParaprofessionalFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAideParaprofessionalColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator142" runat="server"
                        ControlToValidate="txtAideParaprofessionalColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator35" runat="server" ControlToValidate="txtAideParaprofessionalColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAideParaprofessionalColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAideParaprofessionalColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator143" runat="server"
                        ControlToValidate="txtAideParaprofessionalColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator36" runat="server" ControlToValidate="txtAideParaprofessionalColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtSecretaryBookkeeperNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtSecretaryBookkeeperNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator42" runat="server" ControlToValidate="txtSecretaryBookkeeperNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator37" runat="server" ControlToValidate="txtSecretaryBookkeeperNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSecretaryBookkeeperFTEOrg" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtSecretaryBookkeeperFTE" runat="server" Width="44px" Height="22px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator45" runat="server" ControlToValidate="txtSecretaryBookkeeperFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator130" runat="server" ControlToValidate="txtSecretaryBookkeeperFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSecretaryBookkeeperColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator144" runat="server"
                        ControlToValidate="txtSecretaryBookkeeperColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator38" runat="server" ControlToValidate="txtSecretaryBookkeeperColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSecretaryBookkeeperColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSecretaryBookkeeperColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator145" runat="server"
                        ControlToValidate="txtSecretaryBookkeeperColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator39" runat="server" ControlToValidate="txtSecretaryBookkeeperColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtSSStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator146" runat="server"
                        ControlToValidate="txtSSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator40" runat="server" ControlToValidate="txtSSStipendColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSSStipendColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator147" runat="server"
                        ControlToValidate="txtSSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator41" runat="server" ControlToValidate="txtSSStipendColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtSSOtherNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    <asp:TextBox ID="txtSSOtherNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator46" runat="server" ControlToValidate="txtSSOtherNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator42" runat="server" ControlToValidate="txtSSOtherNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:TextBox ID="txtSSOtherFTEOrg" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtSSOtherFTE" runat="server" Width="44px" Height="22px" Style="text-align: right"
                        MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator51" runat="server" ControlToValidate="txtSSOtherFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator131" runat="server" ControlToValidate="txtSSOtherFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator148" runat="server"
                        ControlToValidate="txtSSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator43" runat="server" ControlToValidate="txtSSOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSSOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator149" runat="server"
                        ControlToValidate="txtSSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator44" runat="server" ControlToValidate="txtSSOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1) if you are decreasing the # of Staff.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1.0) if you are decreasing the # of FTE.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please provide a narrative that includes the components of the fringe benefits, 
                    if applicable: Federal Tax, State Tax, FICA, Mass Unemployment, Health 
                    Insurance, Worker&#39;s Compensation, Medicare, SUTA, Other Retirement Systems, 
                    Other. If the amount is coming from another source, please provide the name of the source(s) in Budget Narrative.</span>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Fringe Benefits
                    <br />
                </td>
                <td class="style315" >
                    <asp:TextBox ID="txtFringeBenefitsNumofStaffOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    <asp:TextBox ID="txtFringeBenefitsNumofStaff" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator52" runat="server" ControlToValidate="txtFringeBenefitsNumofStaff"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator45" runat="server" ControlToValidate="txtFringeBenefitsNumofStaff"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtFringeBenefitsFTEOrg" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    <asp:TextBox ID="txtFringeBenefitsFTE" runat="server" Height="22px" Width="44px"
                        Style="text-align: right" MaxLength="6"></asp:TextBox><br />
                    <asp:CompareValidator ID="CompareValidator53" runat="server" ControlToValidate="txtFringeBenefitsFTE"
                        Display="Dynamic" ErrorMessage="Invalid Data!" Operator="DataTypeCheck" SetFocusOnError="True"
                        Type="Double" Style="font-size: xx-small" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CustomValidator ID="CustomValidator132" runat="server" ControlToValidate="txtFringeBenefitsFTE"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtFringeBenefitsColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator150" runat="server"
                        ControlToValidate="txtFringeBenefitsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator46" runat="server" ControlToValidate="txtFringeBenefitsColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtFringeBenefitsColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtFringeBenefitsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator151" runat="server"
                        ControlToValidate="txtFringeBenefitsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator47" runat="server" ControlToValidate="txtFringeBenefitsColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Rate
                </td>
                <td class="style6">
                    Hour/Day/<br />
                    Week/Year/<br />
                    Flat
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6" colspan="2">
                    <span style="font-size:smaller;text-align:left">Please list the new rate and select a new Hr/Day/Wk/Flat Fee if you are changing this information.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
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
                    <span>$<asp:TextBox ID="txtCSAdvisorRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    </span>$<asp:TextBox ID="txtCSAdvisorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator152" runat="server"
                        ControlToValidate="txtCSAdvisorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator133" runat="server" ControlToValidate="txtCSAdvisorRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSAdvisorHDWOrg" runat="server" Style="height: 27px" 
                        Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSAdvisorHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColDOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSAdvisorColD" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator153" runat="server"
                        ControlToValidate="txtCSAdvisorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator48" runat="server" ControlToValidate="txtCSAdvisorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSAdvisorColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSAdvisorColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator154" runat="server"
                        ControlToValidate="txtCSAdvisorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator49" runat="server" ControlToValidate="txtCSAdvisorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSClinicianRateOrg" runat="server" Height="22px" 
                        Width="70px" Style="text-align: right"
                        MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSClinicianRate" runat="server" Height="22px" 
                        Width="70px" Style="text-align: right"
                        MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator155" runat="server"
                        ControlToValidate="txtCSClinicianRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator134" runat="server" ControlToValidate="txtCSClinicianRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSClinicianHDWOrg" runat="server" Style="height: 27px" 
                        Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSClinicianHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSClinicianColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator156" runat="server"
                        ControlToValidate="txtCSClinicianColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator50" runat="server" ControlToValidate="txtCSClinicianColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSClinicianColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSClinicianColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator157" runat="server"
                        ControlToValidate="txtCSClinicianColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator51" runat="server" ControlToValidate="txtCSClinicianColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSConsultantRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSConsultantRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator158" runat="server"
                        ControlToValidate="txtCSConsultantRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator135" runat="server" ControlToValidate="txtCSConsultantRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSConsultantHDWOrg" runat="server" 
                        Style="height: 27px" Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSConsultantHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSConsultantColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator159" runat="server"
                        ControlToValidate="txtCSConsultantColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator52" runat="server" ControlToValidate="txtCSConsultantColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSConsultantColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSConsultantColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator160" runat="server"
                        ControlToValidate="txtCSConsultantColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator53" runat="server" ControlToValidate="txtCSConsultantColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSEducatorInstructorRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSEducatorInstructorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator161" runat="server"
                        ControlToValidate="txtCSEducatorInstructorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator136" runat="server" ControlToValidate="txtCSEducatorInstructorRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSEducatorInstructorHDWOrg" runat="server" 
                        Style="height: 27px" Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSEducatorInstructorHDW" runat="server" 
                        Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSEducatorInstructorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator162" runat="server"
                        ControlToValidate="txtCSEducatorInstructorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator54" runat="server" ControlToValidate="txtCSEducatorInstructorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSEducatorInstructorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSEducatorInstructorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator163" runat="server"
                        ControlToValidate="txtCSEducatorInstructorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator55" runat="server" ControlToValidate="txtCSEducatorInstructorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSHomeVisitorRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSHomeVisitorRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator164" runat="server"
                        ControlToValidate="txtCSHomeVisitorRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator137" runat="server" ControlToValidate="txtCSHomeVisitorRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSHomeVisitorHDWOrg" runat="server" 
                        Style="height: 27px" Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSHomeVisitorHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSHomeVisitorColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator165" runat="server"
                        ControlToValidate="txtCSHomeVisitorColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator56" runat="server" ControlToValidate="txtCSHomeVisitorColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSHomeVisitorColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSHomeVisitorColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator166" runat="server"
                        ControlToValidate="txtCSHomeVisitorColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator57" runat="server" ControlToValidate="txtCSHomeVisitorColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSSpecialistRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpecialistRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator167" runat="server"
                        ControlToValidate="txtCSSpecialistRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator138" runat="server" ControlToValidate="txtCSSpecialistRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSSpecialistHDWOrg" runat="server" 
                        Style="height: 27px" Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSSpecialistHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpecialistColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator168" runat="server"
                        ControlToValidate="txtCSSpecialistColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator58" runat="server" ControlToValidate="txtCSSpecialistColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSpecialistColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpecialistColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator169" runat="server"
                        ControlToValidate="txtCSSpecialistColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator59" runat="server" ControlToValidate="txtCSSpecialistColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSSpeakerRateOrg" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpeakerRate" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator170" runat="server"
                        ControlToValidate="txtCSSpeakerRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator139" runat="server" ControlToValidate="txtCSSpeakerRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    <asp:DropDownList ID="txtCSSpeakerHDWOrg" runat="server" Style="height: 27px" 
                        Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSSpeakerHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpeakerColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator171" runat="server"
                        ControlToValidate="txtCSSpeakerColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator60" runat="server" ControlToValidate="txtCSSpeakerColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSSpeakerColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSpeakerColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator172" runat="server"
                        ControlToValidate="txtCSSpeakerColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator61" runat="server" ControlToValidate="txtCSSpeakerColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSSubstituteRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSubstituteRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator173" runat="server"
                        ControlToValidate="txtCSSubstituteRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator140" runat="server" ControlToValidate="txtCSSubstituteRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSSubstituteHDWOrg" runat="server" 
                        Style="height: 27px" Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSSubstituteHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSubstituteColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator174" runat="server"
                        ControlToValidate="txtCSSubstituteColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator62" runat="server" ControlToValidate="txtCSSubstituteColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSSubstituteColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSSubstituteColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator175" runat="server"
                        ControlToValidate="txtCSSubstituteColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator63" runat="server" ControlToValidate="txtCSSubstituteColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCSStipendColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSStipendColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator176" runat="server"
                        ControlToValidate="txtCSStipendColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator64" runat="server" ControlToValidate="txtCSStipendColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCSStipendColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSStipendColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator177" runat="server"
                        ControlToValidate="txtCSStipendColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator65" runat="server" ControlToValidate="txtCSStipendColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Other
                </td>
                <td class="style316" >
                    $<asp:TextBox ID="txtCSOtherRateOrg" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSOtherRate" runat="server" Height="22px" Width="70px" Style="text-align: right"
                        MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator178" runat="server"
                        ControlToValidate="txtCSOtherRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator141" runat="server" ControlToValidate="txtCSOtherRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    <asp:DropDownList ID="txtCSOtherHDWOrg" runat="server" Style="height: 27px" 
                        Enabled="False">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="txtCSOtherHDW" runat="server" Style="height: 27px">
                        <asp:ListItem Value="0">-----</asp:ListItem>
                        <asp:ListItem Value="10000">Hour</asp:ListItem>
                        <asp:ListItem Value="10001">Day</asp:ListItem>
                        <asp:ListItem Value="10002">Week</asp:ListItem>
                        <asp:ListItem Value="10003">Year</asp:ListItem>
                        <asp:ListItem Value="10004">Flat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator179" runat="server"
                        ControlToValidate="txtCSOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator66" runat="server" ControlToValidate="txtCSOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCSOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCSOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator180" runat="server"
                        ControlToValidate="txtCSOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator67" runat="server" ControlToValidate="txtCSOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
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
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColDOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColD" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator181" runat="server"
                        ControlToValidate="txtEducationalInstructionalMaterialsColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator68" runat="server" ControlToValidate="txtEducationalInstructionalMaterialsColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColFOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEducationalInstructionalMaterialsColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator182" runat="server"
                        ControlToValidate="txtEducationalInstructionalMaterialsColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator69" runat="server" ControlToValidate="txtEducationalInstructionalMaterialsColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColDOrg" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10" 
                        ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColD" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator183" runat="server"
                        ControlToValidate="txtInstructionalTechnologySoftwareColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator70" runat="server" ControlToValidate="txtInstructionalTechnologySoftwareColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColFOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalTechnologySoftwareColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator184" runat="server"
                        ControlToValidate="txtInstructionalTechnologySoftwareColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator71" runat="server" ControlToValidate="txtInstructionalTechnologySoftwareColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColDOrg" runat="server" 
                        Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator185" runat="server"
                        ControlToValidate="txtNonInstructionalSuppliesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator72" runat="server" ControlToValidate="txtNonInstructionalSuppliesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColFOrg" runat="server" 
                        Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtNonInstructionalSuppliesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator186" runat="server"
                        ControlToValidate="txtNonInstructionalSuppliesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator73" runat="server" ControlToValidate="txtNonInstructionalSuppliesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtSMOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSMOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator187" runat="server"
                        ControlToValidate="txtSMOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator74" runat="server" ControlToValidate="txtSMOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtSMOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSMOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator188" runat="server"
                        ControlToValidate="txtSMOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator75" runat="server" ControlToValidate="txtSMOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Mileage<br />
                    Rate
                </td>
                <td class="style6">
                    &nbsp;</td>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Supervisory Staff
                </td>
                <td class="style315" >
                    $<asp:TextBox ID="txtSupervisoryStaffMileageRateOrg" runat="server" 
                        Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtSupervisoryStaffMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator189" runat="server"
                        ControlToValidate="txtSupervisoryStaffMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator142" runat="server" ControlToValidate="txtSupervisoryStaffMileageRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSupervisoryStaffColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator190" runat="server"
                        ControlToValidate="txtSupervisoryStaffColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator76" runat="server" ControlToValidate="txtSupervisoryStaffColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtSupervisoryStaffColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtSupervisoryStaffColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator191" runat="server"
                        ControlToValidate="txtSupervisoryStaffColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator77" runat="server" ControlToValidate="txtSupervisoryStaffColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtInstructionalStaffMileageRateOrg" runat="server" 
                        Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalStaffMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator192" runat="server"
                        ControlToValidate="txtInstructionalStaffMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator143" runat="server" ControlToValidate="txtInstructionalStaffMileageRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalStaffColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator193" runat="server"
                        ControlToValidate="txtInstructionalStaffColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator78" runat="server" ControlToValidate="txtInstructionalStaffColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtInstructionalStaffColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalStaffColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator194" runat="server"
                        ControlToValidate="txtInstructionalStaffColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator79" runat="server" ControlToValidate="txtInstructionalStaffColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtTravelOtherMileageRateOrg" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0.00</asp:TextBox><br />
                    $<asp:TextBox ID="txtTravelOtherMileageRate" runat="server" Height="22px" Width="70px"
                        Style="text-align: right" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator195" runat="server"
                        ControlToValidate="txtTravelOtherMileageRate" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" 
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator144" runat="server" ControlToValidate="txtTravelOtherMileageRate"
                        ClientValidationFunction="checkAmendValueFloat" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtTravelOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator196" runat="server"
                        ControlToValidate="txtTravelOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator80" runat="server" ControlToValidate="txtTravelOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtTravelOtherColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtTravelOtherColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator197" runat="server"
                        ControlToValidate="txtTravelOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator81" runat="server" ControlToValidate="txtTravelOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
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
                    $<asp:TextBox ID="txtAdvertisingColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAdvertisingColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator198" runat="server"
                        ControlToValidate="txtAdvertisingColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator82" runat="server" ControlToValidate="txtAdvertisingColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAdvertisingColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAdvertisingColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator199" runat="server"
                        ControlToValidate="txtAdvertisingColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator83" runat="server" ControlToValidate="txtAdvertisingColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtEquipmentRentalColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEquipmentRentalColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator200" runat="server"
                        ControlToValidate="txtEquipmentRentalColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator84" runat="server" ControlToValidate="txtEquipmentRentalColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtEquipmentRentalColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEquipmentRentalColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator201" runat="server"
                        ControlToValidate="txtEquipmentRentalColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator85" runat="server" ControlToValidate="txtEquipmentRentalColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtMaintenanceRepairsColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtMaintenanceRepairsColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator202" runat="server"
                        ControlToValidate="txtMaintenanceRepairsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator86" runat="server" ControlToValidate="txtMaintenanceRepairsColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtMaintenanceRepairsColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtMaintenanceRepairsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator203" runat="server"
                        ControlToValidate="txtMaintenanceRepairsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator87" runat="server" ControlToValidate="txtMaintenanceRepairsColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Membership/Subcriptions
                </td>
                <td class="style316" >
                    &nbsp;
                </td>
                <td class="style316">
                    &nbsp;
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtMembershipSubscriptionsColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator204" runat="server"
                        ControlToValidate="txtMembershipSubscriptionsColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator88" runat="server" ControlToValidate="txtMembershipSubscriptionsColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtMembershipSubscriptionsColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtMembershipSubscriptionsColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator205" runat="server"
                        ControlToValidate="txtMembershipSubscriptionsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator89" runat="server" ControlToValidate="txtMembershipSubscriptionsColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtPrintingReproductionColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtPrintingReproductionColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator206" runat="server"
                        ControlToValidate="txtPrintingReproductionColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator90" runat="server" ControlToValidate="txtPrintingReproductionColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtPrintingReproductionColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtPrintingReproductionColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator207" runat="server"
                        ControlToValidate="txtPrintingReproductionColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator91" runat="server" ControlToValidate="txtPrintingReproductionColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtStaffTrainingColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtStaffTrainingColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator208" runat="server"
                        ControlToValidate="txtStaffTrainingColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator92" runat="server" ControlToValidate="txtStaffTrainingColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtStaffTrainingColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtStaffTrainingColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator209" runat="server"
                        ControlToValidate="txtStaffTrainingColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator93" runat="server" ControlToValidate="txtStaffTrainingColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtRentalofSpaceColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtRentalofSpaceColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator210" runat="server"
                        ControlToValidate="txtRentalofSpaceColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator94" runat="server" ControlToValidate="txtRentalofSpaceColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtRentalofSpaceColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtRentalofSpaceColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator211" runat="server"
                        ControlToValidate="txtRentalofSpaceColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator95" runat="server" ControlToValidate="txtRentalofSpaceColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtTelephoneUtilitiesColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtTelephoneUtilitiesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator212" runat="server"
                        ControlToValidate="txtTelephoneUtilitiesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator96" runat="server" ControlToValidate="txtTelephoneUtilitiesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtTelephoneUtilitiesColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtTelephoneUtilitiesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator213" runat="server"
                        ControlToValidate="txtTelephoneUtilitiesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator97" runat="server" ControlToValidate="txtTelephoneUtilitiesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColDOrg" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtDirectServiceTransportationColD" runat="server" Width="73px"
                        Height="22px" Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator214" runat="server"
                        ControlToValidate="txtDirectServiceTransportationColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator98" runat="server" ControlToValidate="txtDirectServiceTransportationColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtDirectServiceTransportationColFOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtDirectServiceTransportationColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator215" runat="server"
                        ControlToValidate="txtDirectServiceTransportationColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator99" runat="server" ControlToValidate="txtDirectServiceTransportationColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtOCOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtOCOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator216" runat="server"
                        ControlToValidate="txtOCOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator100" runat="server" ControlToValidate="txtOCOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtOCOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtOCOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator217" runat="server"
                        ControlToValidate="txtOCOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator101" runat="server" ControlToValidate="txtOCOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
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
                    Budget Narrative<br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please enter a negative number, i.e. (-1000) if you are decreasing the amount of funds.</span>
                </td>
                <td class="style6">
                    <br />
                </td>
                <td class="style6">
                    <span style="font-size:smaller;text-align:left">Please give a brief explanation of the changes to the line item and how these funds will align with the specific activities of this Grant. Character limit is 400 including spaces.</span>
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
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColDOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColD" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator218" runat="server"
                        ControlToValidate="txtProfessionalDevelopOpportunitiesColD" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator102" runat="server" ControlToValidate="txtProfessionalDevelopOpportunitiesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColFOrg" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True" 
                        ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtProfessionalDevelopOpportunitiesColF" runat="server" Width="73px"
                        MaxLength="10" Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator219" runat="server"
                        ControlToValidate="txtProfessionalDevelopOpportunitiesColF" Display="Dynamic"
                        ErrorMessage="Invalid Data!" Style="font-size: xx-small" SetFocusOnError="True"
                        ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator103" runat="server" ControlToValidate="txtProfessionalDevelopOpportunitiesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtApplicationFeesColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtApplicationFeesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator220" runat="server"
                        ControlToValidate="txtApplicationFeesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator104" runat="server" ControlToValidate="txtApplicationFeesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtApplicationFeesColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtApplicationFeesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator221" runat="server"
                        ControlToValidate="txtApplicationFeesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator105" runat="server" ControlToValidate="txtApplicationFeesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCEUCoursesColDOrg" runat="server" Width="73px" 
                        Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCEUCoursesColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator222" runat="server"
                        ControlToValidate="txtCEUCoursesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator106" runat="server" ControlToValidate="txtCEUCoursesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCEUCoursesColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCEUCoursesColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator223" runat="server"
                        ControlToValidate="txtCEUCoursesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator107" runat="server" ControlToValidate="txtCEUCoursesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtCollegeCoursesColDOrg" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCollegeCoursesColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator224" runat="server"
                        ControlToValidate="txtCollegeCoursesColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator108" runat="server" ControlToValidate="txtCollegeCoursesColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtCollegeCoursesColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCollegeCoursesColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator225" runat="server"
                        ControlToValidate="txtCollegeCoursesColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator109" runat="server" ControlToValidate="txtCollegeCoursesColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    Other
                </td>
                <td class="style315" >
                    &nbsp;
                </td>
                <td class="style315">
                    &nbsp;
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCBOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator226" runat="server"
                        ControlToValidate="txtCBOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator110" runat="server" ControlToValidate="txtCBOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtCBOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtCBOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator227" runat="server"
                        ControlToValidate="txtCBOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator111" runat="server" ControlToValidate="txtCBOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    <b>10. Indirect Costs</b>
                </td>
            </tr>
            <tr>
                <td class="style41">
                    Indirect Costs
                </td>
                <td class="style315" colspan="2" style="text-align: left; padding-left: 10px">
                    <span class="style116">Approved Rate:</span>
                    <asp:TextBox ID="txtIndirectPercentOrg" runat="server" Width="50px" MaxLength="6" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" CssClass="styleDisplayOnly1">0.00</asp:TextBox>
                    <span>%<br />
                    <span class="style116">New Approved Rate:</span>
                    <asp:TextBox ID="txtIndirectPercent" runat="server" Width="50px" 
                        MaxLength="6" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox>
                    </span>%<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    $<asp:TextBox ID="txtIndirectCostsColFOrg" runat="server" Width="73px" 
                        MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtIndirectCostsColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator228" runat="server"
                        ControlToValidate="txtIndirectCostsColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator112" runat="server" ControlToValidate="txtIndirectCostsColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtIndirectCosts" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" ReadOnly="True">0</asp:TextBox>
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
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotalColF" runat="server"
                        CssClass="styleSub1">0</asp:Label>
                </td>
                <td class="style336">
                    <span class="styleSub1">$</span><asp:Label ID="txtIndirectCostsSubTotal" runat="server"
                        CssClass="styleSub1">0</asp:Label>
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
                    $<asp:TextBox ID="txtInstructionalEquipmentColDOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalEquipmentColD" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator229" runat="server"
                        ControlToValidate="txtInstructionalEquipmentColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator113" runat="server" ControlToValidate="txtInstructionalEquipmentColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtInstructionalEquipmentColFOrg" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtInstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator230" runat="server"
                        ControlToValidate="txtInstructionalEquipmentColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator114" runat="server" ControlToValidate="txtInstructionalEquipmentColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColDOrg" runat="server" 
                        Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator231" runat="server"
                        ControlToValidate="txtNoninstructionalEquipmentColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator115" runat="server" ControlToValidate="txtNoninstructionalEquipmentColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style316">
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColFOrg" runat="server" 
                        Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly2">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtNoninstructionalEquipmentColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator232" runat="server"
                        ControlToValidate="txtNoninstructionalEquipmentColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator116" runat="server" ControlToValidate="txtNoninstructionalEquipmentColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtEqOtherColDOrg" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10" ReadOnly="True" CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEqOtherColD" runat="server" Width="73px" Height="22px" Style="text-align: right"
                        Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator233" runat="server"
                        ControlToValidate="txtEqOtherColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator117" runat="server" ControlToValidate="txtEqOtherColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtEqOtherColFOrg" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtEqOtherColF" runat="server" Width="73px" MaxLength="10" Height="22px"
                        Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator234" runat="server"
                        ControlToValidate="txtEqOtherColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator118" runat="server" ControlToValidate="txtEqOtherColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
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
                    $<asp:TextBox ID="txtAncillaryColDOrg" runat="server" 
                        Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAncillaryColD" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" MaxLength="10"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator235" runat="server"
                        ControlToValidate="txtAncillaryColD" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator145" runat="server" ControlToValidate="txtAncillaryColD"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillaryColFOrg" runat="server" 
                        Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True" ReadOnly="True" 
                        CssClass="styleDisplayOnly1">0</asp:TextBox><br />
                    $<asp:TextBox ID="txtAncillaryColF" runat="server" Width="73px" MaxLength="10"
                        Height="22px" Style="text-align: right" Enabled="True"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator236" runat="server"
                        ControlToValidate="txtAncillaryColF" Display="Dynamic" ErrorMessage="Invalid Data!"
                        Style="font-size: xx-small" SetFocusOnError="True" ValidationExpression="^[$-]?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator146" runat="server" ControlToValidate="txtAncillaryColF"
                        ClientValidationFunction="checkAmendValueInt" Display="Dynamic" ErrorMessage="Invalid data!" 
                        SetFocusOnError="True" Style="font-size: xx-small"></asp:CustomValidator>
                </td>
                <td class="style315">
                    $<asp:TextBox ID="txtAncillary" runat="server" Width="73px" Height="22px"
                        Style="text-align: right" Enabled="True" ReadOnly="True">0</asp:TextBox>
                </td>
                <td class="style315">
                    <asp:TextBox ID="txtAncillaryDescr" runat="server" Height="50px"
                        TextMode="MultiLine" Width="95%" Style="margin-top: 1px; margin-bottom: 1px"
                        MaxLength="400" Font-Names="Arial"></asp:TextBox>
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
                    ParentChild+ TOTAL
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
                    &nbsp;
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 80px">
            <tr>
                <td align="center">
                    <asp:LinkButton ID="btnPrintHSBudget" runat="server" Text="Save and Print" OnClick="btnPrintHSBudget_Click"
                        CausesValidation="True" CssClass="buttonClass" Visible="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancelSave" runat="server" Text="Cancel Save" OnClick="btnCancelSave_Click"
                        CausesValidation="False" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSaveHome" CssClass="buttonClass" runat="server" Text="Save PC+ Budget Amendment"
                        CausesValidation="True" OnClick="btnSaveHome_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
