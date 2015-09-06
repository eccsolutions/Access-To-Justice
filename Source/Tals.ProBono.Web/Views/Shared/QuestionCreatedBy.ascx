<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DetailsCreatedByModel>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Enums" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<p><strong>Created By:</strong> <%: Html.ActionLink(Model.UserProfile.FullName +" ("+Model.UserProfile.UserName+")","Profile","User",new {Model.UserProfile.UserName},null) %></p>
<% if (Roles.IsUserInRole(UserRoles.Administrators) || Roles.IsUserInRole(UserRoles.Attorney))
   { %>
    <p><strong>Date of Birth: </strong>
        <%:Model.UserProfile.DateOfBirth == null ? "n/a" : Model.UserProfile.DateOfBirth.Value.ToString("MM/dd/yyyy")%>
    </p>
    <p><strong>Eligibility: </strong>
    <% if (Model.PovertyLevel == PovertyLevels.ModestMeans)
       { %>
        Modest Means 
    <% }
       else if (Model.PovertyLevel == PovertyLevels.LegalAid)
       { %>
        Legal Aid <i class="fa fa-book"></i>
    <% } else { %>
        n/a
    <% } %>
    </p>
<% } %>

