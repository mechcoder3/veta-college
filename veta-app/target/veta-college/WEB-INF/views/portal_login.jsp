<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="portal"/>
<c:set var="pageTitle" value="Student Portal Login"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <h1><%= sw?"Tovuti ya Wanafunzi":"Student Portal" %></h1>
    <p><%= sw?"Ingia kupata taarifa zako za masomo, malipo na nyaraka.":"Login to access your academic records, payments and documents." %></p>
  </div>
</div>

<div style="padding:56px 0;background:var(--off)">
  <div class="wrap-xs">
    <div class="plc">
      <div class="plic">👨‍🎓</div>
      <h2 style="font-size:1.4rem;color:var(--navy);margin-bottom:5px;text-align:center"><%= sw?"Kuingia kwa Mwanafunzi":"Student Login" %></h2>
      <p style="font-size:.85rem;color:var(--g400);margin-bottom:22px;text-align:center">
        <%= sw?"Ingiza nambari yako ya usajili na nenosiri.":"Enter your student number and password." %>
      </p>

      <c:if test="${not empty loginError}">
        <div class="alert-error"><c:out value="${loginError}"/></div>
      </c:if>

      <form method="post" action="${pageContext.request.contextPath}/portal">
        <input type="hidden" name="action" value="login">
        <div class="fg">
          <label><%= sw?"Nambari ya Usajili / Kumbukumbu ya Maombi":"Registration No. / Application Reference" %> *</label>
          <input class="fc" name="studentNumber" required placeholder="VETA/STU/2025/XXXX  or  VETA-2025-XXXXX">
        </div>
        <div class="fg">
          <label><%= sw?"Nenosiri (tarakimu 6 za mwisho za NIDA)":"Password (last 6 digits of NIDA)" %> *</label>
          <input class="fc" name="password" type="password" required placeholder="••••••">
        </div>
        <button type="submit" class="btn btn-primary btn-block btn-lg">
          🔐 <%= sw?"Ingia kwenye Tovuti":"Login to Portal" %>
        </button>
      </form>

      <div style="text-align:center;margin-top:14px;font-size:.83rem">
        <a href="${pageContext.request.contextPath}/contact" style="color:var(--blue)">
          <%= sw?"Umesahau nenosiri? Wasiliana na Msajili":"Forgot password? Contact Registrar's Office" %>
        </a>
      </div>
      <div class="divider"></div>
      <div style="text-align:center">
        <p style="font-size:.84rem;color:var(--g400);margin-bottom:10px"><%= sw?"Bado hujaomba?":"Not yet applied?" %></p>
        <a href="${pageContext.request.contextPath}/admissions" class="btn btn-outline"><%= sw?"Omba Sasa →":"Apply Now →" %></a>
      </div>
      <div style="background:var(--g100);border-radius:8px;padding:11px;margin-top:14px;font-size:.76rem;color:var(--g600);text-align:center">
        💡 <%= sw?"Demo: ingiza nambari na nenosiri yoyote kupitia mfumo":"Demo: enter any student number and password to preview" %>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
