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
      <span class="leader-kicker">🏛️ <% if(sw){ %>Uongozi wa Chuo<% } else { %>Center Management<% } %></span>
      <h2 class="leader-title"><% if(sw){ %>Timu ya Uongozi Wetu<% } else { %>Meet Our Leadership Team<% } %></h2>
      <p class="leader-sub"><% if(sw){ %>Wataalamu waliojitoa kwa ubora wa elimu ya ufundi<% } else { %>Experienced professionals dedicated to excellence in vocational education<% } %></p>
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
    <div class="ribbon-name" style="color: #ffffff; font-size: 1.1rem; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">
        ${principal.displayName}
    </div>
    <div class="ribbon-role" style="color: var(--gold); font-size: 0.8rem; font-weight: 800; letter-spacing: 1.5px;">
        <% if(sw){ %>Mkuu wa Chuo<% } else { %>Center Principal<% } %>
    </div>
</div>
        </div>
      </div>
      <div class="principal-info">
        <div class="p-label">🏛️ <% if(sw){ %>MKUU WA CHUO — PRINCIPAL<% } else { %>PRINCIPAL — MKUU WA CHUO<% } %></div>
        <h2 class="p-name">${principal.displayName}</h2>
        <div class="p-creds">${principal.qualifications}</div>
        <blockquote class="p-quote">${principal.welcomeMessage}</blockquote>
        <div class="p-actions">
          <button class="btn btn-gold" onclick="openModal('principalModal')">
            📖 <% if(sw){ %>Soma Ujumbe Kamili<% } else { %>Read Full Message<% } %>
          </button>
          <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-w">
            📧 <% if(sw){ %>Wasiliana na Mkuu<% } else { %>Contact Principal<% } %>
          </a>
        </div>
        <div class="p-meta">
          <div><strong>25+ <% if(sw){ %>Miaka<% } else { %>Years<% } %></strong><span><% if(sw){ %>ya Ubora<% } else { %>of Excellence<% } %></span></div>
          <div><strong>8,000+</strong><span><% if(sw){ %>Wahitimu<% } else { %>Graduates<% } %></span></div>
          <div><strong>ISO 9001:2015</strong><span><% if(sw){ %>Imethibitishwa<% } else { %>Certified<% } %></span></div>
        </div>
      </div>
    </div>
    </c:if>

    <%-- STAFF GRID (MANAGEMENT COMMITTEE) --%>
    <p class="staff-section-title"><% if(sw){ %>KAMATI YA USIMAMIZI WA CHUO<% } else { %>CENTER MANAGEMENT COMMITTEE<% } %></p>
    <div class="staff-grid">
      <%-- Marekebisho: Imeongezwa begin="0" na end="2" ili kudhibiti idadi ya viongozi iwe 3 pekee --%>
      <c:forEach var="s" items="${staffList}" begin="0" end="2">
      <div class="staff-card">
        <div class="staff-avatar" style="width: 140px !important; height: 140px !important; border-radius: 50%; border: 3px solid var(--gold); overflow: hidden; display: flex; align-items: center; justify-content: center; margin: 0 auto 15px;">
    <c:choose>
        <c:when test="${not empty s.photoPath}">
            <%-- JARIBU HII PATH: Hakikisha folda la Images linaanza na herufi kubwa kama kwenye Principal --%>
            <img src="${pageContext.request.contextPath}/Images/${s.photoPath}" 
                 style="width: 100%; height: 100%; object-fit: cover; display: block;" 
                 alt="${s.fullName}">
        </c:when>
        <c:otherwise>
            <span style="font-size: 60px;">👤</span>
        </c:otherwise>
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
      <div class="hero-badge">🇹🇿 <% if(sw){ %>Imethibitishwa na Serikali · Ngazi ya NVA 1–3 · Est. 2005<% } else { %>Government Accredited · NVA Level 1–3 · Est. 2005<% } %></div>
      <h1 class="hero-title"><% if(sw){ %>Nguvu Kazi Yenye Ujuzi mustakabali wa Tanzania<% } else { %>Skilled labour force the future of Tanzania<% } %></h1>
      <p class="hero-desc"><%= sw?
          "Mafunzo ya ufundi ya kiwango cha dunia katika uhandisi, TEHAMA, magari, ujenzi na zaidi." :
          "World-class vocational training in engineering, ICT, automotive, construction and more." %></p>
      <div class="hero-actions">
        <a href="${pageContext.request.contextPath}/admissions" class="btn btn-gold btn-lg">
          🎓 <% if(sw){ %>Omba Sasa<% } else { %>Apply Now<% } %>
        </a>
        <a href="${pageContext.request.contextPath}/courses?type=long" class="btn btn-outline-w btn-lg">
          📚 <% if(sw){ %>Chunguza Programu<% } else { %>Explore Programs<% } %>
        </a>
      </div>
      <div class="hero-stats">
        <div class="hstat"><span class="hnum">15+</span><span class="hlbl"><% if(sw){ %>Programu<% } else { %>Programs<% } %></span></div>
        <div class="hstat"><span class="hnum">500+</span><span class="hlbl"><% if(sw){ %>Wanafunzi<% } else { %>Students<% } %></span></div>
        <div class="hstat"><span class="hnum">8,000+</span><span class="hlbl"><% if(sw){ %>Wahitimu<% } else { %>Graduates<% } %></span></div>
        <div class="hstat"><span class="hnum">90%</span><span class="hlbl"><% if(sw){ %>Ajira<% } else { %>Employment<% } %></span></div>
        <div class="hstat"><span class="hnum">20+yr</span><span class="hlbl"><% if(sw){ %>Ubora<% } else { %>Excellence<% } %></span></div>
      </div>
    </div>
  </div>
