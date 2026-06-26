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

/* === UTATUZI: Logo na Maandishi kutokatwa (Responsive Header) === */
#nav-header {
	height: auto !important; /* Inaruhusu header kutanuka kulingana na maandishi */
	min-height: 90px;
	padding: 10px 0;
	background-size: cover;
	background-position: center;
}
.nav-header-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 5px 4%;
	gap: 12px;
	width: 100%;
	box-sizing: border-box;
}
.logo-box {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}
.logo-box img {
	/* IMEBADILISHWA: Nembo imezidishwa ukubwa hapa */
	width: clamp(55px, 9vw, 95px); 
	height: auto;
	object-fit: contain;
}
.college-name-left {
	font-size: clamp(13px, 1.8vw, 20px);
	font-weight: bold;
	white-space: nowrap; /* Inazuia jina kukatwa ovyo */

}
.government-titles-center {
	text-align: center;
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.title-country {
	font-size: clamp(10px, 1.6vw, 16px);
	font-weight: 700;
	line-height: 1.2;
}
.title-subtext {
	font-size: clamp(8.5px, 1.3vw, 12px);
	line-height: 1.3;
	margin-top: 2px;
}

/* Kwenye simu ndogo sana, vitu vishuke chini kuliko kubanana na kukatika */
@media (max-width: 480px) {
	.nav-header-inner {
		gap: 8px;
		padding: 3px 2%;
	}
	.college-name-left {
		display: none; /* Mara nyingi kwenye simu jina hili linafichwa kwa kuwa nembo na maelezo ya kati yanatosha */
	}
}

/* === UTATUZI WA SCROLL: Mobile menu KUSHOTO yenye Scroll huru === */
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
	left: 0; 
	width: min(75vw, 260px); 
	height: 100% !important; /* Badala ya 100vh ili kuzuia matatizo ya simu */
	max-height: 100vh;
	background: #002147; /* Rangi ya Bluu nzito */
	z-index: 99999;
	transform: translateX(-100%); 
	transition: transform 0.3s ease;
	box-shadow: 6px 0 20px rgba(0, 0, 0, 0.3);
	
	/* Hapa ndio suluhisho la kuscroll */
	overflow-y: auto !important;
	overflow-x: hidden;
	-webkit-overflow-scrolling: touch !important; 
}
#mobileNav.open {
	transform: translateX(0);
}

/* Inazuia tu background ya nyuma isiscroll, lakini inaruhusu menu iscrolo */
body.menu-open {
	overflow: hidden !important;
	position: fixed;
	width: 100%;
}

.mobile-close-btn {
	display: block;
	margin: 12px auto 12px 18px; 
	font-size: 26px;
	line-height: 1;
	background: none;
	border: none;
	cursor: pointer;
	padding: 4px 8px;
	color: #ffffff; 
}
.mobile-inner {
	padding-top: 5px;
	padding-bottom: 40px; /* Nafasi ya ziada chini kabisa baada ya kulink kote ili isigomee mwishoni */
}
.mobile-inner a {
	display: block;
	padding: 14px 20px;
	color: #ffffff !important; 
	text-decoration: none;
	font-family: 'Inter', sans-serif;
	font-size: 15px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.07);
	transition: background 0.2s ease;
}
.mobile-inner a:hover {
	background: rgba(255, 255, 255, 0.1);
	color: #ffeb3b !important; 
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
