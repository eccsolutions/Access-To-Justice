<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountyList.aspx.cs" Inherits="Tals.ProBono.Web.Reports.CountyList" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <a href="/Reporting">Back to Reports</a>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" Width="100%">
            <ServerReport DisplayName="Counties" ReportPath="/CountyList" 
                ReportServerUrl="http://mlsc-sqlweb/Reports_MLSC" />
        </rsweb:ReportViewer>
    
    </div>
    </form>
</body>
</html>
