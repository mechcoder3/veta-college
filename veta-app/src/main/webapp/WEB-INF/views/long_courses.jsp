<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="long"/>
<c:set var="pageTitle" value="Long Courses"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a><span class="bcs">›</span><span><% if(sw){ %>Kozi Ndefu<% } else { %>Long Courses<% } %></span></div>
    <h1><% if(sw){ %>Kozi Ndefu — Zilizoidhinishwa na NVA<% } else { %>Long Courses — NVA Certified<% } %></h1>
    <p><% if(sw){ %>Programu za miaka 2–3 zinazosababisha Vyeti NVA 2–3.<% } else { %>2–3 year programs leading to NVA Level 2–3 Certificates.<% } %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <c:if test="${not empty error}"><div class="alert-error"><c:out value="${error}"/></div></c:if>

  <div class="grid2">
    <c:choose>
      <c:when test="${not empty courses}">
        <c:forEach var="c" items="${courses}">
        <div class="prog-card">
          <div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)">
            <div class="prog-icon">🎓</div>
            <div class="prog-type">${c.nvaLevel} · <% if(sw){ %>KOZI NDEFU<% } else { %>LONG COURSE<% } %></div>
            <h3>${c.nameEn}</h3>
            <c:if test="${not empty c.nameSw}"><div class="prog-nva">${c.nameSw}</div></c:if>
          </div>
          <div class="prog-body">
<div class="prog-row">
    <span class="prl">${sw ? "Muda" : "Duration"}</span>
    <span class="prv">
        ${c.getDurationDisplay()} (Cert) / ${c.getDurationMonths() / 12 + 1} yrs (Dip)
    </span>
