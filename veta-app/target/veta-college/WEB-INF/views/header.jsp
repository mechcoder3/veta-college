<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";
    boolean sw = "sw".equals(lang);
%>
<!DOCTYPE html>
<html lang="<%= lang %>">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title><c:out value="${pageTitle != null ? pageTitle : 'KIGOMA RVTSC'}"/> | KIGOMA RVTSC</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="fixed-header-container">

    <%-- 1. TOPBAR --%>
    <div id="topbar">
      <div class="wrap">
        <div class="tb-left">
          <span>📞 +255282804951</span>
          <span class="sep">|</span>
          <span>✉️ kigomarvtsc@veta.go.tz</span>
          <span class="sep">|</span>
          <span>📍 Kigoma-Tanzania</span>
        </div>
        <div class="tb-right">
          <%
            java.time.LocalDate today = java.time.LocalDate.now();
            java.time.format.DateTimeFormatter fmt = java.time.format.DateTimeFormatter.ofPattern("EEE, dd MMM yyyy");
          %>
          <span><%= today.format(fmt) %></span>
          <span class="sep">|</span>
          <form method="post" action="${pageContext.request.contextPath}/setlang" style="display:inline">
            <input type="hidden" name="lang" value="en">
            <input type="hidden" name="redirect" value="${requestScope['javax.servlet.forward.request_uri']}">
            <button type="submit" class="lb <%= !sw?"active":"" %>">EN</button>
          </form>
          <form method="post" action="${pageContext.request.contextPath}/setlang" style="display:inline">
            <input type="hidden" name="lang" value="sw">
            <input type="hidden" name="redirect" value="${requestScope['javax.servlet.forward.request_uri']}">
            <button type="submit" class="lb <%= sw?"active":"" %>">SW</button>
          </form>
        </div>
      </div>
    </div>

    <%-- 2. NAVBAR YENYE MUUNDO MPYA --%>
    <header id="nav-header" style="background-image: url('${pageContext.request.contextPath}/Images/bendera.PNG');">
        <div class="nav-header-inner">
            <%-- Logo ya Kushoto --%>
            <div class="logo-box">
                <img src="${pageContext.request.contextPath}/Images/emblo.png" alt="Coat of Arms">
            </div>

            <%-- Jina la Chuo (PEMBENI) --%>
            <div class="college-name-left">KIGOMA RVTSC</div>

            <%-- Maandishi ya Kati (SERIKALI) --%>
            <div class="government-titles-center">
                <div class="title-country">
                    <%= sw ? "JAMHURI YA MUUNGANO WA TANZANIA" : "THE UNITED REPUBLIC OF TANZANIA" %>
                </div>
                <div class="title-subtext">
                    <%= sw ? "WIZARA YA ELIMU, SAYANSI NA TEKNOLOJIA" : "MINISTRY OF EDUCATION SCIENCE AND TECHNOLOGY" %>
                </div>
                <div class="title-subtext">
                    <%= sw ? "MAMLAKA YA ELIMU NA MAFUNZO YA UFUNDI" : "VOCATIONAL EDUCATION AND TRAINING AUTHORITY" %>
                </div>
            </div>

            <%-- Logo ya Kulia --%>
            <div class="logo-box">
                <img src="${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png" alt="VETA Logo">
            </div>
        </div>
    </header>

    <%-- 3. NAV LINKS --%>
    <div id="nav-links-bar">
      <div class="wrap">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home"               class="${activePage=='home'?'active':''}"       ><%= sw?"Nyumbani":"Home" %></a>
            <a href="${pageContext.request.contextPath}/about"              class="${activePage=='about'?'active':''}"      ><%= sw?"Kuhusu":"About Us" %></a>
            <a href="${pageContext.request.contextPath}/courses?type=short" class="${activePage=='short'?'active':''}"      ><%= sw?"Kozi Fupi":"Short Courses" %></a>
            <a href="${pageContext.request.contextPath}/courses?type=long"  class="${activePage=='long'?'active':''}"       ><%= sw?"Kozi Ndefu":"Long Courses" %></a>
            <a href="${pageContext.request.contextPath}/admissions"         class="${activePage=='admissions'?'active':''}" ><%= sw?"Maombi":"Admissions" %></a>
            <a href="${pageContext.request.contextPath}/production"         class="${activePage=='production'?'active':''}" ><%= sw?"Uzalishaji":"Production" %></a>
            <a href="${pageContext.request.contextPath}/payments"           class="${activePage=='payments'?'active':''}"   ><%= sw?"Malipo":"Payments" %></a>
            <a href="${pageContext.request.contextPath}/news"               class="${activePage=='news'?'active':''}"       ><%= sw?"Habari":"News" %></a>
            <a href="${pageContext.request.contextPath}/portal"             class="nav-portal ${activePage=='portal'?'active':''}" ><%= sw?"Tovuti":"Student Portal" %></a>
            <a href="${pageContext.request.contextPath}/contact"            class="${activePage=='contact'?'active':''}"    ><%= sw?"Wasiliana":"Contact" %></a>
            <a href="${pageContext.request.contextPath}/admin"              class="nav-admin"                               ><%= sw?"Msimamizi":"Admin Login" %></a>
        </div>
        <button class="menu-toggle" onclick="document.getElementById('mobileNav').classList.toggle('open')">☰</button>
      </div>
    </div>

</div>

<%-- 4. MOBILE MENU --%>
<div id="mobileNav">
  <div class="mobile-inner">
    <a href="${pageContext.request.contextPath}/home">🏠 <%= sw?"Nyumbani":"Home" %></a>
    <a href="${pageContext.request.contextPath}/about">ℹ️ <%= sw?"Kuhusu Sisi":"About Us" %></a>
    <a href="${pageContext.request.contextPath}/courses?type=short">⚡ <%= sw?"Kozi Fupi":"Short Courses" %></a>
    <a href="${pageContext.request.contextPath}/courses?type=long">🎓 <%= sw?"Kozi Ndefu":"Long Courses" %></a>
    <a href="${pageContext.request.contextPath}/admissions">📝 <%= sw?"Maombi":"Admissions" %></a>
    <a href="${pageContext.request.contextPath}/production">🔨 <%= sw?"Uzalishaji":"Production" %></a>
    <a href="${pageContext.request.contextPath}/payments">💳 <%= sw?"Malipo":"Payments" %></a>
    <a href="${pageContext.request.contextPath}/news">📰 <%= sw?"Habari":"News" %></a>
    <a href="${pageContext.request.contextPath}/portal">🖥️ <%= sw?"Tovuti ya Wanafunzi":"Student Portal" %></a>
    <a href="${pageContext.request.contextPath}/contact">📞 <%= sw?"Wasiliana":"Contact" %></a>
    <a href="${pageContext.request.contextPath}/admin">🔐 <%= sw?"Msimamizi":"Admin Login" %></a>
  </div>
</div>
