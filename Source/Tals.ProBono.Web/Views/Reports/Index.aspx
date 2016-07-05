<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Reports
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reports</h2>

    <div class="report-info-container"><span><%: Html.ActionLink("Attorney Activity Summary Report", "AttorneyActivitySummary") %></span>
    <br/>Questions answered per attorney and hours logged per attorney during a particular time frame.  Includes the total count of questions answered and hours logged during this time frame.
    </div>

    <div class="report-info-container"><span><%: Html.ActionLink("Questions Answered By Category", "QuestionsByCategory") %></span>
    <br/>Questions answered per category during a particular time frame.  Includes the total number of questions answered as well as how many questions fall under the legal aid designation.
    </div>
</asp:Content>