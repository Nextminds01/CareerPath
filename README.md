# CareerPath – Your Skills, Your Future
### Complete Full-Stack PHP & MySQL Career Guidance Platform

[![PHP Version](https://img.shields.io/badge/PHP-8.2+-087F5B.svg)](https://php.net)
[![Database](https://img.shields.io/badge/MySQL-MariaDB-142D32.svg)](https://mariadb.org)
[![Theme](https://img.shields.io/badge/Theme-Emerald%20Green%20%2B%20Midnight%20Blue-20A879.svg)]()
[![Responsive](https://img.shields.io/badge/Design-Mobile%20First%20Responsive-success.svg)]()

---

## 📌 Problem Statement & Solution

Students from diverse academic disciplines often struggle to identify suitable careers, understand specific industry skill requirements, detect their missing capabilities, and access quality free learning resources.

**CareerPath** solves this problem through an end-to-end, multi-disciplinary guidance pipeline:
$$\text{Registration} \longrightarrow \text{Profile} \longrightarrow \text{Skill Assessment} \longrightarrow \text{Career Recommendations} \longrightarrow \text{Target Selection} \longrightarrow \text{Skill Gap Analysis} \longrightarrow \text{Free Learning Resources} \longrightarrow \text{Personalized Roadmap} \longrightarrow \text{Progress Tracking} \longrightarrow \text{Readiness Dossier}$$

---

## 🚀 Application Access & URLs

- **Primary Project URL:** [http://localhost/student-career-finder/](http://localhost/student-career-finder/)
- **Workspace Alias URL:** [http://localhost/Thecodestrom/](http://localhost/Thecodestrom/)
- **Student & Admin Login:** [http://localhost/student-career-finder/auth/login.php](http://localhost/student-career-finder/auth/login.php)
- **Student Registration:** [http://localhost/student-career-finder/auth/register.php](http://localhost/student-career-finder/auth/register.php)
- **Explore Careers:** [http://localhost/student-career-finder/careers.php](http://localhost/student-career-finder/careers.php)
- **Free Learning Library:** [http://localhost/student-career-finder/learning.php](http://localhost/student-career-finder/learning.php)

---

## 🔑 System Authentication

The application features secure, role-based authentication with encrypted password hashing and session protection.

| Role | Access URL | Default Email | Password | Console / Scope |
|:---|:---|:---|:---|:---|
| **System Administrator** | `/auth/login.php` | `admin@careerfinder.local` | `Admin@12345` | Administrative Console (All Modules) |
| **Student** | `/auth/login.php` or `/auth/register.php` | Registered Email | User Password | Personalized Student Learning Dashboard |

*Note: Students can register immediately with their degree qualification (BSc CS, BCom, Nursing, Forensic Science, BTech, etc.) to start their tailored assessment and career roadmap.*

---

## 🛠️ Technology Stack (Strict Requirement Compliant)

- **Backend:** Core PHP 8.2+ with PHP Sessions and native PDO
- **Database:** MySQL 10.4 (MariaDB) with normalized 3NF relational schema
- **Frontend:** Semantic HTML5, CSS3 with Custom Emerald Green + Midnight Blue Design System, Vanilla JavaScript (ES6+), Bootstrap 5.3.3 Grid & Components, Bootstrap Icons
- **Data Visualizations:** Chart.js 4.4.2 (Radar charts, horizontal bars, and timeline curves)
- **Environment:** Apache, XAMPP, phpMyAdmin on Windows

---

## 📂 Project Directory Structure

```text
student-career-finder/
├── assets/
│   ├── css/
│   │   └── theme.css              # Emerald Green + Midnight Blue + White SaaS Theme
│   ├── js/
│   │   └── app.js                # Mobile drawer, AJAX task toggling, tooltips
│   └── images/
├── config/
│   └── database.php              # Centralized PDO connection & dynamic BASE_URL resolver
├── database/
│   ├── student_career_finder.sql # Complete MySQL database schema & clean seed dump
│   ├── setup_database.php        # Automated database schema generator
│   └── seed_data.php             # Comprehensive multi-disciplinary catalog seeder
├── includes/
│   ├── header.php                # HTML head, typography, CDNs, Chart.js
│   ├── footer.php                # Bootstrap 5 JS & core scripts
│   ├── navbar.php                # Public responsive navigation
│   ├── sidebar.php               # Desktop midnight-blue sidebar & mobile drawer (12 items)
│   ├── auth_check.php            # Guard for authenticated student sessions
│   └── functions.php             # Core calculation engine, CSRF, flash messages, readiness
├── auth/
│   ├── login.php                 # Dual authentication portal for students & admins
│   ├── register.php              # Multi-disciplinary registration with dynamic specializations
│   ├── logout.php                # Secure session termination
│   ├── forgot_password.php       # Token-based password recovery
│   └── reset_password.php        # Password reset execution
├── student/
│   ├── dashboard.php             # Central student hub with 6 KPI overview cards
│   ├── profile.php               # Editable student profile & self-reported skills
│   ├── assessment.php            # Interactive diagnostic test (MCQs + Scenario questions)
│   ├── assessment_result.php     # Tri-level competency matrix (Self vs Assessed vs Evaluated)
│   ├── careers.php               # Rule-based recommendations with match rationales
│   ├── preferred_job.php         # Career target selector & multi-discipline search
│   ├── skill_gap.php             # Deep gap breakdown, formula transparency & priorities
│   ├── resources.php             # Free learning finder with progress status tracker
│   ├── roadmap.php               # Adaptive 4/8/12/16-week custom learning roadmap
│   ├── progress.php              # Analytics dashboard with Chart.js radar & timeline
│   ├── reports.php               # 12-section official Career Readiness Dossier & PDF print
│   └── settings.php              # Account security & password update
├── admin/
│   ├── dashboard.php             # Administrative statistics & recent activity trail
│   ├── students.php              # Students directory with search, filters & status toggle
│   ├── careers.php               # Career roles CRUD & skill requirement mappings
│   ├── skills.php                # Competency repository & category management
│   ├── assessments.php           # Diagnostic question authoring (MCQs & scenarios)
│   ├── resources.php             # Verified free learning courses curator
│   └── settings.php              # System audit trail & PHP/MySQL diagnostics
├── index.php                     # Modern public homepage with Hero, How It Works, CTA
├── about.php                     # Problem statement & career guidance architecture
├── careers.php                   # Public career directory with keyword & discipline filters
├── how-it-works.php              # Interactive 10-step student journey explainer
├── learning.php                  # Public searchable free learning resources library
└── README.md                     # Comprehensive project documentation
```

---

## 🧮 Mathematical & Evaluation Logic

### 1. Calibrated Skill Rating Formula
To prevent subjective self-rating bias, the platform employs a weighted formula:
$$\text{Evaluated Rating} = \text{round}(0.30 \times \text{Self-Reported Rating} + 0.70 \times \text{Assessed Test Rating})$$

### 2. Overall Skill Match Percentage
$$\text{Skill Match \%} = \frac{\sum \min(\text{Current Evaluated Level}, \text{Required Level})}{\sum \text{Required Level}} \times 100\%$$

### 3. Gap Level & Priority Classification
- **Gap Calculation:** $\text{Gap Points} = \max(0, \text{Required Level} - \text{Current Evaluated Level})$
- **Gap Level:** $0 = \text{None}$, $1 = \text{Low}$, $2 = \text{Moderate}$, $3 = \text{High}$
- **Priority:**
  - $\text{Essential Skill} \land \text{Gap} \ge 2 \implies \mathbf{High\ Priority}$
  - $\text{Essential Skill} \land \text{Gap} = 1 \implies \mathbf{Medium\ Priority}$
  - $\text{Desirable Skill} \land \text{Gap} \ge 2 \implies \mathbf{Medium\ Priority}$
  - $\text{Desirable Skill} \land \text{Gap} = 1 \implies \mathbf{Low\ Priority}$

### 4. Career Readiness Composite Score
$$\text{Readiness Score} = (0.50 \times \text{Skill Match}) + (0.25 \times \text{Roadmap Progress}) + (0.15 \times \text{Free Courses Completed}) + (0.10 \times \text{Diagnostic Score})$$

---

## 🔒 Security & Quality Assurance

- **Password Security:** BCrypt hashing via `password_hash()` and `password_verify()`.
- **SQL Injection Prevention:** 100% prepared SQL statements via PHP PDO.
- **CSRF Defense:** Cryptographic CSRF tokens on all POST forms.
- **XSS Protection:** Context-aware output escaping via `htmlspecialchars()`.
- **Session Security:** `session_regenerate_id(true)` upon authentication with `HttpOnly` and `SameSite=Lax` cookies.
- **Role-Based Authorization:** Strict separation between `student` and `admin` routes.

---

## 🎓 Verified Free Learning Partners Included

All recommended learning links are genuine and direct:
- **freeCodeCamp:** Responsive Web Design, JavaScript, Relational Databases, Python
- **SWAYAM & NPTEL:** Accounting & GST, Engineering Drawing, Medical Care, Six Sigma
- **MIT OpenCourseWare:** Computer Science 6.0001, Electrical Circuits
- **Khan Academy:** Accounting & Financial Statements, Mathematics
- **Microsoft Learn:** Git & GitHub, Excel Data Analytics, Azure Cloud Basics
- **Cisco Networking Academy:** Networking Basics, Cybersecurity Essentials
- **World Health Organization (OpenWHO):** Infection Prevention & Control (IPC), Hand Hygiene
- **OpenLearn UK:** Basic Life Support (BLS), Fingerprint Forensic Science

---

## 📄 License
CareerPath Platform. All rights reserved.

