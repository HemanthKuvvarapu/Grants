<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="UPKClass.aspx.cs" Inherits="UPK_2018_UPKClass" %>

<%@ MasterType VirtualPath="~/MasterPage4.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" type="text/javascript">
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
</script>
    <style type="text/css">
        .auto-style1
        {
            height: 63px;
        }
        .auto-style2
        {
            text-align: center;
            border-right: 1px solid black;
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxControlToolkit:ToolkitScriptManager>
    <table id="tblClassroomSummary" runat="server" width="100%" style="background-color: #EFEFEF" runat="server">
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td style="height: 25px">
                &nbsp;&nbsp;<b>UPK Classroom Summary Form</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grdClasses" runat="server" AutoGenerateColumns="False" DataKeyNames="UpkClassroomId"
                    Width="100%" OnRowDataBound="grdClasses_RowDataBound" OnRowDeleting="grdClasses_RowDeleting"
                    OnRowEditing="grdClasses_RowEditing" BackColor="White" 
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                    ForeColor="Black" GridLines="Vertical">
                    <Columns>
                        <asp:BoundField DataField="ClassroomName" HeaderText="Classroom Name" >
                            <HeaderStyle Width="400px" HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalChildren" HeaderText="Total No. of Children" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PreSchoolChildren" HeaderText="Pre-School Children" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Amount" HeaderText="Award" />
                        <asp:ButtonField ButtonType="Link" CommandName="Edit" Text="View/Edit" />
                        <asp:ButtonField ButtonType="Link" CommandName="Delete" Text="Delete" />
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
                &nbsp;&nbsp;<b>UPK Classroom Information</b>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" style="background-color: #FFFFCC" cellspacing="0" cellpadding="0" border="0">
                 <tr>
                        <td colspan="2">
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Classroom Name:</b>
                            <asp:TextBox ID="txtClassroom" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtClassroom" Display="Dynamic" 
                                ErrorMessage="Please enter a classroom name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                <tr><td colspan="2"><br /></td></tr>
                <tr>
                    <td colspan="2"><span style="color: red; font-weight: bold;">*</span>&nbsp;<b>Please provide the number of weeks per year, days per week and hours per day your 
                        classroom operates.</b></td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;width:70%">Number of weeks per year:</td>
                    <td>
                        <asp:TextBox ID="txtWeeksPerYearOperation" runat="server" MaxLength="2" Width="80px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtWeeksPerYearOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator11" runat="server" 
                            ControlToValidate="txtWeeksPerYearOperation" Display="Dynamic" 
                            ErrorMessage="Please enter a valid value." Operator="LessThanEqual" 
                            SetFocusOnError="True" Type="Integer" ValueToCompare="52"></asp:CompareValidator>

                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of days per week:</td>
                    <td>
                        <asp:TextBox ID="txtDaysPerWeekOperation" runat="server" MaxLength="1" Width="80px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtDaysPerWeekOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator12" runat="server" 
                            ControlToValidate="txtDaysPerWeekOperation" Display="Dynamic" 
                            ErrorMessage="Please enter a valid value." Operator="LessThanEqual" 
                            SetFocusOnError="True" Type="Integer" ValueToCompare="7"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">Number of hours per day:</td>
                    <td>
                        <asp:TextBox ID="txtHoursPerDayOperation" runat="server" MaxLength="2" Width="80px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtHoursPerDayOperation"
                            ErrorMessage="Please enter a value" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <td colspan="2" align="center" style="padding-left:50px;padding-right:50px;">
                        <div style="padding-left:10px;padding-right:10px;background-color:#EFEFEF;width:100%;text-align:left">In order to be eligible to receive the full award amount, programs must be providing full-day, full-year services.  Full-day, full-year programs are defined as operating for at least 231 days and 2,079 hours per year.  For programs providing less than full-day, full-year services, award amounts will be proportionately reduced based on the number of hours that a classroom/family child care home is in operation per year.  Classrooms/family child care homes operating for:
                                <ol>
                                    <li>Three-quarters time care (1,560 through 2,078 hours per year) will receive 75% of the grant award;</li>
                                    <li>Part-time care (1,080 through 1,559 hours) per year will receive 60% of the grant award; and</li>
                                    <li>Less than part-time care (less than 1,080 hours per year) will receive 50% of the grant award.</li>
                                </ol>
                        </div>
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
                   
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of Children
                            in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                TargetControlID="txtTotalChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtTotalChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtPreSchoolChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                TargetControlID="txtPreSchoolChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPreSchoolChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">high needs children</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtHighNeedsChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                TargetControlID="txtHighNeedsChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                ControlToValidate="txtHighNeedsChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">dual language Learners</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtEnglishLearner" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                TargetControlID="txtEnglishLearner" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtEnglishLearner" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp;&nbsp;<b>Demographic Section:</b></td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp;&nbsp;<u>Ethnic Composition of Classroom</u></td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Hispanic</span> or <span style="color:red">Latino</span> origin in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtHispanicChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                TargetControlID="txtHispanicChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtHispanicChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Non-Hispanic</span> or <span style="color:red">Non-Latino</span> origin in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtNonHispanicChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                TargetControlID="txtNonHispanicChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtNonHispanicChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp;&nbsp;<u>Racial Composition of Classroom</u></td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">American Indian</span> or <span style="color:red">Alaska Native</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtIndianChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                TargetControlID="txtIndianChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtIndianChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Asian</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtAsianChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                TargetControlID="txtAsianChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txtAsianChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Black</span> or <span style="color:red">African American</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtAfricanChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                TargetControlID="txtAfricanChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtAfricanChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Native Hawaiian</span> or <span style="color:red">other Pacific Islander</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtHawaiianChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                TargetControlID="txtHawaiianChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txtHawaiianChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">White</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtWhiteChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                TargetControlID="txtWhiteChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtWhiteChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Biracial/Multi-racial</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtBiracialChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server"
                                TargetControlID="txtBiracialChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ControlToValidate="txtBiracialChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Other Race</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtOtherRaceChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server"
                                TargetControlID="txtOtherRaceChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="txtOtherRaceChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red; font-weight: bold;">*</span>&nbsp;Total Number of <b>preschool-aged children</b> who are <span style="color:red">Unspecified Race</span> in the Classroom
                        </td>
                        <td>
                            <asp:TextBox ID="txtUnspecifiedChildren" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server"
                                TargetControlID="txtUnspecifiedChildren" FilterType="Numbers">
                            </ajaxControlToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                ControlToValidate="txtUnspecifiedChildren" Display="Dynamic" 
                                ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
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
                                        <asp:Button ID="btnSaveClass" runat="server" Text="Save Classroom" OnClick="btnSaveClass_Click" />
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
