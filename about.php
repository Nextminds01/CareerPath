<?php
/**
 * About Us & Problem Statement Overview
 */
$pageTitle = "About Us & Vision";
$activeNav = 'about';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/functions.php';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/navbar.php';
?>

<div class="py-5" style="background: linear-gradient(180deg, #FFFFFF 0%, #F0F8F4 100%); border-bottom: 1px solid var(--border-color);">
    <div class="container py-3 text-center">
        <span class="badge badge-soft-primary px-3 py-1 mb-2">Platform Mission & Vision</span>
        <h1 class="display-5 fw-extrabold mb-3">Empowering Every Student Toward Career Clarity</h1>
        <p class="lead text-secondary mx-auto" style="max-width: 700px;">
            A centralized platform bridging the critical gap between academic curriculum, industry requirements, and verified free educational resources.
        </p>
    </div>
</div>

<div class="container py-5">
    <div class="row g-5">
        <div class="col-lg-6">
            <h3 class="fw-bold mb-3 text-dark">The Real-World Problem</h3>
            <p class="text-secondary">
                Millions of higher-education students graduate every year with deep uncertainty regarding their actual industry preparedness. While conventional job boards provide generic postings, they fail to answer fundamental student questions:
            </p>
            <ul class="text-secondary ps-3 mb-4">
                <li class="mb-2"><strong>Educational Disconnect:</strong> What specific job roles match my degree and specialization?</li>
                <li class="mb-2"><strong>Hidden Skill Requirements:</strong> What modern technical and practical capabilities do employers actually look for?</li>
                <li class="mb-2"><strong>Subjective Self-Perception:</strong> How does my self-assessment compare to objective, scenario-based evaluation?</li>
                <li class="mb-2"><strong>Financial Barriers:</strong> Why pay exorbitant course fees when world-class, certified education exists completely free?</li>
                <li class="mb-2"><strong>Absence of Structure:</strong> What sequential roadmap should I follow week by week to bridge my deficits?</li>
            </ul>

            <div class="card p-3 border-start border-4 border-success bg-white shadow-sm mb-4">
                <div class="d-flex align-items-center gap-3">
                    <i class="bi bi-lightbulb-fill text-success fs-3"></i>
                    <div>
                        <h6 class="fw-bold mb-1">Our Proposed Solution</h6>
                        <p class="small text-muted mb-0">
                            A complete personalized pipeline: Profile &rarr; Multi-Disciplinary Assessment &rarr; Career Exploration &rarr; Skill Gap Calculation &rarr; Free Learning Matching &rarr; Adaptive Roadmap &rarr; Career Readiness Dossier.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card p-4 shadow-sm border-0 bg-white">
                <h4 class="fw-bold mb-3">Core Pillars of Innovation</h4>
                
                <div class="d-flex gap-3 mb-3">
                    <div class="stat-icon flex-shrink-0" style="width: 44px; height: 44px;">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-1">Multi-Disciplinary Guidance</h6>
                        <p class="text-muted small mb-0">
                            Designed from the ground up for Computer Science, Commerce, Nursing, Medicine (MBBS), Forensic Science, Basic Sciences, and Engineering.
                        </p>
                    </div>
                </div>

                <div class="d-flex gap-3 mb-3">
                    <div class="stat-icon flex-shrink-0" style="width: 44px; height: 44px;">
                        <i class="bi bi-sliders"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-1">Evidence-Based Assessment</h6>
                        <p class="text-muted small mb-0">
                            Replaces purely self-reported inflated ratings with combined evaluation metrics factoring in MCQ challenges and diagnostic problem-solving.
                        </p>
                    </div>
                </div>

                <div class="d-flex gap-3 mb-3">
                    <div class="stat-icon flex-shrink-0" style="width: 44px; height: 44px;">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-1">Genuinely Free Educational Resources</h6>
                        <p class="text-muted small mb-0">
                            Strict curation of verified free courses from freeCodeCamp, SWAYAM, NPTEL, Khan Academy, MIT OpenCourseWare, and Microsoft Learn.
                        </p>
                    </div>
                </div>

                <div class="d-flex gap-3">
                    <div class="stat-icon flex-shrink-0" style="width: 44px; height: 44px;">
                        <i class="bi bi-file-earmark-pdf-fill"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-1">Downloadable Career Dossier</h6>
                        <p class="text-muted small mb-0">
                            Instant printable, structured portfolio report showing quantified readiness score, gap priorities, and active milestones.
                        </p>
                    </div>
                </div>
            </div>

            <div class="regulatory-alert mt-4">
                <h6 class="fw-bold mb-1"><i class="bi bi-info-circle-fill me-1"></i> Transparent Regulatory Compliance Notice</h6>
                <p class="small mb-0">
                    For statutory and regulated professions (e.g. Registered Nursing under State Nursing Councils, MBBS medical practice under the National Medical Commission), this platform assesses educational competencies and gap identification. It does not replace statutory degree licensing, clinical council registration, or competitive recruitment examinations.
                </p>
            </div>
        </div>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

