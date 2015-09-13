<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <h2>Use Agreement for Lawyers</h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>
    
    <p><%=ConfigSettings.SiteName %> is a web site operated by the Tacoma-Pierce County Bar Association Volunteer Legal Services Program on behalf of the State of Washington Alliance for Equal Justice.  The purpose of the website is to increase access to advice and information about non-criminal legal matters to those who cannot afford it. There is no fee for the use of the system or for the advice and information provided by the lawyer.</p>

    <h3>Who Can Use <%=ConfigSettings.SiteName %></h3>
        <p>Eligibility for use of <%=ConfigSettings.SiteName %> is limited to the following: </p>
        <ul class="padded-list-sm">
            <li>The user must have household income less than 200% of the federal poverty level;</li>
            <li>The user may not request assistance with criminal law matters;</li>
            <li>The user must be over the age of <%=ConfigSettings.MinimumAgeRequirement %>;</li>
            <li>The user must be a Washington State resident or have a legal problem in Washington;</li>
            <li>The user may not have a lawyer already helping them with their case.</li>
        </ul>
        <p>Before users are allowed to request legal advice, they will be asked questions to establish eligibility.</p>
        <p>Users agree to answer those questions truthfully.</p>
        <p>The information that users provide to these questions will not be shared with anyone including the lawyer who responds to the user&#39;s request.</p>
        <p>Users must provide their name and county in order to ask for advice. Subject to the Privacy Policy below, only their name is shared with the lawyer.</p>
        <p>If a user is not eligible to use the system, the user will be denied access to it and provided with some alternate resources for help.</p>

    <h3>What Happens When Clients Use <%=ConfigSettings.SiteName %></h3>
        <p>After eligibility is established, the user will create a User Name and Password.</p>
        <p>The user will post a request for legal advice information and provide facts that will help the lawyer answer the question. Users will be able to go back to their posted question one time to add information. The lawyer may ask for additional information before responding to the user&#39;s request. The user will have a choice to respond to that request or not.</p>   
        <p>Lawyers licensed in Washington will be authorized to use the system and to respond to user&#39;s requests. Lawyers may decline to respond to requests. If no lawyer responds to a request after 30 days, the request will be removed and the administrator will notify the user. If a lawyer responds to a user&#39;s request, the user will receive a written response through the website.</p>
        <p>Users will not know the name of the lawyer who answers their questions unless the lawyer chooses to provide it when answering the question. The lawyer will be licensed to practice law in Washington and will respond based on Washington and/or federal law.</p>
        <p>The lawyer will not take any action to help the user except to respond to the request for advice and information that is posted on the web site.</p> 
  
    <h3>Lawyer/Client Relationship</h3>
        <p>There is no lawyer / client relationship between the client and the administrator of this website (TPCBA VLS). In the event a client submits a question and receives an answer from a lawyer, there will be a lawyer/client relationship formed between that client and the lawyer who responds. That relationship, however, will be limited in scope and duration as described in this agreement. The representation will be limited to providing an answer to the legal question and will not involve any continuing representation of the client beyond the act of providing such an answer. The lawyer will provide short-term, limited legal services to a client (the eligible user of this site) without expectation by either the lawyer or the client (the eligible user of this site) that the lawyer will provide continuing representation in the matter. By accepting the terms of this use agreement, you consent to the limited nature of this relationship both as to scope and duration.</p>

    <h3>Conflicts</h3>
        <p>Because of the pro bono publico nature of the limited scope representation provided through <%=ConfigSettings.SiteName %> pursuant to RPC 6.1 and because of the involvement of TPCBA VLS, the general rules for lawyers as to conflicts of interest do not apply to lawyers&#39; participation in Washington Web Lawyer. Instead, the only conflicts of interest that would preclude a lawyer from answering a question for an eligible user of Washington Web Lawyer are conflicts of interest that the lawyer actually knows of at the time that they receive or answer a client&#39;s question. This means that the possibility exists, and the clients agree that they understand, that a lawyer who answers a question, or another lawyer with whom they practice in a firm, may actually be representing other parties with an interest in the question. The client name will be provided to the lawyer so that the lawyer can make sure not to answer the question if the lawyer knows that he would have a conflict of interest. If based on the information the client provides, whether client name or any details of the question, the lawyer actually knows of a conflict of interest precluding him from answering, the question will be referred to another volunteer lawyer.</p>

    <h3>Privacy Policy / Confidentiality Statement</h3>
        <p><%=ConfigSettings.SiteName %> is sponsored by the Tacoma-Pierce County Bar Association Volunteer Legal Services Program (TPCBA VLS). This site is designed to insure client privacy. Information available to TPCBA VLS and the lawyer responding to a client request shall remain confidential, subject to the limitations of this Privacy/Confidentiality Policy. However, client requests for information and the response of the lawyers participating in <%=ConfigSettings.SiteName %> may be maintained in a database for review in order to measure the effectiveness of the project. Steps will be taken to maintain the security of this database and it will only be utilized by TPCBA VLS, but an absolute guarantee of security is not possible when using the internet and internet based systems.</p>
        <p>For each visitor to the site, the web server automatically recognizes only the consumer domain name. This is the information that is collected for statistical purposes.</p>
        <p>Aggregate information is collected on what pages consumers access or visit on this website.</p>
        <p>The information collected is used to improve the content of the Web page and is not shared with other organizations for commercial purposes. Information may be disclosed when legally required at the request of government authorities conducting an investigation, to verify or enforce compliance with the policies governing our website and applicable laws or to protect against misuses or unauthorized use of our website.</p>
        <p>With respect to cookies: Two non-personal temporary cookies are sent. These are eliminated when you log out of the site.</p>
        <p>With respect to Ad Servers: There is and will be no partnership or special relationship with any ad server company.</p>
    
    <h3>Accepting Pro Bono Cases</h3>
        <p>If a lawyer chooses to communicate with a client outside of the waweblawyer.org website for the purposes of taking the client&#39;s case on a pro bono basis, lawyers are asked to contact <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>. We would like to keep track of the number of pro bono cases that are generated from the website. Lawyers will need to report this information in order to be covered by professional liability insurance maintained by TPCBA VLS. </p>

    <h3>Agreement</h3>
        <p>By clicking the “I Agree” button you agree:</p>
        <ul class="padded-list-sm">
            <li>I have read the Use Agreement and I understand the terms of the Use Agreement.</li>
            <li>The information that I will provide is true and correct.</li>
            <li>If I do not agree to the Terms of Use, I will not be able to use the system.</li>
        </ul>
</div>

