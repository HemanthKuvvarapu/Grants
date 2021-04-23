<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW5.master" AutoEventWireup="true" CodeFile="CPPIClass.aspx.cs" Inherits="CPPI_2020_CPPIClass" %>

<%@ MasterType VirtualPath="~/MasterPageNEW5.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" type="text/javascript">
        function deleteConfirm(pubid) {
            var result = confirm('Do you want to delete the record?');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }

    function calTotalHrPerYear()
    {
        var var1 = document.getElementById('<%=txtWeeksPerYearOperation.ClientID%>');
        var var2 = document.getElementById('<%=txtDaysPerWeekOperation.ClientID%>');
        var var3 = document.getElementById('<%=txtHoursPerDayOperation.ClientID%>');
    
        var result = document.getElementById('<%=txtTotalHoursPerYear.ClientID%>');
    
        if (!isNaN(parseInt(var1.value)) && !isNaN(parseInt(var2.value)) && !isNaN(parseInt(var3.value)))
        {
            result.value = parseInt(var1.value) * parseInt(var2.value) * parseInt(var3.value)
        }
    
    }

        function GetTotalChildren(Id1, Id2, Id3, totalTxtId) {
            var a1 = document.getElementById(Id1);
            var a2 = document.getElementById(Id2);
            var a3 = document.getElementById(Id3);
            //var a4 = document.getElementById(Id4);

            var a1Value = (a1 == null) ? 0 : parseInt(a1.value);
            var a2Value = (a2 == null) ? 0 : parseInt(a2.value);
            var a3Value = (a3 == null) ? 0 : parseInt(a3.value);
            //var a4Value = (a4 == null) ? 0 : parseInt(a4.value);

            a1Value = (isNaN(a1Value)) ? 0 : a1Value;
            a2Value = (isNaN(a2Value)) ? 0 : a2Value;
            a3Value = (isNaN(a3Value)) ? 0 : a3Value;
            //a4Value = (isNaN(a4Value)) ? 0 : a4Value;

            document.getElementById(totalTxtId).value = a1Value + a2Value + a3Value;  //+ a4Value;

        }
