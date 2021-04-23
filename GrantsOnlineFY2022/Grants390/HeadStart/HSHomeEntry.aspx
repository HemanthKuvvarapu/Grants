<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.master" AutoEventWireup="true" CodeFile="HSHomeEntry.aspx.cs" Inherits="HeadStart_HSHomeEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
        <span style="color:darkblue"><b>Head Start and Early Head Start Site Survey FY <%=AppInfo.FiscalYear%>: Home-Based</b></span>
        <br />
        <table id=tblAddEditProgram runat=server width=100% border=0 style="background-color:#ebebeb" >
                <tr style="background-color:#6d8da7; color:#ffffff"> 
                    <th colspan=2 align=left style="background-color: #3399FF"><asp:Label ID=lblAddEditHeader runat=server Text="Add/Edit Program Info"></asp:Label></th>
                </tr>
                 <tr>
                    <td class="style13">Program Name</td>
                    <td class="style12">
                        <asp:TextBox ID="txtProgramName" runat="server" Width="117px" 
                            Height="27px" CssClass="style16"></asp:TextBox>
                        
                         <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator9"  
             runat="server"  
             ControlToValidate="txtProgramName"  
             ErrorMessage='Please enter Program Name'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                    </td>
                 </tr>
                 <tr>
                    <td class="style13">Address</td>
                    <td class="style12">
                        <asp:TextBox ID="txtHSHomeAddress" runat="server" Width="300px" 
                            TextMode="MultiLine" CssClass="style16"></asp:TextBox>
                        <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator1"  
             runat="server"  
             ControlToValidate="txtHSHomeAddress"  
             ErrorMessage='Please enter Address '  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                <tr>
                    <td class="style13">Communities Served</td>
                    <td class="style12">
                        <asp:TextBox ID="txtCommunitiesServed" runat="server" 
                            Width="295px" Height="94px" TextMode="MultiLine" CssClass="style16"></asp:TextBox>
                       
                        
             <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator3"  
             runat="server"  
             ControlToValidate="txtCommunitiesServed"  
             ErrorMessage='Please enter Communities Served'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td class="style13">Zip Code <span class="style13">(*5 digit zip Example: 00000)</span></td>
                    <td class="style7">
                        <asp:TextBox ID="txtZipCode" runat="server" Width="102px" 
                            Height="27px" CssClass="style16"></asp:TextBox>
             <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator10"  
             runat="server"  
             ControlToValidate="txtZipCode"  
             ErrorMessage='Please enter Zip Code'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ControlToValidate="txtZipCode" ErrorMessage="Zip code input not correct use 5 digits"
            ValidationExpression="^\d{5}$|^\d{5}-\d{4}$"></asp:RegularExpressionValidator>   
                        <br />
                       
                         
                    </td>
                </tr>
                <tr style="display:none">
                    <td class="style13">Staff Degree Level</td>
                    <td class="style13">
                        <asp:DropDownList ID="ddlStaffDegreeLevel" runat="server" CssClass="style16">
                        <asp:ListItem Value="-1" Text="-Select Degree Level-"></asp:ListItem>
                            
                            <asp:ListItem>High School</asp:ListItem>
                            <asp:ListItem>Some College</asp:ListItem>
                            <asp:ListItem>AA</asp:ListItem>
                            <asp:ListItem>BA</asp:ListItem>
                            <asp:ListItem>Advance</asp:ListItem>
                            
                        </asp:DropDownList>
                       
                         <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator34"  
             runat="server"  
             ControlToValidate="ddlStaffDegreeLevel"  
             ErrorMessage='Please enter Staff Degree Level '  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"
             InitialValue="-1"                
             ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">Funded Capacity Head Start</td>
                    <td class="style12">
                        <asp:TextBox ID="txtFundedCapacityHeadstart" runat="server" 
                            Width="111px" CssClass="style16"></asp:TextBox>
                        <ajaxcontroltoolkit:filteredtextboxextender ID="FilteredTextBoxExtender1"
                                    runat="server" TargetControlID="txtFundedCapacityHeadstart" FilterType="Numbers">
                                </ajaxcontroltoolkit:filteredtextboxextender>    
                        
                         <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator12"  
             runat="server"  
             ControlToValidate="txtFundedCapacityHeadstart"  
             ErrorMessage='Please enter Funded Capacity Head Start'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13">Funded Capacity Early Head Start</td>
                    <td class="style12">
                        <asp:TextBox ID="txtFundedCapacityEarlyHeadStart" runat="server" 
                            Width="111px" CssClass="style16"></asp:TextBox>
                        <ajaxcontroltoolkit:filteredtextboxextender ID="FilteredTextBoxExtender2"
                                    runat="server" TargetControlID="txtFundedCapacityEarlyHeadStart" FilterType="Numbers">
                                </ajaxcontroltoolkit:filteredtextboxextender>    
                         
                         <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator13"  
             runat="server"  
             ControlToValidate="txtFundedCapacityEarlyHeadStart"  
             ErrorMessage='Please enter Funded Capacity Early Head Start'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>    
                    </td>
                </tr>
                    <tr style="display:none">
                    <td class="style13">Number of Dual Language Learners</td>
                    <td class="style12">
                        <asp:TextBox ID="txtNumberDualLanguageLearnersHome" runat="server" 
                            Width="111px" CssClass="style16"></asp:TextBox>
                        <ajaxcontroltoolkit:filteredtextboxextender ID="FilteredTextBoxExtender3"
                                    runat="server" TargetControlID="txtNumberDualLanguageLearnersHome" FilterType="Numbers">
                                </ajaxcontroltoolkit:filteredtextboxextender>    
                      
                         <asp:RequiredFieldValidator  
             ID="RequiredFieldValidator14"  
             runat="server"  
             ControlToValidate="txtNumberDualLanguageLearnersHome"  
             ErrorMessage='Please enter Number of Dual Language Learners'  
             EnableClientScript="true"  
             SetFocusOnError="true"  
             Text="*" Font-Size="Medium"></asp:RequiredFieldValidator>    
                        </td>
                </tr>
                    <tr>
                    <td class="style13">Comments</td>
                    <td class="style12">
                        <asp:TextBox ID="txtComments" runat="server" Height="110px" TextMode="MultiLine" 
                            Width="243px" CssClass="style16"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
                <tr><td colspan=2 align=center class="style11"><asp:Button ID="btnSaveHSHomeinfo" runat="server" 
                        Text="Save Program" onclick="btnSaveHSHomeinfo_Click" />  
                    &nbsp;<input type="button" onclick="location.href = 'HSHome.aspx'"  value="Cancel" />
                    &nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" onclick="btnReset_Click" />
                </td></tr>
                <tr>
                    <td colspan=2 class="style9"><asp:Label ID=lblAddEditMsg runat=server Text=""></asp:Label></td>
                </tr>
            <tr id="trHasHSHomeBased" visible="false">
                <td colspan=2 align=center class="style6">
                    <span class="auto-style3">The Home Based Program has been SAVED successfully.</span><br />
                            <br />
                    <input type="button" onclick="location.href = 'HSHome.aspx'"  value="Go back to Home Based Program list" />
                   
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
    <ajaxcontroltoolkit:toolkitscriptmanager ID="ToolkitScriptManager1" runat="server">
 </ajaxcontroltoolkit:toolkitscriptmanager>
</asp:Content>

