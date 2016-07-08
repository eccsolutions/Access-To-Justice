<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> – Free Legal Advice & Counsel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%=Index.WelcomeMessage.Replace("{{SiteName}}",ConfigSettings.SiteName)%></h2>
    
    <p><%=Index.Intro1.Replace("{{SiteName}}",ConfigSettings.SiteName)%></p>
    <p><%=Index.Intro2.Replace("{{SiteName}}",ConfigSettings.SiteName)%></p>
    
    <h2><%=Index.HowItWorks%></h2>
    <ol>
        <li><%=Index.HowItWorks1%></li>
        <li><%=Index.HowItWorks2%></li>
        <li><%=Index.HowItWorks3%></li>
        <li><%=Index.HowItWorks4%></li>
        <li><%=Index.HowItWorks5%></li>
        <li><%=Index.HowItWorks6%></li>
    </ol>

    <p><%=Index.NewUserRegister %></p>
    <p><a href="<%=Url.Action("SignUp","Account") %>" class="imageLinkText"><i class="fa fa-user-plus fa-2x"></i> <%=Index.NewUserRegisterLink %></a></p>
    
    <p><br/><%=Index.BeenHereBefore %></p>
    <p><a href="<%=Url.Action("SignIn","Account") %>" class="imageLinkText"><i class="fa fa-lock fa-2x"></i> <%=Index.ExistingUserLink %></a></p>
</asp:Content>
