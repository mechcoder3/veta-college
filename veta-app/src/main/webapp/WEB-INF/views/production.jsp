<%-- ════════════════ production.jsp ════════════════ --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="activePage" value="production"/>
<c:set var="pageTitle" value="Production Services"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a>
      <span class="bcs">›</span>
      <span><% if(sw){ %>Uzalishaji<% } else { %>Production<% } %></span>
    </div>
    <h1><% if(sw){ %>Huduma za Uzalishaji<% } else { %>Production Services<% } %></h1>
    <p><% if(sw){ %>Bidhaa bora na huduma za kitaalamu zilizoundwa na wanafunzi wetu chini ya usimamizi wa wataalamu.<% } else { %>Quality products and services crafted by our skilled trainees under expert supervision.<% } %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">

  <%-- Success Message --%>
  <c:if test="${orderSuccess}">
  <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--r12);padding:26px;text-align:center;margin-bottom:28px;color:#fff">
    <div style="font-size:2.5rem;margin-bottom:10px">✅</div>
    <h3 style="color:#fff;margin-bottom:6px"><% if(sw){ %>Agizo Limewasilishwa!<% } else { %>Order Placed Successfully!<% } %></h3>
    <div style="font-family:'Courier New',monospace;font-size:1.5rem;font-weight:700;color:var(--gold);letter-spacing:3px;margin-bottom:8px">${orderNumber}</div>
    <p style="color:rgba(255,255,255,.75);font-size:.85rem"><% if(sw){ %>Tutawasiliana nawe ndani ya masaa 24 na nukuu.<% } else { %>We will contact you within 24 hours with a quotation.<% } %></p>
  </div>
  </c:if>
  <c:if test="${not empty orderError}">
    <div class="alert-error"><c:out value="${orderError}"/></div>
  </c:if>

  <%-- ══ PRODUCTS GRID ══
       Format: emoji | name_en | name_sw | price | color | desc_en | desc_sw
  --%>
  <div style="margin-bottom:44px">
    <h2 style="font-size:1.6rem;color:var(--navy);margin-bottom:24px">
      🛍️ <% if(sw){ %>Bidhaa Zinazouzwa<% } else { %>Products For Sale<% } %>
    </h2>
    <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:18px">

      <c:set var="products" value="
