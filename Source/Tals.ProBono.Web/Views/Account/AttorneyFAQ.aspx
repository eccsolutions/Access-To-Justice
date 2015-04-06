<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.AppName %> - Attorney Sign Up FAQ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Attorney Sign Up - Frequently Asked Questions</h2>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-bottom: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
    <p>
        <a href="#Q1">How does the <%=ConfigSettings.AppName %> work?</a>
        <br />
        <a href="#Q2">Who is eligible to use the <%=ConfigSettings.AppName %>?</a>
        <br />
        <a href="#Q3">Will I receive pro bono hours for participating?</a>
        <br />
        <a href="#Q4">What kinds of lawyers should participate?</a>
        <br />
        <a href="#Q5">What happens if a lawyer cannot answer a user’s question?</a>
        <br />
        <a href="#Q6">What type of relationship exists between the client and lawyer?</a>
        <br />
        <a href="#Q7">How do lawyers check for conflicts of interest?</a>
        <br />
        <a href="#Q8">What about professional liability insurance coverage?</a>
        <br />
        <a href="#Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a>
        <br />
        <a href="#Q10">Navigating the Website and Selecting Questions to Answer</a>
        <br />
        <a href="#Q11">Selecting Questions You Want to Answer</a>
        <br />
        <a href="#Q12">Entering Pro Bono Hours</a>
        <br />
        <br />
        <strong>Referral Questions:</strong>
        <br />
        <a href="#Q13">How do I contact the administrator with a question?</a>
        <br />
        <a href="#Q14">What if I think the user needs more help?</a>
        <br />
        <a href="#Q15">How do I make a referral?</a>
        <br />
        <a href="#Q16">What if I want to represent the client in their case?</a>
        <br />
        <a href="#Q17">What if I see the same question over and over, is there something that I can use to provide answers?</a>
        <br />
        <a href="#Q18">Where can I find information related to the question's substantive area of law?</a>
        <br />
        <a href="#Q19">What if I have further questions or feedback?</a>
    </p>
    <p>
        <strong><a id="Q1">How does the <%=ConfigSettings.AppName %> work?</a></strong></p>
    <p>The <%=ConfigSettings.AppName %> is based on the walk-in clinic or dial-a-lawyer model where clients request brief advice and counsel about a specific civil legal issue from a volunteer lawyer. Lawyers provide information and basic legal advice without any expectation of long-term representation.</p>
    <p>Users who meet eligibility (see Eligibility below) sign the user agreement, create a username and password, post a request for legal advice information, and provide facts about their case that will help the lawyer answer the question. Users will be asked to select a category (such as “housing” or “family”) that best describes their question. The lawyer may ask for additional information before responding to the user’s request, but the user will have a choice to respond to that request or not. A user’s name, county, opposing party information, and county of venue for open legal matters will be shared with the attorney. Users are informed that there is no guarantee that a question will be answered. If a question is not answered within fourteen (14) days, the user will receive an email from the website administrator instructing the user to seek assistance elsewhere. The user will also be provided with a list of additional resources.</p>
    <p>Lawyers who would like to participate must create a username and password, provide contact information and their attorney ID number, sign the lawyer use agreement, and request approval from the website administrator. Before the lawyer’s account is activated, the website administrator checks to ensure the lawyer is licensed in <%=ConfigSettings.StateName %> and is in good standing with The <%=ConfigSettings.StateName %> Bar. Once a lawyer has been approved by the website administrator, the lawyer receives an email notification and can begin answering user questions.</p>
    <p>Lawyers may log in at any time to review a list of user questions and select the one(s) they want to answer. Lawyers will use the categories provided by the user to help determine which questions they would like to answer. A lawyer will have the opportunity to read the full question before deciding to take it from the list and answer it. Once a lawyer takes a question from the list, the lawyer has three (3) days to answer it. Lawyers will be allowed to ask follow-up questions through the website if they need additional information in order to answer the user’s question. The lawyer’s name will not be revealed to the user. The lawyer’s contact information will not be shared with the user. Once a lawyer answers a question, the user will be asked to accept the answer or send a follow up question to the lawyer.</p>
    <p>
        Lawyers will be able to view a log of questions they have answered.</p>
    <p>
        <strong><a id="Q2">Who is eligible to use the <%=ConfigSettings.AppName %>?</a></strong></p>
    <p>
        Eligibility for use of the <%=ConfigSettings.AppName %> is limited to the following:</p>
    <ul>
        <li>The user must be a <%=ConfigSettings.StateName %> resident;</li>
        <li>The user must have household income at or below 200% of the federal poverty level;</li>
        <li>The user must be at least 14 years of age;</li>
        <li>The user may not request assistance with criminal law matters; and</li>
        <li>The user must provide their name and county in order to request advice.</li>
    </ul>
    <p>
        Users must provide their name and county in order to request advice.</p>
    <p>
        <strong><a id="Q3">Will I earn pro bono hours for participating?</a></strong></p>
    <p>Lawyers earn pro bono hours for time spent researching and answering questions. Lawyers keep their time and report it in the <%=ConfigSettings.AppName %> before logging out of each session. Lawyers may view the number of hours they have volunteered. Lawyers may earn up to 1 hour of CLE credit for every six hours of pro bono provided. See the rules for more information.</p>
    <p>
        <strong><a id="Q4">What kinds of lawyers should participate?</a></strong></p>
    <p>All lawyers are welcome! While there are certain types of legal questions that regularly come up, we need lawyers with different areas of expertise to volunteer. We hope the website will appeal to lawyers who want to give back but have been unable to participate in traditional pro bono work due to family obligations, work limitations, schedule, or geographic location. We also hope to engage lawyers who already provide pro bono and are willing to give more of their time to those who need it.</p>
    <p>
        <strong><a id="Q5">What happens if a lawyer cannot answer a user’s question?</a></strong></p>
    <p>A lawyer might be unable to answer a user’s question for a number of reasons. Some examples might be a conflict of interest,
        the user’s failure to respond to lawyer requests for additional information, or the question is determined to fall outside
        the lawyer’s area of expertise. Lawyers can access the Mississippi Volunteer Lawyers Project’s online resource library at
        <a href="http://www.mvlp.org">www.mvlp.org</a> or the Mississippi Legal Services Programs’ websites at <a href="http://www.mslegalservices.org">www.mslegalservices.org</a>
        or <a href="http://www.nmrls.com">www.nmrls.com</a> for additional resources on different areas of substantive law. If a lawyer
        determines that she cannot answer a question, the lawyer may contact the site administrator to place the question back into the queue so that another volunteer lawyer may try to assist the user. The lawyer should let the administrator know the reason why the question needs to be placed back in the queue.</p>
    <p>
        <strong><a id="Q6">What type of relationship exists between the client and lawyer?</a></strong></p>
    <p>In the event a client submits a question and receives an answer from an attorney, there will be an attorney/client relationship formed between that client and the attorney who responds. That relationship, however, will be limited in scope and duration. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The attorney will provide short-term, limited legal services to the client without expectation by either the attorney or the client that the attorney will provide continuing representation in the matter.</p>

    <p>Both the eligible users and lawyers must consent to the limited nature of this relationship both as to scope and duration as indicated when they accept the terms of the use agreement. Eligible users and lawyers who do not accept the terms of the use agreement will not be allowed access to the site.</p>

    <p>There is no attorney/client relationship between the client and the Mississippi Volunteer Lawyers Project.</p>
    <p>
        <strong><a id="Q7">How do lawyers check for conflicts of interest?</a></strong></p>
    <p>Because of the pro bono publico nature of the limited scope representation provided through the <%=ConfigSettings.AppName %>, Mississippi Rules of Professional Conduct 1.2(c) and 6.5 apply to an attorney’s participation in the <%=ConfigSettings.AppName %>. The only conflicts of interest that would preclude an attorney from answering a question for an eligible user of the <%=ConfigSettings.AppName %> are conflicts of interest that the attorney actually knows of at the time that she receives or answers a client's question. Because an attorney is only precluded from answering a question if she knows there is a conflict, the possibility exists, and clients agree that they understand, that an attorney who answers a question, or another attorney with whom she practices in a firm, may be representing other parties with an interest in the question.</p>
    <p>The client name and opposing party name will be provided to the attorney so that the attorney can recognize known conflicts of interest. If, based on the information the client provides, the attorney gains actual knowledge of a conflict of interest precluding her from answering, the question will be returned to the queue to be accepted by another volunteer attorney.</p>
    <p>
        <strong><a id="Q8">What about professional liability insurance coverage?</a></strong></p>
    <p>Volunteer lawyers who provide brief advice and counsel via the website will be covered by professional liability insurance maintained by the Mississippi Volunteer Lawyers Project.   MVLP has a specific pro bono rider to its general organizational policy for this purpose. If an issue of malpractice arises, MVLP can trace each answered question back to the attorney who answered it. MVLP may have to contact lawyers participating in the program from time to time related to this insurance coverage.</p>
    <p>
        <strong><a id="Q9">Is there a confidentiality issue with client information/lawyer advice being
            housed on the internet?</a></strong></p>
    <p>This site is designed to ensure client privacy. Since the web program is administered via email through a platform that limits access based on a screening, confidentiality will be maintained since only the website administrator has access to content between a client and a lawyer. Information available to the website administrator and the lawyer responding to a client request shall remain confidential, subject to the limitations of the Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in the <%=ConfigSettings.AppName %> may be maintained in a database for review in order to measure the effectiveness of the project. Steps will be taken to maintain the security of this database and it will only be utilized by the administrator but an absolute guarantee of security is not possible when using the internet and internet based systems.</p>
    <p>For each visitor to the Webpage the web server automatically recognizes only the consumer domain name. This is the information that is collected for statistical purposes.</p>
    <p>Aggregate information is collected on the pages consumers access or visit on this website.</p>
    <p>The information collected is used to improve the content of the webpage and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>
    <p>
        <strong><a id="Q10">Navigating the Website and Selecting Questions to Answer</a></strong></p>
    <p>When your account has been approved by the website administrator, you will receive a notification email. To get started you will go to <a href="http://www.mslegalhelp.org">www.mslegalhelp.org</a> and select “Sign In” at the top right side of your screen. After you enter your username and password, you will automatically be directed to a page that lists all the questions that have been posted for lawyers to answer.</p>
    <p>You will notice that the questions are color-coded. This color-coding lets you know how long each question has been in the queue. Green questions are those that have been posted within the past five (5) days; yellow questions are those that have been posted within the last 6-10 days; and red questions are those that have been in the queue for over ten (10) days and will be closed if no lawyer is able to answer them. Questions that are not answered within fourteen (14) days will be closed and the client will be notified.</p>

    <p>You have three ways in which to view questions in the queue:</p>
    <ol>
        <li>You can view a list of all the questions in the queue; this is the default view.</li>
        <li>You can view a list of questions that have been in the queue for ten (10) days or longer by 
            clicking on the “Urgent” option on the left side of your screen.</li>
        <li>You can view questions by legal categories by clicking on the “Practice Areas” tab at the top of the screen. You will notice that each question has a “Category” and a “Subject.” Clients are asked to pick the Category that best describes their question. The Categories are listed as follows: Family, Housing, Consumer and Debt, Work, Immigration, Disability, Health Care, Public Benefits, Youth law and education, Veterans, Taxes, Discrimination, Seniors, and Abuse and Violence.</li>
      </ol>
    <p>You can easily view any question you have taken to answer by clicking on the "Taken"
       option on the left side of your screen.</p>
    <p>
        The client is asked to use the Subject line to tell you, in their own words, what the question is about (for example, eviction, 
        divorce, etc.). The Category and Subject functions are tools to help lawyers quickly decide which questions they would like 
        to review and answer.
    </p>
    <p>
        <strong><a id="Q11">Selecting Questions You Want to Answer</a></strong></p>
    <p>You can read the first few lines of each posted question by moving your mouse over the Subject line. This feature will allow you to review questions before you select the “Take” button. When you have found a question you’d like to answer, click the “Take” button to the left of the question. You will be asked if you are sure you want to take the question. Click “yes” and the question will now appear under the “My Taken Questions” tab at the top of the screen. This screen allows you to quickly see which questions you have taken and track the activity on each. Please respond within three (3) days of taking a question.</p>
    <p>Once you have taken the question, you will be able to reply to the client and provide an answer or ask follow-up questions. If you ask the client a question, you will receive an email when the client responds and a prompt to log back into the website to respond. The client will be given your name but no other information. None of your contact information will be shared unless you choose to provide it to the client.</p>
    <p>
        <strong><a id="Q12">How Do I Subscribe to a Category</a></strong></p>
    <p>If your area of practice is specialized and you only want to answer certain types of questions, you can subscribe to a Category and receive an email notification each time a question in that particular Category is posted.</p>
    <p>To subscribe to a Category (for example, immigration), click on the “Practice Areas” tab at the top of the screen. Scroll down to the Category you are interested in and click on the “Subscribe” button. You will be asked if you are sure that you want to subscribe to the category. You will then enter your email address and click “Subscribe.” You can unsubscribe at any time.</p>
    <p>
        <strong><a id="Q13">Entering Pro Bono Hours</a></strong></p>
    <p>Each time you log out of the website, you will be prompted to enter the time you have spent researching and answering questions. You may log your time in 15-minute increments. You may view your hours at any time by clicking on “My Profile” at the top of the page.</p>
    <p>
        <strong><a id="Q14">How do I contact the administrator with a question?</a></strong></p>
    <p>
        If you have a question or run into a technical problem with the site, you may contact the administrator by clicking 
        the email address <a href="mailto:mvlp@mvlp.org">mvlp@mvlp.org</a> located at the bottom of the page.</p>

    <p><strong><a id="Q15">What if I think the user needs more help?</a></strong></p>
    <p>If you believe that the user requires more legal assistance than can be provided through the <%=ConfigSettings.AppName %>, you can refer him to a local legal services organization. Each organization is different and takes different types of cases, sometimes even within the same organization.  You are encouraged to contact MVLP to determine the organization that might be able to help the user.</p>
    <p><strong><a id="Q16">How do I make a referral?</a></strong></p>
    <p>Every county in Mississippi is covered by a legal aid organization and many other organizations operate statewide. This website contains links to the websites of the Mississippi Volunteer Lawyers Project, the Mississippi Legal Services Programs, the Mississippi Access to Justice Commission, Mississippi Office of the State Public Defender and the Mississippi Attorney General’s Office.  The website of the Mississippi Access to Justice Commission contains links to the websites of all of the state’s civil legal services providers.  Be advised that for organizations, the referral does not mean that the organization will automatically take their case.</p>
    <p><strong><a id="Q17">What if I want to represent the client in their case?</a></strong></p>
    <p>
       If you decide to take a client's case on a pro bono basis, that representation is outside the scope of the website's 
       user agreement. You must enter into a new agreement with the client. Your contact and correspondence with the client 
       should be conducted outside of the <%=ConfigSettings.AppName %> website. You should also notify the website administrator at <a href="mailto:<%=ConfigSettings.SiteEmail %>g"><%=ConfigSettings.SiteEmail %></a>
       that you are taking the case pro bono, so that information can be tracked.
    </p>
    <p><strong><a id="Q18">What if I see the same question over and over, is there something that I can use to provide answers?</a></strong></p>
    <p>
        For the convenience of the attorneys answering the questions, we have provided some basic informational language. This 
        language does not include any advice, only information on where to find more resources on common issues. You will have 
        to include any advice related to the user's specific facts.
    </p>
    <p>
        If there is an area where you see many questions and you feel it would be useful to have some preset
        language, please contact the Administrator.
    </p>
    <p><strong><a id="Q19">Where can I find information related to the question's substantive area of law?</a></strong></p>
    <p>Lawyers can access the Mississippi Volunteer Lawyers Project’s online resource library at <a href="http://www.mvlp.org">www.mvlp.org</a>
        or the Mississippi Legal Services Programs’ websites at <a href="http://www.mslegalservices.org">www.mslegalservices.org</a>
        or <a href="http://www.nmrls.com">www.nmrls.com</a> for additional resources on different areas of substantive law.</p>
    <p><strong><a id="Q20">What if I have further questions or feedback?</a></strong></p>
    <p>
        Contact the administrator at <a href="mailto:mvlp@mvlp.org">mvlp@mvlp.org</a>.
    </p>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
