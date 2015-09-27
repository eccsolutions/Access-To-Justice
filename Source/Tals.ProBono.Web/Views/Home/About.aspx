<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    
    <p>The <%=ConfigSettings.SiteName %> allows eligible users to post a legal question to a private messaging system. The questions are answered by volunteer attorneys. <%=ConfigSettings.SiteName %> users can check the system for answers at any time. Only the website administrator and the volunteer attorney answering a user&#39;s question can see the user&#39;s name. All information posted is held in strict confidence.</p>
    
    <p>The <%=ConfigSettings.SiteName %> is administered by the Arizona Foundation for Legal Services &amp; Education, under the Legal LEARN Contact Center, a joint program with the State Bar of Arizona, in partnership with the Volunteer Lawyers Programs of Community Legal Services, Southern Arizona Legal Aid and DNA People&#39;s Legal Services. Special thanks to the Supreme Court of Arizona, the Arizona Department of Veterans Services, Baker, Donelson, Bearman, Caldwell & Berkowitz, Tennessee Alliance for Legal Services, DNA People&#39;s Legal Services, Southern Arizona Legal Aid, Community Legal Services and our other Arizona partner organizations and stakeholders for their critical support of this project. These entities share the goal of increasing access to legal services to those who cannot afford it.</p>

    <p style="text-align: center;"><strong>All information posted is held in strict confidence.</strong></p>
</asp:Content>
