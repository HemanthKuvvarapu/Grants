<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Languages.aspx.cs" Inherits="Languages" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="JavaScript" type="text/javascript">
    function CheckAllFunction(checkAllBox, txtOther) {
        var txtOther1 = document.getElementById(txtOther);
        
        for (i = 0; i < document.forms[0].length; i++) {
            e = document.forms[0].elements[i];

            //check the town box
            if (e.type == 'checkbox' && e.name.indexOf('chklLanguages') != -1)
                e.checked = checkAllBox.checked;

            //if other is selected then display the textbox
            if (checkAllBox.checked) {
                alert(txtOther1.style.visibility);
                txtOther1.style.visibility = 'visible';
            }
            else {
                alert(txtOther1.style.display);
                txtOther1.style.visibility = 'hidden';
            }
                
        }
        
    }
    </script>

    <style type="text/css">
        .style9
        {
            height: 174px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td>
                <table id="tblSuccess" cellpadding="0" cellspacing="0" border="0" class="styleSaved"
                    style="width: 100%; margin-bottom: 5px" runat="server" visible="false">
                    <tr>
                        <td align="center" style="height: 50px; padding-top: 5px">
                            The information has been SAVED successfully.<br />
                            <br />
                            <asp:LinkButton ID="lnkBackToHome" runat="server" Text="Go back to Home" Visible="true"
                                OnClick="btnBackToHome_Click" CausesValidation="false" CssClass="buttonClass2"
                                Width="200px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkNextPart" runat="server" Text="Go to Lead Agency Budget (Part 4)"
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
                        <td>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                ControlToValidate="txtOther" Display="Dynamic" 
                                ErrorMessage="Please select at least one language." 
                                onservervalidate="CustomValidator2_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
    </table>
    <asp:Literal ID="lblInstruction" runat="server"></asp:Literal>
    <table id="tblRegionTowns" runat="server" style="width: 100%; background-color: #ededed"
        border="0">
        <tr>
            <td>
                <asp:CheckBox ID="chkSelectAll" runat="server" Text="Select All" AutoPostBack="true"
                    OnCheckedChanged="chkSelectAll_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBoxList ID="chklLanguages" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="5" AutoPostBack="true" OnSelectedIndexChanged="chklLanguages_SelectedIndexChanged">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtOther" runat="server" Text="" Width="300px" CssClass="custom"
                    TextMode="MultiLine"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtOther" Display="Dynamic" 
                    ErrorMessage="Please enter the other language(s) in the text box provided." 
                    onservervalidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
        <tr>
            <td align="center" class="style9">
                <asp:LinkButton ID="btnSavePrint" runat="server" Text="Save and Print" onclick="btnSavePrint_Click" CausesValidation="True" CssClass="buttonClass" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Save" OnClick="btnCancel_Click"
                    CssClass="buttonClass" CausesValidation="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btnContinue" runat="server" Text="Save Information" OnClick="btnSave_Click"
                    CssClass="buttonClass" />
            </td>
        </tr>
    </table>
</asp:Content>
