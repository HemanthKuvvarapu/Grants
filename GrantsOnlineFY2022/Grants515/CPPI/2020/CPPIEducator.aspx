<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageNEW5.master" AutoEventWireup="true" CodeFile="CPPIEducator.aspx.cs" Inherits="CPPIEducator" %>

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

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxControlToolkit:ToolkitScriptManager>

    <table id="tblClassroom" runat="server" width="100%" visible="false">
        <tr>
            <td>
                <b>Classroom Name:</b>
                <asp:Label ID="lblClassroomName" runat="server" Width="300px"></asp:Label> 
            </td>
        </tr>
        <tr>
            <td>
                <%--<b>Instructions:</b> Please complete the information below. <br />--%>
                <div id="tblErrorMessage1" runat="server" style="width:100%;background-color:Yellow;color:red;border:solid 1px #ff0000" visible="false"><asp:Label ID="lblErrorMessage1" runat="server" Text="" ForeColor="Red"></asp:Label></div>                   
            </td>
        </tr>

        <tr><td colspan="2">
            <br /></td>
        </tr>
        <tr style="background-color: #6699FF; color: #FFFFFF">
            <td colspan="2" style="height: 25px">
                &nbsp;&nbsp;<b>Classroom Educator(s)</b>
            </td>
        </tr>
        <tr><td colspan="2">
            <asp:HiddenField ID="hidClassroomId" Value="<%=ClassroomId%>" runat="server" />
