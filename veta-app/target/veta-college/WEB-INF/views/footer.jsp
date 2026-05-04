<%@ page contentType="text/html;charset=UTF-8" %>
<%
    boolean sw = "sw".equals(session.getAttribute("lang"));
%>
<footer>
  <div class="wrap">
    <div class="footer-grid">
      <div class="footer-brand">
        <div class="footer-logo">
          <div class="logo-emblem">V</div>
          <div>
            <div class="footer-name"><% if(sw){ %>Chuo cha VETA kigoma<% } else { %>Kigoma rvtsc<% } %></div>
            <div class="footer-sub"><% if(sw){ %>Mamlaka ya Elimu na Mafunzo ya Ufundi<% } else { %>Vocational Education & Training Authority<% } %></div>
          </div>
        </div>
        <p><%= sw ?
            "Chuo kinachoongoza kwa mafunzo ya ufundi yaliyoidhinishwa na serikali Tanzania. Kuwawezesha vijana kwa ujuzi wa vitendo kwa mustakabali bora tangu 2005." :
            "Tanzania's leading government-accredited vocational training institution. Empowering youth with practical skills for a better future since 2005." %></p>
        <div class="footer-certs">
          <span>🏛️ NACTVET Registered</span>
          <span>📜 NVA Level 2–3</span>
      
        </div>
        <div class="footer-social">
          <span class="soc">f</span><span class="soc">𝕏</span><span class="soc">in</span><span class="soc">W</span>
        </div>
      </div>
      <div class="footer-col">
        <h4><% if(sw){ %>Programu<% } else { %>Programs<% } %></h4>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Usakinishaji wa Umeme<% } else { %>Electrical Installation<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Uchemshaji na Uundaji<% } else { %>Welding & Fabrication<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Uhandisi wa Magari<% } else { %>Automotive Courses<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long">ICT Studies</a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><% if(sw){ %>Ushonaji na Mavazi<% } else { %>Tailoring & Garment<% } %></a>
        <a href="${pageContext.request.contextPath}/courses?type=short"><% if(sw){ %>Kozi Fupi (20+)<% } else { %>Short Courses (20+)<% } %></a>
      </div>
      <div class="footer-col">
        <h4><% if(sw){ %>Viungo vya Haraka<% } else { %>Quick Links<% } %></h4>
        <a href="${pageContext.request.contextPath}/about"><% if(sw){ %>Kuhusu Sisi<% } else { %>About Us<% } %></a>
        <a href="${pageContext.request.contextPath}/admissions"><% if(sw){ %>Omba Mtandaoni<% } else { %>Apply Online<% } %></a>
        <a href="${pageContext.request.contextPath}/payments"><% if(sw){ %>Ada na Malipo<% } else { %>Fees & Payments<% } %></a>
        <a href="${pageContext.request.contextPath}/production"><% if(sw){ %>Huduma za Uzalishaji<% } else { %>Production Services<% } %></a>
        <a href="${pageContext.request.contextPath}/news"><% if(sw){ %>Habari & Matukio<% } else { %>News & Events<% } %></a>
        <a href="${pageContext.request.contextPath}/portal"><% if(sw){ %>Tovuti ya Wanafunzi<% } else { %>Student Portal<% } %></a>
      </div>
      <div class="footer-col">
        <h4><% if(sw){ %>Wasiliana<% } else { %>Contact<% } %></h4>
        <span>📍 Kigoma</span>
        <a href="+255282804951">📞 +255282804951</a>
        <a href="+255282804951">📱+255282804951</a>
        <a href="kigomarvtsc@veta.go.tz">✉️ kigomarvtsc@veta.go.tz</a>
        <a href="kigomarvtsc@veta.go.tz">✉️ kigomarvtsc@veta.go.tz</a>
        <span class="hours"><% if(sw){ %>Jumatatu–Ijumaa: 7:30AM–4:00PM<% } else { %>Mon–Fri: 7:30AM–5:00PM<% } %></span>
      </div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 KIGOMA RVTSC. <% if(sw){ %>Haki zote zimehifadhiwa.<% } else { %>All rights reserved.<% } %></span>
      <div>
        <a href="#"><% if(sw){ %>Sera ya Faragha<% } else { %>Privacy Policy<% } %></a>
        <span class="sep">|</span>
        <a href="#"><% if(sw){ %>Masharti<% } else { %>Terms of Use<% } %></a>
        <span class="govt-badge"><% if(sw){ %>Imeidhinishwa na VETA makao makuu<% } else { %>VETE HQ. Accredited<% } %></span>
      </div>
    </div>
  </div>
</footer>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
