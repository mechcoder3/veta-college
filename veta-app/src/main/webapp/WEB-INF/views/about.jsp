<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="about"/>
<c:set var="pageTitle" value="About Us"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<%-- GALLERY SLIDESHOW --%>
<div class="gallery-slideshow">
    <div class="slides">
        <div class="slides">
    <div class="slide active">
        <img src="${pageContext.request.contextPath}/Images/best.jpeg" alt="Event 1">
        <div class="slide-caption">Katika siku ya wafanyakazi duniani mfanyakazi bora akiwa anakabidhiwa cheti chake cha mfanyakazi bora wa mwaka 2025/2026</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/best1.jpeg" alt="Event 2">
        <div class="slide-caption">picha ya pamoja ya mfanyakazi hodari</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/bestmoney.jpeg" alt="Event 3">
        <div class="slide-caption">mfanyakazi bora akipatiwa kitita cha fedha kama zawadi ya ufanyakazi hodari</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/bestworker.jpeg" alt="Event 4">
        <div class="slide-caption">picha ya pamoja ya mfanyakazi hodari msajiri,katibu RAAWUU tawi na mwenyekiti wa kina mama raawuu tawi</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/chakula.jpeg" alt="Event 5">
        <div class="slide-caption">wafanyakazi wa VETA kigoma wakipata chakula cha pamoja</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/dg.jpeg" alt="Event 6">
        <div class="slide-caption">mkurugenzi mkuu akiongea na mwenyekiti dawati la jinsia veta KIGOMA </div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/mayday1.jpeg" alt="Event 7">
        <div class="slide-caption">wafanyakazi wa veta kigoma katika sherehe ya pamoja sikukuu ya wafanyakazi duniani 2026</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/sikukuu1.jpeg" alt="Event 8">
        <div class="slide-caption">National Celebrations</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/student1.jpeg" alt="Event 9">
        <div class="slide-caption">Wanafunzi wa fani ya ufundi bomba wakiwa katika matembezi ya masomo</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/studettour.jpeg" alt="Event 10">
        <div class="slide-caption">Wanafunzi wa fani ya ufundi bomba wakiwa katika matembezi ya masomo</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/tour.jpeg" alt="Event 11">
        <div class="slide-caption">Wanafunzi wa fani ya ufundi bomba wakiwa katika matembezi ya masomo</div>
    </div>
    <div class="slide">
        <img src="${pageContext.request.contextPath}/Images/uvinza.jpeg" alt="Event 12">
        <div class="slide-caption">wafanyakazi wa veta kigoma wakiwa safarini kuelekea uvinza kwa ajiri ya sikukuu ya wafanyakizi </div>
    </div>
</div>
    </div>
    <button class="slide-btn prev" onclick="changeSlide(-1)">&#10094;</button>
    <button class="slide-btn next" onclick="changeSlide(1)">&#10095;</button>
   <div class="slide-dots">
    <span class="dot active" onclick="goToSlide(0)"></span>
    <span class="dot" onclick="goToSlide(1)"></span>
    <span class="dot" onclick="goToSlide(2)"></span>
    <span class="dot" onclick="goToSlide(3)"></span>
    <span class="dot" onclick="goToSlide(4)"></span>
    <span class="dot" onclick="goToSlide(5)"></span>
    <span class="dot" onclick="goToSlide(6)"></span>
    <span class="dot" onclick="goToSlide(7)"></span>
    <span class="dot" onclick="goToSlide(8)"></span>
    <span class="dot" onclick="goToSlide(9)"></span>
    <span class="dot" onclick="goToSlide(10)"></span>
    <span class="dot" onclick="goToSlide(11)"></span>
</div>
</div>

