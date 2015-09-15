﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Attorney Sign Up FAQ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Attorney Sign Up - Frequently Asked Questions</h2>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-bottom: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>

    <p><a href="https://www.youtube.com/watch?v=Z4uesStFQUw" target="_blank">Watch an instruction video for attorneys</a></p>

    <p><a href="#Q1">How does <%=ConfigSettings.SiteName %> work?</a></p>
    <p><a href="#Q2">Who is eligible to use <%=ConfigSettings.SiteName %>?</a></p>
    <p><a href="#Q3">Will I earn CLE credit?</a></p>
    <p><a href="#Q4">What kinds of lawyers should participate?</a></p>
    <p><a href="#Q5">What happens if a lawyer cannot answer a user&#39;s question?</a></p>
    <p><a href="#Q6">What type of relationship exists between the client and lawyer?</a></p>
    <p><a href="#Q7">How do lawyers check for conflicts of interest?</a></p>
    <p><a href="#Q8">What about professional liability insurance coverage?</a></p>
    <p><a href="#Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the Internet?</a></p>
    <p><a href="#Q10">Navigating the Website and Selecting Questions to Answer</a></p>
    <p><a href="#Q11">Selecting Questions You Want to Answer</a></p>
    <p><a href="#Q12">How Do I Subscribe to a Category?</a></p>
    <p><a href="#Q13">Entering Hours for CLE Credit</a></p>
    <p><a href="#Q14">How do I contact the administrator with a question?</a></p>

