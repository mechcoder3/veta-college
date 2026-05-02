<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="activePage" value="payments"/>
<c:set var="pageTitle" value="Payments"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><%= sw?"Nyumbani":"Home" %></a><span class="bcs">›</span><span><%= sw?"Malipo":"Payments" %></span></div>
    <h1><%= sw?"Mfumo wa Nambari ya Udhibiti wa Serikali":"Government Control Number Payment System" %></h1>
    <p><%= sw?"Tengeneza nambari yako rasmi ya udhibiti na ulipe kwa benki au pesa za simu.":"Generate your official control number and pay via bank or mobile money." %></p>
  </div>
</div>

<div style="padding:48px 0;background:var(--off)"><div class="wrap">

  <c:if test="${not empty error}"><div class="alert-error"><c:out value="${error}"/></div></c:if>

  <div class="pay-layout">
    <%-- LEFT: Form --%>
    <div>
      <%-- Tabs --%>
      <div class="pay-tabs" id="payTabs">
        <button class="ptab active" onclick="showPayTab('appfee',this)"><%= sw?"Ada ya Maombi":"Application Fee" %></button>
        <button class="ptab" onclick="showPayTab('tuition',this)"><%= sw?"Ada ya Masomo":"Tuition Fee" %></button>
        <button class="ptab" onclick="showPayTab('short',this)"><%= sw?"Kozi Fupi":"Short Course" %></button>
        <button class="ptab" onclick="showPayTab('production',this)"><%= sw?"Uzalishaji":"Production" %></button>
        <button class="ptab" onclick="showPayTab('other',this)"><%= sw?"Mengine":"Other" %></button>
      </div>

      <div class="pay-card">
        <%-- Application Fee Tab --%>
        <div id="payTab-appfee">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><%= sw?"Malipo ya Ada ya Maombi":"Application Fee Payment" %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="APPLICATION_FEE">
            <input type="hidden" name="amount" value="20000">
            <div class="form-row">
              <div class="fg"><label><%= sw?"Nambari ya Kumbukumbu ya Maombi":"Application Reference No." %> *</label><input class="fc" name="referenceId" required placeholder="VETA-2025-XXXXX" value="${param.ref}"></div>
              <div class="fg"><label><%= sw?"Jina Kamili la Mwombaji":"Applicant Full Name" %> *</label><input class="fc" name="payerName" required placeholder="<%= sw?"Jina kamili":"Full name" %>"></div>
            </div>
            <div class="fg"><label><%= sw?"Nambari ya Simu":"Phone Number" %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><%= sw?"Aina ya Malipo":"Payment Type" %></label>
              <select class="fc" name="description" onchange="this.form.amount.value=this.value.split('|')[1]">
                <option value="Application Fee|20000"><%= sw?"Ada ya Maombi — TZS 20,000":"Application Fee — TZS 20,000" %></option>
                <option value="Registration Fee|50000"><%= sw?"Ada ya Usajili — TZS 50,000":"Registration Fee — TZS 50,000" %></option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <%= sw?"Tengeneza Nambari ya Udhibiti":"Generate Control Number" %></button>
          </form>
        </div>

        <%-- Tuition Fee Tab --%>
        <div id="payTab-tuition" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><%= sw?"Malipo ya Ada ya Masomo":"Tuition Fee Payment" %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="TUITION_FEE">
            <div class="form-row">
              <div class="fg"><label><%= sw?"Nambari ya Usajili":"Student Reg. No." %> *</label><input class="fc" name="referenceId" required placeholder="VETA/STU/2025/XXXX"></div>
              <div class="fg"><label><%= sw?"Mwaka wa Masomo":"Academic Year" %></label><select class="fc" name="academicYear"><option>2025/2026</option><option>2024/2025</option></select></div>
            </div>
            <div class="fg"><label><%= sw?"Jina Kamili":"Full Name" %> *</label><input class="fc" name="payerName" required placeholder="<%= sw?"Jina kamili":"Full name" %>"></div>
            <div class="fg"><label><%= sw?"Simu":"Phone" %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><%= sw?"Programu na Ada":"Program & Fee" %></label>
              <select class="fc" name="amount">
                <option value="850000">Electrical Installation — TZS 850,000</option>
                <option value="780000">Welding & Fabrication — TZS 780,000</option>
                <option value="920000">Automotive Engineering — TZS 920,000</option>
                <option value="900000">ICT Studies — TZS 900,000</option>
                <option value="700000">Tailoring & Garment — TZS 700,000</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <%= sw?"Tengeneza Nambari ya Udhibiti":"Generate Control Number" %></button>
          </form>
        </div>

        <%-- Short Course Tab --%>
        <div id="payTab-short" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><%= sw?"Ada ya Kozi Fupi":"Short Course Fee" %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="SHORT_COURSE_FEE">
            <div class="form-row">
              <div class="fg"><label><%= sw?"Kumbukumbu ya Maombi":"Application Reference" %> *</label><input class="fc" name="referenceId" required placeholder="VETA-2025-XXXXX"></div>
              <div class="fg"><label><%= sw?"Jina Kamili":"Full Name" %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><%= sw?"Simu":"Phone" %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><%= sw?"Kozi na Ada":"Course & Fee" %></label>
              <select class="fc" name="amount">
                <option value="180000">Driving PSV — TZS 180,000</option>
                <option value="80000">Motorcycle Riding — TZS 80,000</option>
                <option value="150000">Computer Applications — TZS 150,000</option>
                <option value="200000">Welding Short — TZS 200,000</option>
                <option value="175000">Electrical Short — TZS 175,000</option>
                <option value="160000">Tailoring Short — TZS 160,000</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">🔢 <%= sw?"Tengeneza Nambari ya Udhibiti":"Generate Control Number" %></button>
          </form>
        </div>

        <%-- Production Tab --%>
        <div id="payTab-production" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><%= sw?"Malipo ya Uzalishaji":"Production Payment" %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <input type="hidden" name="paymentType" value="PRODUCTION_ORDER">
            <div class="form-row">
              <div class="fg"><label><%= sw?"Nambari ya Agizo":"Order Number" %> *</label><input class="fc" name="referenceId" required placeholder="ORD-2025-XXXXX"></div>
              <div class="fg"><label><%= sw?"Jina la Mteja":"Client Name" %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><%= sw?"Simu":"Phone" %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><%= sw?"Kiasi (TZS)":"Amount (TZS)" %> *</label><input class="fc" name="amount" type="number" required placeholder="e.g. 450000"></div>
            <button type="submit" class="btn btn-primary">🔢 <%= sw?"Tengeneza Nambari ya Udhibiti":"Generate Control Number" %></button>
          </form>
        </div>

        <%-- Other Tab --%>
        <div id="payTab-other" class="hidden">
          <h3 style="font-size:1.1rem;color:var(--navy);margin-bottom:18px"><%= sw?"Malipo Mengine":"Other Payments" %></h3>
          <form method="post" action="${pageContext.request.contextPath}/payments">
            <input type="hidden" name="action" value="generate">
            <div class="form-row">
              <div class="fg"><label><%= sw?"Nambari ya Mwanafunzi":"Student ID / Reference" %> *</label><input class="fc" name="referenceId" required placeholder="VETA/STU/... or VETA-2025-..."></div>
              <div class="fg"><label><%= sw?"Jina":"Name" %> *</label><input class="fc" name="payerName" required></div>
            </div>
            <div class="fg"><label><%= sw?"Simu":"Phone" %> *</label><input class="fc" name="payerPhone" type="tel" required placeholder="+255 7XX XXX XXX"></div>
            <div class="fg"><label><%= sw?"Aina ya Malipo":"Payment Type" %></label>
              <select class="fc" name="paymentType" onchange="document.querySelector('[name=amount]').value=this.selectedOptions[0].dataset.amount||''">
                <option value="EXAM_FEE" data-amount="80000"><%= sw?"Ada ya Mtihani — TZS 80,000":"Exam Fee — TZS 80,000" %></option>
                <option value="OTHER" data-amount="10000"><%= sw?"Ubadilishaji wa Kadi — TZS 10,000":"ID Card Replacement — TZS 10,000" %></option>
                <option value="OTHER" data-amount="30000"><%= sw?"Ubadilishaji wa Cheti — TZS 30,000":"Certificate Replacement — TZS 30,000" %></option>
                <option value="OTHER" data-amount="20000"><%= sw?"Muhtasari wa Alama — TZS 20,000":"Transcript — TZS 20,000" %></option>
              </select>
            </div>
            <input type="hidden" name="amount" value="80000">
            <button type="submit" class="btn btn-primary">🔢 <%= sw?"Tengeneza Nambari ya Udhibiti":"Generate Control Number" %></button>
          </form>
        </div>

        <%-- CONTROL NUMBER DISPLAY --%>
        <c:if test="${not empty controlNumber}">
        <div class="ctrl-box">
          <div class="ctrl-lbl"><%= sw?"NAMBARI RASMI YA UDHIBITI WA SERIKALI":"OFFICIAL GOVERNMENT CONTROL NUMBER" %></div>
          <div class="ctrl-num">${controlNumber}</div>
          <div class="ctrl-st cst-pending">⏳ <%= sw?"Malipo Yanasubiri":"Payment Pending" %></div>
          <div class="ctrl-exp"><%= sw?"Inaisha: ":"Expires: " %>${expiryDate}</div>
          <div class="pay-methods">
            <div class="pmc"><div class="pmn">📱 M-Pesa</div><div class="pmd">*150*00# → Lipa Bili → Ingiza Nambari</div></div>
            <div class="pmc"><div class="pmn">📱 Tigo Pesa</div><div class="pmd">*150*01# → Malipo → Ingiza Nambari</div></div>
            <div class="pmc"><div class="pmn">📱 Airtel Money</div><div class="pmd">*150*60# → Lipa Bili</div></div>
            <div class="pmc"><div class="pmn">🏦 CRDB Bank</div><div class="pmd">Branch / SimBanking — Tumia Nambari kama Kumbukumbu</div></div>
            <div class="pmc"><div class="pmn">🏦 NMB Bank</div><div class="pmd">Branch / NMB Mobile — Tumia Nambari</div></div>
            <div class="pmc"><div class="pmn">🏦 NBC Bank</div><div class="pmd">Branch deposit — Nambari kama Kumbukumbu</div></div>
          </div>
          <div style="display:flex;gap:10px;justify-content:center;flex-wrap:wrap">
            <button onclick="copyText('${controlNumber}')" class="btn btn-white btn-sm">📋 <%= sw?"Nakili":"Copy" %></button>
            <button onclick="window.print()" class="btn btn-white btn-sm">🖨️ <%= sw?"Chapisha Stakabadhi":"Print Slip" %></button>
            <a href="${pageContext.request.contextPath}/download?type=receipt&ref=${controlNumber}" class="btn btn-white btn-sm">📄 <%= sw?"Pakua PDF":"Download PDF" %></a>
          </div>
        </div>
        </c:if>
      </div>
    </div>

    <%-- RIGHT: Fee Table --%>
    <div>
      <div style="background:#fff;border-radius:var(--radius);box-shadow:var(--shadow);overflow:hidden">
        <table style="width:100%;border-collapse:collapse;font-size:.83rem">
          <thead><tr><th colspan="2" style="background:var(--navy);color:#fff;padding:12px 14px;text-align:left"><%= sw?"Ratiba Kamili ya Ada":"Complete Fee Schedule" %></th></tr></thead>
          <tbody>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><%= sw?"Kozi Fupi":"Short Courses" %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Driving (PSV/Light)</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 180,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Motorcycle Riding</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 80,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Computer Applications</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 150,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Welding Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 200,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Electrical Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 175,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Tailoring Short</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 160,000</td></tr>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><%= sw?"Kozi Ndefu (kwa mwaka)":"Long Courses (per year)" %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Tailoring & Garment</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 700,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Welding & Fabrication</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 780,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Electrical Installation</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 850,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">ICT Studies</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 900,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)">Automotive Engineering</td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 920,000</td></tr>
            <tr><td colspan="2" style="background:var(--off);font-weight:700;font-size:.73rem;text-transform:uppercase;padding:8px 14px;letter-spacing:.5px"><%= sw?"Malipo Mengine":"Other Charges" %></td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><%= sw?"Ada ya Maombi":"Application Fee" %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 20,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><%= sw?"Usajili (mara moja)":"Registration (once)" %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 50,000</td></tr>
            <tr><td style="padding:9px 14px;border-bottom:1px solid var(--g200)"><%= sw?"Ada ya Mtihani/mwaka":"Exam Fee/year" %></td><td style="padding:9px 14px;border-bottom:1px solid var(--g200);font-weight:700">TZS 80,000</td></tr>
            <tr><td style="padding:9px 14px"><%= sw?"Hosteli/muhula":"Hostel/semester" %></td><td style="padding:9px 14px;font-weight:700">TZS 300,000</td></tr>
          </tbody>
        </table>
      </div>
      <div style="background:var(--navy);border-radius:var(--radius);padding:18px;margin-top:14px;color:rgba(255,255,255,.75);font-size:.82rem;line-height:1.7">
        <div style="font-weight:700;color:var(--gold);margin-bottom:7px">⚠️ <%= sw?"Maelezo Muhimu":"Important Notes" %></div>
        <%= sw ?
            "Daima tengeneza Nambari ya Udhibiti kabla ya kulipa. Nambari zinaisha baada ya siku 7. Hifadhi stakabadhi yako. Msaada: +255 754 000 222." :
            "Always generate a Control Number before paying. Numbers expire in 7 days. Keep your receipt. Help: +255 754 000 222." %>
      </div>
    </div>
  </div>
</div></div>

<jsp:include page="footer.jsp"/>
