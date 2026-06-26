<%@ page contentType="text/html;charset=UTF-8" %>
<%
    boolean sw = "sw".equals(session.getAttribute("lang"));
%>

<%-- Font Awesome CDN (kama haikuwekwa kwenye header.jsp) --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>
/* ── Footer Social Buttons ── */
.footer-social {
  display: flex;
  gap: 8px;
  margin-top: 14px;
  flex-wrap: wrap;
}
.footer-soc-btn {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  transition: transform .2s ease, opacity .2s ease;
  color: #fff;
  font-size: .9rem;
}
.footer-soc-btn:hover {
  transform: translateY(-3px);
  opacity: .85;
}
.soc-fb { background: #1877F2; }
.soc-tw { background: #000000; }
.soc-li { background: #0A66C2; }
.soc-wa { background: #25D366; }
.soc-yt { background: #FF0000; }
.soc-ig { background: linear-gradient(45deg,#f09433,#e6683c,#dc2743,#cc2366,#bc1888); }

/* ── Footer Contact Icons ── */
.footer-contact-item {
  display: flex;
  align-items: flex-start;
  gap: 8px;
  margin-bottom: 7px;
  font-size: .83rem;
  color: rgba(255,255,255,.7);
  text-decoration: none;
}
.footer-contact-item i {
  margin-top: 2px;
  width: 14px;
  color: var(--gold, #FFD700);
  flex-shrink: 0;
}
.footer-contact-item:hover {
  color: #fff;
}

/* ── Footer Cert Badges ── */
.footer-cert-badge {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  background: rgba(255,255,255,.08);
  border: 1px solid rgba(255,255,255,.15);
  border-radius: 20px;
  padding: 4px 10px;
  font-size: .72rem;
  color: rgba(255,255,255,.75);
  margin-right: 6px;
  margin-bottom: 6px;
}
.footer-cert-badge i {
  color: var(--gold, #FFD700);
  font-size: .75rem;
}
</style>

<footer>
  <div class="wrap">
    <div class="footer-grid">

      <%-- ══ Brand Column ══ --%>
      <div class="footer-brand">
        <div class="footer-logo">
          <div class="logo-emblem" style="background:transparent;padding:2px;overflow:hidden;border-radius:50%;">
            <img src="${pageContext.request.contextPath}/Images/VETA LOGO EMBOSED.png"
                 alt="VETA Logo"
                 style="width:100%;height:100%;object-fit:contain;mix-blend-mode:screen;"/>
          </div>
          <div>
            <div class="footer-name"><% if(sw){ %>Chuo cha VETA Kigoma<% } else { %>Kigoma RVTSC<% } %></div>
            <div class="footer-sub"><% if(sw){ %>Mamlaka ya Elimu na Mafunzo ya Ufundi<% } else { %>Vocational Education &amp; Training Authority<% } %></div>
          </div>
        </div>

        <p><%= sw ?
            "Chuo kinachoongoza kwa mafunzo ya ufundi yaliyoidhinishwa na serikali Tanzania. Kuwawezesha vijana kwa ujuzi wa vitendo kwa mustakabali bora tangu 2005." :
            "Tanzania's leading government-accredited vocational training institution. Empowering youth with practical skills for a better future since 2005." %></p>

        <%-- Cert Badges --%>
        <div class="footer-certs" style="margin-bottom:10px">
          <span class="footer-cert-badge">
            <i class="fa-solid fa-building-columns"></i> NACTVET Registered
          </span>
          <span class="footer-cert-badge">
            <i class="fa-solid fa-scroll"></i> NVA Level 2–3
          </span>
        </div>

        <%-- Social Media --%>
        <div class="footer-social">
          <a href="#" class="footer-soc-btn soc-fb" title="Facebook">
            <i class="fa-brands fa-facebook-f"></i>
          </a>
          <a href="#" class="footer-soc-btn soc-tw" title="X (Twitter)">
            <i class="fa-brands fa-x-twitter"></i>
          </a>
          <a href="#" class="footer-soc-btn soc-li" title="LinkedIn">
            <i class="fa-brands fa-linkedin-in"></i>
          </a>
          <a href="#" class="footer-soc-btn soc-wa" title="WhatsApp">
            <i class="fa-brands fa-whatsapp"></i>
          </a>
          <a href="#" class="footer-soc-btn soc-yt" title="YouTube">
            <i class="fa-brands fa-youtube"></i>
          </a>
          <a href="#" class="footer-soc-btn soc-ig" title="Instagram">
            <i class="fa-brands fa-instagram"></i>
          </a>
        </div>
      </div>

      <%-- ══ Programs Column ══ --%>
      <div class="footer-col">
        <h4><% if(sw){ %>Programu<% } else { %>Programs<% } %></h4>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Usakinishaji wa Umeme<% } else { %>Electrical Installation<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Uchemshaji na Uundaji<% } else { %>Welding &amp; Fabrication<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Uhandisi wa Magari<% } else { %>Automotive Courses<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long">ICT Studies</a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Ushonaji na Mavazi<% } else { %>Tailoring &amp; Garment<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=short"><% if(sw){ %>Kozi Fupi (20+)<% } else { %>Short Courses (20+)<% } %></a>
      </div>

      <%-- ══ Quick Links Column ══ --%>
      <div class="footer-col">
        <h4><% if(sw){ %>Viungo vya Haraka<% } else { %>Quick Links<% } %></h4>
        <a href="${pageContext.request.contextPath}/about"><% if(sw){ %>Kuhusu Sisi<% } else { %>About Us<% } %></a>
        <a href="${pageContext.request.contextPath}/admissions"><% if(sw){ %>Omba Mtandaoni<% } else { %>Apply Online<% } %></a>
        <a href="${pageContext.request.contextPath}/payments"><% if(sw){ %>Ada na Malipo<% } else { %>Fees &amp; Payments<% } %></a>
        <a href="${pageContext.request.contextPath}/production"><% if(sw){ %>Huduma za Uzalishaji<% } else { %>Production Services<% } %></a>
        <a href="${pageContext.request.contextPath}/news"><% if(sw){ %>Habari &amp; Matukio<% } else { %>News &amp; Events<% } %></a>
        <a href="${pageContext.request.contextPath}/portal"><% if(sw){ %>Tovuti ya Wanafunzi<% } else { %>Student Portal<% } %></a>
      </div>

      <%-- ══ Contact Column ══ --%>
      <div class="footer-col">
        <h4><% if(sw){ %>Wasiliana<% } else { %>Contact<% } %></h4>

        <span class="footer-contact-item">
          <i class="fa-solid fa-location-dot"></i>
          <span>Kigoma, Tanzania</span>
        </span>

        <a href="tel:+255282804951" class="footer-contact-item">
          <i class="fa-solid fa-phone"></i>
          <span>+255 282 804 951</span>
        </a>

        <a href="tel:+255765765790" class="footer-contact-item">
          <i class="fa-solid fa-mobile-screen"></i>
          <span>+255 765 765 790</span>
        </a>

        <a href="mailto:kigomarvtsc@veta.go.tz" class="footer-contact-item">
          <i class="fa-solid fa-envelope"></i>
          <span>kigomarvtsc@veta.go.tz</span>
        </a>

        <span class="footer-contact-item">
          <i class="fa-solid fa-clock"></i>
          <span><% if(sw){ %>Jumatatu–Ijumaa: 7:30AM–5:00PM<% } else { %>Mon–Fri: 7:30AM–5:00PM<% } %></span>
        </span>

        <span class="footer-contact-item">
          <i class="fa-solid fa-circle-xmark" style="color:#ff6b6b"></i>
          <span><% if(sw){ %>Jumamosi &amp; Jumapili: Imefungwa<% } else { %>Sat &amp; Sun: Closed<% } %></span>
        </span>
      </div>

    </div><%-- end footer-grid --%>

    <%-- ══ Footer Bottom ══ --%>
    <div class="footer-bottom">
      <span>
        <i class="fa-regular fa-copyright" style="font-size:.8rem"></i>
        2026 KIGOMA RVTSC.
        <% if(sw){ %>Haki zote zimehifadhiwa.<% } else { %>All rights reserved.<% } %>
      </span>
      <div>
        <a href="#"><% if(sw){ %>Sera ya Faragha<% } else { %>Privacy Policy<% } %></a>
        <span class="sep">|</span>
        <a href="#"><% if(sw){ %>Masharti<% } else { %>Terms of Use<% } %></a>
        <span class="govt-badge">
          <i class="fa-solid fa-shield-halved" style="font-size:.7rem;margin-right:3px"></i>
          <% if(sw){ %>Imeidhinishwa na VETA Makao Makuu<% } else { %>VETA HQ Accredited<% } %>
        </span>
      </div>
    </div>

  </div>
</footer>

<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
