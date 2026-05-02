<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="admissions"/>
<c:set var="pageTitle" value="Admissions"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/home"><%= sw?"Nyumbani":"Home" %></a>
      <span class="bcs">›</span>
      <span><%= sw?"Maombi":"Admissions" %></span>
    </div>
    <h1><%= sw?"Mfumo wa Maombi ya Mtandaoni":"Online Application System" %></h1>
    <p><%= sw?"Jaza fomu hapa chini kuomba. Utapata nambari ya kumbukumbu mara moja.":"Fill the form below to apply. You will receive your reference number instantly." %></p>
  </div>
</div>

<div style="padding:48px 0;background:var(--off)"><div class="wrap">

  <%-- SUCCESS: Show reference number --%>
  <c:if test="${success}">
  <div class="ref-success" style="max-width:700px;margin:0 auto 32px">
    <div style="font-size:2.5rem">🎉</div>
    <div class="rs-title"><%= sw?"Maombi Yamewasilishwa Kwa Mafanikio!":"Application Submitted Successfully!" %></div>
    <div class="rs-label"><%= sw?"Nambari Yako ya Kumbukumbu:":"Your Application Reference Number:" %></div>
    <div class="rs-num">${refNumber}</div>
    <p style="color:rgba(255,255,255,.7);font-size:.85rem;margin-bottom:16px">
      <%= sw?"Hifadhi nambari hii. Itumie kulipa ada na kufuatilia maombi yako.":"Save this number to pay your fee and track your application." %>
    </p>
    <div style="display:flex;gap:10px;justify-content:center;flex-wrap:wrap">
      <a href="${pageContext.request.contextPath}/payments?ref=${refNumber}" class="btn btn-gold">
        💳 <%= sw?"Lipa Ada Sasa":"Pay Application Fee" %>
      </a>
      <a href="${pageContext.request.contextPath}/download?type=admission&ref=${refNumber}" class="btn btn-white">
        📄 <%= sw?"Pakua Barua ya Maombi":"Download Admission Letter" %>
      </a>
    </div>
  </div>
  </c:if>

  <%-- ERROR --%>
  <c:if test="${not empty error}">
  <div class="alert-error"><%= sw?"Hitilafu: ":"Error: " %><c:out value="${error}"/></div>
  </c:if>

  <div class="apply-layout">

    <%-- MAIN FORM --%>
    <div class="apply-card">
      <%-- Steps --%>
      <div class="steps-row">
        <div class="si active"><div class="sn">1</div><div class="sl"><%= sw?"Jaza Fomu":"Fill Form" %></div></div>
        <div class="si"><div class="sn">2</div><div class="sl"><%= sw?"Pakia Nyaraka":"Upload Docs" %></div></div>
        <div class="si"><div class="sn">3</div><div class="sl"><%= sw?"Pata Nambari":"Get Ref No." %></div></div>
        <div class="si"><div class="sn">4</div><div class="sl"><%= sw?"Lipa Ada":"Pay Fee" %></div></div>
        <div class="si"><div class="sn">5</div><div class="sl"><%= sw?"Udahili":"Admitted" %></div></div>
      </div>

      <h2 style="font-size:1.4rem;color:var(--navy);margin-bottom:20px"><%= sw?"Fomu ya Maombi":"Application Form" %></h2>

      <form method="post" action="${pageContext.request.contextPath}/admissions" enctype="multipart/form-data">
        <div class="form-row">
          <div class="fg">
            <label><%= sw?"Jina Kamili":"Full Name" %> <span class="req">*</span></label>
            <input class="fc" name="fullName" required placeholder="<%= sw?"Jina lako kamili kama kwenye NIDA":"Full name as in your NIDA" %>">
          </div>
          <div class="fg">
            <label><%= sw?"Nambari ya NIDA":"NIDA Number" %> <span class="req">*</span></label>
            <input class="fc" name="nidaNumber" required placeholder="19XXXXXXXXXXXXXXXXX" maxlength="20">
          </div>
        </div>
        <div class="form-row">
          <div class="fg">
            <label><%= sw?"Nambari ya Simu":"Phone Number" %> <span class="req">*</span></label>
            <input class="fc" name="phone" type="tel" required placeholder="+255 7XX XXX XXX">
          </div>
          <div class="fg">
            <label><%= sw?"Barua Pepe":"Email Address" %></label>
            <input class="fc" name="email" type="email" placeholder="your@email.com">
          </div>
        </div>
        <div class="form-row">
          <div class="fg">
            <label><%= sw?"Tarehe ya Kuzaliwa":"Date of Birth" %></label>
            <input class="fc" name="dateOfBirth" type="date">
          </div>
          <div class="fg">
            <label><%= sw?"Jinsia":"Gender" %></label>
            <select class="fc" name="gender">
              <option value="MALE"><%= sw?"Mume":"Male" %></option>
              <option value="FEMALE"><%= sw?"Mke":"Female" %></option>
            </select>
          </div>
        </div>
        <div class="form-row">
          <div class="fg">
            <label><%= sw?"Programu Unayoiomba":"Program Applied For" %> <span class="req">*</span></label>
            <select class="fc" name="courseId" required>
    <option value=""><%= sw?"-- Chagua Programu --":"-- Select Program --" %></option>
    
    <optgroup label="<%= sw?"Kozi Ndefu":"Long Courses" %>">
        <c:forEach var="c" items="${courses}">
            <c:if test="${c.courseType == 'LONG'}">
                <option value="${c.id}" ${param.courseId == c.id ? 'selected' : ''}>
                    ${sw ? c.nameSw : c.nameEn}
                </option>
            </c:if>
        </c:forEach>
    </optgroup>
    
    <optgroup label="<%= sw?"Kozi Fupi":"Short Courses" %>">
        <c:forEach var="c" items="${courses}">
            <c:if test="${c.courseType == 'SHORT'}">
                <option value="${c.id}" ${param.courseId == c.id ? 'selected' : ''}>
                    ${sw ? c.nameSw : c.nameEn}
                </option>
            </c:if>
        </c:forEach>
    </optgroup>
