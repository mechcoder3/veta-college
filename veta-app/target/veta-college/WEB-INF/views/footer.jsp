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
            <div class="footer-name"><%= sw?"Chuo cha VETA kigoma":"Kigoma rvtsc" %></div>
            <div class="footer-sub"><%= sw?"Mamlaka ya Elimu na Mafunzo ya Ufundi":"Vocational Education & Training Authority" %></div>
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
        <h4><%= sw?"Programu":"Programs" %></h4>
        <a href="${pageContext.request.contextPath}/courses?type=long"><%= sw?"Usakinishaji wa Umeme":"Electrical Installation" %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><%= sw?"Uchemshaji na Uundaji":"Welding & Fabrication" %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><%= sw?"Uhandisi wa Magari":"Automotive Engineering" %></a>
        <a href="${pageContext.request.contextPath}/courses?type=long">ICT Studies</a>
        <a href="${pageContext.request.contextPath}/courses?type=long"><%= sw?"Ushonaji na Mavazi":"Tailoring & Garment" %></a>
        <a href="${pageContext.request.contextPath}/courses?type=short"><%= sw?"Kozi Fupi (20+)":"Short Courses (20+)" %></a>
      </div>
      <div class="footer-col">
        <h4><%= sw?"Viungo vya Haraka":"Quick Links" %></h4>
        <a href="${pageContext.request.contextPath}/about"><%= sw?"Kuhusu Sisi":"About Us" %></a>
        <a href="${pageContext.request.contextPath}/admissions"><%= sw?"Omba Mtandaoni":"Apply Online" %></a>
        <a href="${pageContext.request.contextPath}/payments"><%= sw?"Ada na Malipo":"Fees & Payments" %></a>
        <a href="${pageContext.request.contextPath}/production"><%= sw?"Huduma za Uzalishaji":"Production Services" %></a>
        <a href="${pageContext.request.contextPath}/news"><%= sw?"Habari & Matukio":"News & Events" %></a>
        <a href="${pageContext.request.contextPath}/portal"><%= sw?"Tovuti ya Wanafunzi":"Student Portal" %></a>
      </div>
      <div class="footer-col">
        <h4><%= sw?"Wasiliana":"Contact" %></h4>
        <span>📍 Kigoma</span>
        <a href="+255282804951">📞 +255282804951</a>
        <a href="+255282804951">📱+255282804951</a>
        <a href="kigomarvtsc@veta.go.tz">✉️ kigomarvtsc@veta.go.tz</a>
        <a href="kigomarvtsc@veta.go.tz">✉️ kigomarvtsc@veta.go.tz</a>
        <span class="hours"><%= sw?"Jumatatu–Ijumaa: 7:30AM–4:00PM":"Mon–Fri: 7:30AM–5:00PM" %></span>
      </div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 KIGOMA RVTSC. <%= sw?"Haki zote zimehifadhiwa.":"All rights reserved." %></span>
      <div>
        <a href="#"><%= sw?"Sera ya Faragha":"Privacy Policy" %></a>
        <span class="sep">|</span>
        <a href="#"><%= sw?"Masharti":"Terms of Use" %></a>
        <span class="govt-badge"><%= sw?"Imeidhinishwa na VETA makao makuu":"VETE HQ. Accredited" %></span>
      </div>
    </div>
  </div>
</footer>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
