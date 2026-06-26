<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String lang = (String) session.getAttribute("lang");
if (lang == null)
	lang = "en";
boolean sw = "sw".equals(lang);
%>
<!DOCTYPE html>
<html lang="<%=lang%>">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title><c:out
		value="${pageTitle != null ? pageTitle : 'KIGOMA RVTSC'}" /> | KIGOMA
	RVTSC</title>
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<style>
/* Background Logo kwenye pages zote */
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
	background-image:
		url('${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	opacity: 0.05;
	pointer-events: none;
	z-index: 0;
}

/* === RESPONSIVE HEADER & LOGO SIZE TUNING === */
.nav-header-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px 5%;
	gap: 10px;
}
.logo-box img {
	max-width: 100%;
	height: auto;
	width: clamp(45px, 8vw, 85px); /* Inajipanga yenyewe kulingana na kifaa */
}
.college-name-left {
	font-size: clamp(14px, 2vw, 22px);
	font-weight: bold;
}
.government-titles-center {
	text-align: center;
	flex: 1;
}
.title-country {
	font-size: clamp(11px, 1.8vw, 18px);
	font-weight: 700;
	line-height: 1.2;
}
.title-subtext {
	font-size: clamp(9px, 1.4vw, 13px);
	line-height: 1.3;
	margin-top: 2px;
}

/* === FIX: Mobile menu KUSHOTO, Bluu, Maandishi Nyeupe na Upana Mdogo === */
#mobileNavBackdrop {
	display: none;
	position: fixed !important;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	z-index: 99998;
	opacity: 0;
	transition: opacity 0.3s ease;
}
#mobileNavBackdrop.open {
	display: block;
	opacity: 1;
}

#mobileNav {
	position: fixed !important;
	top: 0;
	left: 0; /* Imewekwa upande wa Kushoto */
	width: min(70vw, 260px); /* Upana umepunguzwa */
	height: 100vh;
	overflow-y: auto;
	-webkit-overflow-scrolling: touch;
	background: #002147; /* Rangi ya Bluu nzito */
	z-index: 99999;
	transform: translateX(-100%); /* Inatokea kushoto */
	transition: transform 0.3s ease;
	box-shadow: 6px 0 20px rgba(0, 0, 0, 0.3);
}
#mobileNav.open {
	transform: translateX(0);
}
body.menu-open {
	overflow: hidden;
}

