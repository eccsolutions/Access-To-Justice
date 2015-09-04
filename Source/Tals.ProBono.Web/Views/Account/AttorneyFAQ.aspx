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
    <p><a href="#Q5">What happens if a lawyer cannot answer a user&#39;s question?</a></p>
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
    <p><a href="#Q18">Where can I find information related to the question&#39;s substantive area of law?</a></p>
    <p><a href="#Q19">What if I have further questions or feedback?</a></p>

<div style="margin-top:50px">
   
    <h3><a id="Q1">How does the <%=ConfigSettings.SiteName %> work?</a></h3>
        <p>The Online Arizona Justice system is based on the walk-in clinic or dial-a-lawyer model where clients request brief advice and counsel about a specific civil legal issue from a volunteer lawyer. Lawyers provide information and basic legal advice without any expectation of long-term representation.</p>
        <p>Users sign the user agreement, create a username and password, post a request for legal advice or information, and provide facts about their case that will help the lawyer answer the question. All users are eligible for the program. Those users who are under 125% of the Federal Poverty Guidelines will be indicated as Legal Aid under the Eligibility category. This category is located next to the user&#39;s question. Attorneys who assist these individuals may receive CLE credit for their pro bono time. (See <a href="http://www.azbar.org/cleandmcle/mcle/rule45,arizrsupct" target="_blank" title="Rules of the Supreme Court of Arizona, Rule 45">See Rule 45, Ariz. R. Sup. Ct.</a>) Users who are under 250% of the Federal Poverty Guidelines will be indicated as Modest Means. Modest Means questions and questions by unclassified users will not be eligible for CLE credit, but still will qualify toward pro bono hours.</p>
        <p>Users will be asked to select a category (such as &quot;housing&quot; or &quot;family&quot;) that best describes their question. The lawyer may ask for additional information before responding to the user&#39;s request, but the user will have a choice to respond to that request or not. A user&#39;s name, birthdate, county, opposing party information, and county of venue for open legal matters will be shared with the attorney if provided by user. Users are informed that there is no guarantee that a question will be answered. If a question is not answered within fourteen (14) days, the user will receive an email from the website administrator instructing the user of additional resources and to seek assistance elsewhere.</p>
        <p>Lawyers who would like to participate must create a username and password, provide contact information and their Arizona Bar number, sign the lawyer user agreement, and request approval from the website administrator. Before the lawyer&#39;s account is activated, the website administrator checks to ensure the lawyer is licensed in Arizona, has malpractice insurance (If you do not have malpractice insurance applicable to this pro bono work, please contact <a href="mailto:<%=ConfigSettings.SiteEmail%>"><%=ConfigSettings.SiteEmail%></a> to arrange for coverage under this program) and is in good standing with the State Bar of Arizona. Once a lawyer has been approved by the website administrator, the lawyer receives an email notification and can begin answering user questions.</p>
        <p>Lawyers may then log in at any time to review a list of user questions and select the one(s) they want to answer. Lawyers will use the categories provided by the user to help determine which questions they would like to answer. A lawyer will have the opportunity to read the full question before deciding to take it from the list and answer it. Once a lawyer takes a question from the list, the lawyer has three (3) days to answer it. Lawyers will be allowed to ask follow-up questions through the website if they need additional information in order to answer the user&#39;s question. The lawyer&#39;s name and user name will be revealed to the user. The lawyer’s contact information will not be shared with the user. Once a lawyer answers a question, the user will be asked to accept the answer or they may send a follow up question to the lawyer. The lawyer can control when the question/answer exchange is ended.</p>
        <p>Lawyers may view a list of questions they have chosen but not completed using the navigation on the left side of the screen under Question Center. The word &quot;Taken&quot; will provide a list of all questions chosen by the attorney that have not been closed by clicking on &quot;Taken&quot;. A lawyer may see the entire list of questions available by clicking &quot;Queue&quot;. To view questions that are in danger of being removed from the system lawyers may click on &quot;Longest Wait&quot;.</p>
        <p>Lawyers will be able to view a log of questions they have answered. This log is located under the Profile tab. A yearly total for pro bono hours in this program is also maintained at the bottom of your profile. This total does not indicate the amount of hours earned toward CLE credit. The lawyer&#39;s local Volunteer Lawyers Project will provide CLE credit for eligible pro bono hours. </p>

    <h3><a id="Q2">Who is eligible to use the <%=ConfigSettings.SiteName %>?</a></h3>
        <p>Eligibility for use of the Online Arizona Justice system is limited to the following:</p>
        <ul>
            <li>The user must be an Arizona resident or have an issue in Arizona;</li>
            <li>The user must be at least <%=ConfigSettings.MinimumAgeRequirement %> years of age; and</li>
            <li>The user must provide their name, birthdate and county in order to request advice.</li>
        </ul>
    
    <h3><a id="Q3">Will I earn pro bono hours for participating?</a></h3>
        <p>Lawyers earn pro bono hours for time spent researching and answering questions. Lawyers keep their time and report it in the Online Arizona Justice system before logging out of each session. Lawyers may view the number of hours they have volunteered under their profile.</p>
        <p>The Online Arizona Justice system is available to anyone who has a legal question. Lawyers will earn pro bono hours for all people they assist however, only questions that have been identified as under the 125% of the Federal Poverty Guidelines, by the &quot;Legal Aid&quot; indicator will give an attorney pro bono hours towards CLE credit. Each &quot;Legal Aid&quot; question will be worth 30 minutes of pro bono time. Lawyers may earn up to 1 hour of CLE credit for every five hours, ten questions, of pro bono provided to designated individuals up to a maximum of 5 CLE hours per educational year. See <a href="http://www.azbar.org/cleandmcle/mcle/rule45,arizrsupct" target="_blank" title="Rules of the Supreme Court of Arizona, Rule 45">See Rule 45, Ariz. R. Sup. Ct.</a> for more information.</p>
        <p>All Arizona licensed lawyers who register for the Online Arizona Justice System and answer &quot;Legal Aid&quot; questions will have their information given to their local Volunteer Lawyers Project for enrollment and verification of CLE credit</p>
    
    <h3><a id="Q4">What kinds of lawyers should participate?</a></h3>
        <p>All lawyers are welcome! While there are certain types of legal questions that regularly come up, we need lawyers with different areas of expertise to volunteer. We hope the website will appeal to lawyers who want to give back but have been unable to participate in traditional pro bono work due to family obligations, work limitations, schedule, or geographic location. We also hope to engage lawyers who already provide pro bono and are willing to give more of their time to those who need it.</p>
    
    <h3><a id="Q5">What happens if a lawyer cannot answer a user&#39;s question?</a></h3>
        <p>A lawyer might be unable to answer a user&#39;s question for a number of reasons. Some examples might be a conflict of interest, the user&#39;s failure to respond to lawyer requests for additional information, or the question is determined to fall outside the lawyer&#39;s area of expertise. As a resource to assist in answering questions outside of an area of expertise lawyers can click on the advocate tab on their profile page to access informative CLEs or converse with fellow attorneys about an issue. If a lawyer determines that she cannot answer a question, the lawyer may contact the site administrator to place the question back into the queue so that another volunteer lawyer may try to assist the user. The lawyer should let the administrator know the reason why the question needs to be placed back in the queue by submitting an email to <a href="mailto:<%=ConfigSettings.SiteEmail%>"><%=ConfigSettings.SiteEmail%></a>.</p>
    
    <h3><a id="Q6">What type of relationship exists between the client and lawyer?</a></h3>
        <p>In the event a client submits a question and receives an answer from an attorney, there will be an attorney/client relationship formed between that client and the attorney who responds. That relationship, however, will be limited in scope and duration. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The attorney will provide short-term, limited legal services to the client without expectation by either the attorney or the client that the attorney will provide continuing representation in the matter. If a lawyer would like to provide further assistance to a user please see the <a href="#Q17">What if I want to represent the client in their case?</a> question.</p>
        <p>Both the eligible users and lawyers must consent to the limited nature of this relationship both as to scope and duration as indicated when they accept the terms of the user agreement or <a href="<%=Url.Action("UseAgreement","Account") %>" target="_blank">attorney agreement</a>. Eligible users and lawyers who do not accept the terms of the user agreement will not be allowed access to the site.</p>
        <p>There is no attorney/client relationship between the client and the programs affiliated with this system.</p>

    <h3><a id="Q7">How do lawyers check for conflicts of interest?</a></h3>
    <p>Because of the pro bono publico nature of the limited scope representation provided through the Online Arizona Justice system, Arizona Rules of Professional Conduct <a href="http://www.azbar.org/Ethics/RulesofProfessionalConduct/ViewRule?id=4" target="_blank">1.2(c)</a> and <a href="http://www.azbar.org/Ethics/RulesofProfessionalConduct/ViewRule?id=56" target="_blank">6.5</a> apply to an attorney&#39;s participation in the Online Arizona Justice system. The only conflicts of interest that would preclude an attorney from answering a question for an eligible user of the Online Arizona Justice system are conflicts of interest that the attorney actually knows of at the time that he or she receives or answers a client&#39;s question. Because an attorney is only precluded from answering a question if she or he knows there is a conflict, the possibility exists, and clients agree that they understand, that an attorney who answers a question, or another attorney with whom he or she practices in a firm, may be representing other parties with an interest in the question.</p>
    <p>The client name, birthdate and opposing party name will be provided to the attorney so that the attorney can recognize known conflicts of interest. If, based on the information the client provides, the attorney gains actual knowledge of a conflict of interest precluding her or him from answering, the question will be returned to the queue to be accepted by another volunteer attorney.</p>        
    
    <h3><a id="Q8">What about professional liability insurance coverage?</a></h3>
        <p>Volunteer lawyers who provide brief advice and counsel via the website must be covered by professional malpractice insurance. If you do not have your own malpractice insurance, free malpractice insurance may be acquired through the Arizona Foundation for Legal Services &amp; Education by emailing <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>. If an issue of malpractice arises, the Arizona Foundation for Legal Services &amp; Education can trace each answered question back to the attorney who answered it. They may have to contact lawyers participating in the program from time to time related to this insurance coverage.</p>
        
    <h3><a id="Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a></h3>
        <p>This site is designed to ensure client privacy. Since the web program is administered via email through a platform that limits access based on a screening, confidentiality will be maintained since only the website program administrators have access to content between a client and a lawyer. Information available to the website administrators and the lawyer responding to a client request shall remain confidential, subject to the limitations of the Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in the Online Arizona Justice system are retained on the website database but will not be used for any purposes outside the scope of this website program. Measures will be taken to maintain the security of this database but as with all internet based systems an absolute guarantee of security is not possible.</p>
        <p>For each visitor to the Webpage the web server automatically recognizes only the consumer domain name. This is the information that is collected for statistical purposes.</p>
        <p>Aggregate information is collected on the pages the consumers accesses or visits on this website.</p>
        <p>The information collected is used to improve the content of the legal help websites working alongside this website program and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>

    <h3><a id="Q10">Navigating the Website and Selecting Questions to Answer</a></h3>
        <p>When your account has been approved by the website administrator, you will receive a notification email. To get started you will go to <a href="<%=ConfigSettings.SiteUrl%>"><%=ConfigSettings.SiteUrl %></a> and select &quot;Sign In&quot; at the top right side of your screen. After you enter your username and password, you will automatically be directed to a page that lists all the questions that have been posted for lawyers to answer.</p>
        <p>You will notice that the questions are color-coded. This color-coding lets you know how long each question has been in the queue. Green questions are those that have been posted within the past five (5) days; yellow questions are those that have been posted within the last 6-10 days; and red questions are those that have been in the queue for over ten (10) days and will be closed if no lawyer is able to answer them. Questions that are not answered within fourteen (14) days will be closed and the client will be notified.</p>
        <p>Questions are also given an eligibility ranking and a category. Categories are the areas of law that are provided on the site while eligibility indicates the user&#39;s financial status. Users who meet the legal aid requirements and are at or below 125% of the federal poverty guidelines are indicated by a legal aid designation; answering these questions and <strong>only</strong> these questions will earn an attorney pro bono hours that can be accrued toward CLE credit. (See Rule 45, Ariz. R. Sup. Ct.) Answering other questions designated as Modest Means or left blank (above income) will still be eligible for pro bono hours. </p>
        <p>You have three ways in which to view questions in the queue:</p>
        <ol>
            <li>You can view a list of all the questions in the queue; this is the default view.</li>
            <li>You can view a list of questions that have been in the queue for ten (10) days or longer by clicking on the &quot;Longest Wait&quot; option on the left side of your screen under the Question Center sidebar.</li>
            <li>You can view questions by legal categories by clicking on the &quot;Practice Areas&quot; tab at the top of the screen. You will notice that each question has a &quot;Category&quot; and a &quot;Subject.&quot; Clients are asked to pick the Category that best describes their question. The Categories are listed as follows: Family and Children, Housing, Consumer Issues, Debt and Bankruptcy, Work, Immigration, Disability, Health Care, Public Benefits, Education, Criminal Law, Veterans, Discrimination, Seniors, Other, and Abuse and Violence. </li>
        </ol>
        <p>You can easily view any question you have taken to answer by clicking on the &quot;Taken&quot; option on the left side of your screen under the sidebar labeled Question Center.</p>
        <p>The client is asked to use the Subject line to tell you, in their own words, what the question is about (for example, eviction, divorce, etc.). The Category and Subject functions are tools to help lawyers quickly decide which questions they would like to review and answer.</p>

    <h3><a id="Q11">Selecting Questions You Want to Answer</a></h3>
        <p>You can read the first few lines of each posted question by moving your mouse over the Subject line. This feature will allow you to review questions before you select the &quot;Take&quot; button. When you have found a question you&#39;d like to answer, click the &quot;Take&quot; button to the left of the question. You will be asked if you are sure you want to take the question. Click &quot;yes&quot; and the question will now appear under the &quot;My Taken Questions&quot; tab at the top of the screen. This screen allows you to quickly see which questions you have taken and track the activity on each. Please respond within three (3) days of taking a question.</p>
        <p>Once you have taken the question, you will be able to reply to the client and provide an answer or ask follow-up questions. If you ask the client a question, you will receive an email when the client responds and a prompt to log back into the website to respond. The client will be given your name but no other information. None of your contact information will be shared unless you choose to provide it to the client.</p>    

    <h3><a id="Q12">How Do I Subscribe to a Category</a></h3>
        <p>If your area of practice is specialized and you only want to answer certain types of questions, you can subscribe to a Category and receive an email notification each time a question in that particular Category is posted.</p>
        <p>To subscribe to a Category (for example, immigration), click on the &quot;Practice Areas&quot; tab at the top of the screen, scroll down to the Category you are interested in and click on the &quot;Subscribe&quot; button. You will be asked if you are sure that you want to subscribe to the category. You will then enter your email address and click &quot;Subscribe.&quot; You can unsubscribe at any time.</p>
        
    
    <h3><a id="Q13">Entering Pro Bono Hours</a></h3>
        <p>Each time you log out of the website, you will be prompted to enter the time you have spent researching and answering questions. You may log your time in 15-minute increments. You may view your hours at any time by clicking on &quot;My Profile&quot; at the top of the page.</p>
    
    <h3><a id="Q14">How do I contact the administrator with a question?</a></h3>
        <p>If you have a question or run into a technical problem with the site, you may contact the administrator by clicking the email address <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> located at the bottom of the page.</p>
    
    <h3><a id="Q15">What if I think the user needs more help?</a></h3>
        <p>If you believe that the user requires more legal assistance than can be provided through the Online Arizona Justice system, and you do not wish to provide it, you can refer the user to <a href="http://azlawhelp.org/" target="_blank">AZLawHelp.org</a>. Also, if the user has indicated s/he is a veteran, refer them to lawforveterans.org or if the user is a senior then refer to lawforseniors.org These website provides a number of services and information that users may find helpful including the Arizona&#39;s Access to Justice Online Intake form and Legal LEARN number.</p>
    
    <h3><a id="Q16">How do I make a referral?</a></h3>
        <p>To provide a user with a referral to a legal aid organization provide the following link: <a href="http://www.azlawhelp.org/accessToJustice.cfm" target="_blank">http://www.azlawhelp.org/accessToJustice.cfm</a>. To provide a user with a comprehensive list of referral choices provide the following link: <a href="http://www.azlawhelp.org/legalaidlisting.cfm" target="_blank">http://www.azlawhelp.org/legalaidlisting.cfm</a>. If the user is a veteran provide this link: <a href="http://lawforveterans.org/legal-resources" target="_blank">http://lawforveterans.org/legal-resources</a>.</p>
    
    <h3><a id="Q17">What if I want to represent the client in their case?</a></h3>
        <p>Attorneys who wish to extend their attorney client relationship may do so, but must follow the following rules:</p>
        <ol>
            <li>Users have been advised and agreed to not request representation beyond asking their questions. Attorneys may broach further representation with their limited-scope clients, in compliance with Ethical Rule 7.3. </li>
            <li>Users who are indicated as &quot;Legal Aid&quot; must first be directed to the Arizona&#39;s Access to Justice Online Intake system located here: <a href="http://azlawhelp.org/accessToJustice.cfm" target="_blank">http://azlawhelp.org/accessToJustice.cfm</a> to check for eligibility before being taken as a client.</li>
            <li>All users who are indicated as &quot;Legal Aid&quot; and are unable to be assisted by a legal aid organization and users who are indicated as &quot;Modest Means&quot;, under the eligibility category, must be offered services at either pro bono or at a maximum rate of $75 per hour. </li>
            <li>Users who have been designated as &quot;--&quot; under the eligibility category may be assisted at any reasonable rate negotiated between attorney and client.</li>
            <li>Representation of a client is outside the scope of the website&#39;s user agreement and the attorney must enter into a new agreement with the client. Contact and correspondence with the client should then be conducted outside of the <%=ConfigSettings.SiteName %>. </li>
            <li>Attorneys who agree to provide additional legal assistance must also notify the website administrators at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> that you have offered and the user has accepted an agreement for additional legal services, so that information can be tracked for administrative purposes and to measure the total impact of the program.</li>
        </ol>
    
    <h3><a id="Q18">What if I see the same question over and over, is there something that I can use to provide answers?</a></h3>
        <p>For the convenience of the attorneys answering the questions, we have provided some basic informational language under the advocate tab. This language does not include any advice, only information on where to find more resources on common issues. You will have to include any advice related to the user&#39;s specific facts.</p>
        <p>If there is an area where you see many questions and you feel it would be useful to have some preset language, please contact the Administrators at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>.</p>
    
    <h3><a id="Q19">Where can I find information related to the question's substantive area of law?</a></h3>
        <p>CLEs and CLE information can be found on the advocate tab for various areas of law. The Forum tab also allows attorneys to communicate with other volunteer attorneys about any questions they may have.</p>
    
    <h3><a id="Q20">What if I have further questions or feedback?</a></h3>
        <p>Contact the administrator at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> or <a href="https://www.surveymonkey.com/s/onlineazjustice" target="_blank">click here to answer a short survey</a>.</p>

</div>

    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
