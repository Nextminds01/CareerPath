-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2026 at 10:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_career_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_logs`
--

CREATE TABLE `admin_activity_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_user_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(150) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_activity_logs`
--

INSERT INTO `admin_activity_logs` (`id`, `admin_user_id`, `action`, `details`, `ip_address`, `created_at`) VALUES
(1, 1, 'Administrator logged out', NULL, '::1', '2026-11-06 12:00:10'),
(2, 1, 'Administrator logged in', NULL, '::1', '2026-11-06 12:32:20'),
(3, 1, 'Administrator logged in', NULL, '::1', '2026-11-06 13:44:15'),
(4, 1, 'Administrator logged in', NULL, '::1', '2026-11-06 14:47:00'),
(5, 1, 'Administrator logged in', NULL, '::1', '2026-11-06 14:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_answers`
--

CREATE TABLE `assessment_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `attempt_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `selected_option_id` int(10) UNSIGNED DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_attempts`
--

CREATE TABLE `assessment_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `education_category_id` int(10) UNSIGNED NOT NULL,
  `attempt_number` int(10) UNSIGNED DEFAULT 1,
  `total_questions` int(10) UNSIGNED NOT NULL,
  `correct_answers` int(10) UNSIGNED NOT NULL,
  `percentage_score` decimal(5,2) NOT NULL,
  `time_taken_seconds` int(10) UNSIGNED DEFAULT 0,
  `completed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_options`
--

CREATE TABLE `assessment_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `score_weight` tinyint(3) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_options`
--

