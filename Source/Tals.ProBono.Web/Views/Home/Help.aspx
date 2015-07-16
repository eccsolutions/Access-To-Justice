<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Other places to find legal help and information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Other places to find legal help and information:</h2>
    <h3>Legal aid in Wisconsin</h3>
    <ul>
        <li><a href="http://www.safetyweb.org/">ABC for Health
        </a></li>
        <li><a href="http://www.arcw.org/">AIDS Resource Center of Wisconsin
        </a></li>
        <li><a href="http://cpcmadison.org/internationals/immigration-counseling/">Community Immigration Law Center
        </a></li>
        <li><a href="http://www.ccmke.org/Catholic-Charities.htm">Legal Services for Immigrants - Milwaukee
        </a></li>
        <li><a href="http://www.catholiccharitieslax.org/index.php">Legal Services for Immigrants - La Crosse
        </a></li>
        <li><a href="http://www.safetyweb.org/">Center Against Sexual & Domestic Abuse (CASDA) 
        </a></li>
        <li><a href="http://www.centrolegalwisconsin.org/">Centro Legal por Derechos Humanos 
        </a></li>
        <li><a href="http://www.communityjusticeinc.org/">Community Justice, Inc.
        </a></li>
        <li><a href="http://www.disabilityrightswi.org/">Disability Rights Wisconsin
        </a></li>
        <li><a href="http://www.kidsmatterinc.org/">Kids Matter 
        </a></li>
        <li><a href="http://www.legalaction.org/">Legal Action of Wisconsin
        </a></li>
        <li><a href="http://www.legalaiddoorcounty.org/index.html">Legal Aid Society of Door County 
        </a></li>
        <li><a href="http://www.lasmilwaukee.com/">Legal Aid Society of Milwaukee
        </a></li>
        <li><a href="http://milwaukee.gov/MJC">Milwaukee Justice Center
        </a></li>
        <li><a href="http://www.findmilwaukeelawyers.org/">Milwaukee Lawyer Referral Service
        </a></li>
        <li><a href="http://www.wisbar.org/lris">State Bar Lawyer Referral Service
        </a></li>
        <li><a href="http://www.judicare.org/">Wisconsin Judicare
        </a></li>
        <li><a href="http://law.marquette.edu/mvlc/">Marquette Volunteer Legal Clinic
        </a></li>
        <li><a href="http://law.wisc.edu/clinics/">UW Law School Clinics
        </a></li>
    </ul>

    <h3>You can find helpful legal information at these places:</h3>
    <ul>
        <li><a href="http://www.wisbar.org/forPublic/INeedInformation/Pages/Common-Legal-Questions.aspx">Common legal questions - from the State Bar of Wisconsin</a></li>
        <li><a href="http://wilawlibrary.gov/">State Law Library</a></li>
        <li><a href="http://www.wicourts.gov/services/public/selfhelp/index.htm">Wisconsin Court System Self-Help Center</a></li>
    </ul>
    <h3>Need help with food, clothing, shelter, medicine or other services?</h3>
    <ul>
        <li><a href="http://211.org/">Call 211</a></li>
    </ul>
    <h3>Other helpful agencies:</h3>
    <ul>
        <li><a href="http://wispd.org/">Wisconsin State Public Defenders
        </a></li>
    </ul>
</asp:Content>
