<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="home"/>
<c:set var="pageTitle" value="Home"/>
<%
    boolean sw = "sw".equals(session.getAttribute("lang"));
    request.setAttribute("sw", sw);
%>
<jsp:include page="header.jsp"/>

<%-- ══ 1. LEADERSHIP ══ --%>
<section id="leadership">
  <div class="wrap">
    <div class="leader-intro">
      <span class="leader-kicker">🏛️ <%= sw?"Uongozi wa Chuo":"College Management" %></span>
      <h2 class="leader-title"><%= sw?"Timu ya Uongozi Wetu":"Meet Our Leadership Team" %></h2>
      <p class="leader-sub"><%= sw?"Wataalamu waliojitoa kwa ubora wa elimu ya ufundi":"Experienced professionals dedicated to excellence in vocational education" %></p>
    </div>

    <%-- PRINCIPAL (MKUU WA CHUO) --%>
    <c:if test="${principal != null}">
    <div class="principal-card">
      <div class="principal-photo-col">
        <div class="photo-frame">
          <c:choose>
            <c:when test="${not empty principal.photoPath}">
    <img src="${pageContext.request.contextPath}/Images/${principal.photoPath}" 
         alt="${principal.fullName}">
</c:when>
            <c:otherwise><span class="photo-icon">👨‍💼</span></c:otherwise>
          </c:choose>
          <div class="photo-ribbon">
            <div class="ribbon-name">${principal.displayName}</div>
            <div class="ribbon-role"><%= sw?"Mkuu wa Chuo":"College Principal" %></div>
          </div>
        </div>
      </div>
      <div class="principal-info">
        <div class="p-label">🏛️ <%= sw?"MKUU WA CHUO — PRINCIPAL":"PRINCIPAL — MKUU WA CHUO" %></div>
        <h2 class="p-name">${principal.displayName}</h2>
        <div class="p-creds">${principal.qualifications}</div>
        <blockquote class="p-quote">${principal.welcomeMessage}</blockquote>
        <div class="p-actions">
          <button class="btn btn-gold" onclick="openModal('principalModal')">
            📖 <%= sw?"Soma Ujumbe Kamili":"Read Full Message" %>
          </button>
          <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-w">
            📧 <%= sw?"Wasiliana na Mkuu":"Contact Principal" %>
          </a>
        </div>
        <div class="p-meta">
          <div><strong>25+ <%= sw?"Miaka":"Years" %></strong><span><%= sw?"ya Ubora":"of Excellence" %></span></div>
          <div><strong>8,000+</strong><span><%= sw?"Wahitimu":"Graduates" %></span></div>
          <div><strong>ISO 9001:2015</strong><span><%= sw?"Imethibitishwa":"Certified" %></span></div>
        </div>
      </div>
    </div>
    </c:if>

    <%-- STAFF GRID (MANAGEMENT COMMITTEE) --%>
    <p class="staff-section-title"><%= sw?"KAMATI YA USIMAMIZI WA CHUO":"COLLEGE MANAGEMENT COMMITTEE" %></p>
    <div class="staff-grid">
      <%-- Marekebisho: Imeongezwa begin="0" na end="2" ili kudhibiti idadi ya viongozi iwe 3 pekee --%>
      <c:forEach var="s" items="${staffList}" begin="0" end="2">
      <div class="staff-card">
        <div class="staff-avatar">
          <c:choose>
            <c:when test="${not empty s.photoPath}">
              <img src="${pageContext.request.contextPath}/${s.photoPath}" alt="${s.fullName}">
            </c:when>
            <c:otherwise><span>👤</span></c:otherwise>
          </c:choose>
        </div>
        <div class="staff-name">${s.displayName}</div>
        <div class="staff-role">${s.roleTitle}</div>
        <div class="staff-desc">${s.qualifications}</div>
      </div>
      </c:forEach>
    </div>
  </div>
