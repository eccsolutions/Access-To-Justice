<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Page>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit <%:Model.Title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; Edit <%:Model.Title %>

    <h2> Edit <%:Model.Title %></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title, new {style="width:400px"}) %>
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Content) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Content, 30, 125, new{@class="cleditor"}) %>
                <%: Html.ValidationMessageFor(model => model.Content) %>
            </div>

            <div class="button-container">
                <input type="submit" value="Save Page"/>
                <button type="button" onclick="window.location='<%=Url.Action("Index","Settings")%>'">Cancel</button>
            </div>            
        </fieldset>

    <% } %>
</asp:Content>

<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="Scripts">
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $('#<%:Html.IdFor(x=>x.Content)%>').cleditor();
        }); 
    </script>
</asp:Content>