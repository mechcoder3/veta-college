<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Login"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); String loginType = request.getParameter("type"); %>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <h1><%= "admin".equals(loginType) ? (sw?"Kuingia kwa Msimamizi":"Admin Login") : (sw?"Kuingia":"Login") %></h1>
  </div>
</div>

<div style="padding:56px 0;background:var(--off)">
<div class="wrap-xs">
  <div class="plc">
    <div style="text-align:center;margin-bottom:22px">
      <div style="width:72px;height:72px;border-radius:50%;background:<%= "admin".equals(loginType)?"var(--navy)":"#E3F2FD" %>;display:flex;align-items:center;justify-content:center;font-size:2rem;margin:0 auto 14px"><%= "admin".equals(loginType)?"🔐":"👨‍🎓" %></div>
      <h2 style="font-size:1.35rem;color:var(--navy)"><%= "admin".equals(loginType)?(sw?"Kuingia kwa Msimamizi":"Admin Login"):(sw?"Kuingia kwa Mwanafunzi":"Student Login") %></h2>
      <p style="font-size:.82rem;color:var(--g400);margin-top:4px"><%= "admin".equals(loginType)?(sw?"Wafanyakazi walioidhinishwa pekee":"Authorized staff only"):(sw?"Ingiza vitambulisho vyako":"Enter your credentials") %></p>
    </div>

    <c:if test="${not empty error}">
      <div class="alert-error"><c:out value="${error}"/></div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
      <input type="hidden" name="loginType" value="<%= loginType %>">
      <div class="fg">
        <label><% if(sw){ %>Jina la Mtumiaji / Barua Pepe<% } else { %>Username / Email<% } %> *</label>
        <input class="fc" name="username" required placeholder="<%= "admin".equals(loginType)?"admin@vetacollege.ac.tz":"VETA/STU/2025/XXXX" %>" autofocus>
      </div>
      <div class="fg">
        <label><% if(sw){ %>Nenosiri<% } else { %>Password<% } %> *</label>
        <input class="fc" name="password" type="password" required placeholder="••••••••">
      </div>
      <button type="submit" class="btn btn-primary btn-block btn-lg">
        🔐 <% if(sw){ %>Ingia<% } else { %>Login<% } %>
      </button>
    </form>

    <% if (!"admin".equals(loginType)) { %>
    <div style="text-align:center;margin-top:14px;font-size:.82rem">
      <a href="${pageContext.request.contextPath}/admissions" style="color:var(--blue)">
        <% if(sw){ %>Bado hujaomba? Omba sasa →<% } else { %>Not applied yet? Apply now →<% } %>
      </a>
    </div>
    <% } %>

    <div style="background:var(--g100);border-radius:8px;padding:11px;margin-top:14px;font-size:.75rem;color:var(--g600);text-align:center">
      💡 Demo credentials: <strong>admin</strong> / <strong>admin123</strong>
    </div>
  </div>
</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