</section>
<%-- ══ 2. HERO ══ --%>
<section id="hero">
  <div class="hero-bg"><div class="hb hb1"></div><div class="hb hb2"></div></div>
  <div class="wrap">
    <div class="hero-content">
      <div class="hero-badge">🇹🇿 <%= sw?"Imethibitishwa na Serikali · Ngazi ya NTA 2–6 · Est. 1999":"Government Accredited · NTA Level 2–6 · Est. 1999" %></div>
      <h1 class="hero-title"><%= sw?"Kujenga Nguvu Kazi Yenye Ujuzi wa Tanzania":"Building Tanzania's Skilled Workforce" %></h1>
      <p class="hero-desc"><%= sw?
          "Mafunzo ya ufundi ya kiwango cha dunia katika uhandisi, TEHAMA, magari, ujenzi na zaidi." :
          "World-class vocational training in engineering, ICT, automotive, construction and more." %></p>
      <div class="hero-actions">
        <a href="${pageContext.request.contextPath}/admissions" class="btn btn-gold btn-lg">
          🎓 <%= sw?"Omba Sasa":"Apply Now" %>
        </a>
        <a href="${pageContext.request.contextPath}/courses?type=long" class="btn btn-outline-w btn-lg">
          📚 <%= sw?"Chunguza Programu":"Explore Programs" %>
        </a>
      </div>
      <div class="hero-stats">
        <div class="hstat"><span class="hnum">15+</span><span class="hlbl"><%= sw?"Programu":"Programs" %></span></div>
        <div class="hstat"><span class="hnum">500+</span><span class="hlbl"><%= sw?"Wanafunzi":"Students" %></span></div>
        <div class="hstat"><span class="hnum">8,000+</span><span class="hlbl"><%= sw?"Wahitimu":"Graduates" %></span></div>
        <div class="hstat"><span class="hnum">90%</span><span class="hlbl"><%= sw?"Ajira":"Employment" %></span></div>
        <div class="hstat"><span class="hnum">20+yr</span><span class="hlbl"><%= sw?"Ubora":"Excellence" %></span></div>
      </div>
    </div>
  </div>
</section>

<%-- ANNOUNCE BAR --%>
<div class="announce-bar">
  <div class="wrap">
    <span class="a-label">📢 <%= sw?"TANGAZO":"NOTICE" %></span>
    <span class="a-text" id="announceTxt">
      <%= sw?
          "Udahili wa Januari 2026 Umefunguliwa — Omba Mtandaoni Leo! Mwisho: Novemba 30, 2025" :
          "January 2026 Intake Now Open — Apply Online Today! Deadline: 30 November 2025" %>
    </span>
  </div>
</div>

<%-- ══ 3. QUICK ACCESS ══ --%>
<section id="quick-access">
  <div class="wrap">
    <div class="section-header center">
      <span class="sk"><%= sw?"Ufikiaji wa Haraka":"Quick Access" %></span>
      <h2 class="st"><%= sw?"Kila Unachohitaji, Mahali Pamoja":"Everything You Need, In One Place" %></h2>
    </div>
    <div class="quick-grid">
      <a href="${pageContext.request.contextPath}/courses?type=short" class="quick-card">
        <div class="q-icon" style="background:#EFF6FF">⚡</div>
        <div class="q-title"><%= sw?"Kozi Fupi":"Short Courses" %></div>
        <div class="q-desc"><%= sw?"Programu za miezi 3–6":"3–6 month programs" %></div>
      </a>
      <a href="${pageContext.request.contextPath}/courses?type=long" class="quick-card">
        <div class="q-icon" style="background:#ECFDF5">🎓</div>
        <div class="q-title"><%= sw?"Kozi Ndefu":"Long Courses" %></div>
        <div class="q-desc"><%= sw?"Miaka 2–3 NVA":"2–3 year NVA certified" %></div>
      </a>
      <a href="${pageContext.request.contextPath}/admissions" class="quick-card">
        <div class="q-icon" style="background:#FFF7ED">📝</div>
        <div class="q-title"><%= sw?"Omba Mtandaoni":"Apply Online" %></div>
        <div class="q-desc"><%= sw?"Ombi rahisi la mtandaoni":"Easy online application" %></div>
      </a>
      <a href="${pageContext.request.contextPath}/payments" class="quick-card">
        <div class="q-icon" style="background:#F5F3FF">💳</div>
        <div class="q-title"><%= sw?"Malipo":"Payments" %></div>
        <div class="q-desc"><%= sw?"Nambari ya Udhibiti":"Control number system" %></div>
      </a>
      <a href="${pageContext.request.contextPath}/portal" class="quick-card">
        <div class="q-icon" style="background:#F0FDFA">🖥️</div>
        <div class="q-title"><%= sw?"Tovuti ya Wanafunzi":"Student Portal" %></div>
        <div class="q-desc"><%= sw?"Hali na nyaraka":"Status & documents" %></div>
      </a>
      <a href="${pageContext.request.contextPath}/production" class="quick-card">
        <div class="q-icon" style="background:#FEF9C3">🔨</div>
        <div class="q-title"><%= sw?"Uzalishaji":"Production" %></div>
        <div class="q-desc"><%= sw?"Bidhaa na huduma":"Products & services" %></div>
      </a>
    </div>
  </div>
