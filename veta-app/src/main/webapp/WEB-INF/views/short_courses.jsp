<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="short"/>
<c:set var="pageTitle" value="Short Courses"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a><span class="bcs">›</span><span><% if(sw){ %>Kozi Fupi<% } else { %>Short Courses<% } %></span></div>
    <h1><% if(sw){ %>Kozi Fupi<% } else { %>Short Courses<% } %></h1>
    <p><% if(sw){ %>Ujuzi wa vitendo kwa miezi 1–6. Inafaa kwa ajira ya haraka na kuongeza ujuzi.<% } else { %>Practical skills in 1–6 months. Ideal for quick employment and upskilling.<% } %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <c:if test="${not empty error}"><div class="alert-error"><c:out value="${error}"/></div></c:if>

  <div class="grid3">
    <c:choose>
      <c:when test="${not empty courses}">
        <c:forEach var="c" items="${courses}">
        <div class="prog-card">
          <div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)">
            <div class="prog-icon">📚</div>
            <div class="prog-type"><% if(sw){ %>KOZI FUPI<% } else { %>SHORT COURSE<% } %> · ${c.nvaLevel}</div>
            <h3>${c.nameEn}</h3>
            <c:if test="${not empty c.nameSw}"><div class="prog-nva">${c.nameSw}</div></c:if>
          </div>
          <div class="prog-body">
            <div class="prog-row"><span class="prl"><% if(sw){ %>Muda<% } else { %>Duration<% } %></span><span class="prv">${c.getDurationDisplay()}</span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Ada Kamili<% } else { %>Total Fee<% } %></span><span class="prv">TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/></span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Ada ya Maombi<% } else { %>Application Fee<% } %></span><span class="prv">TZS <fmt:formatNumber value="${c.applicationFee}" pattern="#,##0"/></span></div>
            <div class="prog-row"><span class="prl"><% if(sw){ %>Idara<% } else { %>Department<% } %></span><span class="prv">${c.department}</span></div>
            <c:if test="${not empty c.entryRequirementsEn}">
            <div style="margin-top:12px;background:var(--off);border-radius:8px;padding:11px;font-size:.8rem;color:var(--g700)">
              <strong style="display:block;margin-bottom:5px;color:var(--navy)"><% if(sw){ %>Mahitaji<% } else { %>Requirements<% } %></strong>
              <c:out value="${sw && not empty c.entryRequirementsSw ? c.entryRequirementsSw : c.entryRequirementsEn}"/>
            </div>
            </c:if>
          </div>
          <div class="prog-foot" style="display:flex;gap:8px">
            <a href="${pageContext.request.contextPath}/admissions?courseId=${c.id}" class="btn btn-primary" style="flex:1">
              <% if(sw){ %>Omba Sasa<% } else { %>Apply Now<% } %> →
            </a>
            <a href="${pageContext.request.contextPath}/payments" class="btn btn-ghost btn-sm">💳</a>
          </div>
        </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <%-- Static fallback if DB not connected --%>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)"><div class="prog-icon">🚗</div><div class="prog-type">SHORT COURSE · SUMATRA</div><h3>Driving Course — PSV & Light Vehicles</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">1 Week-1Months</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 250,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · ID · Age 18+</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#1B5E20,#388E3C)"><div class="prog-icon">🏍️</div><div class="prog-type">SHORT COURSE · SUMATRA</div><h3>Motorcycle Riding Course</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">1 week</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 30,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · ID · Age 16+</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#4A148C,#7B1FA2)"><div class="prog-icon">💻</div><div class="prog-type">SHORT COURSE · NVA LEVEL 2</div><h3>Computer Applications</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">3-5 Months</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 375,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · Basic literacy</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#BF360C,#E64A19)"><div class="prog-icon">🔥</div><div class="prog-type">SHORT COURSE · NVA LEVEL 2-3</div><h3>Welding Short Program</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">3-5 Months</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 370,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · Good eyesight</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#006064,#00838F)"><div class="prog-icon">⚡</div><div class="prog-type">SHORT COURSE · NVA LEVEL 2-3</div><h3>Electrical Short Course</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">3-5 Months</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 375,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · Open to all genders</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
        <div class="prog-card"><div class="prog-head" style="background:linear-gradient(135deg,#1A237E,#283593)"><div class="prog-icon">🧵</div><div class="prog-type">SHORT COURSE · NVA LEVEL 2-3</div><h3>Tailoring Short Course</h3></div><div class="prog-body"><div class="prog-row"><span class="prl">Duration</span><span class="prv">3-5 Months</span></div><div class="prog-row"><span class="prl">Total Fee</span><span class="prv">TZS 375,000</span></div><div class="prog-row"><span class="prl">Requirements</span><span class="prv">Std 7 · Open to all genders</span></div></div><div class="prog-foot"><a href="${pageContext.request.contextPath}/admissions" class="btn btn-primary btn-block">Apply Now →</a></div></div>
      </c:otherwise>
    </c:choose>
  </div>

  <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--r12);padding:28px;margin-top:32px;color:#fff;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:16px">
    <div>
      <h3 style="color:#fff;margin-bottom:6px"><% if(sw){ %>Una maswali kuhusu kozi fupi?<% } else { %>Have questions about short courses?<% } %></h3>
      <p style="color:rgba(255,255,255,.75);font-size:.88rem"><% if(sw){ %>Wasiliana nasi kwa maelezo zaidi au tembelea ofisi ya udahili.<% } else { %>Contact us for more details or visit the admissions office.<% } %></p>
    </div>
    <div style="display:flex;gap:10px;flex-wrap:wrap">
      <a href="tel:+255754000111" class="btn btn-gold">📞+255282804951</a>
      <a href="${pageContext.request.contextPath}/admissions" class="btn btn-outline-w"><% if(sw){ %>Omba Sasa<% } else { %>Apply Now<% } %> →</a>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
