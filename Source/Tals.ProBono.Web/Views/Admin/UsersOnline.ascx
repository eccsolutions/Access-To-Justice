<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Web.Models.UsersOnlineViewModel>" %>

<div id="OnlineUsers">
    Registered users online: <%: Model.TotalUsers %><br />
    Of those online are <%: Model.Attorneys %> Attorneys and <%: Model.Clients %> Clients.
</div>