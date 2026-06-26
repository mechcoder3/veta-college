<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String lang = (String) session.getAttribute("lang");
if (lang == null) lang = "en";
boolean sw = "sw".equals(lang);
%>
<!DOCTYPE html>
<html lang="<%=lang%>">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title><c:out value="${pageTitle != null ? pageTitle : 'KIGOMA RVTSC'}"/> | KIGOMA RVTSC</title>

<%-- Google Fonts --%>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<%-- Font Awesome --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<%-- Main CSS --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<style>
/* ── Background Logo ── */
body::before {
  content: '';
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  max-width: 700px;
  min-width: 292px;
  aspect-ratio: 1/1;
  background-image: url('${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png');
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;
  opacity: 0.05;
  pointer-events: none;
  z-index: 0;
}

/* ── Topbar Icons ── */
.tb-left span i,
.tb-left span a i {
  font-size: .78rem;
  color: var(--gold, #FFD700);
  margin-right: 4px;
}
.tb-contact-link {
  color: inherit;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 4px;
}
.tb-contact-link:hover { opacity: .8; }

/* ── Mobile Menu Icons ── */
.mobile-inner a i {
  width: 20px;
  text-align: center;
  color: var(--gold, #FFD700);
  margin-right: 8px;
  font-size: .9rem;
}
.menu-toggle i {
  font-size: 1.2rem;
}
</style>
</head>
<body>

<div class="fixed-header-container">

  <%-- ══ 1. TOPBAR ══ --%>
  <div id="topbar">
    <div class="wrap">
      <div class="tb-left">
        <span>
          <i class="fa-solid fa-phone"></i>
          <a href="tel:+255282804951" class="tb-contact-link">+255282804951</a>
        </span>
        <span class="sep">|</span>
        <span>
          <i class="fa-solid fa-envelope"></i>
          <a href="mailto:kigomarvtsc@veta.go.tz" class="tb-contact-link">kigomarvtsc@veta.go.tz</a>
        </span>
        <span class="sep">|</span>
        <span>
          <i class="fa-solid fa-location-dot"></i>
          Kigoma-Tanzania
        </span>
      </div>
      <div class="tb-right">
        <%
          java.time.LocalDate today = java.time.LocalDate.now();
          java.time.format.DateTimeFormatter fmt = java.time.format.DateTimeFormatter.ofPattern("EEE, dd MMM yyyy");
        %>
        <span><i class="fa-regular fa-calendar" style="margin-right:4px;font-size:.75rem"></i><%=today.format(fmt)%></span>
        <span class="sep">|</span>
        <form method="post" action="${pageContext.request.contextPath}/setlang" style="display:inline">
          <input type="hidden" name="lang" value="en">
          <input type="hidden" name="redirect" value="${requestScope['javax.servlet.forward.request_uri']}">
          <button type="submit" class="lb <%=!sw ? "active" : ""%>">EN</button>
        </form>
        <form method="post" action="${pageContext.request.contextPath}/setlang" style="display:inline">
          <input type="hidden" name="lang" value="sw">
          <input type="hidden" name="redirect" value="${requestScope['javax.servlet.forward.request_uri']}">
          <button type="submit" class="lb <%=sw ? "active" : ""%>">SW</button>
        </form>
      </div>
    </div>
  </div>

  <%-- ══ 2. NAVBAR ══ --%>
  <header id="nav-header"
    style="background-image:url('${pageContext.request.contextPath}/Images/bendera.PNG');">
    <div class="nav-header-inner">
      <div class="logo-box">
        <img src="${pageContext.request.contextPath}/Images/emblo.png" alt="Coat of Arms">
      </div>
      <div class="college-name-left">KIGOMA RVTSC</div>
      <div class="government-titles-center">
        <div class="title-country"><%=sw ? "JAMHURI YA MUUNGANO WA TANZANIA" : "THE UNITED REPUBLIC OF TANZANIA"%></div>
        <div class="title-subtext"><%=sw ? "WIZARA YA ELIMU, SAYANSI NA TEKNOLOJIA" : "MINISTRY OF EDUCATION SCIENCE AND TECHNOLOGY"%></div>
        <div class="title-subtext"><%=sw ? "MAMLAKA YA ELIMU NA MAFUNZO YA UFUNDI" : "VOCATIONAL EDUCATION AND TRAINING AUTHORITY"%></div>
      </div>
      <div class="logo-box">
        <img src="${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png" alt="VETA Logo">
      </div>
    </div>
  </header>

  <%-- ══ 3. NAV LINKS ══ --%>
  <div id="nav-links-bar">
    <div class="wrap">
      <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home"       class="${activePage=='home'?'active':''}"><%=sw?"Nyumbani":"Home"%></a>
        <a href="${pageContext.request.contextPath}/about"      class="${activePage=='about'?'active':''}"><%=sw?"Kuhusu":"About Us"%></a>
        <a href="${pageContext.request.contextPath}/courses?type=short" class="${activePage=='short'?'active':''}"><%=sw?"Kozi Fupi":"Short Courses"%></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"  class="${activePage=='long'?'active':''}"><%=sw?"Kozi Ndefu":"Long Courses"%></a>
        <a href="${pageContext.request.contextPath}/admissions"  class="${activePage=='admissions'?'active':''}"><%=sw?"Maombi":"Admissions"%></a>
        <a href="${pageContext.request.contextPath}/production"  class="${activePage=='production'?'active':''}"><%=sw?"Uzalishaji":"Production"%></a>
        <a href="${pageContext.request.contextPath}/payments"    class="${activePage=='payments'?'active':''}"><%=sw?"Malipo":"Payments"%></a>
        <a href="${pageContext.request.contextPath}/news"        class="${activePage=='news'?'active':''}"><%=sw?"Habari":"News"%></a>
        <a href="${pageContext.request.contextPath}/portal"      class="nav-portal ${activePage=='portal'?'active':''}"><%=sw?"Tovuti":"Student Portal"%></a>
        <a href="${pageContext.request.contextPath}/contact"     class="${activePage=='contact'?'active':''}"><%=sw?"Wasiliana":"Contact"%></a>
        <a href="${pageContext.request.contextPath}/admin"       class="nav-admin"><%=sw?"Msimamizi":"Admin Login"%></a>
      </div>
      <button class="menu-toggle" onclick="document.getElementById('mobileNav').classList.toggle('open')">
        <i class="fa-solid fa-bars"></i>
      </button>
    </div>
  </div>

</div><%-- end fixed-header-container --%>

<%-- ══ 4. MOBILE MENU ══ --%>
<div id="mobileNav">
  <div class="mobile-inner">
    <a href="${pageContext.request.contextPath}/home">
      <i class="fa-solid fa-house"></i><%=sw?"Nyumbani":"Home"%>
    </a>
    <a href="${pageContext.request.contextPath}/about">
      <i class="fa-solid fa-circle-info"></i><%=sw?"Kuhusu Sisi":"About Us"%>
    </a>
    <a href="${pageContext.request.contextPath}/courses?type=short">
      <i class="fa-solid fa-bolt"></i><%=sw?"Kozi Fupi":"Short Courses"%>
    </a>
    <a href="${pageContext.request.contextPath}/courses?type=long">
      <i class="fa-solid fa-graduation-cap"></i><%=sw?"Kozi Ndefu":"Long Courses"%>
    </a>
    <a href="${pageContext.request.contextPath}/admissions">
      <i class="fa-solid fa-file-pen"></i><%=sw?"Maombi":"Admissions"%>
    </a>
    <a href="${pageContext.request.contextPath}/production">
      <i class="fa-solid fa-hammer"></i><%=sw?"Uzalishaji":"Production"%>
    </a>
    <a href="${pageContext.request.contextPath}/payments">
      <i class="fa-solid fa-credit-card"></i><%=sw?"Malipo":"Payments"%>
    </a>
    <a href="${pageContext.request.contextPath}/news">
      <i class="fa-solid fa-newspaper"></i><%=sw?"Habari":"News"%>
    </a>
    <a href="${pageContext.request.contextPath}/portal">
      <i class="fa-solid fa-desktop"></i><%=sw?"Tovuti ya Wanafunzi":"Student Portal"%>
    </a>
    <a href="${pageContext.request.contextPath}/contact">
      <i class="fa-solid fa-phone"></i><%=sw?"Wasiliana":"Contact"%>
    </a>
    <a href="${pageContext.request.contextPath}/admin">
      <i class="fa-solid fa-lock"></i><%=sw?"Msimamizi":"Admin Login"%>
    </a>
  </div>
</div>
