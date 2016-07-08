<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="System.Threading" %>
<div>
    <%if (Thread.CurrentThread.CurrentCulture.Name.StartsWith("en")){%>
        <strong>English</strong> 
        | <%: Html.ActionLink("Español", "ChangeCulture", "Account", new { lang = "es", returnUrl = this.Request.RawUrl }, null)%>               
    <%}else if(Thread.CurrentThread.CurrentCulture.Name.StartsWith("es")){%>
        <%: Html.ActionLink("English", "ChangeCulture", "Account", new { lang = "en", returnUrl = this.Request.RawUrl}, null) %>
        | <strong>Español</strong>
    <%}else{ %>
        <%: Html.ActionLink("English", "ChangeCulture", "Account", new { lang = "en", returnUrl = this.Request.RawUrl}, null) %>
        | <%: Html.ActionLink("Español", "ChangeCulture", "Account", new { lang = "es", returnUrl = this.Request.RawUrl }, null)%>
    <%} %>    

</div>