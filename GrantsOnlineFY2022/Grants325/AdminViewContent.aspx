<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminViewContent.aspx.cs" enableEventValidation ="false" Inherits="AdminViewContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <strong>FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.FundCode.ToString()%> Online Grant Admin View of all the data entered</strong>
    <a href="AdminView.aspx" target="">&lt;&lt; Back to Home Page</a><br /><br />
    <p style="border-style: double; border-width: 3px; background-color: #CCCCFF">
   <%-- <asp:LinkButton ID="lbtnShowAll" runat="server" 
            Text="Show All FY2015 Grant Data " onclick="lbtnShowAll_Click"></asp:LinkButton>
        <br />
        <br />--%><asp:LinkButton ID="lbtnShowPart1Data" runat="server" 
            Text="Show Contact Information (Part 1) Data " onclick="lbtnShowPart1Data_Click"></asp:LinkButton>
        <br />
        <br />
    <asp:LinkButton ID="lbtnShowPart2Data" runat="server" 
            Text="Show Communities Served (Part 2) Data " onclick="lbtnShowPart2Data_Click"></asp:LinkButton>
        <br />
        <br />
    <asp:LinkButton ID="lbtnShowPart3Data" runat="server" 
            Text="Show Languages Served (Part 3) Data  " onclick="lbtnShowPart3Data_Click"></asp:LinkButton>
        <br />
        <br />
    <asp:LinkButton ID="lbtnShowPart4Data" runat="server" 
            Text="Show Lead Agency Budget (Part 4) Data " onclick="lbtnShowPart4Data_Click"></asp:LinkButton>
        <br />
        <br />
    <asp:LinkButton ID="lbtnShowPart5Data" runat="server" 
            Text="Show Subcontractor Budget (Part 5) Data" onclick="lbtnShowPart5Data_Click"></asp:LinkButton>
        <br />
        <br />
    <asp:LinkButton ID="lbtnShowPart6aData" runat="server" 
            Text="Show Budget Summary (Part 6) Data" onclick="lbtnShowPart6aData_Click"></asp:LinkButton>
        <br />
        <br />
      <% if (AppInfo.DisplayPart6b)
         {
      %>
      <asp:LinkButton ID="lbtnShowPart6bData" runat="server" 
            Text="Show FY 2016 Budget Summary (Part 6b) Data" 
            onclick="lbtnShowPart6bData_Click" Enabled="true"></asp:LinkButton>
        <br />
        <br />
      <% } %>
      <% if (AppInfo.DisplayPart6c)
         {
      %>
      <asp:LinkButton ID="lbtnShowPart6cData" runat="server" 
            Text="Show FY 2017 Budget Summary (Part 6c) Data" 
            onclick="lbtnShowPart6cData_Click" Enabled="true"></asp:LinkButton>
        <br />
        <br />
     <% } %>
        <asp:LinkButton ID="lbtnShowPart7Data" runat="server" 
            Text="Show Narrative Questions (Part 7) Data" onclick="lbtnShowPart7Data_Click"></asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="lbtnShowPart8Data" runat="server" 
            Text="Show Projected Deliverables (Part 8) Data" onclick="lbtnShowPart8Data_Click"></asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="lbtnShowPart9Data" runat="server" 
            Text="Show Required Grant Forms (Part 9) to download Forms files" onclick="lbtnShowPart9Data_Click"></asp:LinkButton>
        <br />
        <br />
       <asp:LinkButton ID="lbtnShowPart10Data" runat="server" 
            Text="Show Checklist (Part 10) Data " onclick="lbtnShowPart10Data_Click"></asp:LinkButton>
        <br />
        <br />  
        <asp:LinkButton ID="lbtnShowLEASUBrprt" runat="server" 
            Text="Budget Summary Report (Lead/Subs)" onclick="lbtnShowLEASUBrprt_Click" Visible="false"></asp:LinkButton>
        <br /> 
        <br />       
    </p>
    
    <div runat="server" id=divData visible=false>
    <asp:Label ID="lblDataSummary" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" OnClick="btnExportToExcel_Click" />
    <br />
    <br />
    <asp:GridView ID="grdDataSummary" runat="server" 
            AlternatingRowStyle-CssClass="AlternateColor2" CellPadding="3" GridLines="Horizontal" 
            style="border-style: double; border-width: 3px" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
<AlternatingRowStyle CssClass="AlternateColor2" BackColor="#F7F7F7"></AlternatingRowStyle>
    </asp:GridView>
    </div>

</asp:Content>