</section>

<%-- ══ FEATURED COURSES ══ --%>
<section style="padding:68px 0;background:#fff">
  <div class="wrap">
    <div style="display:flex;justify-content:space-between;align-items:flex-end;margin-bottom:32px;flex-wrap:wrap;gap:12px">
      <div>
        <span class="sk"><%= sw?"Programu Bora":"Top Programs" %></span>
        <h2 class="st"><%= sw?"Kozi Zilizoangaziwa":"Featured Courses" %></h2>
      </div>
      <a href="${pageContext.request.contextPath}/courses?type=long" class="btn btn-outline">
        <%= sw?"Angalia Zote →":"View All →" %>
      </a>
    </div>
    <div class="grid3">
      <c:forEach var="c" items="${longCourses}" end="2">
      <div class="prog-card">
        <div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)">
          <div class="prog-icon">📚</div>
          <div class="prog-type">NVA <%= sw?"KOZI NDEFU":"LONG COURSE" %></div>
          <h3>${c.nameEn}</h3>
          <div class="prog-nta">${c.ntaLevel} · ${c.getDurationDisplay()}</div>
        </div>
        <div class="prog-body">
          <div class="prog-row">
            <span class="prl"><%= sw?"Muda":"Duration" %></span>
            <span class="prv">${c.getDurationDisplay()}</span>
          </div>
          <div class="prog-row">
            <span class="prl"><%= sw?"Ada/Mwaka":"Annual Fee" %></span>
            <span class="prv">TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/></span>
          </div>
          <div class="prog-row">
            <span class="prl"><%= sw?"Kuingia":"Entry" %></span>
            <span class="prv">Form IV (CSEE)</span>
          </div>
        </div>
        <div class="prog-foot">
          <a href="${pageContext.request.contextPath}/admissions?courseId=${c.id}" class="btn btn-primary btn-block">
            <%= sw?"Omba Sasa →":"Apply Now →" %>
          </a>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>
</section>

<%-- ══ NEWS SNIPPET ══ --%>
<section style="padding:68px 0;background:var(--off)">
  <div class="wrap">
    <div style="display:flex;justify-content:space-between;align-items:flex-end;margin-bottom:32px;flex-wrap:wrap;gap:12px">
      <div>
        <span class="sk"><%= sw?"Habari za Hivi Karibuni":"Latest Updates" %></span>
        <h2 class="st"><%= sw?"Habari na Matukio":"News & Events" %></h2>
      </div>
      <a href="${pageContext.request.contextPath}/news" class="btn btn-outline"><%= sw?"Angalia Zote →":"View All →" %></a>
    </div>
    <div class="grid3">
      <c:forEach var="n" items="${newsList}">
      <div class="news-card card-hover">
        <div class="n-img" style="background:${n.bgGradient}">${n.icon}</div>
        <div class="n-body">
          <div class="n-meta">
            <span class="badge b-blue">${n.category}</span>
            <span class="n-date"><fmt:formatDate value="${n.eventDate}" pattern="MMM dd, yyyy"/></span>
          </div>
          <div class="n-title"><c:out value="${sw ? n.titleSw : n.titleEn}"/></div>
          <div class="n-excerpt"><c:out value="${sw ? n.excerptSw : n.excerptEn}"/></div>
          <a href="${pageContext.request.contextPath}/news" class="n-more"><%= sw?"Soma zaidi →":"Read more →" %></a>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>
</section>

<%-- PRINCIPAL FULL MESSAGE MODAL --%>
<div class="modal-overlay" id="principalModal" onclick="closeModal('principalModal')">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-head">
      <h3><%= sw?"Ujumbe Kamili wa Mkuu wa Chuo":"Principal's Full Welcome Message" %></h3>
      <button class="modal-close" onclick="closeModal('principalModal')">✕</button>
    </div>
    <div class="modal-body">
      <c:if test="${principal != null}">
        <div style="text-align:center;margin-bottom:20px">
          <div class="principal-modal-avatar">👨‍💼</div>
          <h3>${principal.displayName}</h3>
          <p style="color:var(--g400);font-size:.85rem">${principal.roleTitle}</p>
        </div>
        <div class="modal-quote">${principal.welcomeMessage}</div>
      </c:if>
    </div>
    <div class="modal-foot">
      <button class="btn btn-primary" onclick="closeModal('principalModal')"><%= sw?"Funga":"Close" %></button>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
