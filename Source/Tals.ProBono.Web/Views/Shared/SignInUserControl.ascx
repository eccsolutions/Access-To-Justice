<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%: UserModel.Current.UserName %></b>!
        [ <%: Html.ActionLink("Change Password", "ChangePassword", "Account") %> ]
<% if (UserModel.Current.IsInRole(UserRoles.Administrators))
   {%>
        [ <%:Html.ActionLink("Alabama Legal Answers Administration", "List", "Admin") %> ]
<%} %>
<% if (UserModel.Current.IsInRole(UserRoles.Attorney)) { %>
        [ <%:Html.ActionLink("Sign Out", "LogHours", "Attorney")%> ]
<% } else { %>
        [ <%: Html.ActionLink("Sign Out", "SignOut", "Account")%> ]
<% } } else { %> 
        [ <%: Html.ActionLink("Sign In", "SignIn", "Account") %> ]<br /><br />
        <%: Html.ActionLink("Lawyers Sign Up!", "AttorneySignUp", "Account", null, new {@class = "ImageLink ImageLinkHeader"}) %>
<% } %>
