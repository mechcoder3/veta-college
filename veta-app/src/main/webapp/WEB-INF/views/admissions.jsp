<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="activePage" value="admissions" />
<c:set var="pageTitle" value="Admissions" />
<%
boolean sw = "sw".equals(session.getAttribute("lang"));
%>
<jsp:include page="header.jsp" />

<div class="page-hero">
	<div class="wrap">
		<div class="breadcrumb">
			<a href="${pageContext.request.contextPath}/home">
				<%
				if (sw) {
				%>Nyumbani<%
				} else {
				%>Home<%
				}
				%>
			</a> <span class="bcs">›</span> <span>
				<%
				if (sw) {
				%>Maombi<%
				} else {
				%>Admissions<%
				}
				%>
			</span>
		</div>
		<h1>
			<%
			if (sw) {
			%>Mfumo wa Maombi ya Mtandaoni<%
			} else {
			%>Online Application
			System<%
			}
			%>
		</h1>
		<p>
			<%
			if (sw) {
			%>Jaza fomu hapa chini kuomba. Utapata nambari ya kumbukumbu
			mara moja.<%
			} else {
			%>Fill the form below to apply. You will receive
			your reference number instantly.<%
			}
			%>
		</p>
	</div>
</div>

<div style="padding: 48px 0; background: var(--off)">
	<div class="wrap">

		<%-- SUCCESS: Show reference number --%>
		<c:if test="${success}">
			<div class="ref-success"
				style="max-width: 700px; margin: 0 auto 32px">
				<div style="font-size: 2.5rem">🎉</div>
				<div class="rs-title">
					<%
					if (sw) {
					%>Maombi Yamewasilishwa Kwa Mafanikio!<%
					} else {
					%>Application
					Submitted Successfully!<%
					}
					%>
				</div>
				<div class="rs-label">
					<%
					if (sw) {
					%>Nambari Yako ya Kumbukumbu:<%
					} else {
					%>Your Application
					Reference Number:<%
					}
					%>
				</div>
				<div class="rs-num">${refNumber}</div>
				<p
					style="color: rgba(255, 255, 255, .7); font-size: .85rem; margin-bottom: 16px">
					<%
					if (sw) {
					%>Hifadhi nambari hii. Itumie kulipa ada na kufuatilia
					maombi yako.<%
					} else {
					%>Save this number to pay your fee and track
					your application.<%
					}
					%>
				</p>
				<div
					style="display: flex; gap: 10px; justify-content: center; flex-wrap: wrap">
					<a
						href="${pageContext.request.contextPath}/payments?ref=${refNumber}"
						class="btn btn-gold"> 💳 <%
					if (sw) {
					%>Lipa Ada Sasa<%
					} else {
					%>Pay
						Application Fee<%
					}
					%>
					</a> <a
						href="${pageContext.request.contextPath}/download?type=admission&ref=${refNumber}"
						class="btn btn-white"> 📄 <%
 if (sw) {
 %>Pakua Barua ya Maombi<%
 } else {
 %>Download
						Admission Letter<%
 }
 %>
					</a>
				</div>
			</div>
		</c:if>

		<%-- ERROR --%>
		<c:if test="${not empty error}">
			<div class="alert-error">
				<%
				if (sw) {
				%>Hitilafu:
				<%
				} else {
				%>Error:
				<%
				}
				%><c:out value="${error}" />
			</div>
		</c:if>

		<div class="apply-layout">

			<%-- MAIN FORM --%>
			<div class="apply-card">
				<%-- Steps --%>
				<div class="steps-row">
					<div class="si active">
						<div class="sn">1</div>
						<div class="sl">
							<%
							if (sw) {
							%>Jaza Fomu<%
							} else {
							%>Fill Form<%
							}
							%>
						</div>
					</div>
					<div class="si">
						<div class="sn">2</div>
						<div class="sl">
							<%
							if (sw) {
							%>Pakia Nyaraka<%
							} else {
							%>Upload Docs<%
							}
							%>
						</div>
					</div>
					<div class="si">
						<div class="sn">3</div>
						<div class="sl">
							<%
							if (sw) {
							%>Pata Nambari<%
							} else {
							%>Get Ref No.<%
							}
							%>
						</div>
					</div>
					<div class="si">
						<div class="sn">4</div>
						<div class="sl">
							<%
							if (sw) {
							%>Lipa Ada<%
							} else {
							%>Pay Fee<%
							}
							%>
						</div>
					</div>
					<div class="si">
						<div class="sn">5</div>
						<div class="sl">
							<%
							if (sw) {
							%>Udahili<%
							} else {
							%>Admitted<%
							}
							%>
						</div>
					</div>
				</div>

				<h2
					style="font-size: 1.4rem; color: var(--navy); margin-bottom: 20px">
					<%
					if (sw) {
					%>Fomu ya Maombi<%
					} else {
					%>Application Form<%
					}
					%>
				</h2>

				<form method="post"
					action="${pageContext.request.contextPath}/admissions"
					enctype="multipart/form-data">
					<div class="form-row">
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Jina Kamili<%
								} else {
								%>Full Name<%
								}
								%> <span
								class="req">*</span>
							</label> <input class="fc" name="fullName" required
								placeholder="<%if (sw) {%>Jina lako kamili kama kwenye NIDA<%} else {%>Full name as in your NIDA<%}%>">
						</div>
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Nambari ya NIDA<%
								} else {
								%>NIDA Number<%
								}
								%> <span
								class="req">*</span>
							</label> <input class="fc" name="nidaNumber" required
								placeholder="19XXXXXXXXXXXXXXXXX" maxlength="20">
						</div>
					</div>
					<div class="form-row">
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Nambari ya Simu<%
								} else {
								%>Phone Number<%
								}
								%> <span
								class="req">*</span>
							</label> <input class="fc" name="phone" type="tel" required
								placeholder="+255 7XX XXX XXX">
						</div>
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Barua Pepe<%
								} else {
								%>Email Address<%
								}
								%>
							</label> <input class="fc" name="email" type="email"
								placeholder="your@email.com">
						</div>
					</div>
					<div class="form-row">
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Tarehe ya Kuzaliwa<%
								} else {
								%>Date of Birth<%
								}
								%>
							</label> <input class="fc" name="dateOfBirth" type="date">
						</div>
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Jinsia<%
								} else {
								%>Gender<%
								}
								%>
							</label> <select class="fc" name="gender">
								<option value="MALE">
									<%
									if (sw) {
									%>Mume<%
									} else {
									%>Male<%
									}
									%>
								</option>
								<option value="FEMALE">
									<%
									if (sw) {
									%>Mke<%
									} else {
									%>Female<%
									}
									%>
								</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Programu Unayoiomba<%
								} else {
								%>Program Applied For<%
								}
								%>
								<span class="req">*</span>
							</label> <select class="fc" name="courseId" required>
								<option value="">
									<%
									if (sw) {
									%>-- Chagua Programu --<%
									} else {
									%>-- Select Program
									--<%
									}
									%>
								</option>

								<optgroup
									label="<%if (sw) {%>Kozi Ndefu<%} else {%>Long Courses<%}%>">
									<c:forEach var="c" items="${courses}">
										<c:if test="${c.courseType == 'LONG'}">
											<option value="${c.id}"
												${param.courseId == c.id ? 'selected' : ''}>${sw ? c.nameSw : c.nameEn}
											</option>
										</c:if>
									</c:forEach>
								</optgroup>

								<optgroup
									label="<%if (sw) {%>Kozi Fupi<%} else {%>Short Courses<%}%>">
									<c:forEach var="c" items="${courses}">
										<c:if test="${c.courseType == 'SHORT'}">
											<option value="${c.id}"
												${param.courseId == c.id ? 'selected' : ''}>${sw ? c.nameSw : c.nameEn}
											</option>
										</c:if>
									</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Udahili<%
								} else {
								%>Intake Period<%
								}
								%>
							</label> <select class="fc" name="intakePeriod">
								<option>January 2026</option>
								<option>July 2026</option>
								<option>January 2027</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Kiwango cha Elimu<%
								} else {
								%>Education Level<%
								}
								%> <span
								class="req">*</span>
							</label> <select class="fc" name="educationLevel" required>
								<option value="STD7">
									<%
									if (sw) {
									%>Darasa la 7 / Msingi<%
									} else {
									%>Standard 7 / Primary<%
									}
									%>
								</option>
								<option value="FORM2">Form II (FTNA)</option>
								<option value="FORM4">Form IV (CSEE)</option>
								<option value="FORM6">Form VI (ACSEE)</option>
								<option value="DIPLOMA">
									<%
									if (sw) {
									%>Stashahada / Cheti<%
									} else {
									%>Diploma / Certificate<%
									}
									%>
								</option>
								<option value="DEGREE">
									<%
									if (sw) {
									%>Shahada na zaidi<%
									} else {
									%>Degree and above<%
									}
									%>
								</option>
							</select>
						</div>
						<div class="fg">
							<label>
								<%
								if (sw) {
								%>Mkoa wa Asili<%
								} else {
								%>Region of Origin<%
								}
								%>
							</label> <select class="fc" name="regionOfOrigin">
								<option>Dar es Salaam</option>
								<option>Mwanza</option>
								<option>Arusha</option>
								<option>Dodoma</option>
								<option>Mbeya</option>
								<option>Morogoro</option>
								<option>Tanga</option>
								<option>Kilimanjaro</option>
								<option>Geita</option>
								<option>Iringa</option>
								<option>Kagera</option>
								<option>Katavi</option>
								<option>Kigoma</option>
								<option>Lindi</option>
								<option>Manyara</option>
								<option>Mara</option>
								<option>Mjini Magharibi</option>
								<option>Mtwara</option>
								<option>Njombe</option>
								<option>Pemba Kaskazini</option>
								<option>Pemba Kusini</option>
								<option>Pwani</option>
								<option>Rukwa</option>
								<option>Ruvuma</option>
								<option>Shinyanga</option>
								<option>Simiyu</option>
								<option>Singida</option>
								<option>Songwe</option>
								<option>Tabora</option>
								<option>Unguja Kaskazini</option>
								<option>Unguja Kusini</option>
								<option>
									<%
									if (sw) {
									%>Nyingine<%
									} else {
									%>Other<%
									}
									%>
								</option>
							</select>
						</div>
					</div>
					<div class="fg">
						<label>
							<%
							if (sw) {
							%>Anwani ya Makazi<%
							} else {
							%>Residential Address<%
							}
							%>
						</label>
						<textarea class="fc" name="residentialAddress" rows="2"
							placeholder="<%if (sw) {%>Mkoa, Wilaya, Kata, Mtaa...<%} else {%>Region, District, Ward, Street...<%}%>"></textarea>
					</div>
					<div class="fg">
						<label>
							<%
							if (sw) {
							%>Pakia Vyeti (PDF/JPG/PNG)<%
							} else {
							%>Upload
							Certificates (PDF/JPG/PNG)<%
							}
							%>
						</label> <input class="fc" type="file" name="document"
							accept=".pdf,.jpg,.jpeg,.png">
						<div class="form-hint">
							<%
							if (sw) {
							%>Pakia vyeti vyako vya masomo<%
							} else {
							%>Upload your
							academic certificates<%
							}
							%>
						</div>
					</div>
					<div class="form-check">
						<input type="checkbox" id="terms" name="terms" required> <label
							for="terms"><%=sw ? "Ninathibitisha kwamba taarifa zote ni za kweli na ninakubali masharti ya Chuo cha VETA KIGOMA."
		: "I confirm all information is accurate and I accept KIGOMA RVTSC'S terms and conditions."%></label>
					</div>
					<button type="submit" class="btn btn-primary btn-lg btn-block">
						📤
						<%
					if (sw) {
					%>Wasilisha Maombi<%
					} else {
					%>Submit Application<%
					}
					%>
					</button>
				</form>
			</div>

			<%-- SIDEBAR --%>
			<div class="apply-sidebar">
				<div class="aside-card">
					<h4>
						📋
						<%
					if (sw) {
					%>Jinsi ya Kuomba<%
					} else {
					%>How to Apply<%
					}
					%>
					</h4>
					<div class="asi">
						📝 <span>
							<%
							if (sw) {
							%>Jaza fomu yote kikamilifu<%
							} else {
							%>Fill the form
							completely<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						📄 <span>
							<%
							if (sw) {
							%>Pakia vyeti vya masomo<%
							} else {
							%>Upload your
							certificates<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						🔢 <span>
							<%
							if (sw) {
							%>Pokea nambari ya kumbukumbu<%
							} else {
							%>Receive
							reference number<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						💳 <span>
							<%
							if (sw) {
							%>Tengeneza nambari ya udhibiti, lipa TZS 5,000<%
							} else {
							%>Generate
							control number, pay TZS 5,000<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						✅ <span>
							<%
							if (sw) {
							%>Subiri barua ya udahili<%
							} else {
							%>Await admission
							confirmation<%
							}
							%>
						</span>
					</div>
				</div>
				<div class="aside-card" style="border-top-color: var(--gold)">
					<h4>
						📅
						<%
					if (sw) {
					%>Tarehe za Udahili<%
					} else {
					%>Intake Dates<%
					}
					%>
					</h4>
					<div class="asi">
						🟢 <span>January 2027 — <%
					if (sw) {
					%>Mwisho: Novemba 30, 2026<%
					} else {
					%>Deadline:
							30 Nov 2026<%
					}
					%></span>
					</div>
					<div class="asi">
						🟡 <span>July 2026 — <%
					if (sw) {
					%>Mwisho: Mei 31, 2026<%
					} else {
					%>Deadline:
							31 May 2026<%
					}
					%></span>
					</div>
					<div class="asi">
						📞 <span>+255282804951</span>
					</div>
				</div>
				<div class="aside-card" style="border-top-color: var(--green)">
					<h4>
						💰
						<%
					if (sw) {
					%>Muhtasari wa Ada<%
					} else {
					%>Fee Summary<%
					}
					%>
					</h4>
					<div class="asi">
						📌 <span>
							<%
							if (sw) {
							%>Ada ya Maombi: TZS 5,000<%
							} else {
							%>Application Fee:
							TZS 5,000<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						📌 <span>
							<%
							if (sw) {
							%>Usajili: TZS 5,000 (mara moja)<%
							} else {
							%>Registration:
							TZS 5,000 (once)<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						📌 <span>
							<%
							if (sw) {
							%>Masomo: TZS 60,000 KUTWA–120,000 BWENI/mwaka<%
							} else {
							%>Tuition: TZS
							60,000 Day–120,000 Boarding/yr<%
							}
							%>
						</span>
					</div>
					<div class="asi">
						📌 <span>
							<%
							if (sw) {
							%>Mtihani: TZS 30,000/mwaka<%
							} else {
							%>Exam: TZS
							30,000/yr<%
							}
							%>
						</span>
					</div>
				</div>

				<%-- Track Application --%>
				<div class="aside-card" style="border-top-color: var(--blue)">
					<h4>
						🔍
						<%
					if (sw) {
					%>Fuatilia Maombi<%
					} else {
					%>Track Application<%
					}
					%>
					</h4>
					<form method="get"
						action="${pageContext.request.contextPath}/admissions">
						<input type="hidden" name="action" value="status">
						<div class="fg" style="margin-bottom: 10px">
							<input class="fc" name="ref" placeholder="VETA-2025-XXXXX"
								value="${param.ref}">
						</div>
						<button type="submit" class="btn btn-primary btn-block btn-sm">
							🔍
							<%
						if (sw) {
						%>Angalia Hali<%
						} else {
						%>Check Status<%
						}
						%>
						</button>
					</form>
					<c:if test="${found == false}">
						<p style="color: var(--red); font-size: .82rem; margin-top: 8px">
							<% if(sw){ %>Maombi hayakupatikana.<% } else { %>Application not
							found.<% } %>
						</p>
					</c:if>
					<c:if test="${application != null}">
						<div
							style="margin-top: 12px; padding: 12px; background: var(--off); border-radius: 8px; font-size: .83rem">
							<div>
								<strong>
									<% if(sw){ %>Jina:<% } else { %>Name:<% } %>
								</strong> ${application.fullName}
							</div>
							<div>
								<strong>
									<% if(sw){ %>Kozi:<% } else { %>Course:<% } %>
								</strong> ${application.courseName}
							</div>
							<div>
								<strong>
									<% if(sw){ %>Hali:<% } else { %>Status:<% } %>
								</strong> <span
									class="badge <c:choose>
    <c:when test="${application.status == 'APPROVED'}">b-green</c:when>
    <c:when test="${application.status == 'REJECTED'}">b-red</c:when>
    <c:otherwise>b-pending</c:otherwise>
</c:choose>">
									${application.status} </span>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />
