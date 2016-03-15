<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.WorkEntryViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Log Hours
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="ConfirmationHeading">
        Log Hours</h2>
    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" />
    Before logging out, you must log the hours spent answering questions.
    <p id="WarningMessage">
        Hours should be recorded based on actual time spent researching and answering questions.
    </p>
    <fieldset style="border-color: #800000; border-style: solid; border-width: medium">
    <legend><img src="<%: Url.Image("important.png") %>" alt="Important!" /></legend>
        <p style="font-weight:bold;color:#800000">
            Please take a moment to complete our short survey. Your feedback is important to us. <a target="_blank" href="https://www.surveymonkey.com/summary/Iu7ZxJ_2FBhl0wZPSlWPB9ZDCQ4PqtuWK16EtfsJffzAc_3D">Click Here!</a>
        </p>
    </fieldset>
    <% using (Html.BeginForm())
       {%>
    <%:Html.ValidationSummary("Please correct the errors shown below:")%>
    <fieldset>
        <legend>Year-To-Date Hours: <%: Model.YearToDateHours == null ? 0 : Model.YearToDateHours.Value %></legend>
        <div class="editor-label">
            <%:Html.LabelFor(model => model.Entry.Hours)%></div>
        <div class="editor-field">
            <%:Html.Spinner("Entry_Hours") %>
            <%:Html.TextBoxFor(model => model.Entry.Hours, new {@class = "spinner"}) %>
        </div>
        <input name="action" type="submit" value="Log Hours" class="ImageLink" />
    </fieldset>
    <%
        }%>
    <fieldset>
        <legend>Questions Answered This Session</legend>
        <%
       Html.RenderPartial("QuestionList", Model.QuestionsAnswered);%>
    </fieldset>
</asp:Content>
