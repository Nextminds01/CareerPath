<?php
/**
 * Interactive How It Works Explainer
 */
$pageTitle = "How CareerPath Works";
$activeNav = 'how_it_works';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/functions.php';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/navbar.php';
?>

<div class="py-5" style="background: linear-gradient(180deg, #FFFFFF 0%, #F0F8F4 100%); border-bottom: 1px solid var(--border-color);">
    <div class="container py-2 text-center">
        <span class="badge badge-soft-primary px-3 py-1 mb-2">Complete Student Journey</span>
        <h1 class="display-6 fw-extrabold mb-2">From Academic Degree to Career Ready</h1>
        <p class="text-secondary mx-auto" style="max-width: 680px;">
            Explore the comprehensive 10-stage evidence-based methodology designed to guide students toward their ideal professional careers.
        </p>
    </div>
</div>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <!-- Timeline / Stepper -->
            <div class="position-relative">
                
                <!-- Stage 1 -->
                <div class="card p-3 p-sm-4 mb-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--light-emerald); color: var(--primary-emerald); font-weight: 800; font-size: 1.2rem;">
                            01
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Discipline Registration & Profile Creation</h5>
                                <span class="badge badge-soft-primary">Foundation</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                Students register with their specific qualification (e.g., BSc CS, BCom, Nursing, MBBS, Forensic Science, Engineering). The system dynamically tunes all questions, skills, and roadmaps to their discipline.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Captures graduation year, technical projects, and weekly available learning hours.</span>
                        </div>
                    </div>
                </div>

                <!-- Stage 2 -->
                <div class="card p-3 p-sm-4 mb-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--light-emerald); color: var(--primary-emerald); font-weight: 800; font-size: 1.2rem;">
                            02
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Interactive Skill Assessment</h5>
                                <span class="badge badge-soft-info">Diagnostic</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                Rather than relying entirely on self-ratings, students complete domain-specific multiple choice questions and scenario-based diagnostic evaluations.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Transparent 4-level scale: Beginner (1), Basic (2), Intermediate (3), and Advanced (4).</span>
                        </div>
                    </div>
                </div>

                <!-- Stage 3 -->
                <div class="card p-3 p-sm-4 mb-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--light-emerald); color: var(--primary-emerald); font-weight: 800; font-size: 1.2rem;">
                            03
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Career Recommendation & Match Logic</h5>
                                <span class="badge badge-soft-success">Guidance</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                The recommendation engine matches evaluated competencies, interests, and degree qualifications against industry job descriptions with clear match rationales.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Regulated professions (Nursing, MBBS) include statutory council registration notices.</span>
                        </div>
                    </div>
                </div>

                <!-- Stage 4 -->
                <div class="card p-3 p-sm-4 mb-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--light-emerald); color: var(--primary-emerald); font-weight: 800; font-size: 1.2rem;">
                            04
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Skill Gap Analysis & Prioritization</h5>
                                <span class="badge badge-soft-warning">Analysis</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                For any target job role, the system calculates gaps ($\text{Required} - \text{Evaluated}$) and prioritizes High, Medium, and Low focus areas based on skill essentiality.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Transparent mathematical formula with clear breakdown table.</span>
                        </div>
                    </div>
                </div>

                <!-- Stage 5 -->
                <div class="card p-3 p-sm-4 mb-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--light-emerald); color: var(--primary-emerald); font-weight: 800; font-size: 1.2rem;">
                            05
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Free Learning Finder & Adaptive Roadmaps</h5>
                                <span class="badge badge-soft-primary">Execution</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                Each missing skill connects directly to verified free courses (freeCodeCamp, NPTEL, SWAYAM, MIT OCW). Students generate customizable 4, 8, 12, or 16-week structured roadmaps.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Tracks weekly milestones, mini-projects, and verified completion badges.</span>
                        </div>
                    </div>
                </div>

                <!-- Stage 6 -->
                <div class="card p-3 p-sm-4 border-0 shadow-sm">
                    <div class="d-flex align-items-start gap-3 gap-sm-4">
                        <div class="rounded-circle d-flex align-items-center justify-content-center flex-shrink-0" style="width: 48px; height: 48px; background: var(--dark-midnight); color: #FFFFFF; font-weight: 800; font-size: 1.2rem;">
                            06
                        </div>
                        <div class="flex-grow-1" style="min-width: 0;">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <h5 class="fw-bold mb-0 text-dark">Progress Tracking & Downloadable Dossier</h5>
                                <span class="badge badge-soft-success">Outcome</span>
                            </div>
                            <p class="text-secondary small mb-2 text-break">
                                Track skills improved, update learning task completion, retake assessments to verify growth, and export a 12-section professional Career Readiness Report to PDF.
                            </p>
                            <span class="text-muted small"><i class="bi bi-check2 text-success me-1"></i> Instant 1-click print or PDF save with verification timestamp.</span>
                        </div>
                    </div>
                </div>

            </div>

            <!-- CTA -->
            <div class="text-center mt-5">
                <a href="<?= BASE_URL ?>auth/register.php" class="btn btn-emerald btn-lg px-5 py-3 shadow">
                    <i class="bi bi-rocket-takeoff-fill me-2"></i> Start Your Personalized Journey Now
                </a>
            </div>
        </div>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

