<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <h2>Terms and Conditions of the <%=ConfigSettings.SiteName %></h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>
    
    <p>The <%=ConfigSettings.SiteName %> is a website operated by the Arizona Foundation for Legal Services &amp; Education in partnership with the Volunteer Lawyers Programs of Community Legal Services, Southern Arizona Legal Aid and DNA People’s Legal Services. The purpose of the website is to increase access to advice and information about legal matters to those who cannot afford it. There is no fee for the use of the system or for the advice and information provided by the attorneys on the system. Because the advice provided is from volunteer attorneys, and not from anyone employed or supervised by the Arizona Foundation for Legal Services &amp; Education they cannot guarantee the accuracy of the advice given.</p>

    <h3>Who Can Use The <%=ConfigSettings.SiteName %></h3>
        <p>Eligibility for use of the Online Arizona Justice system is limited to the following:</p>
        <ul>
            <li>The user must be an Arizona resident or have an issue in Arizona;</li>
            <li>The user must be at least <%=ConfigSettings.MinimumAgeRequirement %> years of age; and</li>
            <li>The user must provide their name and county in order to request advice.</li>
        </ul>
        <p>Before users are allowed to request legal advice, they will be asked questions to establish eligibility. Users agree to answer those questions truthfully.</p>
        <p>The information that users provide to these questions will not be shared with anyone, including the attorney who responds to the user's request.</p>
        <p>Users must provide their name and county in order to ask for advice. Subject to the Privacy Policy below, only the user’s name, county, venue county (if applicable), and opposing party information (if applicable) is shared with the attorney.</p>
        <p>If a user is not eligible to use the system, the user will be denied access to it and provided with some alternate resources for help.</p>

    <h3>What Happens When Users Use The <%=ConfigSettings.SiteName %></h3>
        <p>After eligibility is established, the user will create a username and password.</p>
        <p>The user will post a request for legal advice and provide facts that will help the attorney answer the question.</p>
        <p>Attorneys licensed in Arizona who have been authorized to use the system and will respond to user requests.</p>
        <p>Attorneys wishing to offer pro bono advice must first log into the website. Attorneys can select questions to answer based on the area of law they choose. The attorney may ask for additional information before responding to the user's request. The user can choose whether to respond to that request.</p>
        <p>If the attorney needs to review a client’s document(s) before answering a question, the attorney may do that by asking the client to provide the document and giving the client contact information to exchange the document. However, the attorney must respond to the client's question only via the website. After questions are answered attorneys may take on cases at a $75 per hour rate but to do so is considered outside the scope of this program.</p>
        <p>If an attorney responds to a user's request, the user will receive a written response through the website.</p>
        <p>The attorney will respond based on Arizona and/or federal law.</p>
        <p>Attorneys may decline to respond to questions. If no attorney responds to a question after fourteen (14) days, the question will be removed and the Arizona Foundation for Legal Services &amp; Education will notify the user.</p>
        <p>Users will not know the name of the attorney who answers their question.</p>

    <h3>Attorney/Client Relationship</h3>
        <p>This is a Pro Bono Limited Legal Services program administered by Arizona Foundation for Legal Services &amp; Education pursuant to Rule 6.5 of the Rules of Professional Conduct.</p>
        <p>In the event a client submits a question and receives an answer from an attorney, there will be an attorney/client relationship formed between that client and the attorney who responds. That relationship, however, will be limited in scope and duration as described in this agreement. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The attorney will provide short-term, limited legal services to the client without expectation by either the attorney or the client that the attorney will provide continuing representation in the matter.</p>
        <p>Attorneys may ask the client to take their case after answering their questions but this is outside the scope of this program. Attorneys who do take on clients <strong>must</strong> charge clients a maximum rate of $75 per hour rate.</p>
        <p>There is no attorney/client relationship between the client and Arizona Foundation for Legal Services &amp; Education.</p>

    <h3>Conflicts</h3>
        <p>Because of the pro bono publico nature of the limited scope representation provided through the <%=ConfigSettings.SiteName %> Arizona Rules of Professional Conduct 1.2(c) and 6.5 apply to an attorney’s participation in the <%=ConfigSettings.SiteName %>. The only conflicts of interest that would preclude an attorney from answering a question for an eligible user of the <%=ConfigSettings.SiteName %> are conflicts of interest that the attorney actually knows of at the time that she receives or answers a client's question. Because an attorney is only precluded from answering a question if she knows there is a conflict, the possibility exists, and clients agree that they understand, that an attorney who answers a question, or another attorney with whom she practices in a firm, may be representing other parties with an interest in the question.</p>
        <p>The client name and opposing party name will be provided to the attorney so that the attorney can recognize known conflicts of interest. If, based on the information the client provides, the attorney gains actual knowledge of a conflict of interest precluding her from answering, the question will be returned to the queue to be accepted by another volunteer attorney.</p>
        <p>Once the attorney accepts the client’s question and begins to offer advice through the <%=ConfigSettings.SiteName %>, the attorney should add that client’s name to the attorney’s conflict checking system for future conflict checks. Rule 6.5 states that any conflicts generated from pro bono publico limited scope representation will not be imputed to a lawyer’s firm unless the lawyer knows that another lawyer associated with the lawyer in a law firm is disqualified by Rule 1.7 or 1.9(a) with respect to the matter. Here, this means conflicts created by a volunteer attorney’s limited scope representation through the <%=ConfigSettings.SiteName %> will not be imputed to other members of the volunteer attorney’s firm unless the volunteer attorney knows another lawyer in the firm is disqualified.</p>
    
    <h3>Accepting Cases for Further Representation</h3>
        <p>This website only covers the limited scope representation of providing an answer to a legal question through the <%=ConfigSettings.SiteName %>. This website does not cover any continuing representation of the client beyond the act of providing an answer to a question through this website.</p>
        <p>Arizona Foundation for Legal Services &amp; Education would like to keep track of any cases that are accepted for further representation. If an attorney chooses to extend representation of a client beyond advice offered through the <%=ConfigSettings.SiteName %> website, that attorney is asked to contact <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>.</p>
        <p>Attorneys who wish to extend representation may do so at a maximum rate of $75 per hour. Attorneys who charge a rate higher than $75 per hour may be removed from the <%=ConfigSettings.SiteName %>.</p>
    
    <h3>Privacy Policy/Confidentiality Statement</h3>
        <p>The <%=ConfigSettings.SiteName %> is administered by the Arizona Foundation for Legal Services &amp; Education. This site is designed to guard client privacy. Information available to Arizona Foundation for Legal Services &amp; Education and the attorney responding to a client request shall remain confidential, subject to the limitations of this Privacy/Confidentiality Policy. However, client requests for information and the response of the attorneys participating in the <%=ConfigSettings.SiteName %> will be maintained in a database for review in order to measure the effectiveness of the project. Steps will be taken to maintain the security of this database, but an absolute guarantee of security is not possible when using the internet and internet-based systems.</p>
        <p>For each visitor to the webpage, the web server automatically recognizes only the user domain name. This is the information that is collected for statistical purposes. Aggregate information is collected on which pages users access or visit on this website. The information collected is used to improve the content of the webpage and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing this website and applicable laws, or to protect against misuses or unauthorized use of this website.</p>
        <p>With respect to cookies: Two non-personal temporary cookies are sent. These are eliminated when you log out of the site.</p>
        <p>With respect to ad servers: There is no partnership or special relationship with any ad server company.</p>

    <h3>Agreement</h3>
        <p>If you do not agree to the terms and conditions of the <%=ConfigSettings.SiteName %>, you will not be able to use the system.</p>
        <p>By clicking the “I agree” button, you agree:</p>
        <ul>
            <li>You have read the terms and conditions of the <%=ConfigSettings.SiteName %>,</li>
            <li>You consent to the limited nature of the attorney/client relationship both as to scope and duration,</li>
            <li>You are licensed to practice law in Arizona and you will respond to the question based on Arizona and/or federal law,</li>
            <li>If you accept a case from the <%=ConfigSettings.SiteName %> for ongoing representation you will notify Arizona Foundation for Legal Services &amp; Education by sending an e-mail to <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>, </li>
            <li>If you accept a case from the <%=ConfigSettings.SiteName %> you will only charge a maximum rate of $75 per hour, and</li>
            <li>The information that you will provide is true and correct.</li>
        </ul>
</div>

