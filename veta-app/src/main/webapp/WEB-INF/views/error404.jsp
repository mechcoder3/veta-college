<%-- error404.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<c:set var="pageTitle" value="Page Not Found"/>
<jsp:include page="header.jsp"/>
<div style="text-align:center;padding:80px 24px">
  <div style="font-size:5rem;margin-bottom:20px">🔍</div>
  <h1 style="font-size:3rem;color:var(--navy);margin-bottom:12px">404</h1>
  <p style="font-size:1.1rem;color:var(--g600);margin-bottom:24px">Page not found. The page you are looking for does not exist.</p>
  <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">← Go to Home</a>
</div>
<jsp:include page="footer.jsp"/>