🚪|Metal Security Doors|Milango ya Chuma ya Usalama|TZS 350,000–600,000|#0A2463|Heavy-gauge steel security doors with locks. Custom sizes and designs available. Installation included.|Milango ya chuma ya nguvu na kufuli. Ukubwa na muundo wa kuchagua. Usakinishaji umejumuishwa.;
🪟|Metal Window Frames|Fremu za Madirisha ya Chuma|TZS 80,000–200,000|#1565C0|Welded steel window frames with security grills. Various designs, standard or custom sizes.|Fremu za chuma zenye grili za usalama. Miundo mbalimbali, ukubwa wa kawaida au maalum.;
🪑|Office and School Furniture|Samani za Ofisi na Shule|TZS 120,000–450,000|#1B5E20|Desks, chairs, benches and cabinets. Durable wood and metal combinations. Bulk orders welcome.|Meza, viti, madawati na makabati. Mchanganyiko imara wa mbao na chuma. Maagizo ya wingi yanakaribishwa.;
🧵|School Uniforms and Garments|Sare na Nguo Zilizoshonwa|TZS 25,000–80,000|#1A237E|School uniforms, office wear and traditional attire. Institutional bulk orders welcome.|Sare za shule, mavazi ya ofisi na nguo za jadi. Maagizo ya taasisi yanakaribishwa.;
☀️|Solar Panel Systems|Mifumo ya Paneli za Jua|Bei ya Mazungumzo|#E65100|Solar installation for homes, schools and businesses. Supply, install and maintenance services.|Usakinishaji wa jua kwa nyumba, shule na biashara. Huduma za usambazaji, usakinishaji na matengenezo.;
🔧|Vehicle Repair and Service|Ukarabati na Huduma za Magari|Bei ya Mazungumzo|#4A148C|Engine, brakes, electrical, body work and full service. Professional and competitive rates.|Injini, breki, umeme, mwili wa gari na huduma kamili. Viwango vya kitaalamu na vya ushindani.;
🏗️|Custom Metal Fabrication|Uundaji Maalum wa Chuma|Bei ya Mazungumzo|#006064|Gates, fences, railings, tanks and structures. Designed to your specifications.|Malango, uzio, reli, matangi na miundo. Imeundwa kulingana na mahitaji yako.;
⚡|Electrical Installation|Usakinishaji wa Umeme|Bei ya Mazungumzo|#BF360C|Residential and commercial wiring, distribution boards, security lighting and CCTV.|Waya za nyumba na biashara, bodi za usambazaji, taa za usalama na CCTV."/>

      <c:forTokens var="item" items="${products}" delims=";">
        <c:set var="p" value="${fn:split(fn:trim(item),'|')}"/>
        <c:if test="${fn:length(p) >= 7}">
        <div style="background:#fff;border-radius:var(--r12);box-shadow:var(--s3);overflow:hidden;transition:all var(--tr);display:flex;flex-direction:column" class="card-hover">
          <%-- Icon area --%>
          <div style="height:155px;display:flex;align-items:center;justify-content:center;font-size:3.5rem;background:linear-gradient(135deg,${p[4]},${p[4]}cc)">
            ${p[0]}
          </div>
          <%-- Content --%>
          <div style="padding:15px;flex:1;display:flex;flex-direction:column">
            <div style="font-size:.9rem;font-weight:700;color:var(--navy);margin-bottom:3px">
              <% if(sw){ %>${p[2]}<% } else { %>${p[1]}<% } %>
            </div>
            <div style="font-size:1rem;font-weight:700;color:var(--blue);margin-bottom:7px;font-family:var(--fh)">
              ${p[3]}
            </div>
            <div style="font-size:.78rem;color:var(--g600);margin-bottom:12px;flex:1">
              <% if(sw){ %>${p[6]}<% } else { %>${p[5]}<% } %>
            </div>
            <button class="btn btn-primary btn-sm"
              onclick="document.getElementById('orderForm').scrollIntoView({behavior:'smooth'});
                       document.getElementById('productField').value='<% if(sw){ %>${p[2]}<% } else { %>${p[1]}<% } %>'">
              🛒 <% if(sw){ %>Agiza<% } else { %>Order<% } %>
            </button>
          </div>
        </div>
        </c:if>
      </c:forTokens>

    </div>
  </div>

  <%-- ══ ORDER FORM ══ --%>
  <div id="orderForm" style="background:#fff;border-radius:var(--r12);box-shadow:var(--s3);padding:32px;max-width:680px">
    <h3 style="font-size:1.3rem;color:var(--navy);margin-bottom:20px">
      📋 <% if(sw){ %>Weka Agizo / Omba Nukuu<% } else { %>Place Order / Request Quote<% } %>
    </h3>
    <form method="post" action="${pageContext.request.contextPath}/production">
      <div class="fg">
        <label><% if(sw){ %>Bidhaa / Huduma<% } else { %>Product / Service<% } %></label>
        <input class="fc" id="productField" name="productName"
               placeholder="<% if(sw){ %>Jina la bidhaa au huduma<% } else { %>Product or service name<% } %>">
      </div>
      <div class="form-row">
        <div class="fg">
          <label><% if(sw){ %>Jina Lako Kamili<% } else { %>Your Full Name<% } %> *</label>
          <input class="fc" name="clientName" required
                 placeholder="<% if(sw){ %>Jina kamili<% } else { %>Full name<% } %>">
        </div>
        <div class="fg">
          <label><% if(sw){ %>Nambari ya Simu<% } else { %>Phone Number<% } %> *</label>
          <input class="fc" name="clientPhone" type="tel" required placeholder="+255 7XX XXX XXX">
        </div>
      </div>
      <div class="fg">
        <label><% if(sw){ %>Barua Pepe<% } else { %>Email Address<% } %></label>
        <input class="fc" name="clientEmail" type="email" placeholder="your@email.com">
      </div>
      <div class="fg">
        <label><% if(sw){ %>Maelezo / Mahitaji Maalum<% } else { %>Specifications / Requirements<% } %></label>
        <textarea class="fc" name="specifications" rows="3"
                  placeholder="<% if(sw){ %>Ukubwa, rangi, idadi, mahali pa uwasilishaji...<% } else { %>Size, color, quantity, delivery location...<% } %>"></textarea>
      </div>
      <div class="form-row">
        <div class="fg">
          <label><% if(sw){ %>Idadi<% } else { %>Quantity<% } %></label>
          <input class="fc" name="quantity" type="number" min="1" value="1">
        </div>
        <div class="fg">
          <label><% if(sw){ %>Bajeti ya Tahmini (TZS)<% } else { %>Estimated Budget (TZS)<% } %></label>
          <input class="fc" name="estimatedBudget" type="number" placeholder="e.g. 500000">
        </div>
      </div>
      <button type="submit" class="btn btn-primary btn-lg">
        📋 <% if(sw){ %>Wasilisha Agizo<% } else { %>Submit Order<% } %>
      </button>
    </form>
  </div>

</div>

<jsp:include page="footer.jsp"/>