</script>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 18px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxControlToolkit:ToolkitScriptManager>
    <table id="tblClassroomSummary" runat="server" width="100%" style="background-color: #EFEFEF" runat="server">
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="height: 25px">
                &nbsp;&nbsp;<b>CPPI Classroom Summary Form</b>
                
                <asp:HiddenField ID="hidMaxPSChildren" runat="server" Value="<%=MaxPSChildren%>" />
                <asp:HiddenField ID="hidMax3YearOld" runat="server" Value="<%=Max3YearOld%>" />
                <asp:HiddenField ID="hidMax4YearOld" runat="server" Value="<%=Max4YearOld%>" />
                <asp:HiddenField ID="hidMaxUnder3Year" runat="server" Value="<%=MaxUnder3Year%>" />

                <asp:HiddenField ID="hidCurPSChildren" runat="server" Value="<%=CurPSChildren%>" />
                <asp:HiddenField ID="hidCur3YearOld" runat="server" Value="<%=Cur3YearOld%>" />
                <asp:HiddenField ID="hidCur4YearOld" runat="server" Value="<%=Cur4YearOld%>" />
                <asp:HiddenField ID="hidCurUnder3Year" runat="server" Value="<%=CurUnder3Year%>" />

                <asp:HiddenField ID="hidIsFirstTime" runat="server" Value="<%=IsFirstTime%>" />
                <asp:HiddenField ID="hidIsNewClass" runat="server" Value="<%=IsNewClass%>" />

                <asp:HiddenField ID="hidAvailPSChildren" runat="server" Value="<%=AvailPSChildren%>" />
                <asp:HiddenField ID="hidAvail3YearOld" runat="server" Value="<%=Avail3YearOld%>" />
                <asp:HiddenField ID="hidAvail4YearOld" runat="server" Value="<%=Avail4YearOld%>" />
                <asp:HiddenField ID="hidAvailUnder3Year" runat="server" Value="<%=AvailUnder3Year%>" />

                <asp:HiddenField ID="hidThisPSChildren" runat="server" Value="<%=ThisPSChildren%>" />
                <asp:HiddenField ID="hidThis3YearOld" runat="server" Value="<%=This3YearOld%>" />
                <asp:HiddenField ID="hidThis4YearOld" runat="server" Value="<%=This4YearOld%>" />
                <asp:HiddenField ID="hidThisUnder3Year" runat="server" Value="<%=ThisUnder3Year%>" />
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grdClasses" runat="server" AutoGenerateColumns="False" DataKeyNames="ClassroomId"
                    Width="100%" OnRowDataBound="grdClasses_RowDataBound" OnRowDeleting="grdClasses_RowDeleting"
                    OnRowEditing="grdClasses_RowEditing" BackColor="White" 
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                    ForeColor="Black" GridLines="Vertical">
                    <Columns>
                        <%--<asp:BoundField DataField="ClassroomId" HeaderText="Classroom ID" Visible="False">
                            <HeaderStyle Width="50px" HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="txtClassroomName" HeaderText="Classroom Name" >
                            <HeaderStyle Width="400px" HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <%--<asp:BoundField DataField="txtQ1_1_1" HeaderText="Total No. of Pre-School Children" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="txtAmount" HeaderText="Award" />--%>
                                             
                        <asp:ButtonField ButtonType="Link" CommandName="Edit" Text="View/Edit" />
                        <asp:ButtonField ButtonType="Link" CommandName="Delete" Text="Delete" />

                        <asp:TemplateField HeaderText="Educators">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkEducators" runat="server" Text="" />
                                </ItemTemplate>
                                <ItemStyle Width="130px" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr><td align="center"><b style="text-align:center;color:#FF0000">No classroom found.</b></td></tr>
                        </table>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnAddNewClass" runat="server" Text="Add New Classroom" OnClick="btnAddNewClass_Click" />
                <asp:Label ID="lblMaxClassroom" runat="server" Visible="false">Maximum number of classrooms reached</asp:Label>
            </td>
        </tr>
    </table>
    <table id="tblClassroom" runat="server" width="100%" visible="false">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <b>Instructions:</b> Please complete the information below. <br />
                <div id="tblErrorMessage1" runat="server" style="width:100%;background-color:Yellow;color:red;border:solid 1px #ff0000" visible="false"><asp:Label ID="lblErrorMessage1" runat="server" Text="" ForeColor="Red"></asp:Label></div>                   
            </td>
        </tr>
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="height: 25px">
                &nbsp;&nbsp;<b>Classroom Information</b>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" style="background-color: #FFFFCC" cellspacing="0" cellpadding="0" border="0">
                <tr>
                        <td colspan="2" class="auto-style1">
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Classroom Name:</b>
                            <asp:TextBox ID="txtClassroomName" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtClassroomName" Display="Dynamic" 
                                ErrorMessage="Please enter a classroom name" ValidationGroup="validClass"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr><td colspan="2">
                    
                    <br /></td>
                </tr>
                <%--<tr>
                        <td colspan="2" class="auto-style1">
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Major/Program of Study:</b>
                            <asp:TextBox ID="txtMajorProgramStudy" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtMajorProgramStudy" Display="Dynamic" 
                                ErrorMessage="Please enter a major/program of study"></asp:RequiredFieldValidator>
                        </td>
                </tr>--%>
                <tr><td colspan="2">
                    <br /></td>
                </tr>
                <tr style="background-color: #6699FF; color: #FFFFFF">
            <%--<td colspan="2" style="height: 25px">
                &nbsp;&nbsp;<b>Classroom Educator(s)</b>
            </td>--%>
        </tr>

        <tr><td colspan="2">
                    
                    <br /></td></tr>
                                <tr style="background-color: #6699FF; color: #FFFFFF">
            <td colspan="2" style="height: 25px">
                &nbsp;&nbsp;<b>Classroom Hours of Operation</b>
            </td>
        </tr>
                <tr>
                    <td colspan="2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Please provide the number of weeks per year, days per week and hours per day your 
                        classroom operates.</b></td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;width:70%">Number of weeks per year:</td>
                    <td>
                        <asp:TextBox ID="txtWeeksPerYearOperation" runat="server" MaxLength="2" Width="80px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtWeeksPerYearOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic" ValidationGroup="validClass"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator11" runat="server" 
                            ControlToValidate="txtWeeksPerYearOperation" Display="Dynamic" 
                            ErrorMessage="Please enter a valid value." Operator="LessThanEqual" 
                            SetFocusOnError="True" Type="Integer" ValueToCompare="52"></asp:CompareValidator>

                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of days per week (must be 5):</td>
                    <td>
                        <asp:TextBox ID="txtDaysPerWeekOperation" runat="server" MaxLength="1" Width="80px" Text="5" Enabled="false"></asp:TextBox><br />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtDaysPerWeekOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator12" runat="server" 
                            ControlToValidate="txtDaysPerWeekOperation" Display="Dynamic" 
                            ErrorMessage="Please enter a valid value." Operator="LessThanEqual" 
                            SetFocusOnError="True" Type="Integer" ValueToCompare="7"></asp:CompareValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of hours per day:</td>
                    <td>
                        <asp:TextBox ID="txtHoursPerDayOperation" runat="server" MaxLength="2" Width="80px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtHoursPerDayOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic"  ValidationGroup="validClass"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator13" runat="server" 
                            ControlToValidate="txtHoursPerDayOperation" Display="Dynamic" 
                            ErrorMessage="Please enter a valid value." Operator="LessThanEqual" 
                            SetFocusOnError="True" Type="Integer" ValueToCompare="24"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td style="padding-left: 50px;">Total number of hours open for the year:</td>
                    <td>
                        <asp:TextBox ID="txtTotalHoursPerYear" runat="server" Enabled="False" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="padding-left:50px;padding-right:50px;">&nbsp;
                        <%--<div style="padding-left:10px;padding-right:10px;background-color:#EFEFEF;width:100%;text-align:left">In order to be eligible to receive the full award amount, programs must be providing full-day, full-year services.  Full-day, full-year programs are defined as operating for at least 231 days and 2,079 hours per year.  For programs providing less than full-day, full-year services, award amounts will be proportionately reduced based on the number of hours that a classroom/family child care home is in operation per year.  Classrooms/family child care homes operating for:
                                <ol>
                                    <li>Three-quarters time care (1,560 through 2,078 hours per year) will receive 75% of the grant award;</li>
                                    <li>Part-time care (1,080 through 1,559 hours) per year will receive 60% of the grant award; and</li>
                                    <li>Less than part-time care (less than 1,080 hours per year) will receive 50% of the grant award.</li>
                                </ol>
                        </div>--%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
             
        </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" style="background-color: #FFFFCC" cellspacing="0" cellpadding="0"
                    border="0">
                                                        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td colspan="2" style="height: 25px">
                &nbsp;&nbsp;<b>Classroom Enrollment</b>
            </td>
        </tr>
                    <tr><td colspan="2">
