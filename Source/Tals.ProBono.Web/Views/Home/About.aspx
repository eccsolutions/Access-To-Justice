<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About <%=ConfigSettings.SiteName %></h2>
    
    <p><%=ConfigSettings.SiteName %> allows eligible users to post a legal question to a private online messaging system. The questions are answered by volunteer attorneys. <%=ConfigSettings.SiteName %> users can check the system for answers at any time. Only the website administrator and the volunteer attorney answering a <%=ConfigSettings.SiteName %> client&#39;s question can see the user&#39;s name. All information posted is held in strict confidence.</p>
    
    <p><%=ConfigSettings.SiteName %> is administered by the Tacoma-Pierce County Bar Association Volunteer Legal Services Program in partnership with the Washington State Alliance for Equal Justice, including the Access to Justice Board, ATJ Delivery Systems Committee, Washington State Pro Bono Council, Washington Web Lawyer Advisory Committee, Legal Foundation of Washington and TPCBA VLS Committee.  Special thanks to Baker, Donelson, Bearman, Caldwell &amp; Berkowitz and Online Tennessee Justice, the Tennessee Alliance for Legal Services, Geoff Revelle, and our many Washington State partner organizations and stakeholders for their critical support of this project. These entities share the goal of increasing access to civil legal services for those who cannot afford it.</p>

    <p><center><b>All information posted is held in strict confidence.</b></center></p>
</asp:Content>