<%--            <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="txtEducatorName" ErrorMessage="Please complete all the classroom educator(s) information." OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>                   --%>
            <br /></td></tr>
        <tr>
            <td colspan="2" style="padding-left:20px">
                <asp:GridView ID="grdTeachers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" ShowFooter="True" OnRowCommand="grdTeachers_RowCommand" OnRowDataBound="grdTeachers_RowDataBound" OnRowDeleting="grdTeachers_RowDeleting" OnRowEditing="grdTeachers_RowEditing" OnRowUpdating="grdTeachers_RowUpdating" OnRowCancelingEdit="grdTeachers_RowCancelingEdit">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="EducatorId" Visible="False" />
                        <asp:TemplateField HeaderText="Educator Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEducatorName" width="200px" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEducatorName" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEducatorName" width="200px" runat="server"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEducatorName" ValidationGroup="validation"/>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position">
                            <EditItemTemplate>
                                <asp:DropDownList ID="cboPosition" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Lead Teacher">Lead Teacher</asp:ListItem>
                                    <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
                                    <asp:ListItem Value="Assistant Teacher">Assistant Teacher</asp:ListItem>
						            <asp:ListItem Value="FCC Provider">FCC Provider</asp:ListItem>
						            <asp:ListItem Value="FCC Assistant">FCC Assistant</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList><br />
                                Please enter PQR number<br />
                                <asp:TextBox ID="txtPQRNumber" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPQRNumber" ErrorMessage="Please enter PQR number" ValidationGroup="validTeacher"  Display="Dynamic"/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPosition" runat="server"></asp:Label><br />
                                <asp:Label ID="lblPQRNumber" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cboPosition" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Lead Teacher">Lead Teacher</asp:ListItem>
                                    <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
                                    <asp:ListItem Value="Assistant Teacher">Assistant Teacher</asp:ListItem>
						            <asp:ListItem Value="FCC Provider">FCC Provider</asp:ListItem>
						            <asp:ListItem Value="FCC Assistant">FCC Assistant</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList><br />
                                Please enter PQR number<br />
                                <asp:TextBox ID="txtPQRNumber" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPQRNumber" ErrorMessage="Please enter PQR number" ValidationGroup="validTeacher"  Display="Dynamic"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cboPosition" ErrorMessage="Please choose one of the options" ValidationGroup="validTeacher"  Display="Dynamic"/>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highest Education Level">
                            <EditItemTemplate>
                                <asp:DropDownList ID="cboEducationLevel" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="High School Diploma/GED">High School Diploma/GED</asp:ListItem>
                                    <asp:ListItem Value="Child Development Associate (CDA) Credential">Child Development Associate (CDA) Credential</asp:ListItem>
                                    <asp:ListItem Value="Associate's Degree">Associate's Degree</asp:ListItem>
                                    <asp:ListItem Value="Bachelor of Arts">Bachelor of Arts</asp:ListItem>
                                    <asp:ListItem Value="Master’s Degree">Master’s Degree</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                                <%--if other, please specify<br />
                                <asp:TextBox ID="txtOtherEducationLevel" runat="server"></asp:TextBox>--%>
                                <br /><%--Major/Program of Study:--%>
                                <asp:TextBox ID="txtMajorProgramStudy" runat="server" Width="300px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEducationLevel" runat="server"></asp:Label><br />
                                &nbsp;&nbsp;<%--Major/Program of Study:--%>&nbsp;<asp:Label ID="lblMajorProgramStudy" runat="server"></asp:Label>
                            </ItemTemplate>                             
                            <FooterTemplate>
                                <asp:DropDownList ID="cboEducationLevel" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="High School Diploma/GED">High School Diploma/GED</asp:ListItem>
                                    <asp:ListItem Value="Child Development Associate (CDA) Credential">Child Development Associate (CDA) Credential</asp:ListItem>
                                    <asp:ListItem Value="Associate's Degree">Associate's Degree</asp:ListItem>
                                    <asp:ListItem Value="Bachelor of Arts">Bachelor of Arts</asp:ListItem>
                                    <asp:ListItem Value="Master’s Degree">Master’s Degree</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList><br />
                                <%--if other, please specify<br />
                                <asp:TextBox ID="txtOtherEducationLevel" runat="server"></asp:TextBox><br />--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cboEducationLevel" ErrorMessage="Please choose one of the options" ValidationGroup="validTeacher"  Display="Dynamic"/>
                                <br />Major/Program of Study:
                                <asp:TextBox ID="txtMajorProgramStudy" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtMajorProgramStudy" Display="Dynamic" ValidationGroup="validTeacher"
                                    ErrorMessage="Please enter a major/program of study"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="Major/Program of Study">
                            <EditItemTemplate>                                        
                                <asp:TextBox ID="txtMajorProgramStudy" runat="server" Width="300px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMajorProgramStudy" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate> 
                                <asp:TextBox ID="txtMajorProgramStudy" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtMajorProgramStudy" Display="Dynamic" ValidationGroup="validation"
                                    ErrorMessage="Please enter a major/program of study"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Annual Salary">
                            <EditItemTemplate>
                                <asp:DropDownList ID="cboAnnualSalary" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="0-9999">0-9999</asp:ListItem>
                                    <asp:ListItem Value="10000-19999">10000-19999</asp:ListItem>
                                    <asp:ListItem Value="20000-29999">20000-29999</asp:ListItem>
                                    <asp:ListItem Value="30000-39999">30000-39999</asp:ListItem>
                                    <asp:ListItem Value="40000-49999">40000-49999</asp:ListItem>
                                    <asp:ListItem Value="50000-59999">50000-59999</asp:ListItem>
                                    <asp:ListItem Value="60000-69999">60000-69999</asp:ListItem>
                                    <asp:ListItem Value="70000-79999">70000-79999</asp:ListItem>
                                    <asp:ListItem Value="80000-89999">80000-89999</asp:ListItem>
                                    <asp:ListItem Value="90000-100000">90000-100000</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator98" runat="server" ControlToValidate="cboAnnualSalary" ErrorMessage="Please choose one of the options" ValidationGroup="validTeacher"  Display="Dynamic"/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAnnualSalary" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cboAnnualSalary" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="0-9999">0-9999</asp:ListItem>
                                    <asp:ListItem Value="10000-19999">10000-19999</asp:ListItem>
                                    <asp:ListItem Value="20000-29999">20000-29999</asp:ListItem>
                                    <asp:ListItem Value="30000-39999">30000-39999</asp:ListItem>
                                    <asp:ListItem Value="40000-49999">40000-49999</asp:ListItem>
                                    <asp:ListItem Value="50000-59999">50000-59999</asp:ListItem>
                                    <asp:ListItem Value="60000-69999">60000-69999</asp:ListItem>
                                    <asp:ListItem Value="70000-79999">70000-79999</asp:ListItem>
                                    <asp:ListItem Value="80000-89999">80000-89999</asp:ListItem>
                                    <asp:ListItem Value="90000-100000">90000-100000</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator98" runat="server" ControlToValidate="cboAnnualSalary" ErrorMessage="Please choose one of the options" ValidationGroup="validTeacher"  Display="Dynamic"/>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update" CausesValidation="false" />
                                <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" CausesValidation="false" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit"  CausesValidation="false"  />
                                <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete" CausesValidation="false"  />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New Educator" ValidationGroup="validTeacher" CausesValidation="true" />
                            </FooterTemplate>
                            </asp:TemplateField>

                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Button ID="btnAddNewEducator" runat="server" Text="Add New Educators" CommandName="New" ValidationGroup="validTeacher" CausesValidation="true" />

                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            </td>
        </tr>
        <tr><td colspan="2">
                    
            <br /></td></tr>
                                
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
                            <td align="left">
                                <%--<asp:Button ID="btnCancelClass" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancelClass_Click" />&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <asp:Button ID="btnBackToClass" runat="server" Text="Go Back to Classroom Summary" OnClick="btnBackToClass_Click"  />
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

<%--    </td>
    </tr>
    </table>

    
    </td>
    </tr>
    </table>--%>

    <table id="tblHome" cellpadding="0" cellspacing="0" border="0" runat="server" width="100%" style="height:100px">
            <tr>
                <td align="left">
                    <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Program Summary" Visible="true"
                            OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                            Width="200px" />
                </td>
            </tr>
        </table>

</asp:Content>
