<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
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

    <p><a href="#Q1">How does the <%=ConfigSettings.SiteName %> work?</a></p>
    <p><a href="#Q2">Who is eligible to use the <%=ConfigSettings.SiteName %>?</a></p>
    <p><a href="#Q3">Will I receive pro bono hours for participating?</a></p>
    <p><a href="#Q4">What kinds of lawyers should participate?</a></p>
    <p><a href="#Q5">What happens if a lawyer cannot answer a user’s question?</a></p>
    <p><a href="#Q6">What type of relationship exists between the client and lawyer?</a></p>
    <p><a href="#Q7">How do lawyers check for conflicts of interest?</a></p>
    <p><a href="#Q8">What about professional liability insurance coverage?</a></p>
    <p><a href="#Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a></p>
    <p><a href="#Q10">Navigating the Website and Selecting Questions to Answer</a></p>
    <p><a href="#Q11">Selecting Questions You Want to Answer</a></p>
    <p><a href="#Q12">Entering Pro Bono Hours</a></p>

    <h3>Referral Questions:</h3>
    <p><a href="#Q13">How do I contact the administrator with a question?</a></p>
    <p><a href="#Q14">What if I think the user needs more help?</a></p>
    <p><a href="#Q15">How do I make a referral?</a></p>
    <p><a href="#Q16">What if I want to represent the client in their case?</a></p>
    <p><a href="#Q17">What if I see the same question over and over, is there something that I can use to provide answers?</a></p>
    <p><a href="#Q18">Where can I find information related to the question's substantive area of law?</a></p>
    <p><a href="#Q19">What if I have further questions or feedback?</a></p>

