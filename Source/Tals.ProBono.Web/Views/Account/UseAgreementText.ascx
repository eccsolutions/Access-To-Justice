<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>

    <h2>Terms and Conditions of the <%=ConfigSettings.SiteName %></h2>

    <p><%=ConfigSettings.SiteName %> is a website program administered by the Arizona Foundation for Legal Services & Education, under the Legal LEARN Contact Center, a joint program with the Arizona State Bar, and in partnership with the Volunteer Lawyers Programs of Community Legal Services, Southern Arizona Legal Aid and DNA People&#39;s Legal Services. The primary purpose of the website is to increase access to advice and information about legal matters to those who cannot afford it. There is no fee for the use of the system or for the advice and information provided by the attorneys on the system. Because the advice provided is from volunteer attorneys, and not from anyone employed or supervised by the programs, they cannot guarantee the accuracy of the advice given.</p>

    <h3>Who Can Use The <%=ConfigSettings.SiteName %></h3>
        <p>Eligibility for use of the Online Arizona Justice system is limited to the following:</p>
        <ul>
            <li>The user must live or have a legal issue in Arizona,</li>
            <li>The user must be at least <%=ConfigSettings.MinimumAgeRequirement %> years old, and</li>
            <li>The user must provide their name, birthdate and county in order to request advice.</li>
        </ul>
        <p>Before users are allowed to request legal advice, they will be asked questions to establish eligibility. Users agree to answer those questions truthfully.</p>
        <p>The information that users provide and the questions asked will not be shared with outside entities except for attorneys authorized to participate in the system under this agreement.</p>
        <p>Users must provide their name, birthdate and county in order to ask for advice. Subject to the Privacy Policy below, only the user&#39;s name, birthdate, county, venue county (if applicable), and opposing party information (if applicable) is shared with the attorney.</p>
        <p>If a user is not eligible to use the system, the user will be denied access to it and provided with some alternate resources for help.</p>

    <h3>What Happens When Users Use The <%=ConfigSettings.SiteName %></h3>
        <p>After eligibility is established, the user will create a username and password.</p>
        <p>The user will post a request for legal advice and provide facts that will help the attorney answer the question.</p>
        <p>Attorneys licensed in Arizona who have been authorized to use the system may respond to user requests on a pro bono basis.</p>
        <p>Attorneys wishing to offer pro bono advice must first log into the website. Attorneys can select questions to answer based on the area of law they choose. The attorney may ask for additional information before responding to the user&#39;s request. The user can choose whether to respond to the request.</p>
        <p>If the attorney needs to review a client&#39;s document(s) before answering a question, the attorney may do so by asking the client to provide the document and giving the client contact information to exchange the document. However, the attorney must respond to the client&#39;s question via the website. After questions are answered attorneys may offer additional assistance to a user but to do so is considered outside the scope of this program. If an attorney does decide to provide further representation to the user the rules set forth in this document must be followed; see the &quot;Accepting Cases for Further Representation&quot; section for more information.</p>
        <p>If an attorney responds to a user&#39;s request, the user will receive a written response through the website.</p>
        <p>The attorney will respond based on Arizona and/or federal law.</p>
        <p>If no attorney responds to a question after fourteen (14) days, the question will be removed and the Arizona Foundation for Legal Services &amp; Education will notify the user and provide alternate resources.</p>
        <p>Users will be able to see the attorney&#39;s first and last name as well as their username for the system. No other personal information will be provided.</p>

    <h3>Attorney/Client Relationship</h3>
        <p>This is a Pro Bono Limited Legal Service program administered by Arizona Foundation for Legal Services &amp; Education pursuant to Ethical Rule 6.5 of the Arizona Rules of Professional Conduct.</p>
        <p>In the event a client submits a question and receives an answer from an attorney, there will be an attorney/client relationship formed between that client and the attorney who responds. That relationship, however, will be limited in scope and duration as described in this agreement. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The attorney will provide short-term, limited legal services to the client without expectation by either the attorney or the client that the attorney will provide continuing representation in the matter.</p>
        <p>Attorneys who wish to extend their attorney client relationship may do so, but must follow the rules listed in &quot;Accepting Cases For Further Representation&quot; section of this document.</p>
        <p>There is no attorney/client relationship between the client and Arizona Foundation for Legal Services &amp; Education or the Volunteer Lawyers Programs.</p>

    <h3>Conflicts</h3>
        <p>Because of the pro bono publico nature of the limited scope representation provided through the Online Arizona Justice system, Arizona Rules of Professional Conduct <a href="http://www.azbar.org/Ethics/RulesofProfessionalConduct/ViewRule?id=4" target="_blank">1.2(c)</a> and <a href="http://www.azbar.org/Ethics/RulesofProfessionalConduct/ViewRule?id=56" target="_blank">6.5</a> apply to an attorney&#39;s participation in the <%=ConfigSettings.SiteName %>. The only conflicts of interest that would preclude an attorney from answering a question for an eligible user of the <%=ConfigSettings.SiteName %> are conflicts of interest that the attorney actually knows of at the time that he or she receives or answers a client&#39;s question. Because an attorney is only precluded from answering a question if she or he knows there is a conflict, the possibility exists, and clients agree that they understand, that an attorney who answers a question, or another attorney with whom she practices in a firm, may be representing other parties with an interest in the question.</p>
        <p>The client name, birthdate and opposing party name (if any) will be provided to the attorney so that the attorney may recognize known conflicts of interest. If, based on the information the client provides, the attorney gains actual knowledge of a conflict of interest precluding him or her from answering, the question will be returned to the queue for possible response by another volunteer attorney.</p>
        <p>Once the attorney accepts the client&#39;s question and begins to offer advice through the <%=ConfigSettings.SiteName %>, the attorney should add that client&#39;s name to the attorney&#39;s conflict checking system for future conflict checks.</p>
    
    <h3>Accepting Cases for Further Representation</h3>
        <p>Attorneys who wish to extend their attorney client relationship may do so, but must follow the following rules:</p>
        <ol>
            <li>Users have been advised and agreed to not request representation beyond asking their questions. Attorneys may broach further representation with their limited-scope clients, in compliance with Ethical Rule 7.3. </li>
            <li>Users who are indicated as &quot;Legal Aid&quot; must first be directed to the Arizona&#39;s Access to Justice Online Intake system located here: <a href="http://azlawhelp.org/accessToJustice.cfm" target="_blank">http://azlawhelp.org/accessToJustice.cfm</a> to check for eligibility before being taken as a client.</li>
            <li>All users who are indicated as &quot;Legal Aid&quot; and are unable to be assisted by a legal aid organization and users who are indicated as &quot;Modest Means&quot;, under the eligibility category, must be offered services at either pro bono or at a maximum rate of $75 per hour. </li>
            <li>Users who have been designated as &quot;--&quot; under the eligibility category may be assisted at any reasonable rate negotiated between attorney and client.</li>
            <li>Representation of a client is outside the scope of the website&#39;s user agreement and the attorney must enter into a new agreement with the client. Contact and correspondence with the client should then be conducted outside of the <%=ConfigSettings.SiteName %>. </li>
            <li>Attorneys who agree to provide additional legal assistance must also notify the website administrators at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a> that you have offered and the user has accepted an agreement for additional legal services, so that information can be tracked for administrative purposes and to measure the total impact of the program.</li>
        </ol>
        <p>This website only covers the limited scope representation of providing an answer to a legal question through the <%=ConfigSettings.SiteName %>. This website does not cover any continuing representation of the client beyond the act of providing an answer to a question through this website.</p>
    
    <h3>Privacy Policy/Confidentiality Statement</h3>
        <p>The <%=ConfigSettings.SiteName %> is administered by the Arizona Foundation for Legal Services &amp; Education. This site is designed to guard client privacy. Information available to Arizona Foundation for Legal Services &amp; Education and the attorney responding to a client request shall remain confidential, subject to the limitations of this Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in the <%=ConfigSettings.SiteName %> are retained on the website database but will not be used for any purposes outside the scope of this website program. Measures will be taken to maintain the security of this database but as with all internet based systems an absolute guarantee of security is not possible.</p>
        <p>Attorneys who register for the <%=ConfigSettings.SiteName %> and answer &quot;Legal Aid&quot; designated questions will have their information reported to their local Volunteer Lawyer Program; who will register that individual and verify their pro bono CLE credits hours available to them under <a href="http://www.azbar.org/cleandmcle/mcle/rule45,arizrsupct" target="_blank">Rule 45(a)(5), Ariz. R. Sup.Ct.</a>.</p>
        <p>For each visitor to the Webpage the web server automatically recognizes only the consumer domain name. This is the information that is collected for statistical purposes.</p>
        <p>Aggregate information is collected on the pages the consumers accesses or visits on this website.</p>
        <p>The information collected is used to improve the content of the legal help websites working alongside this website program and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>
        <p>With respect to cookies: Two non-personal temporary cookies are sent. These are eliminated when you log out of the site.</p>

    <h3>Agreement</h3>
        <p>If you do not agree to the terms and conditions of the <%=ConfigSettings.SiteName %>, you will not be able to use the system.</p>
        <p>By clicking the &quot;I agree&quot; button, you agree:</p>
        <ul>
            <li>You have read the terms and conditions of the <%=ConfigSettings.SiteName %>,</li>
            <li>You consent to the limited nature of the attorney/client relationship both as to scope and duration,</li>
            <li>You are licensed to practice law in Arizona and you will respond to the question based on Arizona and/or federal law,</li>
            <li>You agree you have and will maintain professional malpractice insurance, </li>
            <li>If you accept a case from the <%=ConfigSettings.SiteName %> for additional representation you will notify Arizona Foundation for Legal Services &amp; Education by sending an e-mail to <a href="<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a></li>
            <li>If you accept a &quot;Legal Aid&quot; case you will first instruct the user to apply online at Arizona&#39;s Access to Justice Online Intake system,</li>
            <li>If you accept a case from the <%=ConfigSettings.SiteName %> you will only charge a maximum rate of $75 per hour to &quot;Modest Means&quot; and &quot;Legal Aid&quot; clients, and</li>
            <li>The information that you will provide is true and correct.</li>
        </ul>
</div>

