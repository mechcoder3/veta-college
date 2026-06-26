<%-- ════════════════ contact.jsp ════════════════ --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="contact"/>
<c:set var="pageTitle" value="Contact Us"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<%-- Font Awesome CDN --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>
/* ── Contact Icons ── */
.contact-icon-box {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: #E3F2FD;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  border: 2px solid rgba(21,101,192,.15);
}
.contact-icon-box i {
  font-size: 1.2rem;
  color: #1565C0;
}
.contact-row {
  display: flex;
  gap: 14px;
  margin-bottom: 20px;
  align-items: flex-start;
}
.contact-row h4 {
  font-size: .85rem;
  font-weight: 700;
  color: #555;
  margin-bottom: 4px;
}
.contact-row p, .contact-row a {
  font-size: .85rem;
  color: #666;
  display: block;
  margin-bottom: 2px;
  text-decoration: none;
}
.contact-row a:hover { color: #1565C0; }

/* ── Social Media Buttons ── */
.social-links {
  display: flex;
  gap: 10px;
  margin-top: 8px;
  flex-wrap: wrap;
}
.soc-btn {
  width: 42px;
  height: 42px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  transition: transform .2s ease, opacity .2s ease;
  color: #fff;
  font-size: 1rem;
}
.soc-btn:hover {
  transform: translateY(-3px);
  opacity: .88;
}
.soc-fb   { background: #1877F2; }
.soc-tw   { background: #000000; }
.soc-li   { background: #0A66C2; }
.soc-wa   { background: #25D366; }
.soc-yt   { background: #FF0000; }
.soc-ig   { background: linear-gradient(45deg,#f09433,#e6683c,#dc2743,#cc2366,#bc1888); }
</style>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a>
      <span class="bcs">›</span>
      <span><% if(sw){ %>Wasiliana<% } else { %>Contact<% } %></span>
    </div>
    <h1><% if(sw){ %>Wasiliana Nasi<% } else { %>Contact Us<% } %></h1>
    <p><% if(sw){ %>Tuko hapa kusaidia. Fikia kwa simu, barua pepe, au tembelea ofisini.<% } else { %>We are here to help. Reach us by phone, email or visit us in person.<% } %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:36px">

    <%-- ══ LEFT: Contact Info ══ --%>
    <div>
      <h2 style="font-size:1.7rem;color:var(--navy);margin-bottom:24px">
        <% if(sw){ %>Mawasiliano<% } else { %>Get In Touch<% } %>
      </h2>

      <%-- Location --%>
      <div class="contact-row">
        <div class="contact-icon-box">
          <i class="fa-solid fa-location-dot"></i>
        </div>
        <div>
          <h4><% if(sw){ %>Anwani ya Mahali<% } else { %>Physical Address<% } %></h4>
          <p>Plot No. 12, VETA Road<br>Kigoma, Tanzania</p>
        </div>
      </div>

      <%-- Phone --%>
      <div class="contact-row">
        <div class="contact-icon-box">
          <i class="fa-solid fa-phone"></i>
        </div>
        <div>
          <h4><% if(sw){ %>Nambari za Simu<% } else { %>Phone Numbers<% } %></h4>
          <a href="tel:+255282804951">+255 282 804 951 (<% if(sw){ %>Ofisi Kuu<% } else { %>Main Office<% } %>)</a>
          <a href="tel:+255282804951">+255 282 804 951 (<% if(sw){ %>Udahili<% } else { %>Admissions<% } %>)</a>
          <a href="tel:+255282804951">+255 282 804 951 (<% if(sw){ %>Malipo<% } else { %>Payments<% } %>)</a>
          <a href="tel:+255765765790">+255 765 765 790 (<% if(sw){ %>Uzalishaji<% } else { %>Production<% } %>)</a>
        </div>
      </div>

      <%-- Email --%>
      <div class="contact-row">
        <div class="contact-icon-box">
          <i class="fa-solid fa-envelope"></i>
        </div>
        <div>
          <h4><% if(sw){ %>Barua Pepe<% } else { %>Email Addresses<% } %></h4>
          <a href="mailto:kigomarvtsc@veta.go.tz">kigomarvtsc@veta.go.tz (<% if(sw){ %>Ofisi Kuu<% } else { %>Main Office<% } %>)</a>
          <a href="mailto:kigomarvtsc@veta.go.tz">kigomarvtsc@veta.go.tz (<% if(sw){ %>Udahili<% } else { %>Admissions<% } %>)</a>
          <a href="mailto:kigomarvtsc@veta.go.tz">kigomarvtsc@veta.go.tz (<% if(sw){ %>Uzalishaji<% } else { %>Production<% } %>)</a>
        </div>
      </div>

      <%-- Office Hours --%>
      <div class="contact-row">
        <div class="contact-icon-box">
          <i class="fa-solid fa-clock"></i>
        </div>
        <div>
          <h4><% if(sw){ %>Saa za Ofisi<% } else { %>Office Hours<% } %></h4>
          <p>
            <% if(sw){ %>
              Jumatatu – Ijumaa: 7:30 AM – 5:00 PM<br>
              Jumamosi &amp; Jumapili: Imefungwa
            <% } else { %>
              Monday – Friday: 7:30 AM – 4:00 PM<br>
              Saturday &amp; Sunday: Closed
            <% } %>
          </p>
        </div>
      </div>

      <%-- Google Map --%>
      <div style="border-radius:var(--r12);overflow:hidden;height:220px;margin-bottom:20px;box-shadow:var(--s2)">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.4194240652814!2d29.63945377400725!3d-4.869186050037099!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x19bf1b604f11f1a7%3A0xf616de04dee9d624!2sVETA%2C%20Kigoma!5e0!3m2!1sen!2sdz!4v1777930277495!5m2!1sen!2sdz"
          width="100%" height="220" style="border:0;"
          allowfullscreen="" loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

      <%-- Social Media --%>
      <h4 style="font-size:.85rem;font-weight:700;color:#555;margin-bottom:10px">
        <% if(sw){ %>Tufuate Mitandaoni<% } else { %>Follow Us Online<% } %>
      </h4>
      <div class="social-links">
        <a href="#" class="soc-btn soc-fb" title="Facebook">
          <i class="fa-brands fa-facebook-f"></i>
        </a>
        <a href="#" class="soc-btn soc-tw" title="X (Twitter)">
          <i class="fa-brands fa-x-twitter"></i>
        </a>
        <a href="#" class="soc-btn soc-li" title="LinkedIn">
          <i class="fa-brands fa-linkedin-in"></i>
        </a>
        <a href="#" class="soc-btn soc-wa" title="WhatsApp">
          <i class="fa-brands fa-whatsapp"></i>
        </a>
        <a href="#" class="soc-btn soc-yt" title="YouTube">
          <i class="fa-brands fa-youtube"></i>
        </a>
        <a href="#" class="soc-btn soc-ig" title="Instagram">
          <i class="fa-brands fa-instagram"></i>
        </a>
      </div>
    </div>

    <%-- ══ RIGHT: Contact Form ══ --%>
    <div style="background:#fff;border-radius:var(--r12);box-shadow:var(--s3);padding:32px">
      <h3 style="font-size:1.3rem;color:var(--navy);margin-bottom:20px">
        <i class="fa-solid fa-paper-plane" style="color:#1565C0;margin-right:8px"></i>
        <% if(sw){ %>Tutumie Ujumbe<% } else { %>Send Us a Message<% } %>
      </h3>

      <c:if test="${contactSuccess}">
        <div style="background:#f0fdf4;border:1px solid #86efac;color:#166534;padding:12px 16px;border-radius:8px;margin-bottom:18px;font-size:.88rem">
          <i class="fa-solid fa-circle-check"></i>
          <% if(sw){ %> Ujumbe umetumwa! Tutajibu ndani ya masaa 24.<% } else { %> Message sent! We will respond within 24 hours.<% } %>
        </div>
      </c:if>
      <c:if test="${not empty contactError}">
        <div class="alert-error"><c:out value="${contactError}"/></div>
      </c:if>

      <form method="post" action="${pageContext.request.contextPath}/contact">
        <div class="form-row">
          <div class="fg">
            <label><% if(sw){ %>Jina Kamili<% } else { %>Full Name<% } %> *</label>
            <input class="fc" name="name" required
                   placeholder="<% if(sw){ %>Jina lako kamili<% } else { %>Your full name<% } %>">
          </div>
          <div class="fg">
            <label><% if(sw){ %>Simu<% } else { %>Phone<% } %> *</label>
            <input class="fc" name="phone" type="tel" required placeholder="+255 7XX XXX XXX">
          </div>
        </div>
        <div class="fg">
          <label><% if(sw){ %>Barua Pepe<% } else { %>Email<% } %> *</label>
          <input class="fc" name="email" type="email" required placeholder="your@email.com">
        </div>
        <div class="fg">
          <label><% if(sw){ %>Mada<% } else { %>Subject<% } %></label>
          <select class="fc" name="subject">
            <option><% if(sw){ %>Maswali ya Jumla<% } else { %>General Enquiry<% } %></option>
            <option><% if(sw){ %>Taarifa za Kozi<% } else { %>Course Information<% } %></option>
            <option><% if(sw){ %>Udahili<% } else { %>Admissions<% } %></option>
            <option><% if(sw){ %>Ada na Malipo<% } else { %>Fees & Payments<% } %></option>
            <option><% if(sw){ %>Huduma za Uzalishaji<% } else { %>Production Services<% } %></option>
            <option><% if(sw){ %>Nyingine<% } else { %>Other<% } %></option>
          </select>
        </div>
        <div class="fg">
          <label><% if(sw){ %>Ujumbe<% } else { %>Message<% } %> *</label>
          <textarea class="fc" name="message" rows="5" required
                    placeholder="<% if(sw){ %>Andika ujumbe wako hapa...<% } else { %>Type your message here...<% } %>"></textarea>
        </div>
        <button type="submit" class="btn btn-primary btn-block btn-lg">
          <i class="fa-solid fa-paper-plane"></i>
          <% if(sw){ %> Tuma Ujumbe<% } else { %> Send Message<% } %>
        </button>
      </form>
    </div>

  </div>
</div>

<jsp:include page="footer.jsp"/>
