<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="CenterbaseEntry.aspx.cs" Inherits="HeadStart_CenterbaseEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style1
        {
            height: 32px;
        }
        .auto-style2
        {
            height: 114px;
        }
        .auto-style3
        {
            color: #009933;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <span style="color:darkblue"><b>Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Center-Based</b></span>
        <br />
<table id=tblAddEditProgram runat=server width=100% border=0 style="background-color:#ebebeb" >
                <tr style="background-color:#6d8da7; color:#ffffff"> 
                    <th colspan=2 align=left style="background-color: #339966" class="auto-style1"><asp:Label ID=lblAddEditHeader runat=server Text="Add/Edit Program Info"></asp:Label></th>
                </tr>
                <tr>
                    <td class="style13">Program Number</td>
                    <td class="style15">
                        <asp:TextBox ID="txtHSProgramNumber" runat="server" Width="117px" 
                            Height="27px" CssClass="style16"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18"
                                    runat="server" TargetControlID="txtHSProgramNumber" FilterType="Numbers">
                                </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator1"  
             runat="server"  
             ControlToValidate="txtHSProgramNumber"  
             ErrorMessage='Please enter a Program Number'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                    </td>
                 </tr>
                 <tr>
                    <td class="style13">Program Name</td>
                    <td class="style15">
                        <asp:TextBox ID="txtHeadStartFacilityName" runat="server" Width="176px" 
                            Height="38px" CssClass="style16"></asp:TextBox>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator9"  
             runat="server"  
             ControlToValidate="txtHeadStartFacilityName"  
             ErrorMessage='Please enter a Program Name'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                        
                    </td>
                 </tr>
                 <tr>
                    <td class="style13">Address</td>
                    <td class="style15">
                        <asp:TextBox ID="txtHSCenterbasedAddress" runat="server" 
                            TextMode="MultiLine" Height="67px" CssClass="style16" Width="407px"></asp:TextBox>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator27"  
             runat="server"  
             ControlToValidate="txtHSCenterbasedAddress"  
             ErrorMessage='Please enter an Address'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                       
                     </td>
                </tr>
                <tr>
                    <td class="style13">City/Town</td>
                    <td class="style15">
                        <asp:TextBox ID="txtCity" runat="server" Height="37px" Width="169px" 
                            CssClass="style16"></asp:TextBox>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator28"  
             runat="server"  
             ControlToValidate="txtCity"  
             ErrorMessage='Please enter a City'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                        
                    </td>
                </tr>
                <tr>
                    <td class="style13">Zip Code <span class="style13">(*5 digit zip Example: 00000)</span></td>
                    <td class="style7">
                         
                        <asp:TextBox ID="txtZipCode" runat="server" Width="71px" 
                            Height="27px" CssClass="style16"></asp:TextBox>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator29"  
             runat="server"  
             ControlToValidate="txtZipCode"  
             ErrorMessage='Please enter a Zip Code'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium">
             </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ControlToValidate="txtZipCode" ErrorMessage="Zip code input not correct use 5 digits"
            ValidationExpression="^\d{5}$|^\d{5}-\d{4}$"></asp:RegularExpressionValidator>
                        
                        
                        
                    </td>
                </tr>
                <tr>
                    <td class="style13">Number of EEC Licensed Capacity</td>
                    <td class="style15">
                        <asp:TextBox ID="txtEECLicensedCapacity" runat="server" 
                            Width="58px" CssClass="style16"></asp:TextBox>
                       <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                    runat="server" TargetControlID="txtEECLicensedCapacity" FilterType="Numbers">
                                </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator30"  
             runat="server"  
             ControlToValidate="txtEECLicensedCapacity"  
             ErrorMessage='Please enter Number of EEC Licensed Capacity'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                        
                    </td>
                </tr>
                <tr>
                    <td class="style13">Total number of classrooms</td>
                    <td class="style15">
                        <asp:TextBox ID="txtTotalNumberClassrooms" runat="server" 
                            Width="78px" CssClass="style16"></asp:TextBox>
                            <ajaxControlToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5"
                                    runat="server" TargetControlID="txtTotalNumberClassrooms" FilterType="Numbers">
                                </ajaxControlToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator35"  
             runat="server"  
             ControlToValidate="txtTotalNumberClassrooms"  
             ErrorMessage='Please enter Total number of classrooms'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"  
             ></asp:RequiredFieldValidator> 
                        
                    </td>
                    </tr>
                    <tr>
                        <td class="style13">NAEYC Accredited?</td>
                        <td class="style15" align="left">
                            <asp:RadioButtonList ID="ddlNAEYCAccredited" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                onselectedindexchanged="ddlNAEYCAccredited_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator235" runat="server" 
                                ControlToValidate="ddlNAEYCAccredited" Display="Dynamic" 
                                ErrorMessage="Please select one of the options."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="trAccr" runat="server" visible="false">
                        <td style="background-color: beige;" colspan="2">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style13" colspan="4">Please enter the accreditation details.<asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="ddlAccreditation" Display="Dynamic" ErrorMessage="Please fill in the accreditation details." OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <asp:DropDownList ID="ddlAccreditation" runat="server" Width="150px">
                                            <asp:ListItem Value="0" Text="---------"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="NAEYC"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="NEASC"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationNumber" runat="server" Text="" MaxLength="20"></asp:TextBox><br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationEarnDate" runat="server" Width="100px"></asp:TextBox>
                                        <asp:ImageButton ID="btnCalendarEarnDate" runat="server" ImageUrl="~/images/CalendarImage.png" CausesValidation="false" /><br />
                                        <ajaxControlToolkit:MaskedEditExtender runat="server" ID="MaskedEditExtender1" TargetControlID="txtAccreditationEarnDate"
                                            Mask="99/99/9999" MaskType="Date" PromptCharacter="_" ClearMaskOnLostFocus="true">
                                        </ajaxControlToolkit:MaskedEditExtender>
                                        <ajaxControlToolkit:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtAccreditationEarnDate"
                                            PopupButtonID="btnCalendarEarnDate">
                                         </ajaxControlToolkit:CalendarExtender>
                                        <ajaxControlToolkit:TextBoxWatermarkExtender runat="server" ID="TextBoxWatermarkExtender1"
                                            TargetControlID="txtAccreditationEarnDate" WatermarkText="mm/dd/yyyy">
                                        </ajaxControlToolkit:TextBoxWatermarkExtender>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccreditationExpDate" runat="server" Width="100px"></asp:TextBox>
                                        <asp:ImageButton ID="btnCalendarExpDate" runat="server" ImageUrl="~/images/CalendarImage.png" CausesValidation="false" /><br />
                                        <ajaxControlToolkit:MaskedEditExtender runat="server" ID="MaskedEditExtender2" TargetControlID="txtAccreditationExpDate"
                                            Mask="99/99/9999" MaskType="Date" PromptCharacter="_" ClearMaskOnLostFocus="true" >
                                        </ajaxControlToolkit:MaskedEditExtender>
                                        <ajaxControlToolkit:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtAccreditationExpDate"
                                            PopupButtonID="btnCalendarExpDate" >
                                        </ajaxControlToolkit:CalendarExtender>
                                        <ajaxControlToolkit:TextBoxWatermarkExtender runat="server" ID="TextBoxWatermarkExtender2"
                                            TargetControlID="txtAccreditationExpDate" WatermarkText="mm/dd/yyyy">
                                        </ajaxControlToolkit:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>(Type)
                                    </td>
                                    <td>(No.)
                                    </td>
                                    <td>(Earned Date)
                                    </td>
                                    <td>(Expiration Date)
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    <td class="style13">Comments</td>
                    <td class="style15">
                        <asp:TextBox CssClass=commentbox ID="txtCenterBasescomments" runat="server" 
                            TextMode="MultiLine" Height="75px" Width="407px" 
                            style="font-family: Verdana"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </td>
                </tr>
                <tr>
                <td colspan=2 align=center class="auto-style1"><asp:Button ID="btnSaveHSCenterBased" runat="server" 
                        Text="Save Program" onclick="btnSaveHSCenterBased_Click" />
                     &nbsp;<input type="button" onclick="location.href = 'CenterBaseHome.aspx'"  value="Cancel" />
                    &nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" onclick="btnReset_Click" />
                </td>
                </tr>
                <tr id="trHasHSCenterBased" visible="false">
                <td colspan=2 align=center class="style6">
                    <span class="auto-style3">The Center Based Program has been SAVED successfully.</span><br />
                            <br />
                    <input type="button" onclick="location.href = 'CenterBaseHome.aspx'"  value="Go back to Center Based Program list" />
                   
                    &nbsp;&nbsp;
                </td>
                </tr>
                <tr>
                    <td colspan=2 class="auto-style2">
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" BackColor="#EFEFEF" />  

                    </td>
                    
                </tr>
    
    
            </table>

</div>

    <ajaxControlToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
 </ajaxControlToolkit:ToolkitScriptManager>
</asp:Content>

