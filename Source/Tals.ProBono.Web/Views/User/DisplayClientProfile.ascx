<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Web.Models.ClientProfileViewModel>" %>
<%@ Import Namespace="System.Globalization" %>
<fieldset>
        <legend>Statistics</legend>
        <label>Total Questions Asked:</label>
        <div class="profile-field, clear"><%: Model.QuestionsAsked.ToString(CultureInfo.InvariantCulture) %></div>
        
        <label>Questions Currently in Queue:</label>
        <div class="profile-field, clear"><%: Model.QuestionsInQueue.ToString(CultureInfo.InvariantCulture) %></div>

        <label>Questions Currently Taken</label>
        <div class="profile-field, clear"><%: Model.QuestionsTaken.ToString(CultureInfo.InvariantCulture) %></div>
</fieldset>