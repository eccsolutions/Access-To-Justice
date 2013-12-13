<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Online Tennessee Justice - Attorney Sign Up FAQ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Attorney Sign Up - Frequently Asked Questions</h2>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-bottom: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
    <p>
        <a href="http://www.youtube.com/watch?v=Z4uesStFQUw" target="_blank">Watch an instruction video for attorneys</a>
    </p>
    <p>
        <strong>How does OnlineTNJustice work?</strong></p>
    <p>
        OnlineTNJustice is based on the walk-in clinic or dial-a-lawyer model where clients
        request brief advice and counsel about a specific civil legal issue from a volunteer
        lawyer. Lawyers provide information and basic legal advice without any expectation
        of long-term representation.</p>
    <p>
        Users who meet eligibility (see <strong>Eligibility</strong> below) sign the
        <%: Html.ActionLink("use agreement", "AttorneyUseAgreement", "Account",null)%>
        , create a username and password, post a request for legal advice information and
        provide facts about their case that will help the lawyer answer the question. Users
        will be asked to select a category (such as “housing” or “debt”) that best describes
        their question. The lawyer may ask for additional information before responding
        to the user’s request, but the user will have a choice to respond to that request
        or not. Users will provide their name, but no other identifying information will
        be shared with the volunteer lawyer. Users are informed that there is no guarantee
        that a question will be answered. If a question is not answered within 30 days,
        the user will receive an email from the website administrator instructing them to
        seek assistance elsewhere. The user will also be provided with a list of additional
        resources.</p>
    <p>
        Lawyers who would like to participate must create a username and password, provide
        contact information and their BPR number,
        <%: Html.ActionLink("sign the lawyer use agreement", "AttorneyUseAgreement", "Account",null)%>
        and request approval from the website administrator. Before the lawyer’s account
        is activated, the website administrator checks to ensure the lawyer is licensed
        in Tennessee and is in good standing with the Tennessee Board of Professional Responsibility.
        Once a lawyer has been approved by the website administrator, the lawyer receives
        an email notification and can begin answering user questions.</p>
    <p>
        Lawyers may log in at any time to review a list of user questions and select the
        one(s) they want to answer. Lawyers will use the categories provided by the user
        (such as “housing” or “debt”) to help determine which questions they would like
        to answer. A lawyer will have the opportunity to read the full question before deciding
        to take it from the list and answer it. Once a lawyer takes a question from the
        list, the lawyer has 3 days to answer it. Lawyers will be allowed to ask follow
        up questions via email if they need additional information in order to answer the
        user’s question. The lawyer’s identity is not revealed to the user unless the lawyer
        decides to do so. Once a lawyer answers a question, the user will be asked to accept
        the answer or send a follow up question to the lawyer.</p>
    <p>
        Lawyers will be able to view a log of questions they have answered.</p>
    <p>
        <strong>Who is eligible to use OnlineTNJustice?</strong></p>
    <p>
        Eligibility for use of OnlineTNJustice is limited to the following:</p>
    <ul>
        <li>The user must have household income less than 250% of the federal poverty level;</li>
        <li>The user may not have liquid assets exceeding $5,000 in value (this includes checking
            and savings account balances, as well as the value of any stocks or bonds);</li>
        <li>The user may not be incarcerated;</li>
        <li>The user may not request assistance with criminal law matters.</li>
    </ul>
    <p>
        Users must provide their name and zip code in order to request advice.</p>
    <p>
        Users agree to post no more than 3 legal questions per year.</p>
    <p>
        <strong>Will I earn CLE credit?</strong></p>
    <p>
        Lawyers earn CLE credit for time spent researching and answering questions. Lawyers
        keep up with their time and report it in the OnlineTNJustice system before logging
        out of each session. The website administrator will file for CLE credits on a quarterly
        basis. Lawyers may earn up to 1 hour of ethics & professionalism (EP) credit for
        every five hours of pro bono provided.</p>
    <p>
        <strong>What kinds of lawyers should participate?</strong></p>
    <p>
        All lawyers are welcome! While there are certain types of legal questions that regularly
        come up at legal clinics, we need lawyers with different areas of expertise and
        practice to volunteer. We hope the website will appeal to lawyers who want to give
        back but have been unable to participate in traditional pro bono work due to family
        obligations, schedule or geographic location. We also hope to engage lawyers who
        already provide pro bono and are willing to give more of their time to those who
        need it.</p>
    <p>
        <strong>What happens if a lawyer cannot answer a user’s question?</strong></p>
    <p>
        A lawyer might be unable to answer a user’s question for a number of reasons. Some
        examples might be a conflict of interest, user’s failure to respond to lawyer requests
        for additional information or the question is determined to fall outside the lawyer’s
        area of expertise. . Lawyers will have access to brochures on various areas of substantive
        law to help them answer questions. If a lawyer determines that (s)he cannot answer
        a question, the lawyer may contact the site administrator to place the question
        back into the queue so that another volunteer lawyer may try to assist the user.
        The lawyer should let the administrator know the reason why the question needs to
        be placed back in the queue.</p>
    <p>
        <strong>What type of relationship exists between the client and lawyer?</strong></p>
    <p>
        When a user submits a question and receives an answer from a lawyer, there will
        be a lawyer/client relationship formed between that client and the lawyer who responds.
        That relationship, however, will be limited in scope and duration as described in
        the use agreements for both users and lawyers. The representation will be limited
        to providing an answer to the legal question and will not involve any continuing
        representation of the client beyond the act of providing such an answer. The lawyer
        will provide short-term, limited legal services to a client (the eligible user of
        this site) without expectation by either the lawyer or the client (the eligible
        user of this site) that the lawyer will provide continuing representation in the
        matter. Both the eligible users and lawyers must consent to the limited nature of
        this relationship both as to scope and duration as indicated when they accept the
        terms of the use agreement. Eligible users and lawyers who do not accept the terms
        of the use agreement will not be allowed access to the site.</p>
    <p>
        <strong>How do lawyers check for conflicts of interest?</strong></p>
    <p>
        Under Tennessee law (RPC 1.2(c) and 6.5), because of the pro bono publico nature
        of the limited scope representation provided through OnlineTNJustice and because
        of the involvement of TALS as the administrator, the general rules for lawyers as
        to conflicts of interest do not apply to lawyers’ participation in OnlineTNJustice.
        Instead, the only conflicts of interest that would preclude a lawyer from answering
        a question for an eligible user of OnlineTNJustice are conflicts of interest that
        the lawyer actually knows of at the time that they receive or answer a client’s
        question. This means that the possibility exists, and the clients agree that they
        understand, that a lawyer who answers a question, or another lawyer with whom they
        practice in a firm, may actually be representing other parties with an interest
        in the question. The user’s name will be provided to the lawyer so that the lawyer
        can make sure not to answer the question if the lawyer knows that (s)he would have
        a conflict of interest. If based on the information the user provides, whether user
        name or any details of the question, the lawyer actually knows of a conflict of
        interest precluding him from answering, the question will be referred to another
        volunteer lawyer.</p>
    <p>
        <strong>What about professional liability insurance coverage?</strong></p>
    <p>
        Volunteer lawyers who provide brief advice and counsel via the website will be covered
        by professional liability insurance maintained by TALS. TALS has a specific pro
        bono rider to its general organizational policy for this purpose. If an issue of
        malpractice arises, TALS can trace each answered question back to the attorney who
        answered it. TALS may have to contact lawyers participating in the program from
        time to time related to this insurance coverage.</p>
    <p>
        <strong>Is there a confidentiality issue with client information/lawyer advice being
            housed on the internet?</strong></p>
    <p>
        This site is designed to insure client privacy. Since the web program is administered
        via email through a platform that limits access based on a screening, confidentiality
        will be maintained since only the website administrator has access to content between
        a client and a lawyer. Information available to the website administrator and the
        lawyer responding to a client request shall remain confidential, subject to the
        limitations of the Privacy/Confidentiality Policy. However, client requests for
        information and the response of the lawyers participating in OnlineTNJustice may
        be maintained in a database for review in order to measure the effectiveness of
        the project. Steps will be taken to maintain the security of this database and it
        will only be utilized by the administrator but an absolute guarantee of security
        is not possible when using the internet and internet based systems.</p>
    <p>
        For each visitor to the Webpage the web server automatically recognizes only the
        consumer domain name. This is the information that is collected for statistical
        purposes.</p>
    <p>
        Aggregate information is collected on the pages consumers access or visit on this
        website.</p>
    <p>
        The information collected is used to improve the content of the Web page and is
        not shared with other organizations for commercial purposes. Information may be
        disclosed when legally required at the request of government authorities conducting
        an investigation, to verify or enforce compliance with the policies governing our
        website and applicable laws or to protect against misuses or unauthorized use of
        our website.</p>
    <p>
        <strong>Navigating the Website and Selecting Questions to Answer</strong></p>
    <p>
        When your account has been approved by the website administrator, you will receive
        a notification email. To get started you will go to <a href="http://www.onlinetnjustice.org">
            www.onlinetnjustice.org</a> and select “Sign In” at the top right side of your
        screen. After you enter your username and password, you will automatically be directed
        to a page that lists all the questions that have been posted for lawyers to answer.
    </p>
    <p>
        You will notice that the questions are color-coded. This color-coding lets you know
        how long each question has been in the queue. Green questions are those that have
        been posted within the past 10 days; yellow questions are those that have been posted
        for more than 10 days; and red questions are those that have been in the queue for
        at least 25 days and will be closed if no lawyer is able to answer them. Questions
        that are not answered within 30 days will be closed and the client will be notified.
    </p>
    You have three ways in which to view questions in the queue:
    <ol>
        <li>You can view a list of all the questions in the queue; this is the default view.</li>
        <li>You can view a list of questions that have been in the queue for 25 days or longer
            by clicking on the “Urgent” option on the left side of your screen.</li>
        <li>You can view questions by legal categories by clicking on the “Practice Areas” tab
            at the top of the screen. The list of Categories is as follows: benefits, debt &
            purchases, family, health care, housing, immigration/citizenship, other, school/juvenile,
            seniors and work. You will notice that each question has a “Category” and a “Subject.”
            Clients are asked to pick the Category that best describes their question. The Categories
            are listed as follows: <i>benefits, debt & purchases, family, health care, housing,
                immigration/citizenship, other, school/juvenile, seniors and work.</i></li>
        <li>You can easily view any question you have taken to answer by clicking on the "Taken"
            option on the left side of your screen.</li>
    </ol>
    <p>
        The client is asked to use the Subject line to tell you, in their own words, what
        the question is about (for example, eviction, divorce, bankruptcy, etc.). The Category
        and Subject functions are tools to help lawyers quickly decide which questions they
        would like to review and answer.
    </p>
    <p>
        <strong>Selecting Questions You Want to Answer</strong></p>
    <p>
        You can read the first few lines of each posted question by moving your mouse over
        the Subject line. This feature will allow you to review questions before you select
        the “Take” button. When you have found a question you’d like to answer, click the
        “Take” button to the left of the question. You will be asked if you are sure you
        want to take the question. Click “yes” and the question will now appear under the
        “My Taken Questions” tab at the top of the screen. This screen allows you to quickly
        see which questions you have taken and track the activity on each. Please respond
        within 3 days of taking a question. If you fail to respond within 3 days, the question
        will be moved back into the queue.</p>
    <p>
        Once you have taken the question, you will be able to reply to the client and provide
        an answer or ask follow up questions. The client will not know your identity unless
        you choose to provide it. If you ask the client a question, you will receive an
        email when the client responds and a prompt to log back into the website to respond.</p>
    <p>
        <strong>How Do I Subscribe to a Category</strong></p>
    <p>
        If your area of practice is specialized and you only want to answer certain types
        of questions, you can subscribe to a Category and receive an email notification
        each time a question in that particular Category is posted.</p>
    <p>
        To subscribe to a Category (for example, immigration), click on the “Practice Areas”
        tab at the top of the screen. Scroll down to the Category you are interested in
        and click on the “Subscribe” button. You will be asked if you are sure that you
        want to subscribe to the category. You will then enter your email address and click
        “Subscribe.” You can unsubscribe at any time.
    </p>
    <p>
        <strong>Entering Hours for CLE Credit</strong></p>
    <p>
        Each time you attempt to log out of the website, you will be prompted to enter the
        time you have spent researching and answering questions. You may log your time in
        15-minute increments. TALS will report your CLE credit to the CLE Commission on
        a quarterly basis. You may view your hours at any time by clicking on “My Profile”
        at the top of the page.
    </p>
    <p>
        <strong>How do I contact the administrator with a question?</strong></p>
    <p>
        If you have a question or run into a technical problem with the site, you may contact
        the administrator by clicking on the “Help” link located at the bottom of the page.</p>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
