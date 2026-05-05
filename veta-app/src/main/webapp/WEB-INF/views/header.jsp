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

<style>
    body::before {
        content: "";
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        height: 100%;
        background-image: url('${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png');
        background-repeat: no-repeat;
        background-position: center;
        background-size: contain;
        opacity: 0.20;
        z-index: -1;
        pointer-events: none;
    }

    #mobileNav {
        position: fixed;
        top: 0;
        left: -100%;
        width: 75%;
        height: 100vh;
        background: var(--navy);
        z-index: 99999;
        transition: left 0.3s ease;
        overflow-y: auto;
        padding-top: 60px;
    }

    #mobileNav.open {
        left: 0;
    }

    .menu-toggle {
        z-index: 99999;
        position: relative;
    }

    .fixed-header-container {
        position: sticky;
        top: 0;
        z-index: 9000;
    }

    .nav-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        z-index: 99998;
    }

    .nav-overlay.active {
        display: block;
    }
</style>
</head>
<body>

<div class="nav-overlay" id="navOverlay" onclick="toggleMobileNav()"></div>

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
            <button type="submit" class="lb <% if(sw){ %>active<% } else { %><% } %>">SW</button>
          </form>
        </div>
      </div>
    </div>

    <%-- 2. NAVBAR --%>
    <header id="nav-header" style="background-image: url('${pageContext.request.contextPath}/Images/bendera.PNG');">
        <div class="nav-header-inner">
            <div class="logo-box">
                <img src="${pageContext.request.contextPath}/Images/emblo.png" alt="Coat of Arms">
            </div>
            <div class="college-name-left">KIGOMA RVTSC</div>
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
            <div class="logo-box">
                <img src="${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png" alt="VETA Logo">
            </div>
        </div>
    </header>

    <%-- 3. NAV LINKS --%>
    <div id="nav-links-bar">
      <div class="wrap">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home"               class="${activePage=='home'?'active':''}"       ><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a>
            <a href="${pageContext.request.contextPath}/about"              class="${activePage=='about'?'active':''}"      ><% if(sw){ %>Kuhusu<% } else { %>About Us<% } %></a>
            <a href="${pageContext.request.contextPath}/courses?type=short" class="${activePage=='short'?'active':''}"      ><% if(sw){ %>Kozi Fupi<% } else { %>Short Courses<% } %></a>
            <a href="${pageContext.request.contextPath}/courses?type=long"  class="${activePage=='long'?'active':''}"       ><% if(sw){ %>Kozi Ndefu<% } else { %>Long Courses<% } %></a>
            <a href="${pageContext.request.contextPath}/admissions"         class="${activePage=='admissions'?'active':''}" ><% if(sw){ %>Maombi<% } else { %>Admissions<% } %></a>
            <a href="${pageContext.request.contextPath}/production"         class="${activePage=='production'?'active':''}" ><% if(sw){ %>Uzalishaji<% } else { %>Production<% } %></a>
            <a href="${pageContext.request.contextPath}/payments"           class="${activePage=='payments'?'active':''}"   ><% if(sw){ %>Malipo<% } else { %>Payments<% } %></a>
            <a href="${pageContext.request.contextPath}/news"               class="${activePage=='news'?'active':''}"       ><% if(sw){ %>Habari<% } else { %>News<% } %></a>
            <a href="${pageContext.request.contextPath}/portal"             class="nav-portal ${activePage=='portal'?'active':''}" ><% if(sw){ %>Tovuti<% } else { %>Student Portal<% } %></a>
            <a href="${pageContext.request.contextPath}/contact"            class="${activePage=='contact'?'active':''}"    ><% if(sw){ %>Wasiliana<% } else { %>Contact<% } %></a>
            <a href="${pageContext.request.contextPath}/admin"              class="nav-admin"                               ><% if(sw){ %>Msimamizi<% } else { %>Admin Login<% } %></a>
        </div>
        <button class="menu-toggle" onclick="toggleMobileNav()">☰</button>
      </div>
    </div>
</div>

<script>
function toggleMobileNav() {
    var nav = document.getElementById('mobileNav');
    var overlay = document.getElementById('navOverlay');
    if (nav.classList.contains('open')) {
        nav.classList.remove('open');
        overlay.classList.remove('active');
    } else {
        nav.classList.add('open');
        overlay.classList.add('active');
    }
}
</script>