<%--                        <asp:CustomValidator ID="CustomValidator14" runat="server" ControlToValidate="txtQ1_1_1" Display="Dynamic" ErrorMessage="Please complete the classroom enrollment section." OnServerValidate="CustomValidator14_ServerValidate"></asp:CustomValidator>--%>
                    </td></tr>
                    <tr>
                        <td colspan="2" class="auto-style2">1. Number of children to be enrolled in this CPPI-funded classroom by <b>Age</b>:</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                        <br />
                                        </b></td>
                                   <%-- <td style="width:20%;text-align:center"><b>Actual Enrollment
                                        <br />
                                        March 1, 2021</td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2021</b></td>--%>
                                </tr>
                                <tr>
                                    <td style="height:40px">Total number of preschool-aged children: <b>(2 years, 9 months to 4 years old)</b>
                                       <%--<asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="txtQ1_1_1" ValidationGroup="validClass" Display="Dynamic" ErrorMessage="The total number of preschool-aged children to be enrolled in this and other classrooms in this program cannot exceed the total number of children that was entered for this program.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>--%>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="false"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <%--<td style="text-align:center"><asp:TextBox ID="txtQ1_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>--%>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>3 year-olds</b> (defined as those eligible for Kindergarten by 2023).
                                        <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtQ1_2_1" ValidationGroup="validClass" Display="Dynamic" ErrorMessage="The total number of 3 year-olds to be enrolled in this and other classrooms in this program cannot exceed the total number of 3 year-olds that was entered for this program.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>--%>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator137" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator86" runat="server" 
                                            ControlToValidate="txtQ1_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <%--<td style="text-align:center"><asp:TextBox ID="txtQ1_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator138" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator87" runat="server" 
                                            ControlToValidate="txtQ1_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator139" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator88" runat="server" 
                                            ControlToValidate="txtQ1_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>--%>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>4 year-olds</b> (defined as those eligible for Kindergarten by Sept. 2022)
                                         <%--<asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtQ1_3_1" ValidationGroup="validClass" Display="Dynamic" ErrorMessage="The total number of 4 year-olds to be enrolled in this and other classrooms in this program cannot exceed the total number of 4 year-olds that was entered for this program.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>--%>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator140" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator89" runat="server" 
                                            ControlToValidate="txtQ1_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                   <%-- <td style="text-align:center"><asp:TextBox ID="txtQ1_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator141" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator90" runat="server" 
                                            ControlToValidate="txtQ1_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator142" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator91" runat="server" 
                                            ControlToValidate="txtQ1_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>--%>
                                </tr>
                                <%--<tr>
                                    <td style="height:40px">Of the total, number of <b>5 year-olds</b>.</td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_4_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator143" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator92" runat="server" 
                                            ControlToValidate="txtQ1_4_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_4_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator144" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator93" runat="server" 
                                            ControlToValidate="txtQ1_4_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_4_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator145" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_4_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator94" runat="server" 
                                            ControlToValidate="txtQ1_4_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>--%>
                                <tr>
                                    <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)
                                        <%-- <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtQ1_5_1" ValidationGroup="validClass" Display="Dynamic" ErrorMessage="The total number of under-3 year-olds to be enrolled in this and other classrooms in this program cannot exceed the total number of under-3 year-olds that was entered for this program.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>--%>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator146" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator95" runat="server" 
                                            ControlToValidate="txtQ1_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <%--<td style="text-align:center"><asp:TextBox ID="txtQ1_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator147" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator96" runat="server" 
                                            ControlToValidate="txtQ1_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ1_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator148" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ1_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator97" runat="server" 
                                            ControlToValidate="txtQ1_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>--%>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    
