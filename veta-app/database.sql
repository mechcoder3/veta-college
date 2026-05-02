-- ============================================================
--  VETA COLLEGE TANZANIA — COMPLETE MySQL DATABASE SCHEMA
--  Database: veta_college
--  Version:  2.0
-- ============================================================

CREATE DATABASE IF NOT EXISTS veta_college CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE veta_college;

-- ─────────────────────────────────────────────────────────────
-- 1. USERS (Admin, Student, Staff login accounts)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role          ENUM('ADMIN','STUDENT','STAFF','REGISTRAR','FINANCE') NOT NULL DEFAULT 'STUDENT',
    full_name     VARCHAR(200) NOT NULL,
    email         VARCHAR(150) UNIQUE,
    phone         VARCHAR(20),
    is_active     TINYINT(1)  NOT NULL DEFAULT 1,
    last_login    DATETIME,
    created_at    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ─────────────────────────────────────────────────────────────
-- 2. LEADERSHIP / STAFF PROFILES
-- ─────────────────────────────────────────────────────────────
CREATE TABLE staff (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    user_id       INT,
    full_name     VARCHAR(200) NOT NULL,
    title         VARCHAR(100),          -- e.g. Dr., Mr., Mrs., Eng.
    role_title    VARCHAR(200) NOT NULL, -- e.g. Principal, Head of Academics
    department    VARCHAR(150),
    qualifications VARCHAR(500),
    welcome_message TEXT,
    photo_path    VARCHAR(300),
    display_order INT DEFAULT 0,
    is_principal  TINYINT(1) DEFAULT 0,
    is_visible    TINYINT(1) DEFAULT 1,
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 3. COURSES
-- ─────────────────────────────────────────────────────────────
CREATE TABLE courses (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    course_code       VARCHAR(20) NOT NULL UNIQUE,
    name_en           VARCHAR(300) NOT NULL,
    name_sw           VARCHAR(300),
    course_type       ENUM('SHORT','LONG') NOT NULL,
    nta_level         VARCHAR(50),         -- e.g. NTA 4-5, SUMATRA
    duration_months   INT NOT NULL,
    annual_fee        DECIMAL(12,2) NOT NULL,
    registration_fee  DECIMAL(12,2) DEFAULT 50000.00,
    exam_fee          DECIMAL(12,2) DEFAULT 80000.00,
    application_fee   DECIMAL(12,2) DEFAULT 20000.00,
    entry_requirements_en TEXT,
    entry_requirements_sw TEXT,
    description_en    TEXT,
    description_sw    TEXT,
    department        VARCHAR(150),
    max_capacity      INT DEFAULT 60,
    is_active         TINYINT(1) DEFAULT 1,
    created_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ─────────────────────────────────────────────────────────────
-- 4. APPLICATIONS
-- ─────────────────────────────────────────────────────────────
CREATE TABLE applications (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    ref_number          VARCHAR(30) NOT NULL UNIQUE, -- e.g. VETA-2025-00001
    full_name           VARCHAR(200) NOT NULL,
    nida_number         VARCHAR(30) NOT NULL,
    date_of_birth       DATE,
    gender              ENUM('MALE','FEMALE','OTHER'),
    phone               VARCHAR(20) NOT NULL,
    email               VARCHAR(150),
    region_of_origin    VARCHAR(100),
    residential_address TEXT,
    education_level     ENUM('STD7','FORM2','FORM4','FORM6','DIPLOMA','DEGREE','OTHER') NOT NULL,
    course_id           INT NOT NULL,
    intake_period       VARCHAR(50),        -- e.g. January 2026
    document_path       VARCHAR(500),       -- uploaded cert path
    status              ENUM('PENDING','PROCESSING','APPROVED','REJECTED','ENROLLED') DEFAULT 'PENDING',
    reviewed_by         INT,               -- staff user_id
    review_notes        TEXT,
    reviewed_at         DATETIME,
    submitted_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id)    REFERENCES courses(id),
    FOREIGN KEY (reviewed_by)  REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 5. STUDENTS (enrolled, linked from approved application)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE students (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    student_number      VARCHAR(30) NOT NULL UNIQUE, -- VETA/STU/2025/0001
    user_id             INT UNIQUE,
    application_id      INT UNIQUE,
    full_name           VARCHAR(200) NOT NULL,
    nida_number         VARCHAR(30) NOT NULL,
    phone               VARCHAR(20),
    email               VARCHAR(150),
    date_of_birth       DATE,
    gender              ENUM('MALE','FEMALE','OTHER'),
    course_id           INT NOT NULL,
    year_of_study       INT DEFAULT 1,
    semester            INT DEFAULT 1,
    intake_year         YEAR,
    enrollment_date     DATE NOT NULL,
    graduation_date     DATE,
    status              ENUM('ACTIVE','DEFERRED','GRADUATED','EXPELLED','WITHDRAWN') DEFAULT 'ACTIVE',
    photo_path          VARCHAR(300),
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)        REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE SET NULL,
    FOREIGN KEY (course_id)      REFERENCES courses(id)
);

-- ─────────────────────────────────────────────────────────────
-- 6. PAYMENTS & CONTROL NUMBERS
-- ─────────────────────────────────────────────────────────────
CREATE TABLE payments (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    control_number  VARCHAR(30) NOT NULL UNIQUE, -- 9900-XXXX-XXXX-XXXX
    payer_name      VARCHAR(200) NOT NULL,
    payer_phone     VARCHAR(20),
    reference_id    VARCHAR(50),        -- application ref or student number
    student_id      INT,
    application_id  INT,
    payment_type    ENUM('APPLICATION_FEE','REGISTRATION_FEE','TUITION_FEE',
                         'EXAM_FEE','HOSTEL_FEE','PRODUCTION_ORDER',
                         'SHORT_COURSE_FEE','OTHER') NOT NULL,
    amount          DECIMAL(12,2) NOT NULL,
    academic_year   VARCHAR(20),        -- e.g. 2025/2026
    description     VARCHAR(500),
    bank_name       VARCHAR(100),       -- where paid
    bank_ref        VARCHAR(100),       -- bank transaction reference
    status          ENUM('PENDING','PAID','CANCELLED','EXPIRED') DEFAULT 'PENDING',
    expires_at      DATETIME NOT NULL,
    paid_at         DATETIME,
    verified_by     INT,
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id)     REFERENCES students(id) ON DELETE SET NULL,
    FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE SET NULL,
    FOREIGN KEY (verified_by)    REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 7. PRODUCTION SERVICES & ORDERS
-- ─────────────────────────────────────────────────────────────
CREATE TABLE production_products (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name_en      VARCHAR(200) NOT NULL,
    name_sw      VARCHAR(200),
    description_en TEXT,
    description_sw TEXT,
    category     ENUM('METALWORK','FURNITURE','TAILORING','ELECTRICAL','AUTOMOTIVE','FABRICATION','OTHER'),
    price_from   DECIMAL(12,2),
    price_to     DECIMAL(12,2),
    price_label  VARCHAR(100) DEFAULT 'By Quotation',
    icon         VARCHAR(10)  DEFAULT '🔧',
    department   VARCHAR(100),
    is_active    TINYINT(1) DEFAULT 1,
    display_order INT DEFAULT 0,
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE production_orders (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    order_number    VARCHAR(30) NOT NULL UNIQUE, -- ORD-2025-00001
    client_name     VARCHAR(200) NOT NULL,
    client_phone    VARCHAR(20) NOT NULL,
    client_email    VARCHAR(150),
    product_id      INT,
    custom_product  VARCHAR(300),       -- if not in products table
    specifications  TEXT,
    quantity        INT DEFAULT 1,
    estimated_budget DECIMAL(12,2),
    quoted_amount   DECIMAL(12,2),
    department      VARCHAR(100),
    status          ENUM('PENDING','QUOTED','ACCEPTED','IN_PROGRESS','COMPLETED','CANCELLED') DEFAULT 'PENDING',
    payment_id      INT,
    assigned_to     INT,               -- staff user_id
    notes           TEXT,
    order_date      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expected_date   DATE,
    completed_date  DATE,
    updated_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id)   REFERENCES production_products(id) ON DELETE SET NULL,
    FOREIGN KEY (payment_id)   REFERENCES payments(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to)  REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 8. NEWS & EVENTS
-- ─────────────────────────────────────────────────────────────
CREATE TABLE news_events (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    title_en     VARCHAR(400) NOT NULL,
    title_sw     VARCHAR(400),
    excerpt_en   TEXT,
    excerpt_sw   TEXT,
    content_en   LONGTEXT,
    content_sw   LONGTEXT,
    category     ENUM('GRADUATION','INTAKE','ACHIEVEMENT','COMMUNITY',
                      'PARTNERSHIP','SPORTS','ANNOUNCEMENT','GENERAL') DEFAULT 'GENERAL',
    icon         VARCHAR(10) DEFAULT '📰',
    bg_gradient  VARCHAR(200) DEFAULT 'linear-gradient(135deg,#0A2463,#1565C0)',
    image_path   VARCHAR(300),
    event_date   DATE,
    published    TINYINT(1) DEFAULT 0,
    created_by   INT,
    published_at DATETIME,
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 9. ACADEMIC RESULTS
-- ─────────────────────────────────────────────────────────────
CREATE TABLE subjects (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    course_id    INT NOT NULL,
    code         VARCHAR(20) NOT NULL,
    name_en      VARCHAR(200) NOT NULL,
    name_sw      VARCHAR(200),
    year         INT NOT NULL,
    semester     INT NOT NULL,
    credits      INT DEFAULT 3,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE results (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    student_id   INT NOT NULL,
    subject_id   INT NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    cat_score    DECIMAL(5,2),    -- Continuous Assessment
    exam_score   DECIMAL(5,2),
    total_score  DECIMAL(5,2),
    grade        VARCHAR(5),      -- A, B+, B, C, D, F
    attendance   DECIMAL(5,2),    -- percentage
    remarks      VARCHAR(200),
    recorded_by  INT,
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_result (student_id, subject_id, academic_year),
    FOREIGN KEY (student_id)  REFERENCES students(id),
    FOREIGN KEY (subject_id)  REFERENCES subjects(id),
    FOREIGN KEY (recorded_by) REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- 10. AUDIT LOG
-- ─────────────────────────────────────────────────────────────
CREATE TABLE audit_log (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    action      VARCHAR(100) NOT NULL,  -- e.g. APPROVE_APPLICATION
    table_name  VARCHAR(100),
    record_id   INT,
    old_value   TEXT,
    new_value   TEXT,
    ip_address  VARCHAR(45),
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- ─────────────────────────────────────────────────────────────
-- SEED DATA
-- ─────────────────────────────────────────────────────────────

-- Admin user (password: Admin@Veta2025 → BCrypt hash)
INSERT INTO users (username, password_hash, role, full_name, email, phone) VALUES
('admin', 'Ziguye@4503', 'ADMIN', 'System Administrator', 'admin@vetacollege.ac.tz', '+255220000000'),
('registrar', 'Ziguye@4503', 'REGISTRAR', 'Mrs. Salome Waweru', 'registrar@vetacollege.ac.tz', '+255754000111'),
('finance', 'Ziguye@4503', 'FINANCE', 'Ms. Amina Hassan', 'finance@vetacollege.ac.tz', '+255754000222');

-- Staff / Leadership
INSERT INTO staff (full_name, title, role_title, department, qualifications, welcome_message, display_order, is_principal, is_visible) VALUES
('John Mwangi Kamau', 'Dr.', 'College Principal', 'Management',
 'Ph.D. Vocational Education (UDSM), M.Sc. Mechanical Engineering, B.Ed. Technical (TIE)',
 'Welcome to VETA College Tanzania — a government-accredited institution transforming Tanzania''s youth into skilled, self-reliant professionals. For over 25 years we have delivered quality vocational training that powers our nation''s economy. Your journey to a successful career begins here.',
 1, 1, 1),
('Grace Nyambura', 'Mrs.', 'Head of Academic Affairs', 'Academics', 'M.Ed. Curriculum Development (UDSM)', 'Overseeing quality academic programs for student excellence.', 2, 0, 1),
('Emmanuel Osei Adusei', 'Mr.', 'Head of Administration', 'Administration', 'MBA Public Administration (Mzumbe)', 'Efficient administration for smooth college operations.', 3, 0, 1),
('Peter Kariuki Mwangi', 'Eng.', 'Head of Workshops & Training', 'Workshops', 'B.Sc. Mechanical Engineering (UDSM)', 'Hands-on practical training for industry-ready graduates.', 4, 0, 1),
('Amina Hassan Suleiman', 'Ms.', 'Chief Finance Officer', 'Finance', 'CPA (T), B.Com Accounting (UDSM)', 'Transparent and accountable financial management.', 5, 0, 1),
('David Mwamba Kasaura', 'Mr.', 'Head of ICT Department', 'ICT', 'B.Sc. Computer Science (SUA)', 'Leading digital skills for the modern economy.', 6, 0, 1),
('Salome Waweru Kibe', 'Mrs.', 'Registrar & Student Affairs', 'Registrar', 'PGD Education Management (Open University)', 'Committed to student welfare and smooth admissions.', 7, 0, 1),
('Moses Chama Phiri', 'Eng.', 'Head of Electrical Department', 'Electrical', 'B.Eng. Electrical (UDSM)', 'Empowering students with modern electrical skills.', 8, 0, 1),
('Ali Juma Abdallah', 'Mr.', 'Head of Welding & Fabrication', 'Welding', 'Dip. Welding Technology, 18 years industry experience', 'Building Tanzania''s fabrication industry one welder at a time.', 9, 0, 1);

-- Courses
INSERT INTO courses (course_code, name_en, name_sw, course_type, nta_level, duration_months, annual_fee, registration_fee, exam_fee, application_fee, entry_requirements_en, entry_requirements_sw, department) VALUES
('EIT-NTA4', 'Electrical Installation Technology', 'Teknolojia ya Usakinishaji wa Umeme', 'LONG', 'NTA Level 4-5', 24, 850000.00, 50000.00, 80000.00, 20000.00,
 'CSEE (Form IV) with 4 passes including Mathematics, Physics or Science. FTNA acceptable. Medical fitness certificate. No pacemaker/implants. Valid National ID.',
 'CSEE (Fomu IV) na ufaulu 4 ikiwa ni pamoja na Hesabu, Fizikia au Sayansi. FTNA inakubaliwa. Cheti cha afya. Bila pacemaker/vipandikizi. Kitambulisho halali.',
 'Electrical'),
('WFT-NTA4', 'Welding and Fabrication Technology', 'Teknolojia ya Uchemshaji na Uundaji', 'LONG', 'NTA Level 4-5', 24, 780000.00, 50000.00, 80000.00, 20000.00,
 'CSEE (Form IV) with 4 passes including Mathematics or Science. FTNA acceptable. Medical fitness. Good eyesight. Physical fitness. Valid National ID.',
 'CSEE (Fomu IV) na ufaulu 4 ikiwa ni pamoja na Hesabu au Sayansi. FTNA inakubaliwa. Afya njema. Maono mazuri. Ustawi wa kimwili. Kitambulisho halali.',
 'Welding'),
('AET-NTA4', 'Automotive Engineering Technology', 'Teknolojia ya Uhandisi wa Magari', 'LONG', 'NTA Level 4-5', 24, 920000.00, 50000.00, 80000.00, 20000.00,
 'CSEE (Form IV) with 4 passes including Mathematics. Physical fitness. Medical certificate. Colour vision required. Valid National ID.',
 'CSEE (Fomu IV) na ufaulu 4 ikiwa ni pamoja na Hesabu. Ustawi wa kimwili. Cheti cha kimatibabu. Uwezo wa kuona rangi unahitajika. Kitambulisho halali.',
 'Automotive'),
('ICT-NTA4', 'Information and Communication Technology', 'Teknolojia ya Habari na Mawasiliano', 'LONG', 'NTA Level 4-6', 24, 900000.00, 50000.00, 80000.00, 20000.00,
 'CSEE (Form IV) with passes in Mathematics and English. Computer literacy preferred. Medical certificate. Valid National ID.',
 'CSEE (Fomu IV) na ufaulu wa Hesabu na Kiingereza. Ufahamu wa kompyuta unapendekezwa. Cheti cha kimatibabu. Kitambulisho halali.',
 'ICT'),
('TGT-NTA4', 'Tailoring and Garment Technology', 'Teknolojia ya Ushonaji na Mavazi', 'LONG', 'NTA Level 4-5', 24, 700000.00, 50000.00, 80000.00, 20000.00,
 'CSEE (Form IV) or FTNA. Creative aptitude. Medical certificate. Open to all genders. Valid National ID.',
 'CSEE (Fomu IV) au FTNA. Ubunifu. Cheti cha kimatibabu. Wazi kwa jinsia zote. Kitambulisho halali.',
 'Tailoring'),
('DRV-PSV', 'Driving Course - PSV and Light Vehicles', 'Kozi ya Udereva - PSV na Magari Madogo', 'SHORT', 'SUMATRA', 3, 180000.00, 0.00, 0.00, 10000.00,
 'Standard 7 pass. Valid National ID. Medical fitness certificate. Age 18 or above.',
 'Ufaulu wa Darasa la 7. Kitambulisho cha Taifa halali. Cheti cha afya. Umri wa miaka 18 au zaidi.',
 'Driving'),
('DRV-MOTO', 'Motorcycle Riding Course', 'Kozi ya Kuendesha Pikipiki', 'SHORT', 'SUMATRA', 1, 80000.00, 0.00, 0.00, 10000.00,
 'Standard 7 pass. Valid National ID. Age 16 or above.',
 'Ufaulu wa Darasa la 7. Kitambulisho cha Taifa halali. Umri wa miaka 16 au zaidi.',
 'Driving'),
('COMP-APP', 'Computer Applications', 'Matumizi ya Kompyuta', 'SHORT', 'NTA Level 2', 3, 150000.00, 0.00, 0.00, 10000.00,
 'Standard 7 pass. Basic literacy required.',
 'Ufaulu wa Darasa la 7. Ujuzi wa msingi wa kusoma na kuandika unahitajika.',
 'ICT'),
('WLD-SHORT', 'Welding Short Program', 'Programu Fupi ya Uchemshaji', 'SHORT', 'NTA Level 2-3', 6, 200000.00, 0.00, 0.00, 10000.00,
 'Standard 7 pass. Good eyesight. Medical fitness certificate.',
 'Ufaulu wa Darasa la 7. Maono mazuri. Cheti cha afya.',
 'Welding'),
('ELT-SHORT', 'Electrical Short Course', 'Kozi Fupi ya Umeme', 'SHORT', 'NTA Level 2-3', 4, 175000.00, 0.00, 0.00, 10000.00,
 'Form II minimum. Basic mathematics. Medical fitness certificate.',
 'Fomu II kiwango cha chini. Hesabu za msingi. Cheti cha afya.',
 'Electrical'),
('TLR-SHORT', 'Tailoring Short Course', 'Kozi Fupi ya Ushonaji', 'SHORT', 'NTA Level 2-3', 6, 160000.00, 0.00, 0.00, 10000.00,
 'Standard 7 pass. Basic reading skills. Open to all genders.',
 'Ufaulu wa Darasa la 7. Ujuzi wa msingi wa kusoma. Wazi kwa jinsia zote.',
 'Tailoring');

-- Production Products
INSERT INTO production_products (name_en, name_sw, category, price_from, price_to, price_label, icon, department, display_order) VALUES
('Metal Security Doors', 'Milango ya Chuma ya Usalama', 'METALWORK', 350000, 600000, 'TZS 350,000–600,000', '🚪', 'Welding', 1),
('Metal Window Frames and Grills', 'Fremu za Madirisha ya Chuma na Grills', 'METALWORK', 80000, 200000, 'TZS 80,000–200,000', '🪟', 'Welding', 2),
('Office and School Furniture', 'Samani za Ofisi na Shule', 'FURNITURE', 120000, 450000, 'TZS 120,000–450,000', '🪑', 'Welding', 3),
('School Uniforms and Tailored Garments', 'Sare za Shule na Nguo Zilizoshonwa', 'TAILORING', 25000, 80000, 'TZS 25,000–80,000', '🧵', 'Tailoring', 4),
('Custom Metal Fabrication', 'Uundaji Maalum wa Chuma', 'FABRICATION', NULL, NULL, 'By Quotation', '🏗️', 'Welding', 5),
('Solar Panel Systems', 'Mifumo ya Paneli za Jua', 'ELECTRICAL', NULL, NULL, 'By Quotation', '☀️', 'Electrical', 6),
('Vehicle Repair and Service', 'Ukarabati na Huduma za Magari', 'AUTOMOTIVE', NULL, NULL, 'By Quotation', '🔧', 'Automotive', 7),
('Electrical Installation Services', 'Huduma za Usakinishaji wa Umeme', 'ELECTRICAL', NULL, NULL, 'By Quotation', '⚡', 'Electrical', 8);

-- News & Events (seed)
INSERT INTO news_events (title_en, title_sw, excerpt_en, excerpt_sw, category, icon, event_date, published, published_at) VALUES
('2025 Annual Graduation Ceremony — 340 Graduates Celebrated',
 'Sherehe ya Uhitimu ya Mwaka 2025 — Wahitimu 340 Walisherehekewa',
 'VETA College celebrated another milestone as 340 students graduated across all NTA-certified programs. Guest of Honour: PS Ministry of Education.',
 'Chuo cha VETA kilisherehekea hatua nyingine huku wanafunzi 340 wakihitimu katika programu zote zilizoidhinishwa na NTA.',
 'GRADUATION', '🎓', '2025-06-28', 1, NOW()),
('January 2026 Intake — Applications Now Open',
 'Udahili wa Januari 2026 — Maombi Yamefunguliwa Sasa',
 'Applications are now open for all long and short courses for the January 2026 intake. Deadline: November 30, 2025.',
 'Maombi yamefunguliwa sasa kwa kozi zote ndefu na fupi za udahili wa Januari 2026. Tarehe ya mwisho: Novemba 30, 2025.',
 'INTAKE', '📢', '2025-10-01', 1, NOW()),
('VETA College Wins Gold Medal at Nane Nane Exhibition 2025',
 'Chuo cha VETA Kinashinda Medali ya Dhahabu katika Maonesho ya Nane Nane 2025',
 'Our Welding and ICT departments won gold medals at the National Nane Nane Farmers Exhibition held in Dar es Salaam.',
 'Idara zetu za Uchemshaji na TEHAMA zilishinda medali za dhahabu katika Maonesho ya Wakulima ya Nane Nane ya Kitaifa.',
 'ACHIEVEMENT', '🏆', '2025-08-15', 1, NOW()),
('Community Outreach: Free Electrical Safety Check in Kinondoni',
 'Huduma ya Jamii: Ukaguzi Bure wa Usalama wa Umeme Kinondoni',
 'VETA electrical students conducted free home wiring safety checks for 500 households in Kinondoni.',
 'Wanafunzi wa umeme wa VETA walifanya ukaguzi wa usalama wa wiring ya nyumba bure kwa kaya 500 Kinondoni.',
 'COMMUNITY', '🤝', '2025-09-05', 1, NOW()),
('New MOU Signed with TBL Group for Graduate Employment',
 'Makubaliano Mapya Yaliyosainiwa na Kundi la TBL kwa Ajira ya Wahitimu',
 'VETA College signed an MOU with TBL Group to provide employment placement for qualified ICT and Electrical graduates.',
 'Chuo cha VETA kilisaini makubaliano na Kundi la TBL kutoa uwekaji wa ajira kwa wahitimu waliohitimu wa TEHAMA na Umeme.',
 'PARTNERSHIP', '💼', '2025-07-20', 1, NOW());

-- Sample applications
INSERT INTO applications (ref_number, full_name, nida_number, gender, phone, email, region_of_origin, education_level, course_id, intake_period, status, submitted_at) VALUES
('VETA-2025-00391', 'Hamisi Juma Bakari', '19881234000111', 'MALE', '0754123456', 'hamisi@mail.com', 'Dar es Salaam', 'FORM4', 1, 'January 2026', 'APPROVED', '2025-09-15 10:30:00'),
('VETA-2025-00392', 'Fatuma Ali Mzee', '19901234000222', 'FEMALE', '0712345678', 'fatuma@mail.com', 'Mwanza', 'FORM4', 4, 'January 2026', 'PENDING', '2025-09-18 14:20:00'),
('VETA-2025-00393', 'John Peter Msigwa', '20001234000333', 'MALE', '0766345678', 'john@mail.com', 'Dodoma', 'STD7', 6, 'October 2025', 'PROCESSING', '2025-10-02 09:15:00'),
('VETA-2025-00394', 'Neema Grace Kileo', '19951234000444', 'FEMALE', '0789234567', 'neema@mail.com', 'Arusha', 'FORM4', 2, 'January 2026', 'APPROVED', '2025-10-05 11:45:00'),
('VETA-2025-00395', 'David Mwamba', '19981234000555', 'MALE', '0721456789', 'david@mail.com', 'Tanga', 'FORM4', 5, 'January 2026', 'REJECTED', '2025-10-08 16:00:00');

-- Sample students
INSERT INTO students (student_number, full_name, nida_number, phone, email, course_id, year_of_study, semester, intake_year, enrollment_date, status) VALUES
('VETA/STU/2025/0042', 'John Mwangi Kamau', '20001234000042', '0754111222', 'john.kamau@student.vetacollege.ac.tz', 4, 1, 1, 2025, '2025-01-13', 'ACTIVE'),
('VETA/STU/2025/0043', 'Amina Hassan Suleiman', '20001234000043', '0712222333', 'amina.hassan@student.vetacollege.ac.tz', 1, 1, 1, 2025, '2025-01-13', 'ACTIVE'),
('VETA/STU/2024/0088', 'Peter Makame Seif', '19991234000088', '0766333444', 'peter.makame@student.vetacollege.ac.tz', 2, 2, 1, 2024, '2024-01-15', 'ACTIVE');

-- Sample payments
INSERT INTO payments (control_number, payer_name, payer_phone, reference_id, student_id, application_id, payment_type, amount, academic_year, status, expires_at, paid_at) VALUES
('9900-1234-5678-9012', 'John Mwangi Kamau', '0754111222', 'VETA/STU/2025/0042', 1, NULL, 'TUITION_FEE', 900000.00, '2025/2026', 'PAID', '2025-01-12 23:59:59', '2025-01-05 10:22:00'),
('9900-9876-5432-1098', 'Fatuma Ali Mzee', '0712345678', 'VETA-2025-00392', NULL, 2, 'APPLICATION_FEE', 20000.00, '2025/2026', 'PENDING', DATE_ADD(NOW(), INTERVAL 7 DAY), NULL),
('9900-1111-2222-3333', 'John Peter Msigwa', '0766345678', 'VETA-2025-00393', NULL, 3, 'APPLICATION_FEE', 20000.00, '2025/2026', 'PAID', '2025-10-16 23:59:59', '2025-10-10 09:00:00'),
('9900-4444-5555-6666', 'Neema Grace Kileo', '0789234567', 'VETA-2025-00394', NULL, 4, 'REGISTRATION_FEE', 50000.00, '2025/2026', 'PAID', '2025-01-14 23:59:59', '2026-01-08 14:30:00');

-- Indexes for performance
CREATE INDEX idx_applications_status    ON applications(status);
CREATE INDEX idx_applications_course    ON applications(course_id);
CREATE INDEX idx_payments_status        ON payments(status);
CREATE INDEX idx_payments_ctrl          ON payments(control_number);
CREATE INDEX idx_students_number        ON students(student_number);
CREATE INDEX idx_students_course        ON students(course_id);
CREATE INDEX idx_news_published         ON news_events(published, event_date);
CREATE INDEX idx_orders_status          ON production_orders(status);
CREATE INDEX idx_audit_user             ON audit_log(user_id, created_at);
