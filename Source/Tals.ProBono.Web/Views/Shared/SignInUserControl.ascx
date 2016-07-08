<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<%
    if (Request.IsAuthenticated) {
%>
        <%=Common.WelcomeUser.Replace("{{UserName}}","<b>"+ UserModel.Current.UserName+"</b>") %>
        [ <%: Html.ActionLink(SiteMaster.ChangePassword, "ChangePassword", "Account") %> ]
<% if (UserModel.Current.IsInRole(UserRoles.Administrators))
   {%>
        [ <%:Html.ActionLink("Administration", "List", "Admin") %> ]
<%} %>
<% if (UserModel.Current.IsInRole(UserRoles.Attorney)) { %>
        [ <%:Html.ActionLink("Sign Out", "LogHours", "Attorney")%> ]
<% } else { %>
        [ <%: Html.ActionLink(SiteMaster.SignOut, "SignOut", "Account")%> ]
<% } } else { %> 
        [ <%: Html.ActionLink(SiteMaster.SignIn, "SignIn", "Account") %> ]<br /><br />
        <%: Html.ActionLink("Lawyers Sign Up!", "AttorneySignUp", "Account", null, new {@class = "ImageLink"}) %>
<% } %>