</section>

<%-- ANNOUNCE BAR --%>
<div class="announce-bar">
  <div class="wrap">
    <span class="a-label">📢 <% if(sw){ %>TANGAZO<% } else { %>NOTICE<% } %></span>
    <span class="a-text" id="announceTxt">
      <%= sw?
          "Udahili wa APRIL 2026 Umefunguliwa Wa ngazi ya 3— Omba Mtandaoni Leo! Mwisho: JULAI 30, 2026" :
          "APRIL 2026 Intake Now Open level 3 — Apply Online Today! Deadline: 30 JULY 2026" %>
    </span>
  </div>
</div>

<%-- ══ 3. QUICK ACCESS ══ --%>
<section id="quick-access">
  <div class="wrap">
    <div class="section-header center">
      <span class="sk"><% if(sw){ %>Ufikiaji wa Haraka<% } else { %>Quick Access<% } %></span>
      <h2 class="st"><% if(sw){ %>Kila Unachohitaji, Mahali Pamoja<% } else { %>Everything You Need, In One Place<% } %></h2>
    </div>
    <div class="quick-grid">
      <a href="${pageContext.request.contextPath}/courses?type=short" class="quick-card">
        <div class="q-icon" style="background:#EFF6FF">⚡</div>
        <div class="q-title"><% if(sw){ %>Kozi Fupi<% } else { %>Short Courses<% } %></div>
        <div class="q-desc"><% if(sw){ %>Programu za miezi 3–6<% } else { %>3–6 month programs<% } %></div>
      </a>
      <a href="${pageContext.request.contextPath}/courses?type=long" class="quick-card">
        <div class="q-icon" style="background:#ECFDF5">🎓</div>
        <div class="q-title"><% if(sw){ %>Kozi Ndefu<% } else { %>Long Courses<% } %></div>
        <div class="q-desc"><% if(sw){ %>Miaka 2–3 NVA<% } else { %>2–3 year NVA certified<% } %></div>
      </a>
      <a href="${pageContext.request.contextPath}/admissions" class="quick-card">
        <div class="q-icon" style="background:#FFF7ED">📝</div>
        <div class="q-title"><% if(sw){ %>Omba Mtandaoni<% } else { %>Apply Online<% } %></div>
        <div class="q-desc"><% if(sw){ %>Ombi rahisi la mtandaoni<% } else { %>Easy online application<% } %></div>
      </a>
      <a href="${pageContext.request.contextPath}/payments" class="quick-card">
        <div class="q-icon" style="background:#F5F3FF">💳</div>
        <div class="q-title"><% if(sw){ %>Malipo<% } else { %>Payments<% } %></div>
        <div class="q-desc"><% if(sw){ %>Nambari ya Udhibiti<% } else { %>Control number system<% } %></div>
      </a>
      <a href="${pageContext.request.contextPath}/portal" class="quick-card">
        <div class="q-icon" style="background:#F0FDFA">🖥️</div>
        <div class="q-title"><% if(sw){ %>Tovuti ya Wanafunzi<% } else { %>Student Portal<% } %></div>
        <div class="q-desc"><% if(sw){ %>Hali na nyaraka<% } else { %>Status & documents<% } %></div>
      </a>
      <a href="${pageContext.request.contextPath}/production" class="quick-card">
        <div class="q-icon" style="background:#FEF9C3">🔨</div>
        <div class="q-title"><% if(sw){ %>Uzalishaji<% } else { %>Production<% } %></div>
        <div class="q-desc"><% if(sw){ %>Bidhaa na huduma<% } else { %>Products & services<% } %></div>
      </a>
    </div>
  </div>