<div style="margin-top:50px">
   
    <h3><a id="Q1">How does the <%=ConfigSettings.SiteName %> work?</a></h3>
        <p>The Online Arizona Justice system is based on the walk-in clinic or dial-a-lawyer model where clients request brief advice and counsel about a specific civil legal issue from a volunteer lawyer. Lawyers provide information and basic legal advice without any expectation of long-term representation.</p>
        <p>Users sign the user agreement, create a username and password, post a request for legal advice or information, and provide facts about their case that will help the lawyer answer the question. All users are eligible for the program. Users who are under 150% of the Federal Poverty level will be indicated through color coding. Attorneys who assist these individuals may receive CLE credit for their pro bono time. (See Rule 45) Users will be asked to select a category (such as “housing” or “family”) that best describes their question. The lawyer may ask for additional information before responding to the user’s request, but the user will have a choice to respond to that request or not. A user’s name, county, opposing party information, and county of venue for open legal matters will be shared with the attorney. Users are informed that there is no guarantee that a question will be answered. If a question is not answered within fourteen (14) days, the user will receive an email from the website administrator instructing the user to seek assistance elsewhere. The user will also be provided with a list of additional resources.</p>
        <p>Lawyers who would like to participate must create a username and password, provide contact information and their Bar number, sign the lawyer user agreement, and request approval from the website administrator. Before the lawyer’s account is activated, the website administrator checks to ensure the lawyer is licensed in Arizona, has malpractice insurance (free malpractice insurance for this program is available through the Arizona Foundation for Legal Services &amp; Education) and is in good standing with the State Bar of Arizona. Once a lawyer has been approved by the website administrator, the lawyer receives an email notification and can begin answering user questions.</p>
        <p>Lawyers may log in at any time to review a list of user questions and select the one(s) they want to answer. Lawyers will use the categories provided by the user to help determine which questions they would like to answer. A lawyer will have the opportunity to read the full question before deciding to take it from the list and answer it. Once a lawyer takes a question from the list, the lawyer has three (3) days to answer it. Once the question is taken it will be listed as taken under the Question Center sidebar. To view taken question click on taken under the Question Center sidebar. Lawyers will be allowed to ask follow-up questions through the website if they need additional information in order to answer the user’s question. The lawyer’s name will not be revealed to the user. The lawyer’s contact information will not be shared with the user. Once a lawyer answers a question, the user will be asked to accept the answer or send a follow up question to the lawyer.</p>
        <p>Lawyers will be able to view a log of questions they have answered. This log is located under the Profile tab.</p>

    <h3><a id="Q2">Who is eligible to use the <%=ConfigSettings.SiteName %>?</a></h3>
        <p>Eligibility for use of the Online Arizona Justice system is limited to the following:</p>
        <ul>
            <li>The user must be an Arizona resident or have an issue in Arizona;</li>
            <li>The user must be at least <%=ConfigSettings.MinimumAgeRequirement %> years of age; and</li>
            <li>The user must provide their name and county in order to request advice.</li>
        </ul>
    
    <h3><a id="Q3">Will I earn pro bono hours for participating?</a></h3>
        <p>Lawyers earn pro bono hours for time spent researching and answering questions. Lawyers keep their time and report it in the Online Arizona Justice system before logging out of each session. Lawyers may view the number of hours they have volunteered.</p>
        <p>The Online Arizona Justice system is available to anyone who has a legal question. Lawyers will earn pro bono hours for all people they assist however, only questions that have been identified as under the 150% of the Federal Poverty Guidelines, by the _____________ color coding will give an attorney pro bono hours toward CLE credit. Lawyers may earn up to 1 hour of CLE credit for every five hours of pro bono provided to designated individuals. See <a href="http://www.azbar.org/cleandmcle/mcle/rule45,arizrsupct" target="_blank" title="Rules of the Supreme Court of Arizona, Rule 45"></a>Rules of the Supreme Court of Arizona, Rule 45 for more information.</p>
    
    <h3><a id="Q4">What kinds of lawyers should participate?</a></h3>
        <p>All lawyers are welcome! While there are certain types of legal questions that regularly come up, we need lawyers with different areas of expertise to volunteer. We hope the website will appeal to lawyers who want to give back but have been unable to participate in traditional pro bono work due to family obligations, work limitations, schedule, or geographic location. We also hope to engage lawyers who already provide pro bono and are willing to give more of their time to those who need it.</p>
    
    <h3><a id="Q5">What happens if a lawyer cannot answer a user’s question?</a></h3>
        <p>A lawyer might be unable to answer a user’s question for a number of reasons. Some examples might be a conflict of interest, the user’s failure to respond to lawyer requests for additional information, or the question is determined to fall outside the lawyer’s area of expertise. Lawyers can access the advocate tab on their profile page to access informative CLEs or converse with fellow attorneys about an issue. If a lawyer determines that she cannot answer a question, the lawyer may contact the site administrator to place the question back into the queue so that another volunteer lawyer may try to assist the user. The lawyer should let the administrator know the reason why the question needs to be placed back in the queue.</p>
    
    <h3><a id="Q6">What type of relationship exists between the client and lawyer?</a></h3>
        <p>In the event a client submits a question and receives an answer from an attorney, there will be an attorney/client relationship formed between that client and the attorney who responds. That relationship, however, will be limited in scope and duration. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The attorney will provide short-term, limited legal services to the client without expectation by either the attorney or the client that the attorney will provide continuing representation in the matter. If a lawyer would like to take on a client please see the “What if I want to represent the client in their case?” question.</p>
        <p>Both the eligible users and lawyers must consent to the limited nature of this relationship both as to scope and duration as indicated when they accept the terms of the user agreement. Eligible users and lawyers who do not accept the terms of the use agreement will not be allowed access to the site.</p>
        <p>There is no attorney/client relationship between the client and the Arizona Foundation for Legal Services &amp; Education.</p>

    <h3><a id="Q7">How do lawyers check for conflicts of interest?</a></h3>
        <p>Because of the pro bono publico nature of the limited scope representation provided through the Online Arizona Justice system, Arizona Rules of Professional Conduct 1.2(c) and 6.5 apply to an attorney’s participation in the Online Arizona Justice system. The only conflicts of interest that would preclude an attorney from answering a question for an eligible user of the Online Arizona Justice system are conflicts of interest that the attorney actually knows of at the time that she receives or answers a client's question. Because an attorney is only precluded from answering a question if she knows there is a conflict, the possibility exists, and clients agree that they understand, that an attorney who answers a question, or another attorney with whom she practices in a firm, may be representing other parties with an interest in the question.</p>
        <p>The client name and opposing party name will be provided to the attorney so that the attorney can recognize known conflicts of interest. If, based on the information the client provides, the attorney gains actual knowledge of a conflict of interest precluding her from answering, the question will be returned to the queue to be accepted by another volunteer attorney.</p>
    
    <h3><a id="Q8">What about professional liability insurance coverage?</a></h3>
        <p>Volunteer lawyers who provide brief advice and counsel via the website must be covered by malpractice insurance. If you do not have your own malpractice insurance, free malpractice insurance may be acquired through the Arizona Foundation for Legal Services &amp; Education. If an issue of malpractice arises, the Foundation can trace each answered question back to the attorney who answered it. The Foundation may have to contact lawyers participating in the program from time to time related to this insurance coverage.</p>
        
    <h3><a id="Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a></h3>
        <p>This site is designed to ensure client privacy. Since the web program is administered via email through a platform that limits access based on a screening, confidentiality will be maintained since only the website administrator has access to content between a client and a lawyer. Information available to the website administrator and the lawyer responding to a client request shall remain confidential, subject to the limitations of the Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in the Online Arizona Justice system may be maintained in a database for review in order to measure the effectiveness of the project. Steps will be taken to maintain the security of this database and it will only be utilized by the administrator but an absolute guarantee of security is not possible when using the internet and internet based systems.</p> 
        <p>For each visitor to the Webpage the web server automatically recognizes only the consumer domain name. This is the information that is collected for statistical purposes.</p>     
        <p>Aggregate information is collected on the pages consumers access or visit on this website.</p>
        <p>The information collected is used to improve the content of the webpage and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>  

    <h3><a id="Q10">Navigating the Website and Selecting Questions to Answer</a></h3>
        <p>When your account has been approved by the website administrator, you will receive a notification email. To get started you will go to <a href="<%=ConfigSettings.SiteUrl %>" target="_blank"><%=ConfigSettings.SiteUrl %></a> and select “Sign In” at the top right side of your screen. After you enter your username and password, you will automatically be directed to a page that lists all the questions that have been posted for lawyers to answer.</p>
        <p>You will notice that the questions are color-coded. This color-coding lets you know how long each question has been in the queue and if the person is under 150% of the federal poverty level. Green questions are those that have been posted within the past five (5) days; yellow questions are those that have been posted within the last 6-10 days; and red questions are those that have been in the queue for over ten (10) days and will be closed if no lawyer is able to answer them. Questions that are not answered within fourteen (14) days will be closed and the client will be notified. ________ questions are people who meet the legal aid requirements and are at or below 150% of the federal poverty guidelines; answering these questions and only these questions will earn an attorney pro bono hours that can be accrued toward CLE credit. (<a href="http://www.azbar.org/cleandmcle/mcle/rule45,arizrsupct" target="_blank">See Rule 45</a>)</p>    
        <p>You have three ways in which to view questions in the queue:</p>
        <ol>
            <li>You can view a list of all the questions in the queue; this is the default view.</li>
            <li>You can view a list of questions that have been in the queue for ten (10) days or longer by clicking on the “Urgent” option on the left side of your screen under the Question Center sidebar.</li>
            <li>You can view questions by legal categories by clicking on the “Practice Areas” tab at the top of the screen. You will notice that each question has a “Category” and a “Subject.” Clients are asked to pick the Category that best describes their question. The Categories are listed as follows: Family and Children, Housing, Consumer Issues, Debt and Bankruptcy, Work, Immigration, Disability, Health Care, Public Benefits, LawforKids, Criminal Law, Veterans, Discrimination, Seniors, Other, and Abuse and Violence. </li>
        </ol>
        <p>You can easily view any question you have taken to answer by clicking on the "Taken" option on the left side of your screen under the sidebar labeled Question Center.</p>
        <p>The client is asked to use the Subject line to tell you, in their own words, what the question is about (for example, eviction, divorce, etc.). The Category and Subject functions are tools to help lawyers quickly decide which questions they would like to review and answer.</p>

    <h3><a id="Q11">Selecting Questions You Want to Answer</a></h3>
        <p>You can read the first few lines of each posted question by moving your mouse over the Subject line. This feature will allow you to review questions before you select the “Take” button. When you have found a question you’d like to answer, click the “Take” button to the left of the question. You will be asked if you are sure you want to take the question. Click “yes” and the question will now appear under the “My Taken Questions” tab at the top of the screen. This screen allows you to quickly see which questions you have taken and track the activity on each. Please respond within three (3) days of taking a question.</p>
        <p>Once you have taken the question, you will be able to reply to the client and provide an answer or ask follow-up questions. If you ask the client a question, you will receive an email when the client responds and a prompt to log back into the website to respond. The client will be given your name but no other information. None of your contact information will be shared unless you choose to provide it to the client.</p>    

    <h3><a id="Q12">How Do I Subscribe to a Category</a></h3>
        <p>If your area of practice is specialized and you only want to answer certain types of questions, you can subscribe to a Category and receive an email notification each time a question in that particular Category is posted.</p>
        <p>To subscribe to a Category (for example, immigration), click on the “Practice Areas” tab at the top of the screen. Scroll down to the Category you are interested in and click on the “Subscribe” button. You will be asked if you are sure that you want to subscribe to the category. You will then enter your email address and click “Subscribe.” You can unsubscribe at any time.</p>
    
    <h3><a id="Q13">Entering Pro Bono Hours</a></h3>
        <p>Each time you log out of the website, you will be prompted to enter the time you have spent researching and answering questions. You may log your time in 15-minute increments. You may view your hours at any time by clicking on “My Profile” at the top of the page.</p>
    
    <h3><a id="Q14">How do I contact the administrator with a question?</a></h3>
        <p>If you have a question or run into a technical problem with the site, you may contact the administrator by clicking the email address <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> located at the bottom of the page.</p>
    
    <h3><a id="Q15">What if I think the user needs more help?</a></h3>
        <p>If you believe that the user requires more legal assistance than can be provided through the Online Arizona Justice system, and you do not wish to provide it, you can refer the user to <a href="http://azlawhelp.org/" target="_blank">AZLawHelp.org</a>. This website provides a number of services and information that users may find helpful including the Arizona’s Access to Justice Online Intake form and Legal LEARN number.</p>
    
    <h3><a id="Q16">How do I make a referral?</a></h3>
        <p>To provide a user with a referral to a legal aid organization provide the following link: <a href="http://www.azlawhelp.org/accessToJustice.cfm" target="_blank">http://www.azlawhelp.org/accessToJustice.cfm</a>. To provide a user with a comprehensive list of referral choices provide the following link: <a href="http://www.azlawhelp.org/legalaidlisting.cfm" target="_blank">http://www.azlawhelp.org/legalaidlisting.cfm</a>. If the user is a veteran provide this link: <a href="http://lawforveterans.org/legal-resources" target="_blank">http://lawforveterans.org/legal-resources</a>.</p>
    
    <h3><a id="Q17">What if I want to represent the client in their case?</a></h3>
        <p>Attorneys who wish to extend their attorney client relationship may do so either pro bono or at a maximum rate of $75 per hour. Attorneys are responsible for asking to represent the client as the user has been told they are not to request representation from an attorney on this site. Representation of a client is outside the scope of the website's user agreement and the attorney must enter into a new agreement with the client. Contact and correspondence with the client should be conducted outside of the <%=ConfigSettings.SiteName %>. Attorneys who extend representation should also notify the website administrator at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> that you are taking the case, so that information can be tracked for administrative purposes.</p>
    
    <h3><a id="Q18">What if I see the same question over and over, is there something that I can use to provide answers?</a></h3>
        <p>For the convenience of the attorneys answering the questions, we have provided some basic informational language. This language does not include any advice, only information on where to find more resources on common issues. You will have to include any advice related to the user's specific facts.</p>
        <p>If there is an area where you see many questions and you feel it would be useful to have some preset language, please contact the Administrator.</p>
    
    <h3><a id="Q19">Where can I find information related to the question's substantive area of law?</a></h3>
        <p>CLEs and CLE information can be found on the advocate tab for various areas of law. The advocate forum also allows attorneys to communicate with other volunteer attorneys about any questions they may have.</p>
    
    <h3><a id="Q20">What if I have further questions or feedback?</a></h3>
        <p>Contact the administrator at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> or provide feedback by <a href="https://www.surveymonkey.com/s/onlineazjustice" target="_blank">answering a short survey</a>.</p>

</div>

    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