INSERT INTO `assessment_options` (`id`, `question_id`, `option_text`, `is_correct`, `score_weight`) VALUES
(1, 1, '<div class=\"navigation\">', 0, 1),
(2, 1, '<nav>', 1, 4),
(3, 1, '<header>', 0, 1),
(4, 1, '<section role=\"links\">', 0, 2),
(5, 2, 'display: flex; flex-direction: row; flex-wrap: nowrap;', 0, 1),
(6, 2, 'grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));', 1, 4),
(7, 2, 'width: 33.33%; float: left;', 0, 1),
(8, 2, 'display: inline-block; width: calc(100% / 3);', 0, 1),
(9, 3, '\"undefined\"', 0, 1),
(10, 3, '\"nan\"', 0, 1),
(11, 3, '\"number\"', 1, 4),
(12, 3, '\"object\"', 0, 1),
(13, 4, 'Run an infinite while loop until the response arrives.', 0, 1),
(14, 4, 'Disable the submit button and show a loading spinner immediately upon form submission.', 1, 4),
(15, 4, 'Clear the form fields before sending the network request.', 0, 1),
(16, 4, 'Rely solely on setTimeout to wait 5 seconds before allowing another click.', 0, 2),
(17, 5, 'PDO::ATTR_ERRMODE => PDO::ERRMODE_SILENT', 0, 1),
(18, 5, 'PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION', 1, 4),
(19, 5, 'PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC', 0, 1),
(20, 5, 'PDO::ATTR_AUTOCOMMIT => true', 0, 1),
(21, 6, 'It automatically converts user input into Base64 format before executing.', 0, 1),
(22, 6, 'The database compiles the SQL statement structure first, treating bound parameters strictly as literal values rather than executable code.', 1, 4),
(23, 6, 'It replaces all single quotes with double quotes automatically.', 0, 2),
(24, 6, 'It encrypts the entire database table using AES-256 before querying.', 0, 1),
(25, 7, 'CHECK constraint', 0, 1),
(26, 7, 'FOREIGN KEY constraint with ON DELETE RESTRICT', 1, 4),
(27, 7, 'UNIQUE INDEX constraint', 0, 1),
(28, 7, 'DEFAULT value constraint', 0, 1),
(29, 8, 'Paying employee salaries in cash', 0, 1),
(30, 8, 'Purchasing machinery on 60-day credit from a vendor', 1, 4),
(31, 8, 'Collecting cash from an outstanding accounts receivable debtor', 0, 2),
(32, 8, 'Paying annual insurance in advance', 0, 1),
(33, 9, 'Record as direct Consulting Revenue in the current Income Statement immediately.', 0, 1),
(34, 9, 'Debit Cash and credit Unearned Revenue (Current Liability) on the Balance Sheet.', 1, 4),
(35, 9, 'Ignore the transaction until the services are performed next year.', 0, 1),
(36, 9, 'Debit Retained Earnings and credit Accrued Income.', 0, 1),
(37, 10, 'Only when paying tax on output sales at zero percent', 0, 1),
(38, 10, 'When in possession of a valid tax invoice, goods/services have been received, and the supplier has remitted tax to the government', 1, 4),
(39, 10, 'Immediately upon issuing a quotation to prospective clients', 0, 1),
(40, 10, 'Only at the end of a 5-year commercial lease period', 0, 1),
(41, 11, 'VLOOKUP', 0, 1),
(42, 11, 'HLOOKUP', 0, 1),
(43, 11, 'XLOOKUP', 1, 4),
(44, 11, 'CONCATENATE', 0, 1),
(45, 12, '30 - 50 bpm', 0, 1),
(46, 12, '60 - 100 bpm', 1, 4),
(47, 12, '110 - 140 bpm', 0, 1),
(48, 12, '150 - 180 bpm', 0, 1),
(49, 13, 'Administer another dose of pain medication to comfort the patient.', 0, 1),
(50, 13, 'Maintain airway, administer high-flow oxygen, alert medical officer immediately, and prepare Naloxone as ordered.', 1, 4),
(51, 13, 'Leave the room to check the patient pharmacy billing records.', 0, 1),
(52, 13, 'Place the patient in a prone position and observe for 2 hours.', 0, 1),
(53, 14, 'Routine broad-spectrum antibiotic prophylaxis for all inpatients', 0, 1),
(54, 14, 'Strict compliance with hand hygiene protocols at the 5 Moments of Hand Hygiene', 1, 4),
(55, 14, 'Fumigating hospital wards once every calendar year', 0, 1),
(56, 14, 'Wearing two pairs of sterile gloves throughout an entire 8-hour shift', 0, 1),
(57, 15, 'Upper gastrointestinal endoscopy', 0, 1),
(58, 15, '12-lead Electrocardiogram (ECG)', 1, 4),
(59, 15, 'Serum lipid profile panel', 0, 1),
(60, 15, 'Barium swallow fluoroscopy', 0, 1),
(61, 16, 'Prescribe oral amoxicillin-clavulanate for 14 days to prevent future secondary bacterial infection.', 0, 1),
(62, 16, 'Reassure parents, provide symptom relief guidance (hydration, paracetamol for fever), and explain why antibiotics are ineffective against viral infections.', 1, 4),
(63, 16, 'Administer immediate intramuscular ceftriaxone injection.', 0, 1),
(64, 16, 'Admit the child immediately to the pediatric intensive care unit.', 0, 1),
(65, 17, 'Plastic makes the package too heavy for courtroom transport.', 0, 1),
(66, 17, 'Trapped moisture promotes mold and bacterial growth that rapidly degrades DNA evidence.', 1, 4),
(67, 17, 'Plastic neutralizes blood antigens through chemical ionization.', 0, 1),
(68, 17, 'Airtight bags cause fingerprints to turn invisible within minutes.', 0, 1),
(69, 18, 'Immediately pick up the knife by the blade to see if fingerprints exist on the handle.', 0, 1),
(70, 18, 'Photograph in situ with spatial scale, document exact coordinates on the scene sketch, then package into a rigid protective container wearing clean gloves.', 1, 4),
(71, 18, 'Wash the blade with sterile saline to verify if the red substance is real blood before photographing.', 0, 1),
(72, 18, 'Wrap the knife tightly in aluminum foil and store in a pocket.', 0, 1),
(73, 19, 'Center axis of symmetry', 0, 1),
(74, 19, 'Hidden edge or concealed contour', 1, 4),
(75, 19, 'Visible outline of the part', 0, 1),
(76, 19, 'Dimension extension reference line', 0, 1),
(77, 20, 'Interference Fit', 0, 1),
(78, 20, 'Clearance Fit', 1, 4),
(79, 20, 'Transition Fit', 0, 2),
(80, 20, 'Press Fit', 0, 1),
(81, 21, 'Rewrite the entire database schema from scratch without checking logs.', 0, 1),
(82, 21, 'Examine error logs, reproduce the specific failure condition, formulate a hypothesis, test the fix in staging, and deploy with monitoring.', 1, 4),
(83, 21, 'Blame the database hosting provider and wait 24 hours to see if it fixes itself.', 0, 1),
(84, 21, 'Delete failed records silently so managers do not notice the discrepancy.', 0, 1),
(85, 22, 'A vague statement saying \"The system is broken\"', 0, 1),
(86, 22, 'Clear steps to reproduce, expected versus actual results, environment details, and relevant error logs', 1, 4),
(87, 22, 'An angry complaint regarding previous development cycles', 0, 1),
(88, 22, 'A request to delete user data without investigation', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_questions`
--

CREATE TABLE `assessment_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `education_category_id` int(10) UNSIGNED DEFAULT NULL,
  `question_type` enum('mcq','scenario') DEFAULT 'mcq',
  `question_text` text NOT NULL,
  `scenario_context` text DEFAULT NULL,
  `difficulty_level` tinyint(3) UNSIGNED DEFAULT 2 COMMENT '1=Beginner, 2=Basic, 3=Intermediate, 4=Advanced',
  `explanation` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_questions`
--

INSERT INTO `assessment_questions` (`id`, `skill_id`, `education_category_id`, `question_type`, `question_text`, `scenario_context`, `difficulty_level`, `explanation`, `is_active`) VALUES
(1, 1, 1, 'mcq', 'Which HTML5 semantic element is most appropriate for enclosing the primary navigation links of a web application?', NULL, 2, 'The <nav> element represents a section of a page whose purpose is to provide navigation links either within the current document or to other documents.', 1),
(2, 1, 1, 'scenario', 'You need to create a 3-column card grid that gracefully stacks into a single column on mobile devices without writing multiple media queries. Which modern CSS rule accomplishes this?', 'Scenario: Building a responsive student dashboard card grid that adapts seamlessly across phone (360px) and 4K desktop displays.', 3, 'grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)) automatically calculates how many 280px cards fit and stretches them smoothly to fill remaining space.', 1),
(3, 2, 1, 'mcq', 'What will be logged to the console when executing: console.log(typeof NaN)?', NULL, 2, 'In JavaScript, NaN (Not-a-Number) is a special numeric value, hence typeof NaN returns \"number\".', 1),
(4, 2, 1, 'scenario', 'A student clicks a \"Submit Assessment\" button multiple times rapidly while the network request is pending. How should you prevent duplicate database entries on the client side?', 'Scenario: You are handling an asynchronous fetch() request to submit quiz answers.', 3, 'Disabling the button and changing its label/spinner immediately on submit event prevents duplicate clicks until the asynchronous promise settles.', 1),
(5, 3, 1, 'mcq', 'Which PDO parameter setting ensures that SQL queries always throw exceptions when database query errors occur?', NULL, 2, 'Setting PDO::ATTR_ERRMODE to PDO::ERRMODE_EXCEPTION causes PDO to throw PDOException on database errors.', 1),
(6, 3, 1, 'scenario', 'An attacker inputs \"\' OR \'1\'=\'1\" into a login form. Why does using PDO prepared statements with parameter binding prevent SQL injection?', 'Scenario: Protecting user authentication authentication queries in PHP against SQL injection.', 3, 'Prepared statements send SQL template and user data separately. The database engine treats parameter values strictly as literal data strings, never as executable SQL instructions.', 1),
(7, 4, 1, 'mcq', 'Which SQL constraint prevents orphaned rows in a child table when a referenced parent record is deleted?', NULL, 2, 'Foreign key constraints with ON DELETE RESTRICT (or NO ACTION) prevent parent row deletion if child records reference it.', 1),
(8, 11, 2, 'mcq', 'Under double-entry bookkeeping, which of the following transactions results in a debit to an Asset account and a credit to a Liability account?', NULL, 2, 'Purchasing office equipment on credit increases Assets (Equipment - Debit) and increases Liabilities (Accounts Payable - Credit).', 1),
(9, 11, 2, 'scenario', 'At the end of the fiscal year, a firm has received ₹50,000 in cash for consulting services that will only be rendered in the subsequent fiscal year. How should this be recorded under accrual accounting?', 'Scenario: Year-end accounting adjustment under GAAP / Ind-AS standards.', 3, 'Under the revenue recognition principle, revenue cannot be recognized until earned. Cash is debited and Unearned Revenue (Current Liability) is credited.', 1),
(10, 12, 2, 'mcq', 'In GST compliance, when can a registered business claim Input Tax Credit (ITC)?', NULL, 3, 'ITC can be availed when the tax invoice is held, goods/services have been received, the supplier has deposited tax to the government, and returns are filed.', 1),
(11, 13, 2, 'mcq', 'Which modern Excel function searches a range or array and returns the corresponding item from a second array without requiring the lookup column to be on the left?', NULL, 2, 'XLOOKUP can look in any direction (left, right, vertical, horizontal) and defaults to an exact match without column index numbers.', 1),
(12, 17, 3, 'mcq', 'What is considered normal resting heart rate (pulse) in an adult at rest?', NULL, 1, 'A normal resting heart rate for healthy adults ranges from 60 to 100 beats per minute.', 1),
(13, 17, 3, 'scenario', 'An adult inpatient in the surgical ward suddenly exhibits shallow respirations (8 breaths/min), pin-point pupils, and lethargy following post-operative IV morphine administration. What is the immediate nursing priority?', 'Scenario: Post-operative monitoring in an acute surgical care unit.', 4, 'These are classic signs of opioid overdose and respiratory depression. Securing the airway, delivering high-flow oxygen, alerting the physician, and preparing Naloxone (opioid antagonist) is the immediate protocol.', 1),
(14, 19, 3, 'mcq', 'According to WHO guidelines, what is the single most effective clinical intervention for preventing healthcare-associated infections (HAIs)?', NULL, 2, 'Proper hand hygiene using soap and water or alcohol-based hand rub at the 5 Moments of Hand Hygiene is the single most effective way to prevent HAIs.', 1),
(15, 23, 4, 'mcq', 'A 55-year-old diabetic patient presents with retrosternal crushing chest pain radiating to the left jaw, diaphoresis, and nausea for 45 minutes. What is the most critical initial diagnostic test to obtain within 10 minutes of arrival?', NULL, 3, 'A 12-lead Electrocardiogram (ECG) must be acquired and interpreted within 10 minutes of arrival to assess for ST-segment elevation myocardial infarction (STEMI).', 1),
(16, 24, 4, 'scenario', 'A 3-year-old child presents to the emergency room with high fever, sore throat, and clear rhinorrhea for 2 days. The physical exam shows mild pharyngeal erythema without tonsillar exudates or cervical lymphadenopathy. Rapid strep antigen test is negative. The parents request oral amoxicillin. What is the evidence-based medical management?', 'Scenario: Outpatient pediatric presentation of suspected viral upper respiratory tract infection.', 4, 'Symptoms and negative rapid strep indicate a viral URI. Prescribing antibiotics for viral illnesses drives antibiotic resistance. Reassurance, hydration, antipyretics, and red-flag warning education is guideline-directed.', 1),
(17, 28, 5, 'mcq', 'Why must wet biological evidence (such as bloodstained clothing) never be sealed in airtight plastic bags for extended storage?', NULL, 2, 'Trapped moisture in plastic creates an anaerobic, humid environment that promotes bacterial and fungal decomposition, destroying DNA and biological markers. Biological evidence must be air-dried and stored in breathable paper bags.', 1),
(18, 28, 5, 'scenario', 'You arrive at an indoor crime scene where a homicide occurred. An open knife with reddish stains lies on the living room carpet. What is the proper sequence of action before lifting the knife?', 'Scenario: First responder forensic evidence processing protocol at a physical crime scene.', 3, 'Evidence must be photographed in situ with overall, medium, and close-up scaled photos, measured and marked on the crime scene sketch before careful collection with gloves into a rigid evidence container.', 1),
(19, 33, 6, 'mcq', 'In engineering technical drawing, what does a dashed line (--- ---) represent in an orthographic projection view?', NULL, 2, 'In technical drawings, dashed lines represent hidden edges, contours, or surfaces that are obscured from direct line of sight.', 1),
(20, 33, 6, 'scenario', 'A manufactured cylinder pin must mate with a hole. The nominal diameter is 25.00 mm. The drawing specifies +0.02 mm / -0.00 mm for the hole, and -0.01 mm / -0.03 mm for the pin. What type of fit is this?', 'Scenario: Tolerance and fits analysis in precision manufacturing.', 3, 'Since the maximum pin diameter (24.99 mm) is smaller than the minimum hole diameter (25.00 mm), there is always space between them, resulting in a Clearance Fit.', 1),
(21, 43, NULL, 'scenario', 'During a critical sprint release, a production system bug causes 5% of student assessment scores to fail saving. What is the most structured engineering troubleshooting approach?', 'Scenario: High-pressure incident management and root-cause analysis.', 3, 'Structured problem solving requires reproducing the issue using server logs, identifying root causes, developing and verifying a test patch, and communicating transparently before applying hotfixes.', 1),
(22, 42, NULL, 'mcq', 'When writing a technical bug report or incident summary for cross-functional stakeholders, which element is essential for actionable resolution?', NULL, 2, 'A comprehensive bug report must provide clear step-by-step reproduction instructions, expected vs actual behavior, environment specs, and relevant log snippets.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `career_categories`
--

CREATE TABLE `career_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT 'bi-briefcase',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `career_categories`
--

INSERT INTO `career_categories` (`id`, `name`, `code`, `icon`, `description`) VALUES
(1, 'Software & Information Technology', 'CAT_IT', 'bi-code-square', 'Software engineering, web development, data engineering, quality assurance, and cybersecurity.'),
(2, 'Finance, Banking & Accounting', 'CAT_FIN', 'bi-graph-up-arrow', 'Corporate accounting, financial audit, taxation, commercial banking, and investment analysis.'),
(3, 'Healthcare, Nursing & Clinical Medicine', 'CAT_HEALTH', 'bi-hospital', 'Inpatient patient care, emergency medicine, clinical research, and hospital quality management.'),
(4, 'Forensic Science & Investigation', 'CAT_FOR', 'bi-shield-shaded', 'Crime scene reconstruction, forensic toxicological analysis, and digital forensic examination.'),
(5, 'Engineering, Design & Manufacturing', 'CAT_ENG', 'bi-cpu', 'Industrial production, CAD drafting, automation, quality engineering, and technical maintenance.'),
(6, 'Life Sciences, Biotech & Laboratory', 'CAT_SCI', 'bi-bezier2', 'Wet lab experimentation, bioinformatics, molecular diagnostics, and chemical quality control.'),
(7, 'Business Management & Analytics', 'CAT_MGMT', 'bi-kanban', 'Operations management, business analysis, product coordination, and strategic planning.');

-- --------------------------------------------------------

--
-- Table structure for table `education_categories`
--

CREATE TABLE `education_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT 'bi-mortarboard',
  `is_regulated` tinyint(1) DEFAULT 0,
  `regulatory_notice` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_categories`
--

INSERT INTO `education_categories` (`id`, `code`, `name`, `description`, `icon`, `is_regulated`, `regulatory_notice`, `created_at`) VALUES
(1, 'BSC_CS', 'BSc Computer Science', 'Undergraduate degree focusing on computing, algorithms, programming, web and system architecture.', 'bi-laptop', 0, NULL, '2026-11-06 11:28:49'),
(2, 'BCOM', 'BCom (Bachelor of Commerce)', 'Undergraduate program covering accounting, financial management, corporate taxation, and banking.', 'bi-cash-coin', 0, NULL, '2026-11-06 11:28:49'),
(3, 'NURSING', 'BSc Nursing / GNM', 'Professional healthcare degree preparing registered nurses for patient care, critical clinical support, and community health.', 'bi-heart-pulse', 1, 'REGULATORY NOTICE: Practice as a Registered Nurse (RN) requires valid registration with the State Nursing Council and Indian Nursing Council (INC). Skill assessments identify competency gaps and do not replace statutory licensing.', '2026-11-06 11:28:49'),
(4, 'MBBS', 'MBBS (Medicine & Surgery)', 'Primary medical qualification for licensed physicians covering clinical medicine, surgery, and diagnostics.', 'bi-bandaid', 1, 'REGULATORY NOTICE: Medical practice requires completion of Compulsory Rotatory Medical Internship and permanent registration with the National Medical Commission (NMC) or State Medical Council. Skill assessment does not confer clinical privileges.', '2026-11-06 11:28:49'),
(5, 'FORENSIC', 'BSc Forensic Science', 'Multidisciplinary study applying chemical, biological, and physical sciences to criminal investigation and law enforcement.', 'bi-fingerprint', 0, 'NOTICE: Government forensic laboratories typically require statutory recruitment examinations (e.g. UPSC/State PSC) in addition to academic qualifications.', '2026-11-06 11:28:49'),
(6, 'BTECH', 'BTech / BE (Engineering)', 'Professional engineering curriculum covering core engineering domains, hardware, automation, and software systems.', 'bi-gear-wide-connected', 0, NULL, '2026-11-06 11:28:49'),
(7, 'BCA', 'BCA (Bachelor of Computer Applications)', 'Undergraduate degree emphasizing practical software application development, web systems, and database administration.', 'bi-code-slash', 0, NULL, '2026-11-06 11:28:49'),
(8, 'BBA', 'BBA (Bachelor of Business Administration)', 'Undergraduate business management program developing leadership, organizational strategy, marketing, and operations.', 'bi-briefcase', 0, NULL, '2026-11-06 11:28:49'),
(9, 'BSC_MATH', 'BSc Mathematics', 'Rigorous theoretical and applied mathematical studies, probability, statistical modeling, and computational analysis.', 'bi-calculator', 0, NULL, '2026-11-06 11:28:49'),
(10, 'BSC_PHYS', 'BSc Physics', 'Fundamental principles of matter, energy, mechanics, optics, and computational physical modeling.', 'bi-radioactive', 0, NULL, '2026-11-06 11:28:49'),
(11, 'BSC_CHEM', 'BSc Chemistry', 'Organic, inorganic, physical, and analytical chemistry with emphasis on laboratory wet-lab analysis.', 'bi-eyedropper', 0, NULL, '2026-11-06 11:28:49'),
(12, 'BSC_BIOTECH', 'BSc Biotechnology', 'Application of cellular and biomolecular processes to develop technologies in medicine, agriculture, and industry.', 'bi-virus', 0, NULL, '2026-11-06 11:28:49'),
(13, 'BA', 'BA (Bachelor of Arts)', 'Humanities and social sciences degree covering languages, economics, mass communication, psychology, and public policy.', 'bi-journal-richtext', 0, NULL, '2026-11-06 11:28:49'),
(14, 'DIPLOMA', 'Polytechnic Diploma', 'Hands-on practical technical education preparing industry-ready technicians and junior engineers.', 'bi-tools', 0, NULL, '2026-11-06 11:28:49'),
(15, 'OTHER', 'Other Degrees & Specializations', 'Interdisciplinary and specialized undergraduate programs across emerging fields and vocational paths.', 'bi-mortarboard', 0, NULL, '2026-11-06 11:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `job_required_skills`
--

CREATE TABLE `job_required_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_role_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `required_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1=Beginner, 2=Basic, 3=Intermediate, 4=Advanced',
  `is_essential` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Essential, 0=Desirable',
  `importance_weight` decimal(3,2) DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_required_skills`
--

INSERT INTO `job_required_skills` (`id`, `job_role_id`, `skill_id`, `required_level`, `is_essential`, `importance_weight`) VALUES
(1, 1, 1, 4, 1, 1.00),
(2, 1, 2, 3, 1, 1.00),
(3, 1, 3, 3, 1, 1.00),
(4, 1, 4, 3, 1, 1.00),
(5, 1, 6, 2, 1, 1.00),
(6, 1, 10, 2, 0, 1.00),
(7, 1, 42, 2, 0, 1.00),
(8, 2, 5, 4, 1, 1.00),
(9, 2, 4, 3, 1, 1.00),
(10, 2, 6, 3, 1, 1.00),
(11, 2, 8, 3, 0, 1.00),
(12, 2, 43, 3, 1, 1.00),
(13, 3, 7, 4, 1, 1.00),
(14, 3, 1, 2, 0, 1.00),
(15, 3, 4, 2, 1, 1.00),
(16, 3, 44, 3, 1, 1.00),
(17, 3, 42, 3, 1, 1.00),
(18, 4, 8, 4, 1, 1.00),
(19, 4, 4, 3, 1, 1.00),
(20, 4, 5, 2, 0, 1.00),
(21, 4, 13, 3, 1, 1.00),
(22, 4, 44, 3, 1, 1.00),
(23, 5, 10, 4, 1, 1.00),
(24, 5, 9, 3, 1, 1.00),
(25, 5, 5, 2, 0, 1.00),
(26, 5, 4, 2, 0, 1.00),
(27, 5, 43, 3, 1, 1.00),
(28, 6, 11, 4, 1, 1.00),
(29, 6, 12, 3, 1, 1.00),
(30, 6, 13, 3, 1, 1.00),
(31, 6, 15, 3, 1, 1.00),
(32, 6, 14, 2, 0, 1.00),
(33, 7, 14, 4, 1, 1.00),
(34, 7, 13, 4, 1, 1.00),
(35, 7, 11, 3, 1, 1.00),
(36, 7, 8, 2, 0, 1.00),
(37, 7, 44, 3, 1, 1.00),
(38, 8, 16, 4, 1, 1.00),
(39, 8, 11, 2, 1, 1.00),
(40, 8, 13, 2, 0, 1.00),
(41, 8, 42, 3, 1, 1.00),
(42, 8, 45, 3, 1, 1.00),
(43, 9, 17, 4, 1, 1.00),
(44, 9, 18, 4, 1, 1.00),
(45, 9, 19, 4, 1, 1.00),
(46, 9, 20, 3, 1, 1.00),
(47, 9, 22, 3, 1, 1.00),
(48, 9, 42, 3, 1, 1.00),
(49, 10, 21, 4, 1, 1.00),
(50, 10, 18, 4, 1, 1.00),
(51, 10, 20, 4, 1, 1.00),
(52, 10, 17, 3, 1, 1.00),
(53, 10, 19, 3, 1, 1.00),
(54, 10, 43, 3, 1, 1.00),
(55, 11, 17, 3, 1, 1.00),
(56, 11, 19, 3, 1, 1.00),
(57, 11, 22, 3, 1, 1.00),
(58, 11, 42, 4, 1, 1.00),
(59, 11, 45, 3, 1, 1.00),
(60, 12, 23, 4, 1, 1.00),
(61, 12, 24, 4, 1, 1.00),
(62, 12, 25, 4, 1, 1.00),
(63, 12, 20, 3, 1, 1.00),
(64, 12, 43, 4, 1, 1.00),
(65, 13, 27, 4, 1, 1.00),
(66, 13, 24, 3, 1, 1.00),
(67, 13, 42, 3, 1, 1.00),
(68, 13, 44, 3, 1, 1.00),
(69, 14, 26, 4, 1, 1.00),
(70, 14, 23, 2, 1, 1.00),
(71, 14, 13, 2, 0, 1.00),
(72, 14, 44, 3, 1, 1.00),
(73, 15, 28, 3, 1, 1.00),
(74, 15, 30, 3, 1, 1.00),
(75, 15, 32, 3, 1, 1.00),
(76, 15, 38, 3, 1, 1.00),
(77, 16, 28, 4, 1, 1.00),
(78, 16, 29, 3, 1, 1.00),
(79, 16, 32, 4, 1, 1.00),
(80, 16, 44, 3, 1, 1.00),
(81, 17, 31, 4, 1, 1.00),
(82, 17, 10, 3, 1, 1.00),
(83, 17, 9, 2, 1, 1.00),
(84, 17, 32, 3, 1, 1.00),
(85, 18, 33, 3, 1, 1.00),
(86, 18, 34, 2, 1, 1.00),
(87, 18, 36, 2, 0, 1.00),
(88, 18, 43, 3, 1, 1.00),
(89, 19, 33, 4, 1, 1.00),
(90, 19, 34, 2, 1, 1.00),
(91, 19, 43, 3, 1, 1.00),
(92, 19, 44, 3, 1, 1.00),
(93, 20, 34, 4, 1, 1.00),
(94, 20, 33, 2, 0, 1.00),
(95, 20, 41, 3, 1, 1.00),
(96, 20, 44, 3, 1, 1.00),
(97, 21, 37, 4, 1, 1.00),
(98, 21, 36, 3, 1, 1.00),
(99, 21, 35, 2, 0, 1.00),
(100, 21, 43, 3, 1, 1.00),
(101, 22, 38, 4, 1, 1.00),
(102, 22, 39, 3, 1, 1.00),
(103, 22, 41, 2, 0, 1.00),
(104, 22, 44, 3, 1, 1.00),
(105, 23, 38, 3, 1, 1.00),
(106, 23, 40, 4, 1, 1.00),
(107, 23, 39, 2, 0, 1.00),
(108, 23, 45, 3, 1, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `job_roles`
--

CREATE TABLE `job_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `career_category_id` int(10) UNSIGNED NOT NULL,
  `primary_education_category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `full_description` text NOT NULL,
  `required_qualification` varchar(255) NOT NULL,
  `licensing_requirements` text DEFAULT NULL,
  `typical_responsibilities` text NOT NULL,
  `industry_domain` varchar(100) NOT NULL,
  `average_salary_range` varchar(100) DEFAULT NULL,
  `employment_disclaimer` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_roles`
--

INSERT INTO `job_roles` (`id`, `career_category_id`, `primary_education_category_id`, `title`, `slug`, `short_description`, `full_description`, `required_qualification`, `licensing_requirements`, `typical_responsibilities`, `industry_domain`, `average_salary_range`, `employment_disclaimer`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Junior Web Developer', 'junior-web-developer', 'Build and maintain responsive websites and web applications using modern HTML5, CSS3, JavaScript, and PHP/MySQL backends.', 'Junior Web Developers collaborate with designers and senior engineers to write clean client-side and server-side code, integrate relational databases, and maintain web portals.', 'BSc Computer Science, BCA, or BTech in CSE / IT', NULL, '1. Write clean semantic HTML, CSS, and modern JavaScript for web user interfaces.\n2. Develop secure server-side logic and REST APIs using PHP.\n3. Design and query MySQL relational databases using prepared statements.\n4. Collaborate on GitHub repositories using feature branches and pull requests.\n5. Debug layout inconsistencies and responsive breakpoints across devices.', 'Information Technology / SaaS', '₹3,00,000 - ₹5,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(2, 1, 1, 'Python Developer', 'python-developer', 'Develop backend services, automated scripts, and data processing workflows using Python and relational databases.', 'Python Developers construct core backend logic, automate business processes, parse structured data, and build web microservices.', 'BSc Computer Science, BCA, BSc Mathematics, or BTech', NULL, '1. Write modular, object-oriented Python scripts and microservices.\n2. Interface with SQL databases and manipulate data using pandas.\n3. Implement authentication and RESTful API endpoints.\n4. Write unit tests to ensure software reliability and test coverage.\n5. Optimize database queries and background job performance.', 'Software & Data Services', '₹3,50,000 - ₹6,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(3, 1, 1, 'QA / Software Test Engineer', 'qa-software-tester', 'Verify software reliability through structured manual test cases, bug tracking, boundary analysis, and automated test scripts.', 'QA Engineers ensure application quality by designing thorough test matrices, executing functional tests, verifying edge cases, and reporting defects.', 'BSc Computer Science, BCA, BTech, or Science Graduate', NULL, '1. Design comprehensive test plans, scenarios, and step-by-step test cases.\n2. Perform regression, smoke, and integration testing on web applications.\n3. Log and track defects in issue trackers with clear reproduction steps.\n4. Validate API responses and backend database integrity.\n5. Collaborate with developers to verify fixes before production release.', 'Software Quality Assurance', '₹2,80,000 - ₹4,80,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(4, 1, 1, 'Data Analyst Trainee', 'data-analyst-trainee', 'Extract, transform, and analyze business data to produce actionable insights and executive dashboards.', 'Data Analyst Trainees leverage SQL, Excel, and Python to clean messy datasets, run descriptive statistics, and communicate trends to decision makers.', 'BSc Computer Science, BSc Mathematics, BSc Statistics, BCom, or BTech', NULL, '1. Write complex SQL queries with aggregations and JOINs to extract raw metrics.\n2. Clean and preprocess tabular data using Excel and Python Pandas.\n3. Build interactive visual dashboards for key performance indicators.\n4. Identify trends, statistical anomalies, and operational bottlenecks.\n5. Present analytical findings clearly to management and stakeholders.', 'Analytics & Business Intelligence', '₹3,20,000 - ₹5,80,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(5, 1, 1, 'Cybersecurity Analyst (Junior)', 'cybersecurity-analyst', 'Monitor networks, analyze security logs, identify web vulnerabilities, and enforce organizational security baselines.', 'Cybersecurity Analysts protect digital infrastructure by auditing configurations, assessing web vulnerabilities against OWASP Top 10, and responding to incidents.', 'BSc Computer Science, BTech CSE, or Forensic Science (Digital)', NULL, '1. Review system logs and network traffic for suspicious anomalies.\n2. Assess web applications for OWASP Top 10 vulnerabilities.\n3. Assist in firewall, access control, and endpoint security configuration.\n4. Document incident reports and implement remediation patches.\n5. Conduct routine user security awareness briefings.', 'Information Security / SOC', '₹3,50,000 - ₹6,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(6, 2, 2, 'Accounts Executive', 'accounts-executive', 'Manage day-to-day corporate bookkeeping, vendor ledger reconciliations, invoice verification, and GST returns.', 'Accounts Executives record journal entries, process payables/receivables in TallyPrime, and prepare trial balances for senior accountants.', 'BCom, BBA (Finance), or Master of Commerce', NULL, '1. Post daily financial vouchers, receipts, and invoices in Tally / ERP systems.\n2. Reconcile monthly bank statements and vendor ledger accounts.\n3. Assist in calculating GST liabilities and filing GSTR-1 / GSTR-3B summaries.\n4. Process employee payroll adjustments and statutory TDS deductions.\n5. Prepare draft trial balances and support annual statutory audit checks.', 'Corporate Accounting / Tax Services', '₹2,50,000 - ₹4,20,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(7, 2, 2, 'Financial Analyst Trainee', 'financial-analyst-trainee', 'Evaluate corporate financial statements, compute key valuation ratios, build spreadsheet models, and forecast budgets.', 'Financial Analysts inspect balance sheets, income statements, and cash flows to assess profitability, liquidity, and capital expenditure viability.', 'BCom (Honors), BBA (Finance), BSc Mathematics, or MBA Finance', NULL, '1. Build financial models and variance analyses in MS Excel.\n2. Calculate and benchmark liquidity, solvency, and profitability ratios.\n3. Track revenue trends and departmental operational expenditures.\n4. Prepare visual slide decks summarizing monthly business performance.\n5. Conduct competitor benchmarking and industry market research.', 'Financial Services / Corporate Finance', '₹3,50,000 - ₹6,00,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(8, 2, 2, 'Banking Operations Associate', 'banking-operations-associate', 'Handle retail and commercial banking workflows, customer KYC compliance, deposit services, and credit documentation.', 'Banking Associates execute customer service transactions, verify loan application compliance, and enforce AML regulations.', 'BCom, BBA, BA Economics, or any Graduate degree', NULL, '1. Verify customer identification dossiers according to strict KYC/AML guidelines.\n2. Process electronic fund settlements (NEFT, RTGS, IMPS) accurately.\n3. Assist retail clients with loan applications and account documentation.\n4. Address customer grievances regarding transaction discrepancies.\n5. Maintain regulatory registers and daily branch cash reconciliations.', 'Retail & Commercial Banking', '₹2,80,000 - ₹4,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(9, 3, 3, 'Staff Nurse (Inpatient Care)', 'staff-nurse-inpatient', 'Deliver direct bedside nursing care, administer medications, monitor vital signs, and maintain rigorous patient clinical documentation.', 'Staff Nurses assess patient conditions, execute physician treatment orders, uphold sterile protocols, and educate patients and families.', 'BSc Nursing or GNM (General Nursing and Midwifery)', 'MANDATORY STATUTORY REGISTRATION: Must be registered as a Registered Nurse & Registered Midwife (RN/RM) with the State Nursing Council and Indian Nursing Council. Skill assessments assess theoretical knowledge and cannot substitute for clinical licensure.', '1. Conduct hourly vital signs assessments and record trends in clinical charts.\n2. Administer prescribed oral, subcutaneous, and IV medications adhering to the 5 Rights.\n3. Enforce strict aseptic techniques during dressing changes, catheterization, and IV insertion.\n4. Promptly identify clinical deterioration and alert medical duty officers.\n5. Provide empathetic communication to patients and family members regarding care plans.', 'Hospital Healthcare / Inpatient Wards', '₹2,60,000 - ₹4,80,000 PA', 'Healthcare roles require mandatory council registration and clinical verification. This assessment is purely educational.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(10, 3, 3, 'ICU / Critical Care Nurse', 'icu-critical-care-nurse', 'Provide specialized nursing care for critically ill patients requiring continuous mechanical ventilation and hemodynamic titration.', 'ICU Nurses manage complex multi-organ failure patients, monitor arterial lines, titrate high-alert inotropic medications, and perform rapid resuscitation.', 'BSc Nursing with post-basic clinical ICU training or experience', 'MANDATORY STATUTORY REGISTRATION: Requires valid RN/RM council registration and recognized Basic Life Support (BLS) / Advanced Cardiac Life Support (ACLS) certification. Clinical assessment on this platform does not certify ICU privileges.', '1. Continuously monitor invasive hemodynamic parameters and cardiac telemetry.\n2. Titrate life-sustaining inotropic infusions and sedative drips.\n3. Manage endotracheal tubes, mechanical ventilator settings, and suctioning.\n4. Perform rapid resuscitation protocols during emergency code situations.\n5. Maintain exhaustive SOAPIE ICU documentation and multidisciplinary handovers.', 'Critical Care & Emergency Healthcare', '₹3,50,000 - ₹6,00,000 PA', 'Healthcare roles require mandatory council registration and clinical verification. This assessment is purely educational.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(11, 3, 3, 'Community Health Nurse', 'community-health-nurse', 'Conduct rural health screenings, immunization campaigns, maternal and child healthcare education, and infectious disease tracking.', 'Community Health Nurses serve primary healthcare centers, conducting outreach programs and promoting public health hygiene.', 'BSc Nursing or GNM with Community Health posting', 'MANDATORY STATUTORY REGISTRATION: State Nursing Council registration is required.', '1. Coordinate village immunization schedules and maternal health visits.\n2. Screen communities for chronic diseases such as hypertension and diabetes.\n3. Educate local populations on hygiene, sanitation, and nutritional balance.\n4. Maintain primary health records and report communicable disease outbreaks.\n5. Coordinate emergency referrals with district hospital authorities.', 'Public Health & Primary Care', '₹2,40,000 - ₹4,20,000 PA', 'Healthcare roles require mandatory council registration and clinical verification. This assessment is purely educational.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(12, 3, 4, 'Medical Officer (Primary Healthcare)', 'medical-officer-primary-health', 'Examine outpatients, synthesize clinical differential diagnoses, prescribe rational therapeutics, and manage emergency stabilization.', 'Medical Officers lead clinical care at primary and secondary healthcare centers, treating acute and chronic illnesses and coordinating referrals.', 'MBBS from an institution recognized by the National Medical Commission (NMC)', 'MANDATORY REGISTRATION REQUIREMENT: Candidate must have completed the 1-year Compulsory Rotatory Medical Internship (CRMI) and hold permanent registration with the National Medical Commission (NMC) or State Medical Council. Skill gap testing is solely an academic diagnostic tool.', '1. Take detailed medical histories and conduct thorough physical examinations.\n2. Formulate evidence-based differential diagnoses and order targeted investigations.\n3. Prescribe rational pharmacotherapy while strictly observing antibiotic stewardship.\n4. Stabilize acute medical emergencies before intensive tertiary transport.\n5. Supervise primary health clinic staff, preventive health programs, and bio-waste protocols.', 'Clinical Medicine & Government Health Services', '₹6,00,000 - ₹10,50,000 PA', 'Medical practitioner roles require statutory NMC registration. Skill assessments do not confer clinical practice rights.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(13, 3, 4, 'Clinical Research Associate (CRA)', 'clinical-research-associate', 'Monitor human clinical trial sites, ensure adherence to ICH-GCP regulatory guidelines, and verify clinical patient safety data.', 'CRAs inspect investigative clinical trial sites, audit informed consent documents, and confirm that adverse events are promptly escalated to IRBs.', 'MBBS, BDS, BSc Nursing, or MSc Pharmacology / Biotechnology', 'GCP CERTIFICATION: Requires certification in International Council for Harmonisation - Good Clinical Practice (ICH-GCP).', '1. Monitor investigative site activities for compliance with the clinical trial protocol.\n2. Verify patient informed consent forms and inclusion/exclusion eligibility.\n3. Reconcile investigational drug accountability logs and cold-chain records.\n4. Audit Case Report Forms (CRFs) against source medical records.\n5. Document serious adverse event (SAE) reports and submit monitor findings.', 'Pharmaceuticals & Contract Research (CRO)', '₹4,00,000 - ₹7,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(14, 3, 4, 'Medical Coding Specialist', 'medical-coding-specialist', 'Review clinical records, analyze physician diagnostic notes, and assign standardized ICD-10-CM and CPT procedural codes.', 'Medical Coders bridge medical documentation and international healthcare billing systems, ensuring audit compliance.', 'MBBS, BHMS, BAMS, BSc Nursing, or Life Science Graduate', NULL, '1. Review operative notes and discharge summaries to extract clinical diagnoses.\n2. Assign precise alphanumeric ICD-10-CM codes for diseases and symptoms.\n3. Apply CPT and HCPCS codes for surgical and outpatient medical procedures.\n4. Query attending physicians when medical documentation exhibits ambiguity.\n5. Ensure coding accuracy complies with official CMS and billing audit standards.', 'Healthcare IT & Revenue Cycle Management', '₹3,00,000 - ₹5,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(15, 4, 5, 'Forensic Lab Assistant', 'forensic-lab-assistant', 'Process physical evidence in laboratory settings, perform presumptive screening tests, and prepare forensic chemical reagents.', 'Forensic Lab Assistants prepare specimens, run TLC/UV-Vis tests, examine tool marks, and uphold rigorous chain-of-custody protocols.', 'BSc Forensic Science, BSc Chemistry, or BSc Biotechnology', 'NOTE: Government forensic lab employment requires qualifying in state/central recruitment board competitive exams.', '1. Receive and log physical evidence while verifying intact tamper-evident seals.\n2. Perform preliminary presumptive chemical spot tests for body fluids and narcotics.\n3. Prepare chemical standards, reagents, and calibration solutions for instruments.\n4. Assist senior scientific officers during microscopic trace evidence analysis.\n5. Maintain meticulous lab worksheets and chain-of-custody documentation.', 'Forensic Science Laboratories / Criminal Justice', '₹2,80,000 - ₹4,80,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(16, 4, 5, 'Crime Scene Assistant', 'crime-scene-assistant', 'Assist forensic investigators at crime scenes by securing perimeters, locating trace evidence, and developing latent fingerprints.', 'Crime Scene Assistants photograph scenes, measure spatial coordinates, cast impressions, and preserve perishable physical evidence.', 'BSc Forensic Science or Diploma in Criminology', NULL, '1. Secure crime scenes and establish contamination-free approach corridors.\n2. Photograph physical evidence with macro scales and spatial reference markers.\n3. Apply black magnetic powder and ninhydrin to develop latent prints on surfaces.\n4. Collect, package, and label biological stains and ballistics evidence.\n5. Complete sworn evidence inventory logs and transfer documents.', 'Law Enforcement & Investigation Support', '₹2,60,000 - ₹4,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(17, 4, 5, 'Digital Forensics Trainee', 'digital-forensics-trainee', 'Extract forensic bit-stream disk images from suspect computers, verify SHA-256 hashes, and examine file system artifacts.', 'Digital Forensics Trainees inspect volatile memory, recovered deleted files, browser history, and log files using forensic toolkits.', 'BSc Forensic Science (Digital), BSc Computer Science, or BCA', NULL, '1. Connect suspect digital media through hardware write-blockers.\n2. Create forensically sound bit-stream images and compute SHA-256 hashes.\n3. Recover deleted files, metadata, and browser artifacts using open-source tools.\n4. Parse operating system event logs and USB connection history registries.\n5. Draft objective forensic examination reports for legal proceedings.', 'Cyber Investigation & Corporate Security', '₹3,20,000 - ₹5,80,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(18, 5, 6, 'Graduate Engineer Trainee (GET)', 'graduate-engineer-trainee', 'Rotate across manufacturing, quality control, maintenance, and design departments to develop comprehensive industrial competence.', 'GETs assist senior engineers in plant troubleshooting, time-motion studies, CAD drawing revisions, and ISO process documentation.', 'BTech / BE in Mechanical, Electrical, Civil, or Production Engineering', NULL, '1. Support plant production scheduling and assembly line workflow optimization.\n2. Inspect incoming raw materials and manufactured parts for dimensional tolerance.\n3. Participate in root cause failure analysis (RCFA) for machinery downtime.\n4. Update 2D and 3D engineering drawings using CAD software.\n5. Assist in drafting Standard Operating Procedures (SOPs) and safety protocols.', 'Manufacturing & Heavy Engineering', '₹3,00,000 - ₹5,00,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(19, 5, 6, 'CAD / Design Engineer', 'cad-design-engineer', 'Create precise 2D mechanical fabrication blueprints and 3D assembly models adhering to geometric dimensioning and tolerances (GD&T).', 'CAD Engineers transform conceptual sketches into production-ready CAD files, verify interference clearances, and generate bills of materials (BOM).', 'BTech Mechanical / Civil, or Polytechnic Diploma in Mechanical/Civil', NULL, '1. Model detailed 3D mechanical components and assemblies in CAD software.\n2. Generate complete 2D manufacturing drawings with GD&T annotations.\n3. Conduct interference and clash checks between moving mechanical parts.\n4. Compile accurate Bills of Materials (BOM) for procurement teams.\n5. Coordinate with fabrication shop machinists to resolve drafting queries.', 'Engineering Design & Automotive', '₹3,20,000 - ₹5,50,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(20, 5, 6, 'Quality Assurance Engineer (Manufacturing)', 'qa-engineer-manufacturing', 'Maintain plant quality standards, conduct Statistical Process Control (SPC), and implement ISO 9001 and Six Sigma methodologies.', 'QA Engineers perform calibration checks, run Gage R&R studies, investigate non-conformance reports, and enforce zero-defect quality standards.', 'BTech / BE, Diploma in Engineering, or BSc Physics/Chemistry', NULL, '1. Monitor production line quality parameters using control charts (X-bar & R).\n2. Lead 8D and 5-Why root cause investigations for part rejections.\n3. Perform incoming and final inspection audits using precision verniers and micrometers.\n4. Audit manufacturing processes against ISO 9001 quality management guidelines.\n5. Train shop-floor technicians on error-proofing (Poka-Yoke) techniques.', 'Automotive, Aerospace & Precision Machining', '₹3,00,000 - ₹5,20,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(21, 5, 14, 'Junior Maintenance Technician', 'junior-maintenance-technician', 'Execute preventive maintenance schedules on industrial pumps, motors, conveyor belts, and pneumatic actuators.', 'Maintenance Technicians troubleshoot electrical and mechanical breakdowns, inspect bearings, replace seals, and maintain uptime.', 'Polytechnic Diploma in Mechanical / Electrical Engineering, or ITI', NULL, '1. Perform daily lubrication, pressure checks, and vibration checks on plant equipment.\n2. Troubleshoot three-phase AC induction motors and contactor control circuits.\n3. Disassemble, repair, and realign centrifugal pumps and gearboxes.\n4. Replace faulty pneumatic valves, proximity sensors, and limit switches.\n5. Log spare parts consumption and update computerized maintenance records.', 'Plant Engineering & Utilities', '₹2,20,000 - ₹3,80,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(22, 6, 11, 'Quality Control Chemist', 'quality-control-chemist', 'Conduct chemical assays, UV-Vis spectrophotometry, wet titrations, and HPLC testing on pharmaceutical or chemical batches.', 'QC Chemists ensure raw materials and finished formulations comply with pharmacopoeial monographs and Good Laboratory Practices.', 'BSc Chemistry, BSc Analytical Chemistry, or BPharm', NULL, '1. Perform wet-chemical assay titrations and pH testing on production samples.\n2. Operate and calibrate UV-Visible spectrophotometers and analytical balances.\n3. Prepare mobile phases and run routine HPLC / GC chromatographic tests.\n4. Document analytical testing data in compliance with GLP and 21 CFR Part 11.\n5. Investigate out-of-specification (OOS) results with senior lab managers.', 'Pharmaceuticals & Specialty Chemicals', '₹2,60,000 - ₹4,40,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(23, 6, 12, 'Research Lab Technician (Biotech)', 'research-lab-technician-biotech', 'Support molecular biology investigations, execute bacterial cell culture, isolate nucleic acids, and run PCR amplifications.', 'Biotech Lab Technicians maintain sterile laminar airflow benches, prepare agar media, run agarose gel electrophoresis, and record data.', 'BSc Biotechnology, BSc Microbiology, or BSc Biochemistry', NULL, '1. Prepare chemical buffers, agar growth media, and autoclave sterilization runs.\n2. Perform DNA and RNA extractions using spin-column protocols.\n3. Set up PCR amplification master mixes and program thermal cyclers.\n4. Run agarose gel electrophoresis and document bands using gel documentation systems.\n5. Maintain cryopreserved cell culture stocks and laboratory inventory.', 'Biotechnology & Life Sciences Research', '₹2,50,000 - ₹4,20,000 PA', 'Recommendation is based on skill compatibility and does not guarantee employment or hiring offers.', 1, '2026-11-06 11:28:50', '2026-11-06 11:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `learning_resources`
--

CREATE TABLE `learning_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `platform` varchar(100) NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `url` varchar(500) NOT NULL,
  `learning_format` varchar(100) DEFAULT 'Interactive Tutorial',
  `estimated_hours` int(10) UNSIGNED DEFAULT 10,
  `free_status` enum('100% Free','Free Course / Paid Optional Certificate','Free Open Access') DEFAULT '100% Free',
  `certificate_info` varchar(150) DEFAULT 'Free Digital Certificate',
  `is_verified` tinyint(1) DEFAULT 1,
  `rating` decimal(2,1) DEFAULT 4.8,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `learning_resources`
--

INSERT INTO `learning_resources` (`id`, `title`, `platform`, `skill_id`, `description`, `url`, `learning_format`, `estimated_hours`, `free_status`, `certificate_info`, `is_verified`, `rating`, `created_at`) VALUES
(1, 'Responsive Web Design Certification', 'freeCodeCamp', 1, 'Learn HTML, CSS, Flexbox, CSS Grid, and responsive web development principles through 300+ interactive coding challenges and 5 real-world certification projects.', 'https://www.freecodecamp.org/learn/2022/responsive-web-design/', 'Interactive Tutorial', 300, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(2, 'MDN Web Docs: Learn Web Development', 'MDN Web Docs', 1, 'Comprehensive, official, peer-reviewed documentation covering semantic HTML, modern styling, accessible forms, and responsive design patterns.', 'https://developer.mozilla.org/en-US/docs/Learn', 'Official Documentation', 50, '100% Free', 'No Certificate - Open Courseware', 1, 4.9, '2026-11-06 11:28:50'),
(3, 'JavaScript Algorithms & Data Structures', 'freeCodeCamp', 2, 'Master modern JavaScript fundamentals, ES6 features, regular expressions, debugging, object-oriented programming, and functional programming algorithms.', 'https://www.freecodecamp.org/learn/javascript-algorithms-and-data-structures-v8/', 'Interactive Tutorial', 300, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(4, 'PHP Manual & Language Reference Tutorial', 'PHP.net Official', 3, 'The definitive official PHP documentation covering basic syntax, types, variables, forms, cookies, sessions, PDO, and security best practices.', 'https://www.php.net/manual/en/tutorial.php', 'Official Documentation', 35, '100% Free', 'No Certificate - Open Courseware', 1, 4.8, '2026-11-06 11:28:50'),
(5, 'Relational Databases & SQL Certification', 'freeCodeCamp', 4, 'Learn PostgreSQL, MySQL fundamentals, bash scripting, database design, normalization, subqueries, and table joins inside an interactive Linux container terminal.', 'https://www.freecodecamp.org/learn/relational-database/', 'Interactive Tutorial', 300, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(6, 'Introduction to Computer Science & Python (6.0001)', 'MIT OpenCourseWare', 5, 'MIT undergraduate introductory curriculum teaching algorithmic problem-solving, Python 3 syntax, recursion, testing, and computational complexity (Big O notation).', 'https://ocw.mit.edu/courses/6-0001-introduction-to-computer-science-and-programming-in-python-fall-2016/', 'Video Course', 60, '100% Free', 'No Certificate - Open Courseware', 1, 4.9, '2026-11-06 11:28:50'),
(7, 'Introduction to Git and GitHub', 'Microsoft Learn', 6, 'Learn to track source code changes, stage files, create local commits, manage feature branches, and push to GitHub repositories using real CLI commands.', 'https://learn.microsoft.com/en-us/training/modules/intro-to-git/', 'Interactive Tutorial', 8, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(8, 'Software Testing & Automation Principles', 'NPTEL', 7, 'Comprehensive university lecture series covering boundary value analysis, equivalence partitioning, control flow testing, and integration testing frameworks.', 'https://nptel.ac.in/courses/106105150', 'Video Course', 40, '100% Free', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(9, 'Python for Data Science and Analysis', 'freeCodeCamp', 8, 'Hands-on training in Python data science stack: NumPy arrays, Pandas DataFrames, data cleaning, and statistical visualizations using Matplotlib.', 'https://www.freecodecamp.org/learn/data-analysis-with-python/', 'Interactive Tutorial', 200, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(10, 'Networking Basics', 'Cisco Networking Academy', 9, 'Learn fundamental networking concepts, IP addressing schemes, subnetting, TCP/UDP protocols, and network media troubleshooting on Skills for All.', 'https://www.skillsforall.com/course/networking-basics', 'Self-Paced Text', 25, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(11, 'OWASP Top 10 Web Application Security Guide', 'OWASP Foundation', 10, 'Authoritative documentation of the most critical security risks facing web applications, including Injection, Broken Authentication, XSS, and Security Misconfigurations.', 'https://owasp.org/www-project-top-ten/', 'Official Documentation', 20, '100% Free', 'No Certificate - Open Courseware', 1, 4.9, '2026-11-06 11:28:50'),
(12, 'Accounting & Financial Statements Course', 'Khan Academy', 11, 'Learn the core mechanics of accounting: balance sheets, income statements, cash flow statements, accrual accounting, and depreciation methods.', 'https://www.khanacademy.org/economics-finance-domain/core-finance/accounting-and-financial-statements', 'Video Course', 25, '100% Free', 'No Certificate - Open Courseware', 1, 4.9, '2026-11-06 11:28:50'),
(13, 'Goods & Services Tax (GST) Fundamentals', 'SWAYAM', 12, 'Government-approved curriculum covering GST registration, GST Council guidelines, Input Tax Credit (ITC) conditions, and electronic filing portal workflows.', 'https://swayam.gov.in/explorer?category=Commerce', 'Video Course', 45, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(14, 'Excel for Business and Finance Essentials', 'Microsoft Learn', 13, 'Master spreadsheet formulas, lookup functions (VLOOKUP, XLOOKUP), conditional formatting, Pivot Tables, and interactive dashboard creation.', 'https://learn.microsoft.com/en-us/training/paths/analyze-data-with-excel/', 'Self-Paced Text', 15, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(15, 'Financial Statement Analysis and Reporting', 'NPTEL', 14, 'In-depth study of corporate annual reports, financial ratio analysis, profitability metrics, and cash flow analysis by IIT Kharagpur faculty.', 'https://nptel.ac.in/courses/110105121', 'Video Course', 40, '100% Free', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.8, '2026-11-06 11:28:50'),
(16, 'Principles of Banking Operations & Regulations', 'SWAYAM', 16, 'Covers the evolution of modern commercial banking, KYC/AML norms, retail credit appraisal, central bank monetary policy, and digital banking.', 'https://swayam.gov.in/explorer?category=Management', 'Video Course', 30, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.6, '2026-11-06 11:28:50'),
(17, 'Infection Prevention and Control (IPC) in Healthcare', 'WHO OpenWHO', 19, 'Official World Health Organization training on standard precautions, personal protective equipment (PPE) donning/doffing, and hospital outbreak management.', 'https://openwho.org/courses/IPC-intro-en', 'Self-Paced Text', 8, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(18, 'Standard Precautions: Hand Hygiene Protocols', 'WHO OpenWHO', 19, 'Evidence-based clinical guidelines on the 5 Moments of Hand Hygiene, correct surgical hand scrubbing, and alcohol rub formulations.', 'https://openwho.org/courses/IPC-HH-en', 'Self-Paced Text', 4, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(19, 'Basic Life Support (BLS) Clinical Review Modules', 'OpenLearn UK', 20, 'Interactive learning modules detailing adult and pediatric cardiopulmonary resuscitation (CPR), choking relief algorithms, and automated external defibrillator usage.', 'https://www.open.edu/openlearn/health-sports-psychology/health', 'Self-Paced Text', 12, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(20, 'Clinical Nursing Skills & Patient Monitoring', 'SWAYAM', 17, 'National digital curriculum on vital sign diagnostics, systematic head-to-toe physical assessment, and wound care management.', 'https://swayam.gov.in/explorer?category=Medical', 'Video Course', 35, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(21, 'Principles of Epidemiology & Public Health', 'CDC Training', 23, 'The Centers for Disease Control and Prevention self-study course on outbreak investigation, disease surveillance metrics, and epidemic curves.', 'https://www.cdc.gov/training/publichealth101/epidemiology.html', 'Self-Paced Text', 20, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(22, 'Antimicrobial Stewardship: Clinical Guidelines', 'WHO OpenWHO', 24, 'Core medical training on rational antibiotic prescribing, preventing multidrug resistance in hospital wards, and diagnostic stewardship.', 'https://openwho.org/courses/AMR-competency', 'Self-Paced Text', 6, '100% Free', 'Free Digital Certificate', 1, 4.9, '2026-11-06 11:28:50'),
(23, 'Introduction to Clinical Research & ICH-GCP', 'NIH / Coursera Audit', 27, 'Fundamentals of clinical trial protocol design, ethical human subject protections (Declaration of Helsinki), and Good Clinical Practice oversight (Free to Audit).', 'https://www.coursera.org/learn/clinical-research', 'Video Course', 25, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.8, '2026-11-06 11:28:50'),
(24, 'Forensic Science and Fingerprint Evidence', 'OpenLearn UK', 29, 'Covers the scientific principles behind friction ridge analysis, latent print development using chemical reagents, and dactyloscopic matching.', 'https://www.open.edu/openlearn/science-maths-technology/forensic-science-and-fingerprints/content-section-0', 'Self-Paced Text', 16, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(25, 'Crime Scene Investigation & Evidence Integrity', 'SWAYAM', 28, 'University-level forensic science course detailing crime scene perimeter demarcation, sketching scales, evidence packaging, and chain-of-custody affidavits.', 'https://swayam.gov.in/explorer?category=Science', 'Video Course', 40, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(26, 'Digital Forensics Fundamentals', 'Cisco Networking Academy', 31, 'Learn basic principles of cyber forensics, evidence handling, network traffic packet capture analysis, and system log auditing.', 'https://www.skillsforall.com/course/cybersecurity-essentials', 'Self-Paced Text', 30, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50'),
(27, 'Engineering Drawing and Computer Graphics', 'NPTEL', 33, 'Comprehensive 12-week course by IIT Kharagpur faculty covering orthographic projections, isometric views, sectioning, and CAD drawing standards.', 'https://nptel.ac.in/courses/112105294', 'Video Course', 45, '100% Free', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.8, '2026-11-06 11:28:50'),
(28, 'Six Sigma and Quality Management', 'NPTEL', 34, 'Covers total quality management (TQM), ISO 9001 quality frameworks, DMAIC methodology, and Statistical Process Control (SPC).', 'https://nptel.ac.in/courses/110105088', 'Video Course', 30, '100% Free', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(29, 'Basic Electrical Circuits and Diagnostics', 'MIT OpenCourseWare', 36, 'Circuit theorems, nodal/mesh analysis, operational amplifiers, three-phase power, and laboratory oscilloscope diagnostic procedures.', 'https://ocw.mit.edu/courses/6-002-circuits-and-electronics-spring-2007/', 'Video Course', 40, '100% Free', 'No Certificate - Open Courseware', 1, 4.8, '2026-11-06 11:28:50'),
(30, 'Effective Business Communication & Technical Writing', 'SWAYAM', 42, 'Instruction on writing clear corporate memos, technical defect briefs, research executive summaries, and delivering public presentations.', 'https://swayam.gov.in/explorer?category=Humanities', 'Video Course', 20, 'Free Course / Paid Optional Certificate', 'Optional Paid Certificate (Course 100% Free to Learn)', 1, 4.7, '2026-11-06 11:28:50'),
(31, 'Critical Thinking and Problem Solving in Practice', 'OpenLearn UK', 43, 'Techniques for evaluating evidence, recognizing cognitive biases, constructing rational arguments, and diagnosing root causes.', 'https://www.open.edu/openlearn/skills-for-work', 'Self-Paced Text', 15, '100% Free', 'Free Digital Certificate', 1, 4.8, '2026-11-06 11:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `learning_roadmaps`
--

CREATE TABLE `learning_roadmaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `job_role_id` int(10) UNSIGNED NOT NULL,
  `duration_weeks` tinyint(3) UNSIGNED NOT NULL DEFAULT 8,
  `title` varchar(200) NOT NULL,
  `overview` text NOT NULL,
  `hours_per_week` int(10) UNSIGNED DEFAULT 10,
  `total_tasks` int(10) UNSIGNED DEFAULT 0,
  `completed_tasks` int(10) UNSIGNED DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `learning_roadmaps`
--

INSERT INTO `learning_roadmaps` (`id`, `user_id`, `job_role_id`, `duration_weeks`, `title`, `overview`, `hours_per_week`, `total_tasks`, `completed_tasks`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 16, '16-Week Junior Web Developer Personalized Roadmap', 'Customized 16-week roadmap engineered to bridge 7 competency gaps based on your commitment of 10 hours/week.', 10, 40, 0, '2026-11-06 11:57:16', '2026-11-06 11:57:16'),
(3, 7, 2, 4, '4-Week Python Developer Personalized Roadmap', 'Customized 4-week roadmap engineered to bridge 5 competency gaps based on your commitment of 10 hours/week.', 10, 10, 1, '2026-11-06 12:35:46', '2026-11-06 14:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `preferred_job_roles`
--

CREATE TABLE `preferred_job_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `job_role_id` int(10) UNSIGNED NOT NULL,
  `selected_at` datetime DEFAULT current_timestamp(),
  `is_current` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `preferred_job_roles`
--

INSERT INTO `preferred_job_roles` (`id`, `user_id`, `job_role_id`, `selected_at`, `is_current`) VALUES
(6, 7, 4, '2026-11-06 11:53:20', 0),
(7, 7, 1, '2026-11-06 11:54:47', 0),
(8, 7, 2, '2026-11-06 12:24:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_tasks`
--

CREATE TABLE `roadmap_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `week_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED DEFAULT NULL,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `task_title` varchar(255) NOT NULL,
  `task_type` enum('learn','exercise','assignment','mini_project','assessment') DEFAULT 'learn',
  `task_description` text NOT NULL,
  `estimated_hours` int(10) UNSIGNED DEFAULT 2,
  `is_completed` tinyint(1) DEFAULT 0,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roadmap_tasks`
--

INSERT INTO `roadmap_tasks` (`id`, `week_id`, `skill_id`, `resource_id`, `task_title`, `task_type`, `task_description`, `estimated_hours`, `is_completed`, `completed_at`) VALUES
(14, 9, 1, 1, 'Study Responsive Web Design Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(15, 9, 1, 1, 'Hands-on Exercise: Practical application of HTML5 & Responsive Web Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(16, 10, 2, 3, 'Study JavaScript Algorithms & Data Structures on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(17, 10, 2, 3, 'Hands-on Exercise: Practical application of Modern JavaScript (ES6+)', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(18, 10, 2, NULL, 'Mini-Project: Real-world scenario for Modern JavaScript (ES6+)', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(19, 11, 3, 4, 'Study PHP Manual & Language Reference Tutorial on PHP.net Official', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(20, 11, 3, 4, 'Hands-on Exercise: Practical application of PHP & Backend Web Development', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(21, 12, 4, 5, 'Study Relational Databases & SQL Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(22, 12, 4, 5, 'Hands-on Exercise: Practical application of MySQL & Relational Database Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(23, 12, 4, NULL, 'Mini-Project: Real-world scenario for MySQL & Relational Database Design', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(24, 13, 6, 7, 'Study Introduction to Git and GitHub on Microsoft Learn', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(25, 13, 6, 7, 'Hands-on Exercise: Practical application of Git & GitHub Version Control', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(26, 14, 10, 11, 'Study OWASP Top 10 Web Application Security Guide on OWASP Foundation', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(27, 14, 10, 11, 'Hands-on Exercise: Practical application of Cybersecurity Fundamentals & OWASP', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(28, 14, 10, NULL, 'Mini-Project: Real-world scenario for Cybersecurity Fundamentals & OWASP', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(29, 15, 42, 30, 'Study Effective Business Communication & Technical Writing on SWAYAM', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(30, 15, 42, 30, 'Hands-on Exercise: Practical application of Professional Written & Verbal Communication', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(31, 16, 1, 1, 'Study Responsive Web Design Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(32, 16, 1, 1, 'Hands-on Exercise: Practical application of HTML5 & Responsive Web Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(33, 16, 1, NULL, 'Mini-Project: Real-world scenario for HTML5 & Responsive Web Design', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(34, 17, 2, 3, 'Study JavaScript Algorithms & Data Structures on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(35, 17, 2, 3, 'Hands-on Exercise: Practical application of Modern JavaScript (ES6+)', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(36, 18, 3, 4, 'Study PHP Manual & Language Reference Tutorial on PHP.net Official', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(37, 18, 3, 4, 'Hands-on Exercise: Practical application of PHP & Backend Web Development', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(38, 18, 3, NULL, 'Mini-Project: Real-world scenario for PHP & Backend Web Development', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(39, 19, 4, 5, 'Study Relational Databases & SQL Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(40, 19, 4, 5, 'Hands-on Exercise: Practical application of MySQL & Relational Database Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(41, 20, 6, 7, 'Study Introduction to Git and GitHub on Microsoft Learn', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(42, 20, 6, 7, 'Hands-on Exercise: Practical application of Git & GitHub Version Control', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(43, 20, 6, NULL, 'Mini-Project: Real-world scenario for Git & GitHub Version Control', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(44, 21, 10, 11, 'Study OWASP Top 10 Web Application Security Guide on OWASP Foundation', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(45, 21, 10, 11, 'Hands-on Exercise: Practical application of Cybersecurity Fundamentals & OWASP', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(46, 22, 42, 30, 'Study Effective Business Communication & Technical Writing on SWAYAM', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(47, 22, 42, 30, 'Hands-on Exercise: Practical application of Professional Written & Verbal Communication', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(48, 22, 42, NULL, 'Mini-Project: Real-world scenario for Professional Written & Verbal Communication', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(49, 23, 1, 1, 'Study Responsive Web Design Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(50, 23, 1, 1, 'Hands-on Exercise: Practical application of HTML5 & Responsive Web Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(51, 24, 2, 3, 'Study JavaScript Algorithms & Data Structures on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(52, 24, 2, 3, 'Hands-on Exercise: Practical application of Modern JavaScript (ES6+)', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(53, 24, 2, NULL, 'Mini-Project: Real-world scenario for Modern JavaScript (ES6+)', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(54, 25, 5, 6, 'Study Introduction to Computer Science & Python (6.0001) on MIT OpenCourseWare', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 1, '2026-11-06 09:30:45'),
(55, 25, 5, 6, 'Hands-on Exercise: Practical application of Python Programming', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(56, 26, 4, 5, 'Study Relational Databases & SQL Certification on freeCodeCamp', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(57, 26, 4, 5, 'Hands-on Exercise: Practical application of MySQL & Relational Database Design', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(58, 26, 4, NULL, 'Mini-Project: Real-world scenario for MySQL & Relational Database Design', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL),
(59, 27, 6, 7, 'Study Introduction to Git and GitHub on Microsoft Learn', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(60, 27, 6, 7, 'Hands-on Exercise: Practical application of Git & GitHub Version Control', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(61, 28, 43, 31, 'Study Critical Thinking and Problem Solving in Practice on OpenLearn UK', 'learn', 'Dedicate 3-4 hours studying foundational and intermediate concepts.', 3, 0, NULL),
(62, 28, 43, 31, 'Hands-on Exercise: Practical application of Structured Problem-Solving & Root Cause Analysis', 'exercise', 'Complete interactive coding challenges, lab problem sets, or scenario calculations.', 3, 0, NULL),
(63, 28, 43, NULL, 'Mini-Project: Real-world scenario for Structured Problem-Solving & Root Cause Analysis', 'mini_project', 'Build and document a small portfolio component or casework report demonstrating this skill.', 4, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_weeks`
--

CREATE TABLE `roadmap_weeks` (
  `id` int(10) UNSIGNED NOT NULL,
  `roadmap_id` int(10) UNSIGNED NOT NULL,
  `week_number` tinyint(3) UNSIGNED NOT NULL,
  `theme_title` varchar(200) NOT NULL,
  `objective_description` text NOT NULL,
  `expected_outcome` text NOT NULL,
  `milestone_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roadmap_weeks`
--

INSERT INTO `roadmap_weeks` (`id`, `roadmap_id`, `week_number`, `theme_title`, `objective_description`, `expected_outcome`, `milestone_name`) VALUES
(9, 2, 1, 'Week 1: Mastering HTML5 & Responsive Web Design', 'Advance from Level 1 to Level 4 in HTML5 & Responsive Web Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in HTML5 & Responsive Web Design through verifiable code, calculation, or procedure.', 'Milestone 1: HTML5 & Responsive Web Design Target Attained'),
(10, 2, 2, 'Week 2: Mastering Modern JavaScript (ES6+)', 'Advance from Level 1 to Level 3 in Modern JavaScript (ES6+). Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Modern JavaScript (ES6+) through verifiable code, calculation, or procedure.', 'Milestone 2: Modern JavaScript (ES6+) Target Attained'),
(11, 2, 3, 'Week 3: Mastering PHP & Backend Web Development', 'Advance from Level 1 to Level 3 in PHP & Backend Web Development. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in PHP & Backend Web Development through verifiable code, calculation, or procedure.', 'Milestone 3: PHP & Backend Web Development Target Attained'),
(12, 2, 4, 'Week 4: Mastering MySQL & Relational Database Design', 'Advance from Level 1 to Level 3 in MySQL & Relational Database Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in MySQL & Relational Database Design through verifiable code, calculation, or procedure.', 'Milestone 4: MySQL & Relational Database Design Target Attained'),
(13, 2, 5, 'Week 5: Mastering Git & GitHub Version Control', 'Advance from Level 1 to Level 2 in Git & GitHub Version Control. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Git & GitHub Version Control through verifiable code, calculation, or procedure.', 'Milestone 5: Git & GitHub Version Control Target Attained'),
(14, 2, 6, 'Week 6: Mastering Cybersecurity Fundamentals & OWASP', 'Advance from Level 1 to Level 2 in Cybersecurity Fundamentals & OWASP. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Cybersecurity Fundamentals & OWASP through verifiable code, calculation, or procedure.', 'Milestone 6: Cybersecurity Fundamentals & OWASP Target Attained'),
(15, 2, 7, 'Week 7: Mastering Professional Written & Verbal Communication', 'Advance from Level 1 to Level 2 in Professional Written & Verbal Communication. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Professional Written & Verbal Communication through verifiable code, calculation, or procedure.', 'Milestone 7: Professional Written & Verbal Communication Target Attained'),
(16, 2, 8, 'Week 8: Mastering HTML5 & Responsive Web Design', 'Advance from Level 1 to Level 4 in HTML5 & Responsive Web Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in HTML5 & Responsive Web Design through verifiable code, calculation, or procedure.', 'Milestone 8: HTML5 & Responsive Web Design Target Attained'),
(17, 2, 9, 'Week 9: Mastering Modern JavaScript (ES6+)', 'Advance from Level 1 to Level 3 in Modern JavaScript (ES6+). Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Modern JavaScript (ES6+) through verifiable code, calculation, or procedure.', 'Milestone 9: Modern JavaScript (ES6+) Target Attained'),
(18, 2, 10, 'Week 10: Mastering PHP & Backend Web Development', 'Advance from Level 1 to Level 3 in PHP & Backend Web Development. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in PHP & Backend Web Development through verifiable code, calculation, or procedure.', 'Milestone 10: PHP & Backend Web Development Target Attained'),
(19, 2, 11, 'Week 11: Mastering MySQL & Relational Database Design', 'Advance from Level 1 to Level 3 in MySQL & Relational Database Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in MySQL & Relational Database Design through verifiable code, calculation, or procedure.', 'Milestone 11: MySQL & Relational Database Design Target Attained'),
(20, 2, 12, 'Week 12: Mastering Git & GitHub Version Control', 'Advance from Level 1 to Level 2 in Git & GitHub Version Control. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Git & GitHub Version Control through verifiable code, calculation, or procedure.', 'Milestone 12: Git & GitHub Version Control Target Attained'),
(21, 2, 13, 'Week 13: Mastering Cybersecurity Fundamentals & OWASP', 'Advance from Level 1 to Level 2 in Cybersecurity Fundamentals & OWASP. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Cybersecurity Fundamentals & OWASP through verifiable code, calculation, or procedure.', 'Milestone 13: Cybersecurity Fundamentals & OWASP Target Attained'),
(22, 2, 14, 'Week 14: Mastering Professional Written & Verbal Communication', 'Advance from Level 1 to Level 2 in Professional Written & Verbal Communication. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Professional Written & Verbal Communication through verifiable code, calculation, or procedure.', 'Milestone 14: Professional Written & Verbal Communication Target Attained'),
(23, 2, 15, 'Week 15: Mastering HTML5 & Responsive Web Design', 'Advance from Level 1 to Level 4 in HTML5 & Responsive Web Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in HTML5 & Responsive Web Design through verifiable code, calculation, or procedure.', 'Milestone 15: HTML5 & Responsive Web Design Target Attained'),
(24, 2, 16, 'Week 16: Mastering Modern JavaScript (ES6+)', 'Advance from Level 1 to Level 3 in Modern JavaScript (ES6+). Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Modern JavaScript (ES6+) through verifiable code, calculation, or procedure.', 'Milestone 16: Modern JavaScript (ES6+) Target Attained'),
(25, 3, 1, 'Week 1: Mastering Python Programming', 'Advance from Level 1 to Level 4 in Python Programming. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Python Programming through verifiable code, calculation, or procedure.', 'Milestone 1: Python Programming Target Attained'),
(26, 3, 2, 'Week 2: Mastering MySQL & Relational Database Design', 'Advance from Level 1 to Level 3 in MySQL & Relational Database Design. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in MySQL & Relational Database Design through verifiable code, calculation, or procedure.', 'Milestone 2: MySQL & Relational Database Design Target Attained'),
(27, 3, 3, 'Week 3: Mastering Git & GitHub Version Control', 'Advance from Level 1 to Level 3 in Git & GitHub Version Control. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Git & GitHub Version Control through verifiable code, calculation, or procedure.', 'Milestone 3: Git & GitHub Version Control Target Attained'),
(28, 3, 4, 'Week 4: Mastering Structured Problem-Solving & Root Cause Analysis', 'Advance from Level 1 to Level 3 in Structured Problem-Solving & Root Cause Analysis. Follow verified resources and complete practical exercises.', 'Demonstrate practical competency in Structured Problem-Solving & Root Cause Analysis through verifiable code, calculation, or procedure.', 'Milestone 4: Structured Problem-Solving & Root Cause Analysis Target Attained');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `education_category_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `category_id`, `education_category_id`, `name`, `code`, `description`, `created_at`) VALUES
(1, 1, 1, 'HTML5 & Responsive Web Design', 'SK_HTML_CSS', 'Semantic HTML5 structure, CSS3 Flexbox/Grid, and mobile-responsive layout implementation.', '2026-11-06 11:28:50'),
(2, 1, 1, 'Modern JavaScript (ES6+)', 'SK_JAVASCRIPT', 'Client-side programming, asynchronous fetch API, DOM manipulation, and modern ES6 syntax.', '2026-11-06 11:28:50'),
(3, 1, 1, 'PHP & Backend Web Development', 'SK_PHP_BACKEND', 'Server-side PHP scripting, session management, REST endpoints, and secure API handling.', '2026-11-06 11:28:50'),
(4, 1, 1, 'MySQL & Relational Database Design', 'SK_MYSQL_DB', 'Relational database schema modeling, SQL queries, JOINs, indexing, and prepared statements.', '2026-11-06 11:28:50'),
(5, 1, 1, 'Python Programming', 'SK_PYTHON_CORE', 'Core Python scripting, object-oriented principles, data structures, and standard libraries.', '2026-11-06 11:28:50'),
(6, 4, NULL, 'Git & GitHub Version Control', 'SK_GIT_GITHUB', 'Distributed source control, branching strategies, merge conflict resolution, and collaborative PRs.', '2026-11-06 11:28:50'),
(7, 1, 1, 'Software Quality Assurance (Manual & Automated)', 'SK_QA_TESTING', 'Test case authoring, boundary value analysis, regression testing, and basic automation.', '2026-11-06 11:28:50'),
(8, 1, 1, 'Data Analysis with Pandas & Excel', 'SK_DATA_ANALYSIS', 'Data cleaning, tabular transformation, exploratory descriptive statistics, and visualization.', '2026-11-06 11:28:50'),
(9, 1, 1, 'Computer Networking & TCP/IP Basics', 'SK_NETWORKING', 'IP addressing, subnets, DNS, HTTP/HTTPS protocols, OSI model, and socket diagnostics.', '2026-11-06 11:28:50'),
(10, 1, 1, 'Cybersecurity Fundamentals & OWASP', 'SK_CYBER_OWASP', 'Web vulnerability mitigation (XSS, SQLi, CSRF), secure headers, and authentication security.', '2026-11-06 11:28:50'),
(11, 1, 2, 'Financial Accounting Principles', 'SK_FIN_ACC', 'Double-entry bookkeeping, journal ledgers, trial balance, and balance sheet preparation.', '2026-11-06 11:28:50'),
(12, 1, 2, 'Goods & Services Tax (GST) & Invoicing', 'SK_GST_TAX', 'GST registration classes, input tax credit (ITC) reconciliation, and electronic invoicing.', '2026-11-06 11:28:50'),
(13, 4, 2, 'Advanced MS Excel for Finance', 'SK_EXCEL_FIN', 'XLOOKUP, INDEX/MATCH, Pivot Tables, financial modeling functions (NPV/IRR), and charts.', '2026-11-06 11:28:50'),
(14, 1, 2, 'Financial Statement Analysis & Ratios', 'SK_RATIO_ANALYSIS', 'Liquidity, profitability, leverage, and turnover ratio calculations and interpretation.', '2026-11-06 11:28:50'),
(15, 4, 2, 'TallyPrime / ERP Accounting', 'SK_TALLY_ERP', 'Voucher entry, inventory tracking, payroll processing, and statutory compliance reporting.', '2026-11-06 11:28:50'),
(16, 9, 2, 'Corporate Banking & KYC Procedures', 'SK_BANKING_OPS', 'Commercial banking products, loan documentation, AML compliance, and KYC protocols.', '2026-11-06 11:28:50'),
(17, 2, 3, 'Patient Clinical Assessment & Triage', 'SK_NUR_ASSESS', 'Systematic physical assessment, vital sign interpretation, and emergency triage category rating.', '2026-11-06 11:28:50'),
(18, 1, 3, 'Pharmacology & Medication Administration', 'SK_NUR_PHARM', 'The 5/10 Rights of drug administration, dosage calculations, and IV drip titration.', '2026-11-06 11:28:50'),
(19, 2, 3, 'Infection Prevention & Aseptic Techniques', 'SK_NUR_INFECT', 'Strict hand hygiene, sterile PPE donning/doffing, catheter care, and isolation protocols.', '2026-11-06 11:28:50'),
(20, 2, 3, 'Basic Life Support (BLS) & CPR', 'SK_NUR_BLS', 'High-quality chest compressions, bag-valve mask ventilation, and AED operation.', '2026-11-06 11:28:50'),
(21, 1, 3, 'Critical Care & ICU Monitoring', 'SK_NUR_ICU', 'Ventilator basics, arterial line monitoring, central venous pressure, and vasoactive infusion.', '2026-11-06 11:28:50'),
(22, 9, 3, 'Nursing Ethics & Clinical Documentation', 'SK_NUR_ETHICS', 'SOAPIE clinical charting, patient consent documentation, medico-legal duty of care.', '2026-11-06 11:28:50'),
(23, 1, 4, 'Clinical Differential Diagnosis', 'SK_MED_DIAG', 'Structured patient history taking, physical sign elicitation, and diagnostic hypothesis generation.', '2026-11-06 11:28:50'),
(24, 1, 4, 'Evidence-Based Medicine & Therapeutics', 'SK_MED_THERAP', 'Clinical trial literature appraisal, guideline-directed pharmacotherapy, and antibiotic stewardship.', '2026-11-06 11:28:50'),
(25, 2, 4, 'Interpretation of Diagnostic Imaging & Labs', 'SK_MED_LABS', 'Systematic reading of Chest X-Rays, 12-lead ECGs, arterial blood gases, and metabolic panels.', '2026-11-06 11:28:50'),
(26, 4, 4, 'Medical Coding (ICD-10 & CPT)', 'SK_MED_CODING', 'Accurate clinical diagnosis mapping to ICD-10-CM codes and procedural reimbursement standards.', '2026-11-06 11:28:50'),
(27, 9, 4, 'Clinical Research Protocols & GCP', 'SK_MED_GCP', 'ICH-GCP guidelines, clinical trial phase monitoring, adverse event reporting, and IRB procedures.', '2026-11-06 11:28:50'),
(28, 2, 5, 'Crime Scene Physical Evidence Collection', 'SK_FOR_CSI', 'Grid/spiral search patterns, biological fluid preservation, and chain of custody documentation.', '2026-11-06 11:28:50'),
(29, 2, 5, 'Latent Fingerprint Analysis & Powdering', 'SK_FOR_PRINT', 'Dactyloscopy classification, powder/ninhydrin ridge lifting, and AFIS comparison.', '2026-11-06 11:28:50'),
(30, 2, 5, 'Forensic Toxicology & Chemical Screening', 'SK_FOR_TOX', 'Color spot tests, immunoassay screening, and chromatographic extraction for toxic agents.', '2026-11-06 11:28:50'),
(31, 4, 5, 'Digital Forensics & Drive Imaging', 'SK_FOR_DIGI', 'Forensic bit-stream disk imaging (dd/E01), write-blocker verification, and hash matching.', '2026-11-06 11:28:50'),
(32, 9, 5, 'Medico-Legal Chain of Custody & Courtroom Testimony', 'SK_FOR_CHAIN', 'Statutory evidence storage regulations, evidentiary integrity affidavits, and expert testimony.', '2026-11-06 11:28:50'),
(33, 4, 6, 'Computer-Aided Design (AutoCAD / SolidWorks)', 'SK_ENG_CAD', '2D geometric drafting, 3D solid modeling, orthographic dimensioning, and GD&T tolerances.', '2026-11-06 11:28:50'),
(34, 9, 6, 'Quality Assurance & ISO 9001 / Six Sigma', 'SK_ENG_QA', 'Process capability analysis (Cp/Cpk), root-cause 5-Whys, Pareto charts, and ISO audit prep.', '2026-11-06 11:28:50'),
(35, 1, 6, 'Programmable Logic Controllers (PLC) & Ladder Logic', 'SK_ENG_PLC', 'Industrial ladder diagram programming, digital/analog I/O wiring, and sensor interfacing.', '2026-11-06 11:28:50'),
(36, 2, 6, 'Electrical Circuit Diagnostics & Multimeter Testing', 'SK_ENG_CIRCUIT', 'Schematic tracing, continuity testing, three-phase power verification, and component testing.', '2026-11-06 11:28:50'),
(37, 2, 6, 'Preventive & Predictive Maintenance Planning', 'SK_ENG_MAINT', 'Equipment lubrication scheduling, vibration inspection, failure mode analysis (FMEA).', '2026-11-06 11:28:50'),
(38, 2, 11, 'Good Laboratory Practice (GLP) & Wet Lab Safety', 'SK_SCI_GLP', 'Chemical hazard labeling (GHS), reagent titration, precision pipetting, and autoclave sterilization.', '2026-11-06 11:28:50'),
(39, 2, 11, 'Spectrophotometry & Chromatography (HPLC/GC)', 'SK_SCI_INSTRUMENT', 'UV-Vis calibration, Beer-Lambert analysis, mobile phase prep, and chromatographic peak resolution.', '2026-11-06 11:28:50'),
(40, 1, 12, 'Molecular Biology & PCR Techniques', 'SK_SCI_PCR', 'DNA/RNA isolation, primer design considerations, thermal cycler amplification, and gel electrophoresis.', '2026-11-06 11:28:50'),
(41, 1, 9, 'Statistical Data Analysis (R / Python)', 'SK_SCI_STATS', 'Hypothesis testing (t-test, ANOVA), regression modeling, confidence intervals, and p-value inference.', '2026-11-06 11:28:50'),
(42, 5, NULL, 'Professional Written & Verbal Communication', 'SK_COMM_PROF', 'Structured email articulation, executive summaries, technical documentation, and presentation.', '2026-11-06 11:28:50'),
(43, 6, NULL, 'Structured Problem-Solving & Root Cause Analysis', 'SK_PROB_SOLV', 'Deconstructing complex challenges, fishbone diagrams, hypothesis formulation, and structured action.', '2026-11-06 11:28:50'),
(44, 7, NULL, 'Critical Thinking & Analytical Evaluation', 'SK_CRIT_THINK', 'Detecting cognitive biases, evaluating factual evidence, and discerning correlation vs causation.', '2026-11-06 11:28:50'),
(45, 8, NULL, 'Team Collaboration & Agile Coordination', 'SK_TEAM_AGILE', 'Active standup participation, constructive peer code/work reviews, and conflict mitigation.', '2026-11-06 11:28:50'),
(46, 9, NULL, 'Time & Task Priority Management', 'SK_TIME_MGMT', 'Eisenhower matrix prioritization, Pomodoro focus execution, sprint backlog management.', '2026-11-06 11:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

CREATE TABLE `skill_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`id`, `name`, `description`, `display_order`) VALUES
(1, 'Technical / Domain Skills', 'Core domain-specific knowledge and practical craft required for industry execution.', 1),
(2, 'Practical / Laboratory Skills', 'Hands-on clinical, laboratory, workshop, or technical instrument procedures.', 2),
(3, 'Academic Knowledge', 'Fundamental theoretical concepts, scientific principles, and governing equations.', 3),
(4, 'Digital Literacy & Software', 'Proficiency with modern industry tools, software suites, IDEs, and digital platforms.', 4),
(5, 'Communication Skills', 'Written technical reporting, stakeholder presentation, active listening, and client dialogue.', 5),
(6, 'Problem-Solving Skills', 'Algorithmic logic, quantitative debugging, diagnostic root-cause deduction.', 6),
(7, 'Critical Thinking', 'Evidence evaluation, data synthesis, assumption questioning, and risk appraisal.', 7),
(8, 'Teamwork & Collaboration', 'Cross-functional coordination, agile team participation, empathy, and professional ethics.', 8),
(9, 'Industry-Specific Skills', 'Regulatory compliance standards, audit guidelines, safety protocols, and industry frameworks.', 9);

-- --------------------------------------------------------

--
-- Table structure for table `skill_gap_analysis`
--

CREATE TABLE `skill_gap_analysis` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `job_role_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `current_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `required_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `gap_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=None, 1=Low, 2=Moderate, 3=High',
  `priority` enum('High','Medium','Low','None') NOT NULL DEFAULT 'Low',
  `recommended_action` text DEFAULT NULL,
  `calculated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_gap_analysis`
--

INSERT INTO `skill_gap_analysis` (`id`, `user_id`, `job_role_id`, `skill_id`, `current_level`, `required_level`, `gap_level`, `priority`, `recommended_action`, `calculated_at`) VALUES
(8, 7, 4, 8, 1, 4, 3, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:53:20'),
(9, 7, 4, 4, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:53:20'),
(10, 7, 4, 5, 1, 2, 1, 'Low', 'Desirable supplementary skill. Review after essential gaps are bridged.', '2026-11-06 11:53:20'),
(11, 7, 4, 13, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:53:20'),
(12, 7, 4, 44, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:53:20'),
(13, 7, 1, 1, 1, 4, 3, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:54:47'),
(14, 7, 1, 2, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:54:47'),
(15, 7, 1, 3, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:54:47'),
(16, 7, 1, 4, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 11:54:47'),
(17, 7, 1, 6, 1, 2, 1, 'Medium', 'Targeted practice required to upgrade from baseline to required depth.', '2026-11-06 11:54:47'),
(18, 7, 1, 10, 1, 2, 1, 'Low', 'Desirable supplementary skill. Review after essential gaps are bridged.', '2026-11-06 11:54:47'),
(19, 7, 1, 42, 1, 2, 1, 'Low', 'Desirable supplementary skill. Review after essential gaps are bridged.', '2026-11-06 11:54:47'),
(20, 7, 2, 5, 1, 4, 3, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 12:24:59'),
(21, 7, 2, 4, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 12:24:59'),
(22, 7, 2, 6, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 12:24:59'),
(23, 7, 2, 8, 1, 3, 2, 'Medium', 'Valuable secondary domain skill. Schedule structured learning modules.', '2026-11-06 12:24:59'),
(24, 7, 2, 43, 1, 3, 2, 'High', 'Essential core capability missing. Prioritize immediate foundational training.', '2026-11-06 12:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` int(10) UNSIGNED NOT NULL,
  `education_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `education_category_id`, `name`, `code`) VALUES
(1, 1, 'Software Engineering', 'CS_SE'),
(2, 1, 'Web Technologies & Full Stack', 'CS_WEB'),
(3, 1, 'Data Science & Machine Learning', 'CS_DS'),
(4, 1, 'Cybersecurity & Forensics', 'CS_CYBER'),
(5, 1, 'Cloud & Systems Administration', 'CS_CLOUD'),
(6, 2, 'Accounting & Finance', 'COM_ACC'),
(7, 2, 'Banking & Insurance', 'COM_BANK'),
(8, 2, 'Corporate Taxation & GST', 'COM_TAX'),
(9, 2, 'Financial Markets & Analysis', 'COM_FIN'),
(10, 3, 'General Nursing & Midwifery (GNM)', 'NUR_GEN'),
(11, 3, 'Critical Care & ICU Nursing', 'NUR_ICU'),
(12, 3, 'Emergency & Trauma Care', 'NUR_ER'),
(13, 3, 'Community Health & Preventive Care', 'NUR_COM'),
(14, 4, 'General Clinical Practice', 'MBBS_GEN'),
(15, 4, 'Public Health & Epidemiology', 'MBBS_PUB'),
(16, 4, 'Clinical Research & Trials', 'MBBS_RES'),
(17, 4, 'Hospital Administration & Quality', 'MBBS_ADMIN'),
(18, 5, 'Forensic Biology & Serology', 'FOR_BIO'),
(19, 5, 'Crime Scene Investigation & Physical Evidence', 'FOR_CSI'),
(20, 5, 'Forensic Toxicology & Chemistry', 'FOR_TOX'),
(21, 5, 'Digital & Cyber Forensics', 'FOR_DIGI'),
(22, 6, 'Computer Science & Engineering', 'BT_CSE'),
(23, 6, 'Mechanical Engineering', 'BT_MECH'),
(24, 6, 'Electrical & Electronics Engineering', 'BT_EEE'),
(25, 6, 'Civil & Infrastructure Engineering', 'BT_CIVIL'),
(26, 7, 'Application & Mobile Development', 'BCA_APP'),
(27, 7, 'Database Systems & Analytics', 'BCA_DB'),
(28, 8, 'Marketing Management', 'BBA_MKT'),
(29, 8, 'Human Resource Management', 'BBA_HR'),
(30, 8, 'Finance & Investment', 'BBA_FIN'),
(31, 9, 'Applied Statistics & Data Science', 'MATH_STAT'),
(32, 10, 'Electronics & Computational Physics', 'PHYS_COMP'),
(33, 11, 'Analytical & Industrial Chemistry', 'CHEM_ANAL'),
(34, 12, 'Molecular Biology & Genetic Engineering', 'BIO_GEN'),
(35, 13, 'Journalism & Mass Communication', 'BA_JOUR'),
(36, 14, 'Mechanical & Production Technology', 'DIP_MECH'),
(37, 14, 'Electrical & Instrumentation', 'DIP_ELEC');

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `education_category_id` int(10) UNSIGNED NOT NULL,
  `specialization_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_specialization` varchar(150) DEFAULT NULL,
  `college_university` varchar(200) NOT NULL,
  `graduation_year` int(10) UNSIGNED NOT NULL,
  `bio_summary` text DEFAULT NULL,
  `technical_knowledge` text DEFAULT NULL,
  `interests` text DEFAULT NULL,
  `projects` text DEFAULT NULL,
  `internships` text DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `learning_hours_per_week` int(10) UNSIGNED DEFAULT 10,
  `profile_completed` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_profiles`
--

INSERT INTO `student_profiles` (`id`, `user_id`, `education_category_id`, `specialization_id`, `custom_specialization`, `college_university`, `graduation_year`, `bio_summary`, `technical_knowledge`, `interests`, `projects`, `internships`, `certifications`, `learning_hours_per_week`, `profile_completed`, `created_at`, `updated_at`) VALUES
(6, 7, 1, NULL, NULL, 'gayatri vidya parishad', 2027, NULL, NULL, 'web development', NULL, NULL, NULL, 10, 1, '2026-11-06 11:52:06', '2026-11-06 11:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `student_reports`
--

CREATE TABLE `student_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `report_uuid` varchar(64) NOT NULL,
  `job_role_id` int(10) UNSIGNED NOT NULL,
  `readiness_score` decimal(5,2) NOT NULL DEFAULT 0.00,
  `summary_json` longtext NOT NULL,
  `generated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_resource_progress`
--

CREATE TABLE `student_resource_progress` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `status` enum('not_started','in_progress','completed') DEFAULT 'not_started',
  `notes` text DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_skills`
--

CREATE TABLE `student_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `self_rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Beginner, 2=Basic, 3=Intermediate, 4=Advanced',
  `assessed_rating` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Calculated from quiz/test',
  `evaluated_rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Final combined rating',
  `last_assessed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `mobile`, `password_hash`, `role`, `status`, `reset_token`, `reset_expires_at`, `created_at`, `updated_at`) VALUES
(1, 'System Administrator', 'admin@careerfinder.local', '9876543210', '$2y$10$PTV1iz/8p0qXxRgTc72A7uSYzusPBWSjlK8BV2C57grqKYtIRxXRO', 'admin', 'active', NULL, NULL, '2026-11-06 11:28:50', '2026-11-06 11:28:50'),
(7, 'ella jahnavi', 'jahnaviella18@gmail.com', '8121149258', '$2y$10$mXLH6FHG4qbnrRpgI31fi.wpnj3q5oqJcC6kjKFM4AfzySYgHoTtK', 'student', 'active', NULL, NULL, '2026-11-06 11:52:06', '2026-11-06 11:52:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aal_admin` (`admin_user_id`);

--
-- Indexes for table `assessment_answers`
--
ALTER TABLE `assessment_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ans_att` (`attempt_id`),
  ADD KEY `fk_ans_q` (`question_id`);

--
-- Indexes for table `assessment_attempts`
--
ALTER TABLE `assessment_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_att_user` (`user_id`);

--
-- Indexes for table `assessment_options`
--
ALTER TABLE `assessment_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_opt_q` (`question_id`);

--
-- Indexes for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aq_skill` (`skill_id`),
  ADD KEY `idx_aq_edu` (`education_category_id`);

--
-- Indexes for table `career_categories`
--
ALTER TABLE `career_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `education_categories`
--
ALTER TABLE `education_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `job_required_skills`
--
ALTER TABLE `job_required_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jrs_role` (`job_role_id`),
  ADD KEY `idx_jrs_skill` (`skill_id`);

--
-- Indexes for table `job_roles`
--
ALTER TABLE `job_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_job_cat` (`career_category_id`),
  ADD KEY `idx_job_edu` (`primary_education_category_id`);

--
-- Indexes for table `learning_resources`
--
ALTER TABLE `learning_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_res_skill` (`skill_id`);

--
-- Indexes for table `learning_roadmaps`
--
ALTER TABLE `learning_roadmaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lr_user` (`user_id`),
  ADD KEY `fk_lr_role` (`job_role_id`);

--
-- Indexes for table `preferred_job_roles`
--
ALTER TABLE `preferred_job_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pjr_user` (`user_id`),
  ADD KEY `fk_pjr_role` (`job_role_id`);

--
-- Indexes for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rt_week` (`week_id`),
  ADD KEY `fk_rt_skill` (`skill_id`),
  ADD KEY `fk_rt_res` (`resource_id`);

--
-- Indexes for table `roadmap_weeks`
--
ALTER TABLE `roadmap_weeks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rw_map` (`roadmap_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_skill_cat` (`category_id`),
  ADD KEY `idx_skill_edu` (`education_category_id`);

--
-- Indexes for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_gap_analysis`
--
ALTER TABLE `skill_gap_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sga_user_role` (`user_id`,`job_role_id`),
  ADD KEY `fk_sga_role` (`job_role_id`),
  ADD KEY `fk_sga_skill` (`skill_id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_spec_edu` (`education_category_id`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `fk_profile_edu` (`education_category_id`);

--
-- Indexes for table `student_reports`
--
ALTER TABLE `student_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_uuid` (`report_uuid`),
  ADD KEY `idx_rep_user` (`user_id`),
  ADD KEY `fk_rep_role` (`job_role_id`);

--
-- Indexes for table `student_resource_progress`
--
ALTER TABLE `student_resource_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_res` (`user_id`,`resource_id`),
  ADD KEY `fk_srp_res` (`resource_id`);

--
-- Indexes for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_skill` (`user_id`,`skill_id`),
  ADD KEY `fk_ss_skill` (`skill_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_user_email` (`email`),
  ADD KEY `idx_user_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assessment_answers`
--
ALTER TABLE `assessment_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_attempts`
--
ALTER TABLE `assessment_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessment_options`
--
ALTER TABLE `assessment_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `career_categories`
--
ALTER TABLE `career_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `education_categories`
--
ALTER TABLE `education_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `job_required_skills`
--
ALTER TABLE `job_required_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `job_roles`
--
ALTER TABLE `job_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `learning_resources`
--
ALTER TABLE `learning_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `learning_roadmaps`
--
ALTER TABLE `learning_roadmaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `preferred_job_roles`
--
ALTER TABLE `preferred_job_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `roadmap_weeks`
--
ALTER TABLE `roadmap_weeks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `skill_categories`
--
ALTER TABLE `skill_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `skill_gap_analysis`
--
ALTER TABLE `skill_gap_analysis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `student_profiles`
--
ALTER TABLE `student_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_reports`
--
ALTER TABLE `student_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_resource_progress`
--
ALTER TABLE `student_resource_progress`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_skills`
--
ALTER TABLE `student_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD CONSTRAINT `fk_aal_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_answers`
--
ALTER TABLE `assessment_answers`
  ADD CONSTRAINT `fk_ans_att` FOREIGN KEY (`attempt_id`) REFERENCES `assessment_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ans_q` FOREIGN KEY (`question_id`) REFERENCES `assessment_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_attempts`
--
ALTER TABLE `assessment_attempts`
  ADD CONSTRAINT `fk_att_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_options`
--
ALTER TABLE `assessment_options`
  ADD CONSTRAINT `fk_opt_q` FOREIGN KEY (`question_id`) REFERENCES `assessment_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD CONSTRAINT `fk_aq_edu` FOREIGN KEY (`education_category_id`) REFERENCES `education_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_aq_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_required_skills`
--
ALTER TABLE `job_required_skills`
  ADD CONSTRAINT `fk_jrs_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jrs_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_roles`
--
ALTER TABLE `job_roles`
  ADD CONSTRAINT `fk_job_cat` FOREIGN KEY (`career_category_id`) REFERENCES `career_categories` (`id`),
  ADD CONSTRAINT `fk_job_edu` FOREIGN KEY (`primary_education_category_id`) REFERENCES `education_categories` (`id`);

--
-- Constraints for table `learning_resources`
--
ALTER TABLE `learning_resources`
  ADD CONSTRAINT `fk_res_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `learning_roadmaps`
--
ALTER TABLE `learning_roadmaps`
  ADD CONSTRAINT `fk_lr_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lr_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `preferred_job_roles`
--
ALTER TABLE `preferred_job_roles`
  ADD CONSTRAINT `fk_pjr_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pjr_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD CONSTRAINT `fk_rt_res` FOREIGN KEY (`resource_id`) REFERENCES `learning_resources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_rt_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_rt_week` FOREIGN KEY (`week_id`) REFERENCES `roadmap_weeks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roadmap_weeks`
--
ALTER TABLE `roadmap_weeks`
  ADD CONSTRAINT `fk_rw_map` FOREIGN KEY (`roadmap_id`) REFERENCES `learning_roadmaps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `fk_skill_cat` FOREIGN KEY (`category_id`) REFERENCES `skill_categories` (`id`),
  ADD CONSTRAINT `fk_skill_edu` FOREIGN KEY (`education_category_id`) REFERENCES `education_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `skill_gap_analysis`
--
ALTER TABLE `skill_gap_analysis`
  ADD CONSTRAINT `fk_sga_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sga_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sga_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `fk_spec_edu` FOREIGN KEY (`education_category_id`) REFERENCES `education_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `fk_profile_edu` FOREIGN KEY (`education_category_id`) REFERENCES `education_categories` (`id`),
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_reports`
--
ALTER TABLE `student_reports`
  ADD CONSTRAINT `fk_rep_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rep_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_resource_progress`
--
ALTER TABLE `student_resource_progress`
  ADD CONSTRAINT `fk_srp_res` FOREIGN KEY (`resource_id`) REFERENCES `learning_resources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_srp_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD CONSTRAINT `fk_ss_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ss_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
