<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="admin"/>
<c:set var="pageTitle" value="Admin Panel"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div style="background:var(--off);min-height:calc(100vh - 150px)">
<div class="wrap" style="padding-top:24px;padding-bottom:24px">
<div class="adml">

  <%-- SIDEBAR --%>
  <div class="admsi">
    <div class="asih">
      <div class="asit">ADMIN PANEL</div>
      <div class="asiu">
        <div class="asiau">A</div>
        <div>
          <div class="asinn"><c:out value="${sessionScope.userFullName}"/></div>
          <div class="asinr"><c:out value="${sessionScope.userRole}"/></div>
        </div>
      </div>
    </div>
    <div class="asnav">
      <div class="asnl"><%= sw?"Kuu":"Main" %></div>
      <a href="${pageContext.request.contextPath}/admin?tab=overview" class="asni ${activeTab=='overview'?'active':''}">📊 <%= sw?"Dashibodi":"Dashboard" %></a>
      <a href="${pageContext.request.contextPath}/admin?tab=leadership" class="asni ${activeTab=='leadership'?'active':''}">👥 <%= sw?"Uongozi":"Leadership" %></a>
      <div class="asnl"><%= sw?"Masomo":"Academic" %></div>
      <a href="${pageContext.request.contextPath}/admin?tab=applications" class="asni ${activeTab=='applications'?'active':''}">📋 <%= sw?"Maombi":"Applications" %> <span class="asnib">${pendingApps > 0 ? pendingApps : ''}</span></a>
      <a href="${pageContext.request.contextPath}/admin?tab=students"    class="asni ${activeTab=='students'?'active':''}">🎓 <%= sw?"Wanafunzi":"Students" %></a>
      <a href="${pageContext.request.contextPath}/admin?tab=courses"     class="asni ${activeTab=='courses'?'active':''}">📚 <%= sw?"Kozi":"Courses" %></a>
      <div class="asnl"><%= sw?"Fedha":"Finance" %></div>
      <a href="${pageContext.request.contextPath}/admin?tab=payments"    class="asni ${activeTab=='payments'?'active':''}">💰 <%= sw?"Malipo":"Payments" %> <span class="asnib">${pendingPayments > 0 ? pendingPayments : ''}</span></a>
      <div class="asnl"><%= sw?"Uendeshaji":"Operations" %></div>
      <a href="${pageContext.request.contextPath}/admin?tab=production"  class="asni ${activeTab=='production'?'active':''}">🔨 <%= sw?"Maagizo":"Production" %></a>
      <a href="${pageContext.request.contextPath}/admin?tab=news"        class="asni ${activeTab=='news'?'active':''}">📰 <%= sw?"Habari":"News" %></a>
      <hr style="border-color:rgba(255,255,255,.08);margin:8px 16px">
      <a href="${pageContext.request.contextPath}/logout" class="asni" style="color:rgba(220,80,80,.8)">🚪 <%= sw?"Toka":"Logout" %></a>
    </div>
  </div>

  <%-- MAIN CONTENT --%>
  <div class="adma">

    <c:if test="${not empty adminError}"><div class="alert-error"><c:out value="${adminError}"/></div></c:if>
    <c:if test="${not empty sessionScope.flashError}"><div class="alert-error"><c:out value="${sessionScope.flashError}"/><c:remove var="flashError" scope="session"/></div></c:if>

    <%-- ══ DASHBOARD OVERVIEW ══ --%>
    <c:if test="${activeTab == 'overview'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Muhtasari wa Dashibodi":"Dashboard Overview" %></h2><span style="font-size:.78rem;color:var(--g400)"><%= new java.util.Date() %></span></div>
      <div class="sc2">
        <div class="scc" style="background:linear-gradient(135deg,var(--navy),var(--blue))" data-icon="🎓"><div class="scn">${totalStudents}</div><div class="scl"><%= sw?"Wanafunzi Wote":"Total Students" %></div></div>
        <div class="scc" style="background:linear-gradient(135deg,#1B5E20,#388E3C)" data-icon="📋"><div class="scn">${pendingApps}</div><div class="scl"><%= sw?"Maombi Mapya":"New Applications" %></div></div>
        <div class="scc" style="background:linear-gradient(135deg,#E65100,#F4511E)" data-icon="💳"><div class="scn">${pendingPayments}</div><div class="scl"><%= sw?"Malipo Yanayosubiri":"Pending Payments" %></div></div>
        <div class="scc" style="background:linear-gradient(135deg,#4A148C,#7B1FA2)" data-icon="🔨"><div class="scn">${activeOrders}</div><div class="scl"><%= sw?"Maagizo Yanayoendelea":"Active Orders" %></div></div>
      </div>
    </div>
    <div class="amc">
      <div class="atop"><h2><%= sw?"Maombi ya Hivi Karibuni":"Recent Applications" %></h2>
        <a href="${pageContext.request.contextPath}/admin?tab=applications" class="btn btn-primary btn-sm"><%= sw?"Angalia Zote":"View All" %></a>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th>Ref</th><th><%= sw?"Jina":"Name" %></th><th><%= sw?"Kozi":"Course" %></th><th><%= sw?"Tarehe":"Date" %></th><th><%= sw?"Hali":"Status" %></th><th></th></tr></thead>
        <tbody>
          <c:forEach var="a" items="${recentApps}">
          <tr>
            <td style="font-family:monospace;font-size:.74rem">${a.refNumber}</td>
            <td><strong>${a.fullName}</strong></td>
            <td style="font-size:.75rem">${a.courseName}</td>
            <td style="font-size:.75rem"><fmt:formatDate value="${a.submittedAt}" pattern="dd MMM yyyy"/></td>
            <td><span class="badge ${a.status=='APPROVED'?'b-green':a.status=='REJECTED'?'b-red':a.status=='PENDING'?'b-pending':'b-info'}">${a.status}</span></td>
            <td><a href="${pageContext.request.contextPath}/admin?tab=applications" class="btn btn-ghost btn-xs">👁</a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ APPLICATIONS ══ --%>
    <c:if test="${activeTab == 'applications'}">
    <div class="amc">
      <div class="atop">
        <h2><%= sw?"Usimamizi wa Maombi":"Application Management" %></h2>
        <div style="display:flex;gap:7px;flex-wrap:wrap">
          <a href="?tab=applications" class="btn btn-ghost btn-sm">All</a>
          <a href="?tab=applications&status=PENDING" class="btn btn-ghost btn-sm">Pending</a>
          <a href="?tab=applications&status=APPROVED" class="btn btn-ghost btn-sm">Approved</a>
          <a href="?tab=applications&status=REJECTED" class="btn btn-ghost btn-sm">Rejected</a>
        </div>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th>Ref</th><th><%= sw?"Jina":"Name" %></th><th>NIDA</th><th><%= sw?"Kozi":"Course" %></th><th><%= sw?"Tarehe":"Date" %></th><th><%= sw?"Hali":"Status" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="a" items="${applications}">
          <tr>
            <td style="font-family:monospace;font-size:.73rem">${a.refNumber}</td>
            <td><strong>${a.fullName}</strong></td>
            <td style="font-size:.73rem">${a.nidaNumber}</td>
            <td style="font-size:.76rem">${a.courseName}</td>
            <td style="font-size:.75rem"><fmt:formatDate value="${a.submittedAt}" pattern="dd MMM yyyy"/></td>
            <td><span class="badge ${a.status=='APPROVED'?'b-green':a.status=='REJECTED'?'b-red':a.status=='PENDING'?'b-pending':'b-info'}">${a.status}</span></td>
            <td><div class="ab">
              <c:if test="${a.status == 'PENDING' || a.status == 'PROCESSING'}">
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="approveApp"><input type="hidden" name="ref" value="${a.refNumber}">
                <button type="submit" class="btn btn-success btn-xs">✓</button>
              </form>
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="rejectApp"><input type="hidden" name="ref" value="${a.refNumber}">
                <button type="submit" class="btn btn-danger btn-xs">✗</button>
              </form>
              </c:if>
              <a href="${pageContext.request.contextPath}/download?type=admission&ref=${a.refNumber}" class="btn btn-ghost btn-xs">📄</a>
            </div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ PAYMENTS ══ --%>
    <c:if test="${activeTab == 'payments'}">
    <div class="amc">
      <div class="atop">
        <h2><%= sw?"Uthibitisho wa Malipo":"Payment Verification" %></h2>
        <div style="display:flex;gap:7px">
          <a href="?tab=payments" class="btn btn-ghost btn-sm">All</a>
          <a href="?tab=payments&status=PENDING" class="btn btn-ghost btn-sm">Pending</a>
          <a href="?tab=payments&status=PAID" class="btn btn-ghost btn-sm">Paid</a>
        </div>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th><%= sw?"Nambari ya Udhibiti":"Control No." %></th><th><%= sw?"Mlipaji":"Payer" %></th><th><%= sw?"Aina":"Type" %></th><th><%= sw?"Kiasi":"Amount" %></th><th><%= sw?"Tarehe":"Date" %></th><th><%= sw?"Hali":"Status" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="p" items="${payments}">
          <tr>
            <td style="font-family:monospace;font-size:.73rem">${p.controlNumber}</td>
            <td>${p.payerName}</td>
            <td style="font-size:.76rem">${p.paymentType.replace('_',' ')}</td>
            <td style="font-weight:700">TZS <fmt:formatNumber value="${p.amount}" pattern="#,##0"/></td>
            <td style="font-size:.75rem"><fmt:formatDate value="${p.createdAt}" pattern="dd MMM yyyy"/></td>
            <td><span class="badge ${p.status=='PAID'?'b-green':'b-pending'}">${p.status}</span></td>
            <td><div class="ab">
              <c:if test="${p.status == 'PENDING'}">
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="verifyPayment">
                <input type="hidden" name="ctrl" value="${p.controlNumber}">
                <input type="hidden" name="bankRef" value="MANUAL">
                <button type="submit" class="btn btn-success btn-xs">✓ Verify</button>
              </form>
              </c:if>
              <a href="${pageContext.request.contextPath}/download?type=receipt&ref=${p.controlNumber}" class="btn btn-ghost btn-xs">🖨</a>
            </div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ STUDENTS ══ --%>
    <c:if test="${activeTab == 'students'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Usimamizi wa Wanafunzi":"Student Management" %></h2>
        <div style="display:flex;gap:7px">
          <a href="?tab=students" class="btn btn-ghost btn-sm">All</a>
          <a href="?tab=students&status=ACTIVE" class="btn btn-ghost btn-sm">Active</a>
        </div>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th>ID</th><th><%= sw?"Jina Kamili":"Full Name" %></th><th><%= sw?"Programu":"Program" %></th><th>Y/S</th><th><%= sw?"Simu":"Phone" %></th><th><%= sw?"Hali":"Status" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="s" items="${students}">
          <tr>
            <td style="font-family:monospace;font-size:.73rem">${s.studentNumber}</td>
            <td><strong>${s.fullName}</strong></td>
            <td style="font-size:.76rem">${s.courseName}</td>
            <td>Y${s.yearOfStudy}/S${s.semester}</td>
            <td style="font-size:.75rem">${s.phone}</td>
            <td><span class="badge ${s.status=='ACTIVE'?'b-green':'b-gray'}">${s.status}</span></td>
            <td><div class="ab"><a href="${pageContext.request.contextPath}/portal?student=${s.studentNumber}" class="btn btn-ghost btn-xs">👁</a></div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ COURSES ══ --%>
    <c:if test="${activeTab == 'courses'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Usimamizi wa Kozi":"Course Management" %></h2></div>
      <div class="tw"><table class="at2">
        <thead><tr><th><%= sw?"Jina la Kozi":"Course Name" %></th><th><%= sw?"Aina":"Type" %></th><th><%= sw?"Muda":"Duration" %></th><th><%= sw?"Ada/Mwaka":"Fee/yr" %></th><th>NTA</th><th><%= sw?"Waliandikishwa":"Enrolled" %></th><th><%= sw?"Hali":"Status" %></th></tr></thead>
        <tbody>
          <c:forEach var="c" items="${courses}">
          <tr>
            <td><strong>${c.nameEn}</strong></td>
            <td><span class="badge ${c.courseType=='LONG'?'b-blue':'b-gold'}">${c.courseType}</span></td>
            <td>${c.getDurationDisplay()}</td>
            <td>TZS <fmt:formatNumber value="${c.annualFee}" pattern="#,##0"/></td>
            <td style="font-size:.76rem">${c.ntaLevel}</td>
            <td>${c.enrolledCount}</td>
            <td><span class="badge ${c.active?'b-green':'b-red'}">${c.active?'Active':'Inactive'}</span></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ LEADERSHIP ══ --%>
    <c:if test="${activeTab == 'leadership'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Usimamizi wa Uongozi":"Leadership Management" %></h2></div>
      <div class="tw"><table class="at2">
        <thead><tr><th><%= sw?"Jina":"Name" %></th><th><%= sw?"Cheo":"Title" %></th><th><%= sw?"Idara":"Dept." %></th><th><%= sw?"Mkuu":"Principal" %></th><th><%= sw?"Inaonekana":"Visible" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="s" items="${staffList}">
          <tr>
            <td><strong>${s.displayName}</strong></td>
            <td style="font-size:.82rem">${s.roleTitle}</td>
            <td style="font-size:.78rem">${s.department}</td>
            <td>${s.principal?'✅':''}</td>
            <td>${s.visible?'✅':'❌'}</td>
            <td><div class="ab"><button class="btn btn-outline btn-xs" onclick="alert('Edit form - connect to backend')">✏️</button></div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ PRODUCTION ══ --%>
    <c:if test="${activeTab == 'production'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Maagizo ya Uzalishaji":"Production Orders" %></h2>
        <div style="display:flex;gap:7px">
          <a href="?tab=production" class="btn btn-ghost btn-sm">All</a>
          <a href="?tab=production&status=PENDING" class="btn btn-ghost btn-sm">Pending</a>
          <a href="?tab=production&status=IN_PROGRESS" class="btn btn-ghost btn-sm">In Progress</a>
          <a href="?tab=production&status=COMPLETED" class="btn btn-ghost btn-sm">Completed</a>
        </div>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th>Order #</th><th><%= sw?"Mteja":"Client" %></th><th><%= sw?"Bidhaa":"Product" %></th><th><%= sw?"Bajeti":"Budget" %></th><th><%= sw?"Tarehe":"Date" %></th><th><%= sw?"Hali":"Status" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="o" items="${orders}">
          <tr>
            <td style="font-family:monospace;font-size:.73rem">${o.orderNumber}</td>
            <td>${o.clientName}</td>
            <td style="font-size:.76rem">${o.customProduct}</td>
            <td style="font-size:.76rem">${o.estimatedBudget != null ? 'TZS ' : 'TBD'}<c:if test="${o.estimatedBudget != null}"><fmt:formatNumber value="${o.estimatedBudget}" pattern="#,##0"/></c:if></td>
            <td style="font-size:.75rem"><fmt:formatDate value="${o.orderDate}" pattern="dd MMM yyyy"/></td>
            <td><span class="badge ${o.status=='COMPLETED'?'b-green':o.status=='PENDING'?'b-pending':'b-info'}">${o.status.replace('_',' ')}</span></td>
            <td><div class="ab">
              <c:if test="${o.status == 'PENDING'}">
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="updateOrderStatus">
                <input type="hidden" name="orderNo" value="${o.orderNumber}">
                <input type="hidden" name="status" value="IN_PROGRESS">
                <button type="submit" class="btn btn-primary btn-xs">▶ Start</button>
              </form>
              </c:if>
              <c:if test="${o.status == 'IN_PROGRESS'}">
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="updateOrderStatus">
                <input type="hidden" name="orderNo" value="${o.orderNumber}">
                <input type="hidden" name="status" value="COMPLETED">
                <button type="submit" class="btn btn-success btn-xs">✓ Done</button>
              </form>
              </c:if>
            </div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

    <%-- ══ NEWS & EVENTS ══ --%>
    <c:if test="${activeTab == 'news'}">
    <div class="amc">
      <div class="atop"><h2><%= sw?"Usimamizi wa Habari":"News & Events Management" %></h2>
        <button class="btn btn-primary btn-sm" onclick="document.getElementById('addNewsForm').classList.toggle('hidden')">+ <%= sw?"Ongeza Habari":"Add News" %></button>
      </div>
      <%-- Add Form --%>
      <div id="addNewsForm" class="hidden" style="background:var(--off);border-radius:8px;padding:20px;margin-bottom:20px">
        <form method="post" action="${pageContext.request.contextPath}/admin">
          <input type="hidden" name="action" value="addNews">
          <div class="form-row">
            <div class="fg"><label>Title (EN) *</label><input class="fc" name="titleEn" required placeholder="Event title in English"></div>
            <div class="fg"><label>Title (SW)</label><input class="fc" name="titleSw" placeholder="Kichwa kwa Kiswahili"></div>
          </div>
          <div class="form-row">
            <div class="fg"><label>Excerpt (EN)</label><textarea class="fc" name="excerptEn" rows="2"></textarea></div>
            <div class="fg"><label>Excerpt (SW)</label><textarea class="fc" name="excerptSw" rows="2"></textarea></div>
          </div>
          <div class="form-row">
            <div class="fg"><label>Category</label>
              <select class="fc" name="category">
                <option>GRADUATION</option><option>INTAKE</option><option>ACHIEVEMENT</option>
                <option>COMMUNITY</option><option>PARTNERSHIP</option><option>SPORTS</option><option>GENERAL</option>
              </select>
            </div>
            <div class="fg"><label>Event Date</label><input class="fc" type="date" name="eventDate"></div>
          </div>
          <div class="form-row">
            <div class="fg"><label>Icon (emoji)</label><input class="fc" name="icon" placeholder="📰" maxlength="5"></div>
            <div class="fg"><label>Publish Now?</label>
              <select class="fc" name="published"><option value="1">Yes — Publish immediately</option><option value="0">No — Save as draft</option></select>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">📰 <%= sw?"Chapisha Tukio":"Publish Event" %></button>
        </form>
      </div>
      <div class="tw"><table class="at2">
        <thead><tr><th></th><th><%= sw?"Kichwa":"Title" %></th><th><%= sw?"Kategoria":"Category" %></th><th><%= sw?"Tarehe":"Date" %></th><th><%= sw?"Hali":"Status" %></th><th><%= sw?"Hatua":"Actions" %></th></tr></thead>
        <tbody>
          <c:forEach var="n" items="${newsList}">
          <tr>
            <td style="font-size:1.2rem">${n.icon}</td>
            <td><strong style="font-size:.84rem">${n.titleEn}</strong></td>
            <td><span class="badge b-blue">${n.category}</span></td>
            <td style="font-size:.75rem"><fmt:formatDate value="${n.eventDate}" pattern="dd MMM yyyy"/></td>
            <td><span class="badge ${n.published?'b-green':'b-gray'}">${n.published?'Published':'Draft'}</span></td>
            <td><div class="ab">
              <c:if test="${!n.published}">
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline">
                <input type="hidden" name="action" value="publishNews"><input type="hidden" name="id" value="${n.id}">
                <button type="submit" class="btn btn-primary btn-xs">▶ Publish</button>
              </form>
              </c:if>
              <form method="post" action="${pageContext.request.contextPath}/admin" style="display:inline" onsubmit="return confirm('Delete this event?')">
                <input type="hidden" name="action" value="deleteNews"><input type="hidden" name="id" value="${n.id}">
                <button type="submit" class="btn btn-danger btn-xs">🗑</button>
              </form>
            </div></td>
          </tr>
          </c:forEach>
        </tbody>
      </table></div>
    </div>
    </c:if>

  </div><%-- end adma --%>
</div><%-- end adml --%>
</div></div>

<jsp:include page="footer.jsp"/>