<%--                    <tr>
                        <td colspan="2" style="padding-left:40px">2. Number of children to be enrolled in this CPPI-funded classroom by <b>Age and Disability Status</b>:</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333" rules="all">
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="width:20%;text-align:center" colspan="2"><b>Proposed Target Enrollment
                                        </b></td>
                                    <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment 
                                        <br />
                                        March 1, 201</b>9</td>
                                    <td style="width:20%;text-align:center" colspan="2"><b>Actual Enrollment<br />
                                        June 1 , 2019</b></td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;height:25px">&nbsp;</td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children with IEPs</b></td>
                                    <td style="text-align:center;width:10%"><b>Children without IEPs</b></td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">Total number of preschool-aged children: <b>(2 years, 9 months to 4 years old)</b></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_1_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>3 year-olds</b><br /><asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtQ2_2_1" Display="Dynamic" ErrorMessage="The total number of 3 year-olds with IEPs and without IEPs must equal the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator133" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" 
                                            ControlToValidate="txtQ2_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator134" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" 
                                            ControlToValidate="txtQ2_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator116" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" 
                                            ControlToValidate="txtQ2_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator117" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" 
                                            ControlToValidate="txtQ2_2_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator118" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" 
                                            ControlToValidate="txtQ2_2_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_2_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator119" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_2_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" 
                                            ControlToValidate="txtQ2_2_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>4 year-olds</b><br /><asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="The total number of 4 year-olds with IEPs and without IEPs must equal the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " ControlToValidate="txtQ2_3_1" Display="Dynamic" OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                        <asp:CompareValidator 
                                            ID="CompareValidator120" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" 
                                            ControlToValidate="txtQ2_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator121" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" 
                                            ControlToValidate="txtQ2_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator122" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" 
                                            ControlToValidate="txtQ2_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator123" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" 
                                            ControlToValidate="txtQ2_3_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator124" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator69" runat="server" 
                                            ControlToValidate="txtQ2_3_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_3_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator125" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_3_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator70" runat="server" 
                                            ControlToValidate="txtQ2_3_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                
                                <tr>
                                    <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br /><asp:CustomValidator ID="CustomValidator7" runat="server" ErrorMessage="The total number of children under 3 years old with IEPs and without IEPs must equal the total number of children under 3 year old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " ControlToValidate="txtQ2_5_1" Display="Dynamic" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator1" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" 
                                            ControlToValidate="txtQ2_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator2" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" 
                                            ControlToValidate="txtQ2_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator3" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" 
                                            ControlToValidate="txtQ2_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_4" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator4" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_4" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" 
                                            ControlToValidate="txtQ2_5_4" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_5" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator5" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_5" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" 
                                            ControlToValidate="txtQ2_5_5" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ2_5_6" runat="server" 
                                            Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator6" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ2_5_6" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" 
                                            ControlToValidate="txtQ2_5_6" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="padding-left:40px">3. Number of children who have been identified as <b>Dual Language Learners whose home language is not English (DLL/ELL/LEP)</b>:</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                        </b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment
                                        <br />
                                        March 1, 2019</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2019</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Total number of preschool-aged children: <b>(2 years, 9 months to 5 years old)</b></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>3 year-olds</b>.<br /><asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtQ3_2_1" Display="Dynamic" ErrorMessage="The total number of 3 year-olds identified as DLL/ELL/LEP cannot exceed the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator7" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                            ControlToValidate="txtQ3_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator8" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                            ControlToValidate="txtQ3_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator9" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                            ControlToValidate="txtQ3_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>4 year-olds</b>.<br /><asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="The total number of 4 year-olds identified as DLL/ELL/LEP cannot exceed the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." ControlToValidate="txtQ3_3_1" OnServerValidate="CustomValidator8_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator10" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                            ControlToValidate="txtQ3_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator14" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                            ControlToValidate="txtQ3_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator15" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                            ControlToValidate="txtQ3_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>

                                <tr>
                                    <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br /><asp:CustomValidator ID="CustomValidator10" runat="server" Display="Dynamic" ErrorMessage="The total number of children under 3 years old identified as DLL/ELL/LEP cannot exceed the total number of children under 3 years old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly. " ControlToValidate="txtQ3_5_1" OnServerValidate="CustomValidator10_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator19" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                            ControlToValidate="txtQ3_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator20" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                            ControlToValidate="txtQ3_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ3_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator21" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ3_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                            ControlToValidate="txtQ3_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="padding-left:40px">4. Number of children who have been identified as <b>economically disadvantaged, low income, or eligible for free/reduced priced meals</b>:</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-left: 50px;">
                        <br />
                            <table cellpadding="5" cellspacing="0" border="0" style="border:solid 1px #333333"  rules="all">
                                <tr>
                                    <td style="width:40%">&nbsp;</td>
                                    <td style="width:20%;text-align:center"><b>Proposed Target Enrollment
                                        </b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment
                                        <br />March 1, 2019</b></td>
                                    <td style="width:20%;text-align:center"><b>Actual Enrollment 
                                        <br />
                                        June 1, 2019</b></td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Total number of preschool-aged children: <b>(2 years, 9 months to 4 years old)</b></td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_1_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_1_2" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_1_3" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>3 year-olds</b>.<br /><asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtQ4_2_1" Display="Dynamic" ErrorMessage="The total number of 3 year-olds identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of 3 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_2_1" runat="server" 
                                            Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator22" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                            ControlToValidate="txtQ4_2_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_2_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator23" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                            ControlToValidate="txtQ4_2_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_2_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator24" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_2_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="txtQ4_2_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                                <tr>
                                    <td style="height:40px">Of the total, number of <b>4 year-olds</b>.<br /><asp:CustomValidator ID="CustomValidator11" runat="server" Display="Dynamic" ErrorMessage="The total number of 4 year-olds identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of 4 year-olds that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly.  " OnServerValidate="CustomValidator11_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_3_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator25" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                            ControlToValidate="txtQ4_3_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_3_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator26" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                            ControlToValidate="txtQ4_3_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_3_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator27" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_3_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                            ControlToValidate="txtQ4_3_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>

                                <tr>
                                    <td style="height:40px">Of the total, number of children <b><u>under</u> 3 years old</b>: (2 years, 9 months to 3 years old)<br /><asp:CustomValidator ID="CustomValidator13" runat="server" Display="Dynamic" ErrorMessage="The total number of children under 3 years old identified as economically disadvantaged, low income, or eligible for free/reduced priced meals cannot exceed the total number of children under 3 years old that was entered in Question #1.  Please double-check the numbers that you have entered and revise accordingly." OnServerValidate="CustomValidator13_ServerValidate"></asp:CustomValidator>
                                    </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_5_1" runat="server" Width="50px" MaxLength="5" Text="0"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator31" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_1" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                                            ControlToValidate="txtQ4_5_1" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_5_2" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator32" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_2" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                            ControlToValidate="txtQ4_5_2" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                    <td style="text-align:center"><asp:TextBox ID="txtQ4_5_3" runat="server" Width="50px" MaxLength="5" Text="0" Enabled="False"></asp:TextBox>
                                    <br/><asp:CompareValidator 
                                            ID="CompareValidator33" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please input a valid number." ControlToValidate="txtQ4_5_3" 
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                            ControlToValidate="txtQ4_5_3" Display="Dynamic" 
                                            ErrorMessage="Please input a&lt;br/&gt;valid number."></asp:RequiredFieldValidator>
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="tblActions" runat="server" width="100%" cellpadding="0" cellspacing="0"
                                border="0">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnCancelClass" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancelClass_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnSaveClass" runat="server" Text="Save Classroom" OnClick="btnSaveClass_Click" ValidationGroup="validClass"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table id="tblHome" cellpadding="0" cellspacing="0" border="0" runat="server" width="100%" style="height:100px">
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Program Summary" Visible="true"
                                        OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                        Width="200px" />
                            </td>
                        </tr>
                    </table>
</asp:Content>
