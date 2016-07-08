<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div>
    <%: Html.ActionLink("English", "ChangeCulture", "Account", new { lang = "en", returnUrl = this.Request.RawUrl}, null) %>
    | <%: Html.ActionLink("Español", "ChangeCulture", "Account", new { lang = "es", returnUrl = this.Request.RawUrl }, null)%>
</div>