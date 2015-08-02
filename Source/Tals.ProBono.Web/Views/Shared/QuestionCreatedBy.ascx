<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Domain.Entities.Question>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Enums" %>
<p><strong>Created By:</strong> <%: Html.DisplayUser(Model.CreatedBy) %></p>
<p><strong>Eligibility: </strong>
<% if (Model.ClientPovertyLevel == PovertyLevels.ModestMeans){ %>
    Modest Means 
<% } else if(Model.ClientPovertyLevel == PovertyLevels.LegalAid) {%>
    Legal Aid <i class="fa fa-book"></i>
<%} else {%>
    n/a
<%} %>
</p>