<style>
.gallery-slideshow {
    position: relative;
    width: 100%;
    height: 450px;
    overflow: hidden;
    background: #000;
}
.slides { width: 100%; height: 100%; }
.slide {
    display: none;
    width: 100%;
    height: 100%;
    position: relative;
}
.slide.active { display: block; }
.slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.85;
}
.slide-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(transparent, rgba(0,0,0,0.7));
    color: #fff;
    padding: 30px 20px 15px;
    font-size: 1.2rem;
    font-weight: 600;
    text-align: center;
}
.slide-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(255,255,255,0.3);
    color: white;
    border: none;
    padding: 14px 18px;
    font-size: 1.2rem;
    cursor: pointer;
    border-radius: 50%;
    transition: background 0.3s;
    z-index: 10;
}
.slide-btn:hover { background: rgba(255,255,255,0.6); }
.slide-btn.prev { left: 15px; }
.slide-btn.next { right: 15px; }
.slide-dots {
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 8px;
    z-index: 10;
}
.dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: rgba(255,255,255,0.5);
    cursor: pointer;
    transition: background 0.3s;
}
.dot.active { background: #fff; }
</style>

<script>
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');

function showSlide(n) {
    slides[currentSlide].classList.remove('active');
    dots[currentSlide].classList.remove('active');
    currentSlide = (n + slides.length) % slides.length;
    slides[currentSlide].classList.add('active');
    dots[currentSlide].classList.add('active');
}

function changeSlide(direction) {
    showSlide(currentSlide + direction);
}

function goToSlide(n) {
    showSlide(n);
}

// Automatic slideshow kila sekunde 4
setInterval(() => changeSlide(1), 4000);
</script>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><% if(sw){ %>Nyumbani<% } else { %>Home<% } %></a><span class="bcs">›</span><span><% if(sw){ %>Kuhusu Sisi<% } else { %>About Us<% } %></span></div>
    <h1><% if(sw){ %>Kuhusu Chuo cha VETA KIGOMA<% } else { %>About KIGOMA RVTSC<% } %></h1>
    <p><% if(sw){ %>Chuo cha ufundi KIGOMA RVTSC kilianzishwa mwaka 2005<% } else { %>Tanzania's premier government-accredited vocational training institution since 1999.<% } %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <%-- Story --%>
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:48px;align-items:center;margin-bottom:52px">
    <div>
      <span class="sk"><% if(sw){ %>Historia Yetu<% } else { %>Our Story<% } %></span>
      <h2 style="font-size:1.7rem;color:var(--navy);margin:8px 0 14px"><% if(sw){ %>Miaka 20 ya Kubadilisha Maisha<% } else { %>20 Years of Transforming Lives<% } %></h2>
      <p style="color:var(--g700);margin-bottom:13px;font-size:.93rem"><% if(sw){ %>Chuo cha VETA kilianzishwa mwaka 2005 chini ya Sheria ya Mamlaka ya Elimu na Mafunzo ya Ufundi kutoa mafunzo ya ufundi yenye ubora, yanayofaa na yanayopatikana kwa vijana wa Tanzania. Kwa zaidi ya Miaka 20, tumekuwa taasisi inayotambuliwa kitaifa ikitoa programu zilizoidhinishwa na NVA.<% } else { %>VETA College was established in 1999 under the Vocational Education and Training Authority Act to provide quality, relevant and accessible vocational training to Tanzanian youth. Over 20 years, we have grown into a nationally recognized institution offering NVA-certified programs.<% } %></p>
      <p style="color:var(--g700);font-size:.93rem"><% if(sw){ %>Warsha zetu za kisasa, maabara ya kisasa ya kompyuta na waalimu wenye uzoefu huhakikisha kila mhitimu yuko tayari kwa tasnia na kushindana katika soko la kazi la dunia.<% } else { %>Our state-of-the-art workshops, modern computer labs and experienced instructors ensure every graduate is industry-ready and competitive in the global labour market.<% } %></p>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:13px;margin-top:18px">
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">2005</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><% if(sw){ %>Mwaka wa Kuanzishwa<% } else { %>Year Founded<% } %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">8,000+</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><% if(sw){ %>Wahitimu<% } else { %>Graduates<% } %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">15+</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><% if(sw){ %>Programu<% } else { %>Programs<% } %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">90%</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><% if(sw){ %>Kiwango cha Ajira<% } else { %>Employment Rate<% } %></div></div>
      </div>
    </div>
    <div style="border-radius:var(--r12);background:#E3F2FD;height:340px;display:flex;align-items:center;justify-content:center;font-size:5rem;position:relative;border:1px solid var(--g200)">🏫
      <div style="position:absolute;bottom:18px;right:18px;background:var(--navy);color:#fff;padding:11px 15px;border-radius:var(--r12);text-align:center">
        <div style="font-family:var(--fh);font-size:1.5rem;color:var(--gold);line-height:1">ISO</div>
        <div style="font-size:.7rem;color:rgba(255,255,255,.65)">9001:2015</div>
      </div>
    </div>
  </div>

  <%-- Values --%>
  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:22px;margin-bottom:52px">
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">🎯</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><% if(sw){ %>Dhamira Yetu<% } else { %>Our Mission<% } %></h3><p style="font-size:.85rem;color:var(--g600)"><% if(sw){ %>Kuhakikisha upatikanaji wa ujuzi wa ufundi stadi nchini Tanzania kupitia utoaji na uhamasishaji wa Elimu na Mafunzo ya Ufundi Stadi (VET) ili kukidhi mahitaji ya soko la ajira kwa maendeleo ya kijamii na kiuchumi.<% } else { %>To ensure availability of Vocational Skills in Tanzania through provision and promotion of Vocational Education and Training (VET) to meet labour market demand for socio-economic development.<% } %></p></div>
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:#FFF8E1;display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">🔭</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><% if(sw){ %>Maono Yetu<% } else { %>Our Vision<% } %></h3><p style="font-size:.85rem;color:var(--g600)"><% if(sw){ %>Tanzania yenye mafundi wa kutosha na wenye ujuzi stahiki.<% } else { %>Tanzania with sufficient and competent artisans.<% } %></p></div>
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:var(--greenbg);display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">⭐</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><% if(sw){ %>Maadili Msingi<% } else { %>Core Values<% } %></h3><p style="font-size:.85rem;color:var(--g600)"><% if(sw){ %><br><b>Watu Kwanza</b>
    		Tumejizatiti kukidhi matarajio ya watu kwa heshima, adabu na mwitikio wa haraka
    		<br><b> Ustadi na Ubunifu<b>
    Tumejitoa kuimarisha ujuzi wa vitendo ili kukabiliana na changamoto za kiteknolojia na kukidhi mahitaji ya soko la ajira
    <br><b> Ushirikiano na Uadilifu<b>
    Tunaamini katika kufanya kazi pamoja kwa viwango vya juu vya uadilifu ili kufikia malengo ya pamoja; na
    <br><b> Ulinganifu (Umuhimu)<b>
    Tunajitahidi kuhakikisha utoaji wa mafunzo na huduma za ufundi stadi zenye tija zinazokidhi mahitaji ya soko la ajira na jamii.<% } else { %><b>People first</b>
We are committed to meet people's expectations with courtesy and responsiveness 
<br><b>Dexterity and creativity</b>
Dedicated to Enhance hands on skills in responding technological challenges and meet labour market needs
<br><b>Teamwork and integrity</b>
Believing in working together with high levels of integrity to achieve the common goal and 
<br><b>Relevancy</b>
Working towards ensuring provision of relevant Vocational Training and Services that respond to the demand of labour market and people needs<% } %></p></div>
  </div>

  <%-- CTA --%>
  <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--r12);padding:40px;text-align:center;color:#fff">
    <h2 style="color:#fff;font-size:1.8rem;margin-bottom:12px"><% if(sw){ %>Anza Safari Yako Leo<% } else { %>Start Your Journey Today<% } %></h2>
    <p style="color:rgba(255,255,255,.78);margin-bottom:24px;max-width:500px;margin-left:auto;margin-right:auto"><% if(sw){ %>Jiunge na maelfu ya wanafunzi wanaobadilisha maisha yao kwa elimu ya ufundi wa VETA.<% } else { %>Join thousands of students transforming their lives through VETA vocational education.<% } %></p>
    <div style="display:flex;gap:14px;justify-content:center;flex-wrap:wrap">
      <a href="${pageContext.request.contextPath}/admissions" class="btn btn-gold btn-lg">🎓 <% if(sw){ %>Omba Sasa<% } else { %>Apply Now<% } %></a>
      <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-w btn-lg">📞 <% if(sw){ %>Wasiliana Nasi<% } else { %>Contact Us<% } %></a>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>