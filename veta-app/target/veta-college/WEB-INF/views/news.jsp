<%-- ════════════════ news.jsp ════════════════ --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="news"/>
<c:set var="pageTitle" value="News & Events"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><%= sw?"Nyumbani":"Home" %></a><span class="bcs">›</span><span><%= sw?"Habari & Matukio":"News & Events" %></span></div>
    <h1><%= sw?"Habari na Matukio":"News & Events" %></h1>
    <p><%= sw?"Habari za hivi karibuni, matangazo na matukio kutoka Chuo cha VETA Tanzania.":"Latest news, announcements and events from VETA College Tanzania." %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <c:if test="${not empty error}"><div class="alert-error"><c:out value="${error}"/></div></c:if>

  <div style="display:grid;grid-template-columns:1fr 290px;gap:28px">
    <div style="display:flex;flex-direction:column;gap:18px">
      <c:choose>
        <c:when test="${not empty newsList}">
          <c:forEach var="n" items="${newsList}">
          <div style="background:#fff;border-radius:var(--r12);box-shadow:var(--s2);overflow:hidden;display:grid;grid-template-columns:180px 1fr;border:1px solid var(--g200);transition:all var(--tr)" class="card-hover">
            <div style="background:${n.bgGradient != null ? n.bgGradient : 'linear-gradient(135deg,#0A2463,#1565C0)'};display:flex;align-items:center;justify-content:center;font-size:3rem">${n.icon}</div>
            <div style="padding:18px">
              <div style="display:flex;align-items:center;gap:8px;margin-bottom:8px">
                <span class="badge b-blue">${n.category}</span>
                <span style="font-size:.71rem;color:var(--g400);font-weight:600"><fmt:formatDate value="${n.eventDate}" pattern="dd MMM yyyy"/></span>
              </div>
              <div style="font-family:var(--fh);font-size:.93rem;color:var(--navy);margin-bottom:7px;line-height:1.4"><c:out value="${sw && not empty n.titleSw ? n.titleSw : n.titleEn}"/></div>
              <div style="font-size:.81rem;color:var(--g600);line-height:1.6"><c:out value="${sw && not empty n.excerptSw ? n.excerptSw : n.excerptEn}"/></div>
            </div>
          </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div style="text-align:center;padding:48px;color:var(--g400)">
            <div style="font-size:3rem;margin-bottom:12px">📰</div>
            <p><%= sw?"Hakuna habari za sasa. Angalia tena baadaye.":"No news available. Check back soon." %></p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <%-- Sidebar: Upcoming Events --%>
    <div>
      <div style="background:#fff;border-radius:var(--r12);box-shadow:var(--s2);padding:20px">
        <h4 style="font-size:.9rem;color:var(--navy);margin-bottom:14px;border-bottom:2px solid var(--blue);padding-bottom:8px">📅 <%= sw?"Matukio Yajayo":"Upcoming Events" %></h4>
        <div style="padding:12px 0;border-bottom:1px solid var(--g100);display:flex;gap:12px;align-items:flex-start">
          <div style="background:var(--navy);color:#fff;border-radius:8px;padding:7px 9px;text-align:center;min-width:46px"><div style="font-family:var(--fh);font-size:1.15rem;color:var(--gold);line-height:1">30</div><div style="font-size:.6rem;font-weight:700;text-transform:uppercase;color:rgba(255,255,255,.62)">NOV</div></div>
          <div><div style="font-size:.84rem;font-weight:700;color:var(--navy);margin-bottom:2px"><%= sw?"Mwisho wa Maombi — Jan 2026":"Application Deadline — Jan 2026" %></div><div style="font-size:.75rem;color:var(--g400)"><%= sw?"Omba mtandaoni au ofisini":"Apply online or at office" %></div></div>
        </div>
        <div style="padding:12px 0;border-bottom:1px solid var(--g100);display:flex;gap:12px;align-items:flex-start">
          <div style="background:var(--navy);color:#fff;border-radius:8px;padding:7px 9px;text-align:center;min-width:46px"><div style="font-family:var(--fh);font-size:1.15rem;color:var(--gold);line-height:1">15</div><div style="font-size:.6rem;font-weight:700;text-transform:uppercase;color:rgba(255,255,255,.62)">DEC</div></div>
          <div><div style="font-size:.84rem;font-weight:700;color:var(--navy);margin-bottom:2px"><%= sw?"Matokeo ya Udahili":"Admission Results Published" %></div><div style="font-size:.75rem;color:var(--g400)"><%= sw?"Orodha za udahili wa Jan 2026":"January 2026 admission lists" %></div></div>
        </div>
        <div style="padding:12px 0;border-bottom:1px solid var(--g100);display:flex;gap:12px;align-items:flex-start">
          <div style="background:var(--navy);color:#fff;border-radius:8px;padding:7px 9px;text-align:center;min-width:46px"><div style="font-family:var(--fh);font-size:1.15rem;color:var(--gold);line-height:1">06</div><div style="font-size:.6rem;font-weight:700;text-transform:uppercase;color:rgba(255,255,255,.62)">JAN</div></div>
          <div><div style="font-size:.84rem;font-weight:700;color:var(--navy);margin-bottom:2px"><%= sw?"Wiki ya Usajili na Mwelekeo":"Registration & Orientation" %></div><div style="font-size:.75rem;color:var(--g400)"><%= sw?"Wanafunzi wapya 2026":"New students 2026" %></div></div>
        </div>
        <div style="padding:12px 0;display:flex;gap:12px;align-items:flex-start">
          <div style="background:var(--navy);color:#fff;border-radius:8px;padding:7px 9px;text-align:center;min-width:46px"><div style="font-family:var(--fh);font-size:1.15rem;color:var(--gold);line-height:1">13</div><div style="font-size:.6rem;font-weight:700;text-transform:uppercase;color:rgba(255,255,255,.62)">JAN</div></div>
          <div><div style="font-size:.84rem;font-weight:700;color:var(--navy);margin-bottom:2px"><%= sw?"Masomo Yanaanza — 2026":"Classes Begin — 2026" %></div><div style="font-size:.75rem;color:var(--g400)"><%= sw?"Mihadhara ya kwanza":"First day of lectures" %></div></div>
        </div>
      </div>

      <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--r12);padding:20px;margin-top:16px;text-align:center">
        <div style="font-size:2rem;margin-bottom:10px">📢</div>
        <h4 style="color:#fff;font-size:.95rem;margin-bottom:8px"><%= sw?"Matangazo ya Udahili":"Intake Announcements" %></h4>
        <p style="color:rgba(255,255,255,.72);font-size:.8rem;margin-bottom:14px"><%= sw?"Jiunge na orodha yetu ya barua pepe kupata matangazo.":"Join our mailing list for announcements." %></p>
        <a href="${pageContext.request.contextPath}/contact" class="btn btn-gold btn-sm"><%= sw?"Wasiliana Nasi":"Contact Us" %></a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
