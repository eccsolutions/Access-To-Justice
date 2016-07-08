<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<p class="bold"><%=SignUpStep1.WeWillAsk %></p>
<ul class="padded-list-sm">
    <li><%=SignUpStep1.WeWillAskItem1 %></li>
    <li><%=SignUpStep1.WeWillAskItem2.Replace("{{MinimumAge}}",ConfigSettings.MinimumAgeRequirement.ToString()) %></li> 
    <li><%=SignUpStep1.WeWillAskItem3 %></li>
    <li><%=SignUpStep1.WeWillAskItem4 %></li>
    <li><%=SignUpStep1.WeWillAskItem5 %></li>
</ul>

<p><%=SignUpStep1.TruthStatement %></p>
    
<p><b><%=SignUpStep1.PleaseRemember %></b></p>

<ul class="padded-list-sm">
    <li><%=SignUpStep1.PleaseRememberItem1 %></li>
    <li><%=SignUpStep1.PleaseRememberItem2 %></li>
    <li><%=SignUpStep1.PleaseRememberItem3 %></li>
</ul>