</div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Ada/Mwaka<% } else { %>Annual Fee<% } %></span><span class="prv">TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/></span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Usajili (mara moja)<% } else { %>Registration (once)<% } %></span><span class="prv">TZS <fmt:formatNumber value="${c.registrationFee}" pattern="#,##0"/></span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Ada ya Mtihani/mwaka<% } else { %>Exam Fee/yr<% } %></span><span class="prv">TZS <fmt:formatNumber value="${c.examFee}" pattern="#,##0"/></span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Idara<% } else { %>Department<% } %></span><span class="prv">${c.department}</span></div>
            <c:if test="${not empty c.entryRequirementsEn}">
            <div style="margin-top:12px;background:var(--off);border-radius:8px;padding:11px;font-size:.8rem;color:var(--g700)">
              <strong style="display:block;margin-bottom:5px;color:var(--navy)"><% if(sw){ %>Mahitaji ya Kuingia<% } else { %>Entry Requirements<% } %></strong>
              <c:out value="${sw && not empty c.entryRequirementsSw ? c.entryRequirementsSw : c.entryRequirementsEn}"/>
            </div>
            </c:if>
          </div>
          <div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center">
            <div>
              <div style="font-size:1.2rem;font-weight:700;color:var(--blue);font-family:var(--fh)">TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/>/yr</div>
              <div style="font-size:.72rem;color:var(--g400)">+ TZS <fmt:formatNumber value="${c.registrationFee}" pattern="#,##0"/> reg · TZS <fmt:formatNumber value="${c.examFee}" pattern="#,##0"/> exam/yr</div>
            </div>
            <a href="${pageContext.request.contextPath}/admissions?courseId=${c.id}" class="btn btn-primary">
              <% if(sw){ %>Omba<% } else { %>Apply<% } %> →
            </a>
          </div>
        </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <%-- Static fallback --%>
        <c:set var="staticCourses" value="Electrical Installation|NVA 2-3|#006064|⚡|TZS 60,000 day-120,000 Boarding|Electrical|CSEE Form IV;Welding and Fabrication|NVA 2-3|#0A2463|🔥|TZS 60,000-120,000|Welding|CSEE Form IV ;Automotive courses|NVA 2-3|#BF360C|🚗|TZS60,000 day-120,000 Boarding|Automotive|CSEE Form IV ;ICT — Information & Communication |NVA 2-3|#4A148C|💻|TZS 60,000-120,000|ICT|CSEE Form IV ;Tailoring and Garment|NVA 2-3|#1A237E|🧵|TZS 60,000 day-120,000 Boarding|Tailoring|CSEE Form IV "/>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#006064,#00838F)"><div class="prog-icon">⚡</div><div class="prog-type">NVA LEVEL 2-3 · LONG COURSE</div><h3>Electrical Installation</h3><div class="prog-nva">Certificate (2-3yr) </div></div><div class="prog-body"><div class="prog-row"><span class="prl">Annual Fee</span><span class="prv">TZS 60,000 day-120,000 Boarding</span></div><div class="prog-row"><span class="prl">Registration</span><span class="prv">TZS 50,000</span></div><div class="prog-row"><span class="prl">Exam Fee/yr</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Entry</span><span class="prv">CSEE Form IV —  All genders</span></div></div><div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center"><div><div style="font-size:1.2rem;font-weight:700;color:var(--blue)">TZS60,000 day-120,000 Boarding/yr</div><div style="font-size:.72rem;color:var(--g400)">+ 5,000 reg · 30,000 exam/yr</div></div><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary">Apply →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)"><div class="prog-icon">🔥</div><div class="prog-type">NVA LEVEL 2-3 · LONG COURSE</div><h3>Welding and Fabrication</h3><div class="prog-nva">Certificate (2-3yr)</div></div><div class="prog-body"><div class="prog-row"><span class="prl">Annual Fee</span><span class="prv">TZS60,000 day-120,000 Boarding</span></div><div class="prog-row"><span class="prl">Registration</span><span class="prv">TZS 50,000</span></div><div class="prog-row"><span class="prl">Exam Fee/yr</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Entry</span><span class="prv">CSEE Form IV —  All genders</span></div></div><div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center"><div><div style="font-size:1.2rem;font-weight:700;color:var(--blue)">TZS 60,000 day-120,000 Boarding/yr</div><div style="font-size:.72rem;color:var(--g400)">+ 5,000 reg · 30,000 exam/yr</div></div><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary">Apply →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#BF360C,#E64A19)"><div class="prog-icon">🚗</div><div class="prog-type">NVA LEVEL 2-3 · LONG COURSE</div><h3>Automotive courses</h3><div class="prog-nva">Certificate (2-3yr)</div></div><div class="prog-body"><div class="prog-row"><span class="prl">Annual Fee</span><span class="prv">TZS 60,000 day-120,000 Boarding</span></div><div class="prog-row"><span class="prl">Registration</span><span class="prv">TZS 50,000</span></div><div class="prog-row"><span class="prl">Exam Fee/yr</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Entry</span><span class="prv">CSEE Form IV — All genders</span></div></div><div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center"><div><div style="font-size:1.2rem;font-weight:700;color:var(--blue)">TZS 60,000 day-120,000 Boarding/yr</div><div style="font-size:.72rem;color:var(--g400)">+ 5,000 reg · 30,000 exam/yr</div></div><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary">Apply →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#4A148C,#7B1FA2)"><div class="prog-icon">💻</div><div class="prog-type">NVA LEVEL 2-3 · LONG COURSE</div><h3>ICT — Information & Communication </h3><div class="prog-nta">Certificate(2-3yr)</div></div><div class="prog-body"><div class="prog-row"><span class="prl">Annual Fee</span><span class="prv">TZS 60,000 day-120,000 Boarding</span></div><div class="prog-row"><span class="prl">Registration</span><span class="prv">TZS 50,000</span></div><div class="prog-row"><span class="prl">Exam Fee/yr</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Entry</span><span class="prv">CSEE Form IV —  All genders</span></div></div><div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center"><div><div style="font-size:1.2rem;font-weight:700;color:var(--blue)">TZS60,000 day-120,000 Boarding/yr</div><div style="font-size:.72rem;color:var(--g400)">+ 5,000 reg · 30,000 exam/yr</div></div><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary">Apply →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#1A237E,#283593)"><div class="prog-icon">🧵</div><div class="prog-type">NVA LEVEL 2 · LONG COURSE</div><h3>Tailoring and Garment</h3><div class="prog-nva">Certificate ((2-3yr)) </div></div><div class="prog-body"><div class="prog-row"><span class="prl">Annual Fee</span><span class="prv">TZS60,000 day-120,000 Boarding</span></div><div class="prog-row"><span class="prl">Registration</span><span class="prv">TZS 50,000</span></div><div class="prog-row"><span class="prl">Exam Fee/yr</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Entry</span><span class="prv">CSEE — All genders</span></div></div><div class="prog-foot" style="display:flex;justify-content:space-between;align-items:center"><div><div style="font-size:1.2rem;font-weight:700;color:var(--blue)">TZS60,000 day-120,000 Boarding/yr</div><div style="font-size:.72rem;color:var(--g400)">+ 5,000 reg · 30,000 exam/yr</div></div><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary">Apply →</a></div></div>
      </c:otherwise>
    </c:choose>
  </div>
</div>

<jsp:include page="footer.jsp"/>
