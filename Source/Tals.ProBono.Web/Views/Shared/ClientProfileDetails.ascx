<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Web.Models.ClientProfileViewModel>" %>

<div id="profile">
    <fieldset>

        <legend>Profile</legend>

        <label>User Name:</label>
        <div class="profile-field, clear">
            <%: Model.User.UserName %></div>

        <label>Name:</label>
        <div class="profile-field, clear">
            <%: Model.Profile.FullName %></div>

        <label>Email:</label>
        <div class="profile-field, clear">
            <%: Model.User.Email %></div>

        <label>Registration Date:</label>
        <div class="profile-field, clear">
            <%: String.Format("{0:d}", Model.Profile.RegistrationDate) %></div>

        <label>Last Login Date:</label>
        <div class="profile-field, clear">
            <%: String.Format("{0:g}", Model.User.LastLoginDate) %></div>

        <label>Total Questions Asked:</label>
        <div class="profile-field, clear">
            <%: Model.QuestionsAsked.ToString() %></div>
        
        <label>Questions Currently in Queue:</label>
        <div class="profile-field, clear">
            <%: Model.QuestionsInQueue.ToString() %></div>

        <label>Questions Currently Taken</label>
        <div class="profile-field, clear">
            <%: Model.QuestionsTaken.ToString() %></div>

    </fieldset>
</div>