<div style="margin-top:50px">
   
    <h3><a id="Q1">How does <%=ConfigSettings.SiteName %> work?</a></h3>
        <p><%=ConfigSettings.SiteName %> is based on the walk-in clinic model where clients request brief advice and counsel about a specific civil legal issue from a volunteer lawyer. Lawyers provide information and basic legal advice without any expectation of long-term representation.</p>
        <p>Users who meet eligibility screening (see Eligibility below) sign the use agreement, create a username and password, post a request for legal advice and provide facts about their case that will help the lawyer answer the question. Users will be asked to select a category (such as &quot;housing&quot; or &quot;debt&quot;) that best describes their question. The lawyer may ask for additional information before responding to the user&#39;s request, but the user will have a choice to respond to that request or not. Users will provide their name, but no other identifying information will be shared with the volunteer lawyer. Users are informed that there is no guarantee that a question will be answered. If a question is not answered within 30 days, the user will receive an email from the website administrator instructing them to seek assistance elsewhere. The user will also be provided with a list of additional resources.</p>
        <p>Lawyers who would like to participate must create a username and password, provide contact information and their WSBA Bar number, <a href="<%=Url.Action("UseAgreement","Account") %>" target="_blank">sign the lawyer use agreement</a> and request approval from the website administrator. Before the lawyer&#39;s account is activated, the website administrator checks to ensure the lawyer is licensed in Washington and is in good standing with the WSBA. Once a lawyer has been approved by the website administrator, the lawyer receives an email notification and can begin answering user questions.</p>
        <p>Lawyers may log in at any time to review a list of user questions and select the one(s) they want to answer. Lawyers will use the categories provided by the user (such as &quot;housing&quot; or &quot;debt&quot;) to help determine which questions they would like to answer. A lawyer will have the opportunity to read the full question before deciding to take it from the list and answer it. Once a lawyer takes a question from the list, the lawyer has 3 days to answer it. Lawyers will be allowed to ask follow up questions via email if they need additional information in order to answer the user&#39;s question. The lawyer&#39;s identity is not revealed to the user unless the lawyer decides to do so. Once a lawyer answers a question, the user will be asked to accept the answer or send a follow up question to the lawyer.</p>
        <p>Lawyers will be able to view a log of questions they have answered.</p>

    <h3><a id="Q2">Who is eligible to use <%=ConfigSettings.SiteName %>?</a></h3>
        <p>Eligibility for use of <%=ConfigSettings.SiteName %> is limited to the following:</p>
        <ul class="padded-list-sm">
            <li>The user must have household income less than 200% of the federal poverty level;</li>
            <li>The user must be over the age of <%=ConfigSettings.MinimumAgeRequirement %>;</li>
            <li>The user&#39;s legal issue must be in Washington State;</li>
            <li>The user may not request assistance with criminal law matters;</li>
            <li>The user may not already have an attorney helping them with their legal issue.</li>
        </ul>
        <p>Users must provide their name and zip code in order to request advice.</p>
        <p>Users agree to post no more than 3 legal questions per year.</p>

    <h3><a id="Q3">Will I earn CLE credit?</a></h3>
        <p>Lawyers earn CLE credit for time spent researching and answering questions. Lawyers keep their time and report it in the <%=ConfigSettings.SiteName %> system before logging out of each session.  WSBA MCLE credits earned through participation in <%=ConfigSettings.SiteName %> are self-reported via the WSBA website.  Questions about CLE credit may be directed to <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>.</p>
        
    <h3><a id="Q4">What kinds of lawyers should participate?</a></h3>
        <p>All lawyers are welcome! While there are certain types of legal questions that regularly come up at legal clinics, we need lawyers with different areas of expertise and practice to volunteer. We hope the website will appeal to lawyers who want to give back but have been unable to participate in traditional pro bono work due to family obligations, schedule, work or geographic location. We also hope to engage lawyers who already experienced volunteers and are willing to give more of their time to those who need it.</p>

    <h3><a id="Q5">What happens if a lawyer cannot answer a user&#39;s question?</a></h3>
        <p>A lawyer might be unable to answer a user&#39;s question for a number of reasons. Some examples might be a conflict of interest, user&#39;s failure to respond to lawyer requests for additional information or the question is determined to fall outside the lawyer&#39;s area of expertise.  Lawyers will have access to information and training on various areas of substantive law to help them answer questions. If a lawyer determines that (s)he cannot answer a question, the lawyer may contact the site administrator to place the question back into the queue so that another volunteer lawyer may try to assist the user. The lawyer should let the administrator know the reason why the question needs to be placed back in the queue.</p>

    <h3><a id="Q6">What type of relationship exists between the client and lawyer?</a></h3>
        <p>When a user submits a question and receives an answer from a lawyer, there will be a lawyer/client relationship formed between that client and the lawyer who responds. That relationship, however, will be limited in scope and duration as described in the use agreements for both users and lawyers. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The lawyer will provide short-term, limited legal services to a client (the eligible user of this site) without expectation by either the lawyer or the client (the eligible user of this site) that the lawyer will provide continuing representation in the matter. Both the eligible users and lawyers must consent to the limited nature of this relationship both as to scope and duration as indicated when they accept the terms of the use agreement. Eligible users and lawyers who do not accept the terms of the use agreement will not be allowed access to the site.</p>
        
    <h3><a id="Q7">How do lawyers check for conflicts of interest?</a></h3>
        <p>Because of the pro bono nature of the limited scope representation provided through <%=ConfigSettings.SiteName %> and because of the involvement of TPCBA VLS as the administrator, the general rules for lawyers as to conflicts of interest do not apply to lawyers&#39; participation in <%=ConfigSettings.SiteName %>. Instead, the only conflicts of interest that would preclude a lawyer from answering a question for an eligible user of <%=ConfigSettings.SiteName %> are conflicts of interest that the lawyer actually knows of at the time that they receive or answer a client&#39;s question. This means that the possibility exists, and the clients agree that they understand, that a lawyer who answers a question, or another lawyer with whom they practice in a firm, may actually be representing other parties with an interest in the question. The user&#39;s name will be provided to the lawyer so that the lawyer can make sure not to answer the question if the lawyer knows that (s)he would have a conflict of interest. If based on the information the user provides, whether user name or any details of the question, the lawyer actually knows of a conflict of interest precluding him from answering, the question will be referred to another volunteer lawyer.  Once a lawyer has answered a question for a Washington Web Lawyer user, they should record the name of that user in their own database in order to be able to accurately check for future conflicts.</p>

    <h3><a id="Q8">What about professional liability insurance coverage?</a></h3>
        <p>Volunteer lawyers who provide brief advice and counsel via the website will be covered by professional liability insurance maintained by the Tacoma-Pierce County Bar Association&#39;s Volunteer Legal Services Program.  TPCBA VLS has specific professional insurance for this purpose.  If an issue of malpractice arises, we can trace each answered question back to the attorney who answered it. The malpractice insurance will be primary if the volunteer lawyer does not have malpractice insurance of their own; if the lawyer does have insurance the TPCBA VLS insurance will be secondary. </p>

    <h3><a id="Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a></h3>
        <p>This site is designed to ensure client privacy. Since the web program is administered via email through a platform that limits access based on a screening, confidentiality will be maintained since only the website administrator has access to content between a client and a lawyer. Information available to the website administrator and the lawyer responding to a client request shall remain confidential, subject to the limitations of the Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in <%=ConfigSettings.SiteName %> may be maintained in a database for review in order to measure the effectiveness of the project. Steps will be taken to maintain the security of this database and it will only be utilized by the administrator.  However, it should be noted that an absolute guarantee of security is not possible when using the Internet and Internet based systems.</p>
        <p>For each visitor to the site, the web server automatically recognizes only the consumer domain name. This information is collected for statistical purposes.</p>
        <p>Aggregate information is collected on the pages consumers access or visit on this website.</p>
        <p>The information collected is used to improve the content of the <%=ConfigSettings.SiteName %> and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>
        
    <h3><a id="Q10">Navigating the Website and Selecting Questions to Answer</a></h3>
        <p>When your account has been approved by the website administrator, you will receive a notification email. To get started you will go to <a href="<%=ConfigSettings.SiteUrl %>" target="_blank"><%=ConfigSettings.SiteUrl %></a> and select &quot;Sign In&quot; at the top right side of your screen. After you enter your username and password, you will automatically be directed to a page that lists all the questions that have been posted for lawyers to answer. </p>
        <p>You will notice that the questions are color-coded. This color-coding lets you know how long each question has been in the queue. Green questions are those that have been posted within the past 10 days; yellow questions are those that have been posted for more than 10 days; and red questions are those that have been in the queue for at least 25 days and will be closed if no lawyer is able to answer them. Questions that are not answered within 30 days will be closed and the client will be notified. </p>
        <p>You have three ways in which to view questions in the queue:</p>
        <ol class="padded-list-sm">
            <li>You can view a list of all the questions in the queue; this is the default view.</li>
            <li>You can view a list of questions that have been in the queue for 25 days or longer by clicking on the &quot;Urgent&quot; option on the left side of your screen.</li>
            <li>You can view questions by legal categories by clicking on the &quot;Practice Areas&quot; tab at the top of the screen. The list of Categories is as follows: benefits, debt &amp; purchases, family, health care, housing, immigration/citizenship, other, school/juvenile, seniors and work. You will notice that each question has a &quot;Category&quot; and a &quot;Subject.&quot; Clients are asked to pick the Category that best describes their question. The Categories are listed as follows: <span style="font-style: italic">benefits, debt &amp; purchases, family, health care, housing, immigration/citizenship, other, school/juvenile, seniors and work</span>.</li>
            <li>You can easily view any question you have taken to answer by clicking on the &quot;Taken&quot; option on the left side of your screen.</li>
        </ol>
        <p>The client is asked to use the Subject line to tell you, in their own words, what the question is about (for example, eviction, divorce, bankruptcy, etc.). The Category and Subject functions are tools to help lawyers quickly decide which questions they would like to review and answer. </p>
       
    <h3><a id="Q11">Selecting Questions You Want to Answer</a></h3>
        <p>You can read the first few lines of each posted question by moving your mouse over the Subject line. This feature will allow you to review questions before you select the &quot;Take&quot; button. When you have found a question you&#39;d like to answer, click the &quot;Take&quot; button to the left of the question. You will be asked if you are sure you want to take the question. Click &quot;yes&quot; and the question will now appear under the &quot;My Taken Questions&quot; tab at the top of the screen. This screen allows you to quickly see which questions you have taken and track the activity on each. Please respond within 3 days of taking a question. If you fail to respond within 3 days, the question will be moved back into the queue.</p>
        <p>Once you have taken the question, you will be able to reply to the client and provide an answer or ask follow up questions. The client will see your name on the answer to the question but will not have your contact information unless you choose to provide it. If you ask the client a question, you will receive an email when the client responds and a prompt to log back into the website to respond.</p>
       
    <h3><a id="Q12">How Do I Subscribe to a Category?</a></h3>
        <p>If your area of practice is specialized and you only want to answer certain types of questions, you can subscribe to a Category and receive an email notification each time a question in that particular Category is posted.</p>
        <p>To subscribe to a Category (for example, immigration), click on the &quot;Practice Areas&quot; tab at the top of the screen. Scroll down to the Category you are interested in and click on the &quot;Subscribe&quot; button. You will be asked if you are sure that you want to subscribe to the category. You will then enter your email address and click &quot;Subscribe.&quot; You can unsubscribe at any time. </p>
    
    <h3><a id="Q13">Entering Hours for CLE Credit</a></h3>
        <p>Each time you attempt to log out of the website, you will be prompted to enter the time you have spent researching and answering questions. You may log your time in 15-minute increments.  You will self-report your pro bono hours for CLE credit through the WSBA website.  You may view your <%=ConfigSettings.SiteName %> hours at any time by clicking on &quot;My Profile&quot; at the top of the page. </p>
    
    <h3><a id="Q14">How do I contact the administrator with a question?</a></h3>
        <p>If you have a question or run into a technical problem with the site, you may contact the administrator by clicking on the &quot;Help&quot; link located at the bottom of the page.</p>

</div>

    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