</section>

<%-- ══ FEATURED COURSES ══ --%>
<section style="padding:68px 0;background:#fff">
  <div class="wrap">
    <div style="display:flex;justify-content:space-between;align-items:flex-end;margin-bottom:32px;flex-wrap:wrap;gap:12px">
      <div>
        <span class="sk"><% if(sw){ %>Programu Bora<% } else { %>Top Programs<% } %></span>
        <h2 class="st"><% if(sw){ %>Kozi Zilizoangaziwa<% } else { %>Featured Courses<% } %></h2>
      </div>
      <a href="${pageContext.request.contextPath}/courses?type=long" class="btn btn-outline">
        <% if(sw){ %>Angalia Zote →<% } else { %>View All →<% } %>
      </a>
    </div>
    <div class="grid3">
      <c:forEach var="c" items="${longCourses}" end="2">
      <div class="prog-card">
        <div class="prog-head" style="background:linear-gradient(135deg,#0A2463,#1565C0)">
          <div class="prog-icon">📚</div>
          <div class="prog-type">NVA <% if(sw){ %>KOZI NDEFU<% } else { %>LONG COURSE<% } %></div>
          <h3>${c.nameEn}</h3>
          <div class="prog-nva">${c.nvaLevel} · ${c.getDurationDisplay()}</div>
        </div>
        <div class="prog-body">
          <div class="prog-row">
            <span class="prl"><% if(sw){ %>Muda<% } else { %>Duration<% } %></span>
            <span class="prv">${c.getDurationDisplay()}</span>
          </div>
          <div class="prog-row">
            <span class="prl"><% if(sw){ %>Ada/Mwaka<% } else { %>Annual Fee<% } %></span>
            <span class="prv">TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/></span>
          </div>
          <div class="prog-row">
            <span class="prl"><% if(sw){ %>Kuingia<% } else { %>Entry<% } %></span>
            <span class="prv">Form IV (CSEE)</span>
          </div>
        </div>
        <div class="prog-foot">
          <a href="${pageContext.request.contextPath}/admissions?courseId=${c.id}" class="btn btn-primary btn-block">
            <% if(sw){ %>Omba Sasa →<% } else { %>Apply Now →<% } %>
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
        <span class="sk"><% if(sw){ %>Habari za Hivi Karibuni<% } else { %>Latest Updates<% } %></span>
        <h2 class="st"><% if(sw){ %>Habari na Matukio<% } else { %>News & Events<% } %></h2>
      </div>
      <a href="${pageContext.request.contextPath}/news" class="btn btn-outline"><% if(sw){ %>Angalia Zote →<% } else { %>View All →<% } %></a>
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
          <a href="${pageContext.request.contextPath}/news" class="n-more"><% if(sw){ %>Soma zaidi →<% } else { %>Read more →<% } %></a>
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
      <h3><% if(sw){ %>Ujumbe Kamili wa Mkuu wa Chuo<% } else { %>Principal's Full Welcome Message<% } %></h3>
      <button class="modal-close" onclick="closeModal('principalModal')">✕</button>
    </div>
    <div class="modal-body">
      <c:if test="${principal != null}">
        <div style="text-align:center;margin-bottom:20px">
          <div class="principal-modal-avatar">👨‍💼</div>
          <h3>${principal.displayName}</h3>
          <p style="color:var(--gold);font-size:.85rem">${principal.roleTitle}</p>
        </div>
        <div class="modal-quote">${principal.welcomeMessage}</div>
      </c:if>
    </div>
    <div class="modal-foot">
      <button class="btn btn-primary" onclick="closeModal('principalModal')"><% if(sw){ %>Funga<% } else { %>Close<% } %></button>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
