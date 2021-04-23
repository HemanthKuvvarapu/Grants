<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminView.aspx.cs" Inherits="AdminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div runat="server" id="StartLinkDiv" visible="true">
<legend>FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.GrantName.ToString()%> Online Grant View</legend>
    <a href="http://eec-app-bos-v01/GrantsAdminFY2016/Default.aspx" target="">&lt;&lt; Back to Default Page</a><br /><br />
    <p style="border-style: double; border-width: 3px; background-color: #CCCCFF">
    <a href="AdminViewPassword.aspx" target="">View FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.FundCode.ToString()%> Online Grant UserName/Password look up</a>
            <br />
      
        <br />
   <a href="AdminViewPDF.aspx" target="">View FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.FundCode.ToString()%> Online Grant Summary Information PDF</a> 
        
    <br />
   <br />
   <a href="AdminViewContent.aspx" target="">FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.FundCode.ToString()%> Online Grants Admin View</a> 
        <br/>
        <br />
   <a href="AdminGrantApplicants.aspx" target="">Update/View FY <%=AppInfo.FiscalYear.ToString()%> <%=AppInfo.FundCode.ToString()%> Online Grant Profiles Admin View</a> 
        
    <br />   
            
            </p>
        <p>
            
           <br /> 
            </p>
        
    
</div>
</asp:Content>

