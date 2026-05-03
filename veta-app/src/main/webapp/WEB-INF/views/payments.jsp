<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="payments"/>
<c:set var="pageTitle" value="Payments"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a><span class="bcs">›</span><span><% if(sw){ %>Malipo<% } else { %>Payments<% } %></span></div>
    <h1><% if(sw){ %>Mfumo wa Nambari ya Udhibiti wa Serikali<% } else { %>Government Control Number Payment System<% } %></h1>
    <p><% if(sw){ %>Tengeneza nambari yako rasmi ya udhibiti na ulipe kwa benki au pesa za simu.<% } else { %>Generate your official control number and pay via bank or mobile money.<% } %></p>
  </div>
</div>

<div style="padding:48px 0;background:var(--off)"><div class="wrap">

  <c:if test="${not empty error}"><div class="alert-error"><c:out value="${error}"/></div></c:if>

  <div class="pay-layout">
    <%-- LEFT: Form --%>
    <div>
      <%-- Tabs --%>
      <div class="pay-tabs" id="payTabs">
        <button class="ptab active" onclick="showPayTab('appfee',this)"><% if(sw){ %>Ada ya Maombi<% } else { %>Application Fee<% } %></button>
        <button class="ptab" onclick="showPayTab('tuition',this)"><% if(sw){ %>Ada ya Masomo<% } else { %>Tuition Fee<% } %></button>
        <button class="ptab" onclick="showPayTab('short',this)"><% if(sw){ %>Kozi Fupi<% } else { %>Short Course<% } %></button>
        <button class="ptab" onclick="showPayTab('production',this)"><% if(sw){ %>Uzalishaji<% } else { %>Production<% } %></button>
        <button class="ptab" onclick="showPayTab('other',this)"><% if(sw){ %>Mengine<% } else { %>Other<% } %></button>
      </div>

      <div class="pay-card">
        <%-- Application Fee Tab --%>
        <div id="payTab-appfee">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><% if(sw){ %>Malipo ya Ada ya Maombi<% } else { %>Application Fee Payment<% } %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="APPLICATION_FEE">
            <input type="hidden" name="amount" value="20000">
            <div class="form-row">
              <div class="fg"><label><% if(sw){ %>Nambari ya Kumbukumbu ya Maombi<% } else { %>Application Reference No.<% } %> *</label><input class="fc" name="referenceId" required placeholder="VETA-2025-XXXXX" value="${param.ref}"></div>
              <div class="fg"><label><% if(sw){ %>Jina Kamili la Mwombaji<% } else { %>Applicant Full Name<% } %> *</label><input class="fc" name="payerName" required placeholder="<% if(sw){ %>Jina kamili<% } else { %>Full name<% } %>"></div>
            </div>
            <div class="fg"><label><% if(sw){ %>Nambari ya Simu<% } else { %>Phone Number<% } %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><% if(sw){ %>Aina ya Malipo<% } else { %>Payment Type<% } %></label>
              <select class="fc" name="description" onchange="this.form.amount.value=this.value.split('|')[1]">
                <option value="Application Fee|5,000"><% if(sw){ %>Ada ya Maombi — TZS 5,000<% } else { %>Application Fee — TZS 5,000<% } %></option>
                <option value="Registration Fee|5,000"><% if(sw){ %>Ada ya Usajili — TZS 5,000<% } else { %>Registration Fee — TZS 5,000<% } %></option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <% if(sw){ %>Tengeneza Nambari ya Udhibiti<% } else { %>Generate Control Number<% } %></button>
          </form>
        </div>

        <%-- Tuition Fee Tab --%>
        <div id="payTab-tuition" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><% if(sw){ %>Malipo ya Ada ya Masomo<% } else { %>Tuition Fee Payment<% } %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="TUITION_FEE">
            <div class="form-row">
              <div class="fg"><label><% if(sw){ %>Nambari ya Usajili<% } else { %>Student Reg. No.<% } %> *</label><input class="fc" name="referenceId" required placeholder="VETA/STU/2025/XXXX"></div>
              <div class="fg"><label><% if(sw){ %>Mwaka wa Masomo<% } else { %>Academic Year<% } %></label><select class="fc" name="academicYear"><option>2025/2026</option><option>2024/2025</option></select></div>
            </div>
            <div class="fg"><label><% if(sw){ %>Jina Kamili<% } else { %>Full Name<% } %> *</label><input class="fc" name="payerName" required placeholder="<% if(sw){ %>Jina kamili<% } else { %>Full name<% } %>"></div>
            <div class="fg"><label><% if(sw){ %>Simu<% } else { %>Phone<% } %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><% if(sw){ %>Programu na Ada<% } else { %>Program & Fee<% } %></label>
              <select class="fc" name="amount">
                <option value="60000">Electrical Installation — TZS 60,000-120,000</option>
                <option value="60000">Welding & Fabrication — TZS 60,000-120,000</option>
                <option value="60000">Automotive courses— TZS 60,000-120,000</option>
                <option value="60000">ICT Studies — TZS 60,000-120,000</option>
                <option value="60000">Tailoring & Garment — TZS 60,000-120,000</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <% if(sw){ %>Tengeneza Nambari ya Udhibiti<% } else { %>Generate Control Number<% } %></button>
          </form>
        </div>

        <%-- Short Course Tab --%>
        <div id="payTab-short" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><% if(sw){ %>Ada ya Kozi Fupi<% } else { %>Short Course Fee<% } %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="SHORT_COURSE_FEE">
            <div class="form-row">
              <div class="fg"><label><% if(sw){ %>Kumbukumbu ya Maombi<% } else { %>Application Reference<% } %> *</label><input class="fc" name="referenceId" required placeholder="VETA-2025-XXXXX"></div>
              <div class="fg"><label><% if(sw){ %>Jina Kamili<% } else { %>Full Name<% } %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><% if(sw){ %>Simu<% } else { %>Phone<% } %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><% if(sw){ %>Kozi na Ada<% } else { %>Course & Fee<% } %></label>
              <select class="fc" name="amount">
                <option value="280000">Driving PSV — TZS 280000</option>
                <option value="30000">Motorcycle Riding — TZS 30000</option>
                <option value="375000">Computer Applications — TZS 375000</option>
                <option value="375000">Welding Short — TZS 375000</option>
                <option value="375000">Electrical Short — TZS 375000</option>
                <option value="375000">Tailoring Short — TZS 375000</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <% if(sw){ %>Tengeneza Nambari ya Udhibiti<% } else { %>Generate Control Number<% } %></button>
          </form>
        </div>

        <%-- Production Tab --%>
        <div id="payTab-production" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><% if(sw){ %>Malipo ya Uzalishaji<% } else { %>Production Payment<% } %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="PRODUCTION_ORDER">
            <div class="form-row">
              <div class="fg"><label><% if(sw){ %>Nambari ya Agizo<% } else { %>Order Number<% } %> *</label><input class="fc" name="referenceId" required placeholder="ORD-2025-XXXXX"></div>
              <div class="fg"><label><% if(sw){ %>Jina la Mteja<% } else { %>Client Name<% } %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><% if(sw){ %>Simu<% } else { %>Phone<% } %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><% if(sw){ %>Kiasi (TZS)<% } else { %>Amount (TZS)<% } %> *</label><input class="fc" name="amount" type="number" required placeholder="e.g. 450000"></div>
            <button type="submit" class="btn btn-primary">🔢 <% if(sw){ %>Tengeneza Nambari ya Udhibiti<% } else { %>Generate Control Number<% } %></button>
          </form>
        </div>

        <%-- Other Tab --%>
        <div id="payTab-other" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><% if(sw){ %>Malipo Mengine<% } else { %>Other Payments<% } %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <div class="form-row">
              <div class="fg"><label><% if(sw){ %>Nambari ya Mwanafunzi<% } else { %>Student ID / Reference<% } %> *</label><input class="fc" name="referenceId" required placeholder="VETA/STU/... or VETA-2025-..."></div>
              <div class="fg"><label><% if(sw){ %>Jina<% } else { %>Name<% } %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><% if(sw){ %>Simu<% } else { %>Phone<% } %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><% if(sw){ %>Aina ya Malipo<% } else { %>Payment Type<% } %></label>
              <select class="fc" name="paymentType" onchange="document.querySelector('[name=amount]').value=this.selectedOptions[0].dataset.amount||''">
                <option value="EXAM_FEE" data-amount="30000"><% if(sw){ %>Ada ya Mtihani — TZS 30000<% } else { %>Exam Fee — TZS 30000<% } %></option>
                <option value="OTHER" data-amount="10000"><% if(sw){ %>Ubadilishaji wa Kadi — TZS 10000<% } else { %>ID Card Replacement — TZS 10000<% } %></option>
                <option value="OTHER" data-amount="30000"><% if(sw){ %>Ubadilishaji wa Cheti — TZS 30000<% } else { %>Certificate Replacement — TZS 30000<% } %></option>
                <option value="OTHER" data-amount="20000"><% if(sw){ %>Muhtasari wa Alama — TZS 20000<% } else { %>Transcript — TZS 20000<% } %></option>
              </select>
            </div>
            <input type="hidden" name="amount" value="30000">
            <button type="submit" class="btn btn-primary">🔢 <% if(sw){ %>Tengeneza Nambari ya Udhibiti<% } else { %>Generate Control Number<% } %></button>
          </form>
        </div>

        <%-- CONTROL NUMBER DISPLAY --%>
        <c:if test="${not empty controlNumber}">
        <div class="ctrl-box">
          <div class="ctrl-lbl"><% if(sw){ %>NAMBARI RASMI YA UDHIBITI WA SERIKALI<% } else { %>OFFICIAL GOVERNMENT CONTROL NUMBER<% } %></div>
          <div class="ctrl-num">${controlNumber}</div>
          <div class="ctrl-st cst-pending">⏳ <% if(sw){ %>Malipo Yanasubiri<% } else { %>Payment Pending<% } %></div>
          <div class="ctrl-exp"><% if(sw){ %>Inaisha: <% } else { %>Expires: <% } %>${expiryDate}</div>
          <div class="pay-methods">
            <div class="pmc"><div class="pmn">📱 M-Pesa</div><div class="pmd">*150*00# → Lipa Bili → Ingiza Nambari</div></div>
            <div class="pmc"><div class="pmn">📱 Tigo Pesa</div><div class="pmd">*150*01# → Malipo → Ingiza Nambari</div></div>
            <div class="pmc"><div class="pmn">📱 Airtel Money</div><div class="pmd">*150*60# → Lipa Bili</div></div>
            <div class="pmc"><div class="pmn">🏦 CRDB Bank</div><div class="pmd">Branch / SimBanking — Tumia Nambari kama Kumbukumbu</div></div>
            <div class="pmc"><div class="pmn">🏦 NMB Bank</div><div class="pmd">Branch / NMB Mobile — Tumia Nambari</div></div>
            <div class="pmc"><div class="pmn">🏦 NBC Bank</div><div class="pmd">Branch deposit — Nambari kama Kumbukumbu</div></div>
          </div>
          <div style="display:flex;gap:10px;justify-content:center;flex-wrap:wrap">
            <button onclick="copyText('${controlNumber}')" class="btn btn-white btn-sm">📋 <% if(sw){ %>Nakili<% } else { %>Copy<% } %></button>
            <button onclick="window.print()" class="btn btn-white btn-sm">🖨️ <% if(sw){ %>Chapisha Stakabadhi<% } else { %>Print Slip<% } %></button>
            <a href="${pageContext.request.contextPath}/download?type=receipt&ref=${controlNumber}" class="btn btn-white btn-sm">📄 <% if(sw){ %>Pakua PDF<% } else { %>Download PDF<% } %></a>
          </div>
        </div>
        </c:if>
      </div>
    </div>

    <%-- RIGHT: Fee Table --%>
    <div>
      <div style="background:#fff;border-radius:var(--radius);box-shadow:var(--shadow);overflow:hidden">
        <table style="width:100%;border-collapse:collapse;font-size:.83rem">
          <thead><tr><th colspan="2" style="background:var(--navy);color:#fff;padding:12px 14px;text-align:left"><% if(sw){ %>Ratiba Kamili ya Ada<% } else { %>Complete Fee Schedule<% } %></th></tr></thead>
          <tbody>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><% if(sw){ %>Kozi Fupi<% } else { %>Short Courses<% } %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Driving (PSV/Light)</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 275000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Motorcycle Riding</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 30,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Computer Applications</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 35000-375000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Welding Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 375000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Electrical Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 375,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Tailoring Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 375000</td></tr>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><% if(sw){ %>Kozi Ndefu (kwa mwaka)<% } else { %>Long Courses (per year)<% } %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Tailoring & Garment</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 60,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Welding & Fabrication</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 60,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Electrical Installation</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 60,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">ICT Studies</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 60,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Automotive Engineering</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 60,000</td></tr>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><% if(sw){ %>Malipo Mengine<% } else { %>Other Charges<% } %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><% if(sw){ %>Ada ya Maombi<% } else { %>Application Fee<% } %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 5,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><% if(sw){ %>Usajili (mara moja)<% } else { %>Registration (once)<% } %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 5,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><% if(sw){ %>Ada ya Mtihani/mwaka<% } else { %>Exam Fee/year<% } %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 30,000</td></tr>
            <tr><td style="padding:9px 14px"><% if(sw){ %>Hosteli/muhula<% } else { %>Hostel/semester<% } %></td><td style="padding:9px 14px;font-weight:700">TZS 60,000</td></tr>
          </tbody>
        </table>
      </div>
      <div style="background:var(--navy);border-radius:var(--radius);padding:18px;margin-top:14px;color:rgba(255,255,255,.75);font-size:.82rem;line-height:1.7">
        <div style="font-weight:700;color:var(--gold);margin-bottom:7px">⚠️ <% if(sw){ %>Maelezo Muhimu<% } else { %>Important Notes<% } %></div>
        <%= sw ?
            "Daima tengeneza Nambari ya Udhibiti kabla ya kulipa. Nambari zinaisha baada ya siku 7. Hifadhi stakabadhi yako. Msaada: +255282804951." :
            "Always generate a Control Number before paying. Numbers expire in 7 days. Keep your receipt. Help: +255282804951." %>
      </div>
    </div>
  </div>
</div></div>

<jsp:include page="footer.jsp"/>
