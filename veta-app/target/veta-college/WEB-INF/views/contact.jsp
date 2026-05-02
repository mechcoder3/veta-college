<%-- ════════════════ contact.jsp ════════════════ --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="contact"/>
<c:set var="pageTitle" value="Contact Us"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><%= sw?"Nyumbani":"Home" %></a><span class="bcs">›</span><span><%= sw?"Wasiliana":"Contact" %></span></div>
    <h1><%= sw?"Wasiliana Nasi":"Contact Us" %></h1>
    <p><%= sw?"Tuko hapa kusaidia. Fikia kwa simu, barua pepe, au tembelea ofisini.":"We are here to help. Reach us by phone, email or visit us in person." %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:36px">
    <%-- Contact Info --%>
    <div>
      <h2 style="font-size:1.7rem;color:var(--navy);margin-bottom:20px"><%= sw?"Mawasiliano":"Get In Touch" %></h2>
      <div style="display:flex;gap:14px;margin-bottom:20px">
        <div style="width:50px;height:50px;border-radius:50%;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.2rem;flex-shrink:0;border:2px solid rgba(21,101,192,.15)">📍</div>
        <div><h4 style="font-size:.85rem;font-weight:700;color:var(--g700);margin-bottom:3px"><%= sw?"Anwani ya Mahali":"Physical Address" %></h4><p style="font-size:.85rem;color:var(--g600)">Plot No. 12, Vocational Training Road<br>Kinondoni, Dar es Salaam, Tanzania</p></div>
      </div>
      <div style="display:flex;gap:14px;margin-bottom:20px">
        <div style="width:50px;height:50px;border-radius:50%;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.2rem;flex-shrink:0;border:2px solid rgba(21,101,192,.15)">📞</div>
        <div><h4 style="font-size:.85rem;font-weight:700;color:var(--g700);margin-bottom:3px"><%= sw?"Nambari za Simu":"Phone Numbers" %></h4>
          <a href="tel:+255282804951" style="font-size:.85rem;color:var(--g600);display:block;margin-bottom:2px">+255282804951 (<%= sw?"Ofisi Kuu":"Main Office" %>)</a>
          <a href="tel:+255282804951" style="font-size:.85rem;color:var(--g600);display:block;margin-bottom:2px">+255282804951 (<%= sw?"Udahili":"Admissions" %>)</a>
          <a href="tel:+255282804951" style="font-size:.85rem;color:var(--g600);display:block;margin-bottom:2px">+255282804951 (<%= sw?"Malipo":"Payments" %>)</a>
          <a href="tel:+255282804951" style="font-size:.85rem;color:var(--g600);display:block">+255282804951 (<%= sw?"Uzalishaji":"Production" %>)</a>
        </div>
      </div>
      <div style="display:flex;gap:14px;margin-bottom:20px">
        <div style="width:50px;height:50px;border-radius:50%;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.2rem;flex-shrink:0;border:2px solid rgba(21,101,192,.15)">✉️</div>
        <div><h4 style="font-size:.85rem;font-weight:700;color:var(--g700);margin-bottom:3px"><%= sw?"Barua Pepe":"Email Addresses" %></h4>
          <a href="kigomarvtsc@veta.go.tz" style="font-size:.85rem;color:var(--blue);display:block;margin-bottom:2px">kigomarvtsc@veta.go.tz</a>
          <a href="kigomarvtsc@veta.go.tz" style="font-size:.85rem;color:var(--blue);display:block;margin-bottom:2px">kigomarvtsc@veta.go.tz</a>
          <a href="kigomarvtsc@veta.go.tz" style="font-size:.85rem;color:var(--blue);display:block">kigomarvtsc@veta.go.tz</a>
        </div>
      </div>
      <div style="display:flex;gap:14px;margin-bottom:24px">
        <div style="width:50px;height:50px;border-radius:50%;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.2rem;flex-shrink:0;border:2px solid rgba(21,101,192,.15)">🕒</div>
        <div><h4 style="font-size:.85rem;font-weight:700;color:var(--g700);margin-bottom:3px"><%= sw?"Saa za Ofisi":"Office Hours" %></h4>
          <p style="font-size:.85rem;color:var(--g600)"><%= sw?"Jumatatu–Ijumaa: 7:30 AM – 5:00 PM":"Mon–Fri: 7:30 AM – 4:00 PM" %><br><%= sw?"Jumamosi na Jumapili: Imefungwa":"Saturday and Sunday: Closed" %></p>
        </div>
      </div>
      <div style="background:#E3F2FD;border-radius:var(--r12);border:2px dashed var(--g300);height:220px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:7px;font-size:2.8rem;color:var(--blue);margin-bottom:18px">
        🗺️<span style="font-size:.82rem;font-weight:600;color:var(--navy)">KIGOMA RVTSC — Kigoma</span>
      </div>
      <div style="display:flex;gap:8px">
        <div class="soc">f</div><div class="soc">𝕏</div><div class="soc">in</div><div class="soc">W</div>
      </div>
    </div>

    <%-- Contact Form --%>
    <div style="background:#fff;border-radius:var(--r12);box-shadow:var(--s3);padding:32px">
      <h3 style="font-size:1.3rem;color:var(--navy);margin-bottom:20px"><%= sw?"Tutumie Ujumbe":"Send Us a Message" %></h3>
      <c:if test="${contactSuccess}"><div style="background:var(--greenbg);border:1px solid #86efac;color:var(--green);padding:12px 16px;border-radius:8px;margin-bottom:18px;font-size:.88rem">✅ <%= sw?"Ujumbe umetumwa! Tutajibu ndani ya masaa 24.":"Message sent! We will respond within 24 hours." %></div></c:if>
      <c:if test="${not empty contactError}"><div class="alert-error"><c:out value="${contactError}"/></div></c:if>
      <form method="post" action="${pageContext.request.contextPath}/contact">
        <div class="form-row">
          <div class="fg"><label><%= sw?"Jina Kamili":"Full Name" %> *</label><input class="fc" name="name" required placeholder="<%= sw?"Jina lako kamili":"Your full name" %>"></div>
          <div class="fg"><label><%= sw?"Simu":"Phone" %> *</label><input class="fc" name="phone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
        </div>
        <div class="fg"><label><%= sw?"Barua Pepe":"Email" %> *</label><input class="fc" name="email" type="email" required placeholder="your@email.com"></div>
        <div class="fg"><label><%= sw?"Mada":"Subject" %></label>
          <select class="fc" name="subject">
            <option><%= sw?"Maswali ya Jumla":"General Enquiry" %></option>
            <option><%= sw?"Taarifa za Kozi":"Course Information" %></option>
            <option><%= sw?"Udahili":"Admissions" %></option>
            <option><%= sw?"Ada na Malipo":"Fees & Payments" %></option>
            <option><%= sw?"Huduma za Uzalishaji":"Production Services" %></option>
            <option><%= sw?"Nyingine":"Other" %></option>
          </select>
        </div>
        <div class="fg"><label><%= sw?"Ujumbe":"Message" %> *</label><textarea class="fc" name="message" rows="5" required placeholder="<%= sw?"Andika ujumbe wako hapa...":"Type your message here..." %>"></textarea></div>
        <button type="submit" class="btn btn-primary btn-block btn-lg">📤 <%= sw?"Tuma Ujumbe":"Send Message" %></button>
      </form>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