</select>
          </div>
          <div class="fg">
            <label><%= sw?"Udahili":"Intake Period" %></label>
            <select class="fc" name="intakePeriod">
              <option>January 2026</option>
              <option>July 2026</option>
              <option>January 2027</option>
            </select>
          </div>
        </div>
        <div class="form-row">
          <div class="fg">
            <label><%= sw?"Kiwango cha Elimu":"Education Level" %> <span class="req">*</span></label>
            <select class="fc" name="educationLevel" required>
              <option value="STD7"><%= sw?"Darasa la 7 / Msingi":"Standard 7 / Primary" %></option>
              <option value="FORM2">Form II (FTNA)</option>
              <option value="FORM4">Form IV (CSEE)</option>
              <option value="FORM6">Form VI (ACSEE)</option>
              <option value="DIPLOMA"><%= sw?"Stashahada / Cheti":"Diploma / Certificate" %></option>
              <option value="DEGREE"><%= sw?"Shahada na zaidi":"Degree and above" %></option>
            </select>
          </div>
          <div class="fg">
            <label><%= sw?"Mkoa wa Asili":"Region of Origin" %></label>
            <select class="fc" name="regionOfOrigin">
              <option>Dar es Salaam</option><option>Mwanza</option><option>Arusha</option>
              <option>Dodoma</option><option>Mbeya</option><option>Morogoro</option>
              <option>Tanga</option><option>Kilimanjaro</option><option>Zanzibar</option>
              <option><%= sw?"Nyingine":"Other" %></option>
            </select>
          </div>
        </div>
        <div class="fg">
          <label><%= sw?"Anwani ya Makazi":"Residential Address" %></label>
          <textarea class="fc" name="residentialAddress" rows="2" placeholder="<%= sw?"Mkoa, Wilaya, Kata, Mtaa...":"Region, District, Ward, Street..." %>"></textarea>
        </div>
        <div class="fg">
          <label><%= sw?"Pakia Vyeti (PDF/JPG/PNG)":"Upload Certificates (PDF/JPG/PNG)" %></label>
          <input class="fc" type="file" name="document" accept=".pdf,.jpg,.jpeg,.png">
          <div class="form-hint"><%= sw?"Pakia vyeti vyako vya masomo":"Upload your academic certificates" %></div>
        </div>
        <div class="form-check">
          <input type="checkbox" id="terms" name="terms" required>
          <label for="terms"><%= sw?
              "Ninathibitisha kwamba taarifa zote ni za kweli na ninakubali masharti ya Chuo cha VETA." :
              "I confirm all information is accurate and I accept VETA College's terms and conditions." %></label>
        </div>
        <button type="submit" class="btn btn-primary btn-lg btn-block">
          📤 <%= sw?"Wasilisha Maombi":"Submit Application" %>
        </button>
      </form>
    </div>

    <%-- SIDEBAR --%>
    <div class="apply-sidebar">
      <div class="aside-card">
        <h4>📋 <%= sw?"Jinsi ya Kuomba":"How to Apply" %></h4>
        <div class="asi">📝 <span><%= sw?"Jaza fomu yote kikamilifu":"Fill the form completely" %></span></div>
        <div class="asi">📄 <span><%= sw?"Pakia vyeti vya masomo":"Upload your certificates" %></span></div>
        <div class="asi">🔢 <span><%= sw?"Pokea nambari ya kumbukumbu":"Receive reference number" %></span></div>
        <div class="asi">💳 <span><%= sw?"Tengeneza nambari ya udhibiti, lipa TZS 20,000":"Generate control number, pay TZS 20,000" %></span></div>
        <div class="asi">✅ <span><%= sw?"Subiri barua ya udahili":"Await admission confirmation" %></span></div>
      </div>
      <div class="aside-card" style="border-top-color:var(--gold)">
        <h4>📅 <%= sw?"Tarehe za Udahili":"Intake Dates" %></h4>
        <div class="asi">🟢 <span>January 2026 — <%= sw?"Mwisho: Novemba 30, 2025":"Deadline: 30 Nov 2025" %></span></div>
        <div class="asi">🟡 <span>July 2026 — <%= sw?"Mwisho: Mei 31, 2026":"Deadline: 31 May 2026" %></span></div>
        <div class="asi">📞 <span>+255 754 000 111</span></div>
      </div>
      <div class="aside-card" style="border-top-color:var(--green)">
        <h4>💰 <%= sw?"Muhtasari wa Ada":"Fee Summary" %></h4>
        <div class="asi">📌 <span><%= sw?"Ada ya Maombi: TZS 20,000":"Application Fee: TZS 20,000" %></span></div>
        <div class="asi">📌 <span><%= sw?"Usajili: TZS 50,000 (mara moja)":"Registration: TZS 50,000 (once)" %></span></div>
        <div class="asi">📌 <span><%= sw?"Masomo: TZS 700K–920K/mwaka":"Tuition: TZS 700K–920K/yr" %></span></div>
        <div class="asi">📌 <span><%= sw?"Mtihani: TZS 80,000/mwaka":"Exam: TZS 80,000/yr" %></span></div>
      </div>

      <%-- Track Application --%>
      <div class="aside-card" style="border-top-color:var(--blue)">
        <h4>🔍 <%= sw?"Fuatilia Maombi":"Track Application" %></h4>
        <form method="get" action="${pageContext.request.contextPath}/admissions">
          <input type="hidden" name="action" value="status">
          <div class="fg" style="margin-bottom:10px">
            <input class="fc" name="ref" placeholder="VETA-2025-XXXXX" value="${param.ref}">
          </div>
          <button type="submit" class="btn btn-primary btn-block btn-sm">
            🔍 <%= sw?"Angalia Hali":"Check Status" %>
          </button>
        </form>
        <c:if test="${found == false}">
          <p style="color:var(--red);font-size:.82rem;margin-top:8px"><%= sw?"Maombi hayakupatikana.":"Application not found." %></p>
        </c:if>
        <c:if test="${application != null}">
          <div style="margin-top:12px;padding:12px;background:var(--off);border-radius:8px;font-size:.83rem">
            <div><strong><%= sw?"Jina:":"Name:" %></strong> ${application.fullName}</div>
            <div><strong><%= sw?"Kozi:":"Course:" %></strong> ${application.courseName}</div>
            <div><strong><%= sw?"Hali:":"Status:" %></strong>
             <span class="badge <c:choose>
    <c:when test="${application.status == 'APPROVED'}">b-green</c:when>
    <c:when test="${application.status == 'REJECTED'}">b-red</c:when>
    <c:otherwise>b-pending</c:otherwise>
</c:choose>">
                ${application.status}
              </span>
            </div>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</div></div>

<jsp:include page="footer.jsp"/>
