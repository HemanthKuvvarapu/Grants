<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminDownloadfile.aspx.cs" Inherits="AdminDownloadfile" EnableEventValidation="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
  <div runat=server id=divData visible=true>
  <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" OnClick="btnExportToExcel_Click" />
      <a href="AdminView.aspx" target="">&lt;&lt; Back to Home Page</a><br />
 <br />
    <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"

    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"

    AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
          BorderStyle="None" BorderWidth="1px" CellPadding="3" 
          GridLines="Horizontal">

<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"></RowStyle>

    <Columns>
<asp:BoundField DataField="GrantApplicantID" HeaderText="GrantApplicantID" 
            ReadOnly="True" SortExpression="GrantApplicantID" />
  
   <asp:BoundField DataField="AgencyName" HeaderText="Lead Agency Name" 
            ReadOnly="True" SortExpression="AgencyName" />         
            
                  
        <asp:BoundField DataField="FileName" HeaderText="File Name"/>

        <asp:TemplateField ItemStyle-HorizontalAlign = "Center">

            <ItemTemplate>

                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"

                    CommandArgument='<%# Eval("FileID") %>'></asp:LinkButton>

            </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>

        </asp:TemplateField>

        

    </Columns>

        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

<HeaderStyle BackColor="#4A3C8C" ForeColor="#F7F7F7" Font-Bold="True"></HeaderStyle>

<AlternatingRowStyle BackColor="#F7F7F7"></AlternatingRowStyle>

</asp:GridView>
</div>
</asp:Content>

