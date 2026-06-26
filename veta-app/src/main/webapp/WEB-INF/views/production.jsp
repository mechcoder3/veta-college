<%-- ════════════════ production.jsp ════════════════ --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="activePage" value="production"/>
<c:set var="pageTitle" value="Production Services"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<style>
.prod-card {
  background: #fff;
  border-radius: 14px;
  box-shadow: 0 4px 20px rgba(0,0,0,.10);
  overflow: hidden;
  display: flex;
  flex-direction: column;
  transition: transform .25s ease, box-shadow .25s ease;
}
.prod-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 14px 36px rgba(0,0,0,.18);
}
.prod-img-wrap {
  position: relative;
  height: 180px;
  overflow: hidden;
  background: #1a1a2e;
  display: flex;
  align-items: center;
  justify-content: center;
}
.prod-img-wrap img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
  transition: transform .4s ease;
}
.prod-card:hover .prod-img-wrap img {
  transform: scale(1.07);
}
.prod-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(to top, rgba(10,36,99,.75) 0%, transparent 60%);
  pointer-events: none;
}
.prod-badge {
  position: absolute;
  bottom: 12px;
  left: 12px;
  color: #fff;
  font-size: .72rem;
  font-weight: 700;
  letter-spacing: 1.2px;
  text-transform: uppercase;
  z-index: 2;
}
.prod-price-tag {
  position: absolute;
  top: 10px;
  right: 10px;
  background: #FFD700;
  color: #1a1a1a;
  font-size: .68rem;
  font-weight: 800;
  padding: 4px 10px;
  border-radius: 20px;
  white-space: nowrap;
  z-index: 2;
}
.prod-body {
  padding: 16px;
  flex: 1;
  display: flex;
  flex-direction: column;
}
.prod-name {
  font-size: .93rem;
  font-weight: 700;
  color: #0A2463;
  margin-bottom: 6px;
  line-height: 1.3;
}
.prod-desc {
  font-size: .77rem;
  color: #555;
  flex: 1;
  margin-bottom: 14px;
  line-height: 1.55;
}
.prod-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  margin-bottom: 52px;
}
.prod-fallback {
  font-size: 4rem;
  position: absolute;
}
@media(max-width:1000px){ .prod-grid{ grid-template-columns: repeat(2,1fr); } }
@media(max-width:560px) { .prod-grid{ grid-template-columns: 1fr; } }
</style>

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

  <c:if test="${orderSuccess}">
    <div style="background:linear-gradient(135deg,#0A2463,#1565C0);border-radius:14px;padding:26px;text-align:center;margin-bottom:28px;color:#fff">
      <div style="font-size:2.5rem;margin-bottom:10px">&#9989;</div>
      <h3 style="color:#fff;margin-bottom:6px"><% if(sw){ %>Agizo Limewasilishwa!<% } else { %>Order Placed Successfully!<% } %></h3>
      <div style="font-family:'Courier New',monospace;font-size:1.5rem;font-weight:700;color:#FFD700;letter-spacing:3px;margin-bottom:8px">${orderNumber}</div>
      <p style="color:rgba(255,255,255,.75);font-size:.85rem"><% if(sw){ %>Tutawasiliana nawe ndani ya masaa 24 na nukuu.<% } else { %>We will contact you within 24 hours with a quotation.<% } %></p>
    </div>
  </c:if>
  <c:if test="${not empty orderError}">
    <div class="alert-error"><c:out value="${orderError}"/></div>
  </c:if>

  <h2 style="font-size:1.6rem;color:#0A2463;margin-bottom:24px">
    &#128717; <% if(sw){ %>Bidhaa Zinazouzwa<% } else { %>Products For Sale<% } %>
  </h2>

  <div class="prod-grid">

    <%-- 1 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#0A2463">
        <span class="prod-fallback" id="fb1">&#128682;</span>
        <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb1').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Milango<% } else { %>Doors<% } %></span>
        <span class="prod-price-tag">TZS 350,000–600,000</span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Milango ya Chuma ya Usalama<% } else { %>Metal Security Doors<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Milango ya chuma ya nguvu na kufuli. Ukubwa na muundo wa kuchagua. Usakinishaji umejumuishwa.<% } else { %>Heavy-gauge steel security doors with locks. Custom sizes and designs available. Installation included.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Milango ya Chuma ya Usalama<% } else { %>Metal Security Doors<% } %>')">&#128Shopping; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 2 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#1565C0">
        <span class="prod-fallback" id="fb2">&#129695;</span>
        <img src="https://images.unsplash.com/photo-1541123437800-1bb1317badc2?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb2').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Madirisha<% } else { %>Windows<% } %></span>
        <span class="prod-price-tag">TZS 80,000–200,000</span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Fremu za Madirisha ya Chuma<% } else { %>Metal Window Frames<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Fremu za chuma zenye grili za usalama. Miundo mbalimbali, ukubwa wa kawaida au maalum.<% } else { %>Welded steel window frames with security grills. Various designs, standard or custom sizes.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Fremu za Madirisha ya Chuma<% } else { %>Metal Window Frames<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 3 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#1B5E20">
        <span class="prod-fallback" id="fb3">&#129681;</span>
        <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb3').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Samani<% } else { %>Furniture<% } %></span>
        <span class="prod-price-tag">TZS 120,000–450,000</span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Samani za Ofisi na Shule<% } else { %>Office and School Furniture<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Meza, viti, madawati na makabati. Mchanganyiko imara wa mbao na chuma. Maagizo ya wingi yanakaribishwa.<% } else { %>Desks, chairs, benches and cabinets. Durable wood and metal combinations. Bulk orders welcome.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Samani za Ofisi na Shule<% } else { %>Office and School Furniture<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 4 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#1A237E">
        <span class="prod-fallback" id="fb4">&#129525;</span>
        <img src="https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb4').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Nguo<% } else { %>Garments<% } %></span>
        <span class="prod-price-tag">TZS 25,000–80,000</span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Sare na Nguo Zilizoshonwa<% } else { %>School Uniforms and Garments<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Sare za shule, mavazi ya ofisi na nguo za jadi. Maagizo ya taasisi yanakaribishwa.<% } else { %>School uniforms, office wear and traditional attire. Institutional bulk orders welcome.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Sare na Nguo Zilizoshonwa<% } else { %>School Uniforms and Garments<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 5 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#E65100">
        <span class="prod-fallback" id="fb5">&#9728;&#65039;</span>
        <img src="https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb5').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Jua<% } else { %>Solar<% } %></span>
        <span class="prod-price-tag"><% if(sw){ %>Bei ya Mazungumzo<% } else { %>By Quotation<% } %></span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Mifumo ya Paneli za Jua<% } else { %>Solar Panel Systems<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Usakinishaji wa jua kwa nyumba, shule na biashara. Huduma za usambazaji, usakinishaji na matengenezo.<% } else { %>Solar installation for homes, schools and businesses. Supply, install and maintenance services.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Mifumo ya Paneli za Jua<% } else { %>Solar Panel Systems<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 6 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#4A148C">
        <span class="prod-fallback" id="fb6">&#128295;</span>
        <img src="https://images.unsplash.com/photo-1530046339160-ce3e530c7d2f?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb6').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Magari<% } else { %>Vehicles<% } %></span>
        <span class="prod-price-tag"><% if(sw){ %>Bei ya Mazungumzo<% } else { %>By Quotation<% } %></span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Ukarabati na Huduma za Magari<% } else { %>Vehicle Repair and Service<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Injini, breki, umeme, mwili wa gari na huduma kamili. Viwango vya kitaalamu na vya ushindani.<% } else { %>Engine, brakes, electrical, body work and full service. Professional and competitive rates.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Ukarabati na Huduma za Magari<% } else { %>Vehicle Repair and Service<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 7 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#006064">
        <span class="prod-fallback" id="fb7">&#127959;&#65039;</span>
        <img src="https://images.unsplash.com/photo-1504328345606-18bbc8c9d7d1?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb7').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Chuma<% } else { %>Fabrication<% } %></span>
        <span class="prod-price-tag"><% if(sw){ %>Bei ya Mazungumzo<% } else { %>By Quotation<% } %></span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Uundaji Maalum wa Chuma<% } else { %>Custom Metal Fabrication<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Malango, uzio, reli, matangi na miundo. Imeundwa kulingana na mahitaji yako.<% } else { %>Gates, fences, railings, tanks and structures. Designed to your specifications.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Uundaji Maalum wa Chuma<% } else { %>Custom Metal Fabrication<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

    <%-- 8 --%>
    <div class="prod-card">
      <div class="prod-img-wrap" style="background:#BF360C">
        <span class="prod-fallback" id="fb8">&#9889;</span>
        <img src="https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&h=220&fit=crop&auto=format"
             alt="" onload="document.getElementById('fb8').style.display='none'" onerror="this.style.display='none'">
        <div class="prod-overlay"></div>
        <span class="prod-badge"><% if(sw){ %>Umeme<% } else { %>Electrical<% } %></span>
        <span class="prod-price-tag"><% if(sw){ %>Bei ya Mazungumzo<% } else { %>By Quotation<% } %></span>
      </div>
      <div class="prod-body">
        <div class="prod-name"><% if(sw){ %>Usakinishaji wa Umeme<% } else { %>Electrical Installation<% } %></div>
        <div class="prod-desc"><% if(sw){ %>Waya za nyumba na biashara, bodi za usambazaji, taa za usalama na CCTV.<% } else { %>Residential and commercial wiring, distribution boards, security lighting and CCTV.<% } %></div>
        <button class="btn btn-primary btn-sm" onclick="selectProduct('<% if(sw){ %>Usakinishaji wa Umeme<% } else { %>Electrical Installation<% } %>')">&#128722; <% if(sw){ %>Agiza<% } else { %>Order<% } %></button>
      </div>
    </div>

  </div><%-- end prod-grid --%>

  <%-- ORDER FORM --%>
  <div id="orderForm" style="background:#fff;border-radius:14px;box-shadow:0 4px 20px rgba(0,0,0,.10);padding:36px;max-width:680px">
    <h3 style="font-size:1.3rem;color:#0A2463;margin-bottom:20px">
      &#128203; <% if(sw){ %>Weka Agizo / Omba Nukuu<% } else { %>Place Order / Request Quote<% } %>
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
          <input class="fc" name="clientName" required placeholder="<% if(sw){ %>Jina kamili<% } else { %>Full name<% } %>">
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
        &#128203; <% if(sw){ %>Wasilisha Agizo<% } else { %>Submit Order<% } %>
      </button>
    </form>
  </div>

</div>

<script>
function selectProduct(name) {
  document.getElementById('productField').value = name;
  document.getElementById('orderForm').scrollIntoView({ behavior: 'smooth' });
}
</script>

<jsp:include page="footer.jsp"/>
