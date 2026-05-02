<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="portal"/>
<c:set var="pageTitle" value="Student Dashboard"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap" style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:12px">
    <div>
      <h1 style="color:#fff;margin-bottom:4px"><% if(sw){ %>Dashibodi ya Mwanafunzi<% } else { %>Student Dashboard<% } %></h1>
      <p><% if(sw){ %>Karibu tena,<% } else { %>Welcome back,<% } %> <c:out value="${sessionScope.userFullName}"/></p>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/portal">
      <input type="hidden" name="action" value="logout">
      <button type="submit" class="btn btn-outline-w btn-sm">🚪 <% if(sw){ %>Toka<% } else { %>Logout<% } %></button>
    </form>
  </div>
</div>

<div style="padding:36px 0;background:var(--off)"><div class="wrap">

  <c:if test="${not empty portalError}">
    <div class="alert-error"><c:out value="${portalError}"/></div>
  </c:if>

  <%-- Student info banner --%>
  <c:if test="${student != null}">
  <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--radius);padding:24px 28px;color:#fff;margin-bottom:24px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:14px">
    <div>
      <div style="font-size:.78rem;color:rgba(255,255,255,.6);margin-bottom:3px"><% if(sw){ %>Karibu tena,<% } else { %>Welcome back,<% } %></div>
      <div style="font-family:var(--fh);font-size:1.3rem;color:#fff">${student.fullName}</div>
      <div style="font-size:.8rem;color:rgba(255,255,255,.65);margin-top:3px">${student.studentNumber} · ${student.courseName} · Year ${student.yearOfStudy}/Sem ${student.semester}</div>
    </div>
    <span class="badge" style="background:rgba(255,255,255,.15);color:#fff;font-size:.8rem">${student.status}</span>
  </div>

  <%-- Stats --%>
  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:14px;margin-bottom:24px">
    <div class="pdsc"><div class="psi">📋</div><div class="psv" style="color:var(--green)">Active</div><div class="psl"><% if(sw){ %>Hali<% } else { %>Status<% } %></div></div>
    <div class="pdsc"><div class="psi">💳</div><div class="psv" style="color:var(--green)">Paid</div><div class="psl"><% if(sw){ %>Ada 2025/26<% } else { %>Fees 2025/26<% } %></div></div>
    <div class="pdsc"><div class="psi">📅</div><div class="psv">Y${student.yearOfStudy}/S${student.semester}</div><div class="psl"><% if(sw){ %>Mwaka/Muhula<% } else { %>Year/Sem<% } %></div></div>
    <div class="pdsc"><div class="psi">🎓</div><div class="psv">${student.courseName.length() > 12 ? student.courseName.substring(0,12)+'...' : student.courseName}</div><div class="psl"><% if(sw){ %>Programu<% } else { %>Program<% } %></div></div>
  </div>
  </c:if>

  <%-- Tabs --%>
  <div style="background:#fff;border-radius:var(--radius);box-shadow:var(--shadow);overflow:hidden">
    <div class="ptbn">
      <button class="ptb active" onclick="showPortalTab('info',this)"><% if(sw){ %>Taarifa<% } else { %>Profile<% } %></button>
      <button class="ptb" onclick="showPortalTab('payments',this)"><% if(sw){ %>Malipo<% } else { %>Payments<% } %></button>
      <button class="ptb" onclick="showPortalTab('results',this)"><% if(sw){ %>Matokeo<% } else { %>Results<% } %></button>
      <button class="ptb" onclick="showPortalTab('docs',this)"><% if(sw){ %>Nyaraka<% } else { %>Documents<% } %></button>
    </div>
    <div style="padding:24px">

      <%-- Profile Tab --%>
      <div id="ptab-info" class="ptbc active">
        <c:choose>
          <c:when test="${student != null}">
          <div class="grid2">
            <div style="background:var(--off);border-radius:8px;padding:18px">
              <h4 style="font-size:.9rem;color:var(--navy);margin-bottom:14px"><% if(sw){ %>Taarifa za Mwanafunzi<% } else { %>Student Information<% } %></h4>
              <div style="font-size:.83rem;color:var(--g700);display:flex;flex-direction:column;gap:8px">
                <div><strong><% if(sw){ %>Jina Kamili:<% } else { %>Full Name:<% } %></strong> ${student.fullName}</div>
                <div><strong><% if(sw){ %>Nambari ya Usajili:<% } else { %>Reg. No.:<% } %></strong> ${student.studentNumber}</div>
                <div><strong><% if(sw){ %>Programu:<% } else { %>Program:<% } %></strong> ${student.courseName}</div>
                <div><strong><% if(sw){ %>Mwaka/Muhula:<% } else { %>Year/Sem:<% } %></strong> Year ${student.yearOfStudy}, Semester ${student.semester}</div>
                <div><strong><% if(sw){ %>Mwaka wa Udahili:<% } else { %>Intake Year:<% } %></strong> ${student.intakeYear}</div>
                <div><strong><% if(sw){ %>Simu:<% } else { %>Phone:<% } %></strong> ${student.phone}</div>
                <div><strong><% if(sw){ %>Barua Pepe:<% } else { %>Email:<% } %></strong> ${student.email}</div>
              </div>
            </div>
            <div style="background:var(--off);border-radius:8px;padding:18px">
              <h4 style="font-size:.9rem;color:var(--navy);margin-bottom:14px"><% if(sw){ %>Muhtasari wa Fedha<% } else { %>Financial Summary<% } %></h4>
              <c:forEach var="p" items="${payments}">
              <div style="display:flex;justify-content:space-between;padding:7px 0;border-bottom:1px solid var(--g200);font-size:.83rem">
                <span>${p.paymentType.replace('_',' ')}</span>
                <span class="badge ${p.status=='PAID'?'b-green':'b-pending'}">
                  ${p.status=='PAID'?'✓':'⏳'} TZS <fmt:formatNumber value="${p.amount}" pattern="#,##0"/>
                </span>
              </div>
              </c:forEach>
            </div>
          </div>
          </c:when>
          <c:otherwise>
          <div style="text-align:center;padding:32px;color:var(--g400)">
            <div style="font-size:3rem;margin-bottom:12px">🎓</div>
            <p><% if(sw){ %>Tafadhali ingia na nambari yako ya usajili.<% } else { %>Please login with your student registration number.<% } %></p>
          </div>
          </c:otherwise>
        </c:choose>
      </div>

      <%-- Payments Tab --%>
      <div id="ptab-payments" class="ptbc">
        <c:choose>
          <c:when test="${not empty payments}">
          <div style="overflow-x:auto">
          <table class="dt">
            <thead><tr><th><% if(sw){ %>Nambari ya Udhibiti<% } else { %>Control No.<% } %></th><th><% if(sw){ %>Maelezo<% } else { %>Description<% } %></th><th><% if(sw){ %>Kiasi<% } else { %>Amount<% } %></th><th><% if(sw){ %>Tarehe<% } else { %>Date<% } %></th><th><% if(sw){ %>Hali<% } else { %>Status<% } %></th><th></th></tr></thead>
            <tbody>
              <c:forEach var="p" items="${payments}">
              <tr>
                <td style="font-family:monospace;font-size:.75rem">${p.controlNumber}</td>
                <td style="font-size:.82rem">${p.paymentType.replace('_',' ')}</td>
                <td style="font-weight:700">TZS <fmt:formatNumber value="${p.amount}" pattern="#,##0"/></td>
                <td style="font-size:.78rem"><fmt:formatDate value="${p.createdAt}" pattern="dd MMM yyyy"/></td>
                <td><span class="badge ${p.status=='PAID'?'b-green':'b-pending'}">${p.status=='PAID'?'✓ Paid':'⏳ Pending'}</span></td>
                <td><c:if test="${p.status=='PAID'}"><a href="${pageContext.request.contextPath}/download?type=receipt&ref=${p.controlNumber}" class="btn btn-ghost btn-xs">🧾</a></c:if></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          </div>
          </c:when>
          <c:otherwise><p style="color:var(--g400);padding:20px;text-align:center"><% if(sw){ %>Hakuna rekodi za malipo.<% } else { %>No payment records found.<% } %></p></c:otherwise>
        </c:choose>
      </div>

      <%-- Results Tab --%>
      <div id="ptab-results" class="ptbc">
        <table class="dt">
          <thead><tr><th><% if(sw){ %>Kanuni<% } else { %>Code<% } %></th><th><% if(sw){ %>Somo<% } else { %>Subject<% } %></th><th>CAT</th><th><% if(sw){ %>Mtihani<% } else { %>Exam<% } %></th><th><% if(sw){ %>Jumla<% } else { %>Total<% } %></th><th><% if(sw){ %>Daraja<% } else { %>Grade<% } %></th><th><% if(sw){ %>Mahudhurio<% } else { %>Attend.<% } %></th></tr></thead>
          <tbody>
            <tr><td>ICT4101</td><td style="font-size:.82rem">Computer Hardware & Networks</td><td>78</td><td>74</td><td>76</td><td><span class="badge b-green">B+</span></td><td>92%</td></tr>
            <tr><td>ICT4102</td><td style="font-size:.82rem">Programming Fundamentals</td><td>82</td><td>80</td><td>81</td><td><span class="badge b-green">A-</span></td><td>88%</td></tr>
            <tr><td>ICT4103</td><td style="font-size:.82rem">Database Management Systems</td><td>74</td><td>70</td><td>72</td><td><span class="badge b-blue">B</span></td><td>90%</td></tr>
            <tr><td>ICT4104</td><td style="font-size:.82rem">Web Development</td><td>88</td><td>86</td><td>87</td><td><span class="badge b-green">A</span></td><td>95%</td></tr>
            <tr><td>GEN4001</td><td style="font-size:.82rem">Communication Skills</td><td>72</td><td>68</td><td>70</td><td><span class="badge b-blue">B</span></td><td>85%</td></tr>
          </tbody>
        </table>
      </div>

      <%-- Documents Tab --%>
      <div id="ptab-docs" class="ptbc">
        <div style="display:flex;flex-direction:column;gap:8px">
          <a href="${pageContext.request.contextPath}/download?type=admission&ref=<c:out value='${student != null ? student.studentNumber : \"\"'}'/>" class="dltb">
            <span>📄 <% if(sw){ %>Barua ya Udahili<% } else { %>Admission Letter<% } %></span><span style="font-size:.75rem;color:var(--g400)">PDF ↓</span>
          </a>
          <c:forEach var="p" items="${payments}">
          <c:if test="${p.status=='PAID'}">
          <a href="${pageContext.request.contextPath}/download?type=receipt&ref=${p.controlNumber}" class="dltb">
            <span>🧾 <% if(sw){ %>Stakabadhi ya Ada<% } else { %>Fee Receipt<% } %> — ${p.controlNumber}</span><span style="font-size:.75rem;color:var(--g400)">PDF ↓</span>
          </a>
          </c:if>
          </c:forEach>
          <button class="dltb" onclick="alert('<% if(sw){ %>Kadi itapatikana ofisini.<% } else { %>ID card available at college office.<% } %>')">
            <span>🪪 <% if(sw){ %>Kadi ya Kitambulisho<% } else { %>Student ID Card<% } %></span><span style="font-size:.75rem;color:var(--g400)">PDF ↓</span>
          </button>
          <button class="dltb" onclick="alert('<% if(sw){ %>Muhtasari unapatikana baada ya mtihani.<% } else { %>Transcript available after exams.<% } %>')">
            <span>📊 <% if(sw){ %>Muhtasari wa Masomo<% } else { %>Academic Transcript<% } %></span><span style="font-size:.75rem;color:var(--g400)">PDF ↓</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</div></div>

<jsp:include page="footer.jsp"/>
