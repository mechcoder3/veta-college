<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="about"/>
<c:set var="pageTitle" value="About Us"/>
<% boolean sw = "sw".equals(session.getAttribute("lang")); %>
<jsp:include page="header.jsp"/>

<div class="page-hero">
  <div class="wrap">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><%= sw?"Nyumbani":"Home" %></a><span class="bcs">›</span><span><%= sw?"Kuhusu Sisi":"About Us" %></span></div>
    <h1><%= sw?"Kuhusu Chuo cha VETA KIGOMA":"About KIGOMA RVTSC" %></h1>
    <p><%= sw?"Chuo cha ufundi KIGOMA RVTSC kilianzishwa mwaka 2005":"Tanzania's premier government-accredited vocational training institution since 1999." %></p>
  </div>
</div>

<div class="wrap" style="padding:52px 0">
  <%-- Story --%>
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:48px;align-items:center;margin-bottom:52px">
    <div>
      <span class="sk"><%= sw?"Historia Yetu":"Our Story" %></span>
      <h2 style="font-size:1.7rem;color:var(--navy);margin:8px 0 14px"><%= sw?"Miaka 20 ya Kubadilisha Maisha":"20 Years of Transforming Lives" %></h2>
      <p style="color:var(--g700);margin-bottom:13px;font-size:.93rem"><%= sw?"Chuo cha VETA kilianzishwa mwaka 2005 chini ya Sheria ya Mamlaka ya Elimu na Mafunzo ya Ufundi kutoa mafunzo ya ufundi yenye ubora, yanayofaa na yanayopatikana kwa vijana wa Tanzania. Kwa zaidi ya Miaka 20, tumekuwa taasisi inayotambuliwa kitaifa ikitoa programu zilizoidhinishwa na NVA.":"VETA College was established in 1999 under the Vocational Education and Training Authority Act to provide quality, relevant and accessible vocational training to Tanzanian youth. Over 20 years, we have grown into a nationally recognized institution offering NVA-certified programs." %></p>
      <p style="color:var(--g700);font-size:.93rem"><%= sw?"Warsha zetu za kisasa, maabara ya kisasa ya kompyuta na waalimu wenye uzoefu huhakikisha kila mhitimu yuko tayari kwa tasnia na kushindana katika soko la kazi la dunia.":"Our state-of-the-art workshops, modern computer labs and experienced instructors ensure every graduate is industry-ready and competitive in the global labour market." %></p>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:13px;margin-top:18px">
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">2005</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><%= sw?"Mwaka wa Kuanzishwa":"Year Founded" %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">8,000+</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><%= sw?"Wahitimu":"Graduates" %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">15+</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><%= sw?"Programu":"Programs" %></div></div>
        <div style="background:#E3F2FD;border-radius:8px;padding:15px;border-left:4px solid var(--blue)"><div style="font-family:var(--fh);font-size:1.4rem;color:var(--navy)">90%</div><div style="font-size:.75rem;color:var(--g600);margin-top:1px"><%= sw?"Kiwango cha Ajira":"Employment Rate" %></div></div>
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
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:#E3F2FD;display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">🎯</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><%= sw?"Dhamira Yetu":"Our Mission" %></h3><p style="font-size:.85rem;color:var(--g600)"><%= sw?"Kuhakikisha upatikanaji wa ujuzi wa ufundi stadi nchini Tanzania kupitia utoaji na uhamasishaji wa Elimu na Mafunzo ya Ufundi Stadi (VET) ili kukidhi mahitaji ya soko la ajira kwa maendeleo ya kijamii na kiuchumi.":"To ensure availability of Vocational Skills in Tanzania through provision and promotion of Vocational Education and Training (VET) to meet labour market demand for socio-economic development." %></p></div>
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:#FFF8E1;display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">🔭</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><%= sw?"Maono Yetu":"Our Vision" %></h3><p style="font-size:.85rem;color:var(--g600)"><%= sw?"Tanzania yenye mafundi wa kutosha na wenye ujuzi stahiki.":"Tanzania with sufficient and competent artisans." %></p></div>
    <div style="background:#fff;border-radius:var(--r12);padding:26px 22px;box-shadow:var(--s2)"><div style="width:50px;height:50px;border-radius:8px;background:var(--greenbg);display:flex;align-items:center;justify-content:center;font-size:1.4rem;margin-bottom:14px">⭐</div><h3 style="font-size:1rem;color:var(--navy);margin-bottom:7px"><%= sw?"Maadili Msingi":"Core Values" %></h3><p style="font-size:.85rem;color:var(--g600)"><%= sw?"<br><b>Watu Kwanza</b>
    		Tumejizatiti kukidhi matarajio ya watu kwa heshima, adabu na mwitikio wa haraka
    		<br><b> Ustadi na Ubunifu<b>
    Tumejitoa kuimarisha ujuzi wa vitendo ili kukabiliana na changamoto za kiteknolojia na kukidhi mahitaji ya soko la ajira
    <br><b> Ushirikiano na Uadilifu<b>
    Tunaamini katika kufanya kazi pamoja kwa viwango vya juu vya uadilifu ili kufikia malengo ya pamoja; na
    <br><b> Ulinganifu (Umuhimu)<b>
    Tunajitahidi kuhakikisha utoaji wa mafunzo na huduma za ufundi stadi zenye tija zinazokidhi mahitaji ya soko la ajira na jamii.":"<b>People first</b>
We are committed to meet people's expectations with courtesy and responsiveness 
<br><b>Dexterity and creativity</b>
Dedicated to Enhance hands on skills in responding technological challenges and meet labour market needs
<br><b>Teamwork and integrity</b>
Believing in working together with high levels of integrity to achieve the common goal and 
<br><b>Relevancy</b>
Working towards ensuring provision of relevant Vocational Training and Services that respond to the demand of labour market and people needs" %></p></div>
  </div>

  <%-- CTA --%>
  <div style="background:linear-gradient(135deg,var(--navy),var(--blue));border-radius:var(--r12);padding:40px;text-align:center;color:#fff">
    <h2 style="color:#fff;font-size:1.8rem;margin-bottom:12px"><%= sw?"Anza Safari Yako Leo":"Start Your Journey Today" %></h2>
    <p style="color:rgba(255,255,255,.78);margin-bottom:24px;max-width:500px;margin-left:auto;margin-right:auto"><%= sw?"Jiunge na maelfu ya wanafunzi wanaobadilisha maisha yao kwa elimu ya ufundi wa VETA.":"Join thousands of students transforming their lives through VETA vocational education." %></p>
    <div style="display:flex;gap:14px;justify-content:center;flex-wrap:wrap">
      <a href="${pageContext.request.contextPath}/admissions" class="btn btn-gold btn-lg">🎓 <%= sw?"Omba Sasa":"Apply Now" %></a>
      <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-w btn-lg">📞 <%= sw?"Wasiliana Nasi":"Contact Us" %></a>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
