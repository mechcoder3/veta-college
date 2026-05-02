# VETA College Tanzania — Java Web Application
## Complete Setup & Deployment Guide

---

## 📁 PROJECT STRUCTURE

```
veta-app/
├── pom.xml                          ← Maven build file
├── database.sql                     ← MySQL schema + seed data
└── src/main/
    ├── java/com/veta/
    │   ├── models/                  ← Data models (POJOs)
    │   │   ├── User.java
    │   │   ├── Application.java
    │   │   ├── Student.java
    │   │   ├── Payment.java
    │   │   ├── Course.java
    │   │   ├── Staff.java
    │   │   ├── ProductionOrder.java
    │   │   └── NewsEvent.java
    │   ├── dao/                     ← Database Access Objects
    │   │   ├── UserDAO.java
    │   │   ├── ApplicationDAO.java
    │   │   └── AllDAOs.java         ← PaymentDAO, CourseDAO, StudentDAO, StaffDAO, NewsDAO, ProductionDAO
    │   ├── servlets/                ← HTTP Servlets
    │   │   ├── HomeServlet.java
    │   │   ├── ApplicationServlet.java
    │   │   ├── PaymentServlet.java
    │   │   ├── PortalServlet.java
    │   │   ├── AdminServlet.java
    │   │   ├── AuthServlet.java
    │   │   ├── PdfServlet.java
    │   │   └── OtherServlets.java   ← CourseServlet, NewsServlet, ContactServlet, ProductionServlet
    │   ├── filters/
    │   │   ├── AuthFilter.java
    │   │   └── EncodingFilter.java
    │   └── utils/
    │       ├── DBConnection.java
    │       └── RefGenerator.java
    └── webapp/
        ├── index.jsp                ← Root redirect
        ├── css/style.css
        ├── js/app.js
        └── WEB-INF/
            ├── web.xml
            └── views/
                ├── header.jsp       ← Shared header/navbar
                ├── footer.jsp       ← Shared footer
                ├── index.jsp        ← Homepage (Leadership+Hero+News)
                ├── admissions.jsp   ← Online application form
                ├── payments.jsp     ← Control number payment system
                ├── portal_login.jsp ← Student portal login
                ├── portal_dashboard.jsp ← Student dashboard
                ├── admin.jsp        ← Admin panel (8 tabs)
                ├── login.jsp        ← Shared login page
                └── error404.jsp
```

---

## ⚙️ REQUIREMENTS

| Tool | Version |
|------|---------|
| Java JDK | 11 or 17 |
| Apache Tomcat | 10.x (Jakarta EE 5) |
| MySQL | 8.0+ |
| Maven | 3.8+ |
| IntelliJ IDEA / Eclipse | Any recent |

---

## 🚀 SETUP STEPS

### Step 1 — Create MySQL Database

```sql
-- Open MySQL Workbench or terminal
mysql -u root -p
source /path/to/database.sql
```

This creates the `veta_college` database with all tables and sample data.

### Step 2 — Configure Database Connection

Edit `src/main/java/com/veta/utils/DBConnection.java`:

```java
private static final String DB_URL  = "jdbc:mysql://localhost:3306/veta_college?useSSL=false&serverTimezone=Africa/Dar_es_Salaam";
private static final String DB_USER = "root";       // your MySQL username
private static final String DB_PASS = "your_password"; // your MySQL password
```

### Step 3 — Build with Maven

```bash
cd veta-app
mvn clean package
```

This creates `target/veta-college.war`

### Step 4 — Deploy to Tomcat

**Option A — Tomcat Manager:**
1. Open `http://localhost:8080/manager/html`
2. Deploy the WAR file: `target/veta-college.war`
3. Access the app at `http://localhost:8080/veta`

**Option B — Copy WAR file:**
```bash
cp target/veta-college.war /path/to/tomcat/webapps/
```

**Option C — Maven Tomcat Plugin (development):**
```bash
mvn tomcat7:run
# Access at http://localhost:8080/veta
```

**Option D — IntelliJ IDEA:**
1. Open project as Maven project
2. Add Tomcat 10 configuration
3. Set deployment artifact to `veta-college:war`
4. Run

---

## 🔐 DEFAULT LOGIN CREDENTIALS

| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| Registrar | registrar | admin123 |
| Finance | finance | admin123 |

**Student Portal Demo:** Any student number + any password (demo mode)

---

## 🌐 URL ROUTES

| URL | Description |
|-----|-------------|
| `/veta/home` | Homepage |
| `/veta/courses?type=long` | Long courses |
| `/veta/courses?type=short` | Short courses |
| `/veta/admissions` | Application form |
| `/veta/payments` | Payment control numbers |
| `/veta/portal` | Student portal |
| `/veta/admin` | Admin panel |
| `/veta/login?type=admin` | Admin login |
| `/veta/news` | News & events |
| `/veta/production` | Production services |
| `/veta/contact` | Contact page |
| `/veta/download?type=receipt&ref=CTRL_NO` | Download PDF receipt |
| `/veta/download?type=admission&ref=REF_NO` | Download admission letter |

---

## 📊 DATABASE TABLES

| Table | Description |
|-------|-------------|
| `users` | Login accounts (admin, staff, students) |
| `staff` | Leadership profiles with photos |
| `courses` | All 11 courses (short + long) |
| `applications` | Student applications with status |
| `students` | Enrolled students |
| `payments` | Control numbers and payment records |
| `production_products` | Products for sale |
| `production_orders` | Customer orders |
| `news_events` | News and events |
| `subjects` | Course subjects |
| `results` | Student academic results |
| `audit_log` | All admin actions logged |

---

## 🔧 ADDING MORE JSP PAGES

To add `about.jsp`, `short_courses.jsp`, `long_courses.jsp`, `news.jsp`, `production.jsp`, `contact.jsp`:

Each JSP follows this pattern:
```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="about"/>
<c:set var="pageTitle" value="About Us"/>
<jsp:include page="header.jsp"/>

<!-- YOUR PAGE CONTENT HERE -->
<!-- Use ${courses}, ${newsList}, etc. set by the servlet -->

<jsp:include page="footer.jsp"/>
```

---

## 🛠️ CUSTOMIZATION

**Change College Name:** Edit `header.jsp` and `footer.jsp`

**Change Colors:** Edit `css/style.css` CSS variables:
```css
:root {
  --navy: #0A2463;  /* main dark blue */
  --blue: #1565C0;  /* medium blue */
  --gold: #F9A825;  /* gold accent */
}
```

**Add New Course:** Insert into `courses` table in MySQL

**Add Staff Photo:** 
1. Upload photo to `webapp/images/staff/`
2. Update `staff.photo_path` in database

**Change Database:** Update `DBConnection.java` URL

---

## 📧 CONTACT / SUPPORT

- **College:** VETA College Tanzania
- **Location:** Kinondoni, Dar es Salaam
- **Phone:** +255 22 123 4567
- **Email:** info@vetacollege.ac.tz