.mobile-close-btn {
	display: block;
	margin: 12px auto 12px 18px; /* Kushoto zaidi karibu na maandishi */
	font-size: 26px;
	line-height: 1;
	background: none;
	border: none;
	cursor: pointer;
	padding: 4px 8px;
	color: #ffffff; /* Rangi nyeupe */
}
.mobile-inner {
	padding-top: 10px;
}
.mobile-inner a {
	display: block;
	padding: 12px 20px;
	color: #ffffff !important; /* Hakikisha maandishi ni meupe kabisa */
	text-decoration: none;
	font-family: 'Inter', sans-serif;
	font-size: 15px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.07);
	transition: background 0.2s ease;
}
.mobile-inner a:hover {
	background: rgba(255, 255, 255, 0.1);
	color: #ffeb3b !important; /* Njano ya kuvutia mtumiaji anapoguza */
}
</style>
</head>
<body>

	<div class="fixed-header-container">

		<%-- 1. TOPBAR --%>
		<div id="topbar">
			<div class="wrap">
				<div class="tb-left">
					<span><i class="fa-solid fa-phone"></i> +255282804951</span>
					<span class="sep">|</span>
					<span><i class="fa-solid fa-envelope"></i> kigomarvtsc@veta.go.tz</span>
					<span class="sep">|</span>
					<span><i class="fa-solid fa-location-dot"></i> Kigoma-Tanzania</span>
				</div>
				<div class="tb-right">
					<%
					java.time.LocalDate today = java.time.LocalDate.now();
					java.time.format.DateTimeFormatter fmt = java.time.format.DateTimeFormatter.ofPattern("EEE, dd MMM yyyy");
					%>
					<span><%=today.format(fmt)%></span> <span class="sep">|</span>
					<form method="post"
						action="${pageContext.request.contextPath}/setlang"
						style="display: inline">
						<input type="hidden" name="lang" value="en"> <input
							type="hidden" name="redirect"
							value="${requestScope['javax.servlet.forward.request_uri']}">
						<button type="submit" class="lb <%=!sw ? "active" : ""%>">EN</button>
					</form>
					<form method="post"
						action="${pageContext.request.contextPath}/setlang"
						style="display: inline">
						<input type="hidden" name="lang" value="sw"> <input
							type="hidden" name="redirect"
							value="${requestScope['javax.servlet.forward.request_uri']}">
						<button type="submit"
							class="lb <%if (sw) {%>active<%} else {%><%}%>">SW</button>
					</form>
				</div>
			</div>
		</div>

		<%-- 2. NAVBAR --%>
		<header id="nav-header"
			style="background-image: url('${pageContext.request.contextPath}/Images/bendera.PNG');">
			<div class="nav-header-inner">
				<div class="logo-box">
					<img src="${pageContext.request.contextPath}/Images/emblo.png"
						alt="Coat of Arms">
				</div>
				<div class="college-name-left">KIGOMA RVTSC</div>
				<div class="government-titles-center">
					<div class="title-country">
						<%=sw ? "JAMHURI YA MUUNGANO WA TANZANIA" : "THE UNITED REPUBLIC OF TANZANIA"%>
					</div>
					<div class="title-subtext">
						<%=sw ? "WIZARA YA ELIMU, SAYANSI NA TEKNOLOJIA" : "MINISTRY OF EDUCATION SCIENCE AND TECHNOLOGY"%>
					</div>
					<div class="title-subtext">
						<%=sw ? "MAMLAKA YA ELIMU NA MAFUNZO YA UFUNDI" : "VOCATIONAL EDUCATION AND TRAINING AUTHORITY"%>
					</div>
				</div>
				<div class="logo-box">
					<img
						src="${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png"
						alt="VETA Logo">
				</div>
			</div>
		</header>

		<%-- 3. NAV LINKS --%>
		<div id="nav-links-bar">
			<div class="wrap">
				<div class="nav-links">
					<a href="${pageContext.request.contextPath}/home"
						class="${activePage=='home'?'active':''}"> <%
 if (sw) {
 %>Nyumbani<%
 } else {
 %>Home<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/about"
						class="${activePage=='about'?'active':''}"> <%
 if (sw) {
 %>Kuhusu<%
 } else {
 %>About Us<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/courses?type=short"
						class="${activePage=='short'?'active':''}"> <%
 if (sw) {
 %>Kozi Fupi<%
 } else {
 %>Short Courses<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/courses?type=long"
						class="${activePage=='long'?'active':''}"> <%
 if (sw) {
 %>Kozi Ndefu<%
 } else {
 %>Long Courses<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/admissions"
						class="${activePage=='admissions'?'active':''}"> <%
 if (sw) {
 %>Maombi<%
 } else {
 %>Admissions<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/production"
						class="${activePage=='production'?'active':''}"> <%
 if (sw) {
 %>Uzalishaji<%
 } else {
 %>Production<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/payments"
						class="${activePage=='payments'?'active':''}"> <%
 if (sw) {
 %>Malipo<%
 } else {
 %>Payments<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/news"
						class="${activePage=='news'?'active':''}"> <%
 if (sw) {
 %>Habari<%
 } else {
 %>News<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/portal"
						class="nav-portal ${activePage=='portal'?'active':''}"> <%
 if (sw) {
 %>Tovuti<%
 } else {
 %>Student Portal<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/contact"
						class="${activePage=='contact'?'active':''}"> <%
 if (sw) {
 %>Wasiliana<%
 } else {
 %>Contact<%
 }
 %>
					</a> <a href="${pageContext.request.contextPath}/admin"
						class="nav-admin"> <%
 if (sw) {
 %>Msimamizi<%
 } else {
 %>Admin Login<%
 }
 %>
					</a>
				</div>
				<button class="menu-toggle" onclick="toggleMobileMenu()">☰</button>
			</div>
		</div>

	</div>

	<%-- 4. MOBILE MENU BACKDROP --%>
	<div id="mobileNavBackdrop" onclick="closeMobileMenu()"></div>

	<%-- 5. MOBILE MENU --%>
	<div id="mobileNav">
		<div class="mobile-inner">
			<button class="mobile-close-btn" onclick="closeMobileMenu()">&times;</button>
			<a href="${pageContext.request.contextPath}/home">🏠 <%
			if (sw) {
			%>Nyumbani<%
			} else {
			%>Home<%
			}
			%></a> <a href="${pageContext.request.contextPath}/about">ℹ️ <%
 if (sw) {
 %>Kuhusu Sisi<%
 } else {
 %>About Us<%
 }
 %></a> <a href="${pageContext.request.contextPath}/courses?type=short">⚡
				<%
 if (sw) {
 %>Kozi Fupi<%
 } else {
 %>Short Courses<%
 }
 %>
			</a> <a href="${pageContext.request.contextPath}/courses?type=long">🎓
				<%
 if (sw) {
 %>Kozi Ndefu<%
 } else {
 %>Long Courses<%
 }
 %>
			</a> <a href="${pageContext.request.contextPath}/admissions">📝 <%
 if (sw) {
 %>Maombi<%
 } else {
 %>Admissions<%
 }
 %></a> <a href="${pageContext.request.contextPath}/production">🔨 <%
 if (sw) {
 %>Uzalishaji<%
 } else {
 %>Production<%
 }
 %></a> <a href="${pageContext.request.contextPath}/payments">💳 <%
 if (sw) {
 %>Malipo<%
 } else {
 %>Payments<%
 }
 %></a> <a href="${pageContext.request.contextPath}/news">📰 <%
 if (sw) {
 %>Habari<%
 } else {
 %>News<%
 }
 %></a> <a href="${pageContext.request.contextPath}/portal">🖥️ <%
 if (sw) {
 %>Tovuti ya Wanafunzi<%
 } else {
 %>Student Portal<%
 }
 %></a> <a href="${pageContext.request.contextPath}/contact">📞 <%
 if (sw) {
 %>Wasiliana<%
 } else {
 %>Contact<%
 }
 %></a> <a href="${pageContext.request.contextPath}/admin">🔐 <%
 if (sw) {
 %>Msimamizi<%
 } else {
 %>Admin Login<%
 }
 %></a>
		</div>
	</div>

	<script>
		function toggleMobileMenu() {
			document.getElementById('mobileNav').classList.toggle('open');
			document.getElementById('mobileNavBackdrop').classList.toggle('open');
			document.body.classList.toggle('menu-open');
		}
		function closeMobileMenu() {
			document.getElementById('mobileNav').classList.remove('open');
			document.getElementById('mobileNavBackdrop').classList.remove('open');
			document.body.classList.remove('menu-open');
		}
	</script>
