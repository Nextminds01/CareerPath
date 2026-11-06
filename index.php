<?php
/**
 * Modern Public Homepage
 * CareerPath – Your Skills, Your Future
 */
$pageTitle = "CareerPath – Your Skills, Your Future";
$activeNav = 'home';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/functions.php';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/navbar.php';

$pdo = getDBConnection();

// Fetch counts for social proof
$studentCount = $pdo->query("SELECT COUNT(*) FROM users WHERE role = 'student'")->fetchColumn();
$careerCount = $pdo->query("SELECT COUNT(*) FROM job_roles WHERE is_active = 1")->fetchColumn();
$resourceCount = $pdo->query("SELECT COUNT(*) FROM learning_resources WHERE is_verified = 1")->fetchColumn();
$eduCategories = $pdo->query("SELECT * FROM education_categories ORDER BY id ASC LIMIT 12")->fetchAll();
?>

<!-- HERO SECTION -->
<section class="py-5" style="background: linear-gradient(180deg, #FFFFFF 0%, #F0F8F4 100%); border-bottom: 1px solid var(--border-color);">
    <div class="container py-lg-4">
        <div class="row justify-content-center">
            <div class="col-lg-9 col-xl-8 text-center">
                <div class="d-inline-flex align-items-center gap-2 px-3 py-1 mb-3 rounded-pill" style="background: var(--light-emerald); color: var(--primary-emerald); font-weight: 600; font-size: 0.85rem; border: 1px solid rgba(8, 127, 91, 0.2);">
                    <i class="bi bi-patch-check-fill"></i>
                    <span>Evidence-Based Career Guidance Platform</span>
                </div>
                <h1 class="display-4 fw-extrabold mb-3" style="color: var(--dark-midnight); line-height: 1.15;">
                    Discover Your Potential. <br>
                    <span style="color: var(--primary-emerald);">Build Your Future.</span>
                </h1>
                <p class="lead text-secondary mb-4 mx-auto" style="max-width: 680px; font-size: 1.15rem;">
                    Assess your skills, explore suitable career opportunities, identify skill gaps, and become career-ready through personalized learning roadmaps and free educational resources.
                </p>
                <div class="d-flex flex-wrap justify-content-center gap-3 mb-4">
                    <a href="<?= BASE_URL ?>auth/register.php" class="btn btn-emerald btn-lg px-4 py-3 shadow-sm">
                        <i class="bi bi-lightning-charge-fill me-1"></i> Start Skill Assessment
                    </a>
                    <a href="<?= BASE_URL ?>careers.php" class="btn btn-outline-emerald btn-lg px-4 py-3">
                        <i class="bi bi-compass me-1"></i> Explore Career Paths
                    </a>
                </div>
                <div class="d-flex justify-content-center align-items-center gap-4 text-muted small pt-2 flex-wrap">
                    <div class="d-flex align-items-center gap-2">
                        <i class="bi bi-check-circle-fill text-success fs-5"></i>
                        <span>100% Free Resources</span>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <i class="bi bi-check-circle-fill text-success fs-5"></i>
                        <span>Multi-Disciplinary</span>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <i class="bi bi-check-circle-fill text-success fs-5"></i>
                        <span>Downloadable Reports</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- HOW IT WORKS SECTION -->
<section class="py-5" style="background: #FFFFFF;">
    <div class="container py-4">
        <div class="text-center mb-5">
            <span class="badge badge-soft-primary px-3 py-1 mb-2">Step-by-Step Methodology</span>
            <h2 class="fw-extrabold">How CareerPath Guides Your Journey</h2>
            <p class="text-secondary mx-auto" style="max-width: 650px;">
                From uncertainty about your educational degree to an evidence-based roadmap with verified free learning resources.
            </p>
        </div>

        <div class="row g-4">
            <!-- Step 1 -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 p-4 card-hover text-center">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-3" style="width: 58px; height: 58px; background: var(--light-emerald); color: var(--primary-emerald); font-size: 1.4rem; font-weight: 800;">
                        1
                    </div>
                    <h5 class="fw-bold mb-2">Profile & Discipline</h5>
                    <p class="text-muted small">
                        Register with your specific qualification—CS, Commerce, Nursing, MBBS, Forensic Science, or Engineering.
                    </p>
                </div>
            </div>

            <!-- Step 2 -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 p-4 card-hover text-center">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-3" style="width: 58px; height: 58px; background: var(--light-emerald); color: var(--primary-emerald); font-size: 1.4rem; font-weight: 800;">
                        2
                    </div>
                    <h5 class="fw-bold mb-2">Interactive Quiz & Self-Rating</h5>
                    <p class="text-muted small">
                        Take a dynamic, discipline-tailored assessment combining self-rating with objective scenario questions.
                    </p>
                </div>
            </div>

            <!-- Step 3 -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 p-4 card-hover text-center">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-3" style="width: 58px; height: 58px; background: var(--light-emerald); color: var(--primary-emerald); font-size: 1.4rem; font-weight: 800;">
                        3
                    </div>
                    <h5 class="fw-bold mb-2">Skill Gap Analysis</h5>
                    <p class="text-muted small">
                        Select your preferred career. The system calculates exact missing skills, priority levels, and match percentages.
                    </p>
                </div>
            </div>

            <!-- Step 4 -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 p-4 card-hover text-center">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-3" style="width: 58px; height: 58px; background: var(--light-emerald); color: var(--primary-emerald); font-size: 1.4rem; font-weight: 800;">
                        4
                    </div>
                    <h5 class="fw-bold mb-2">Roadmap & Free Learning</h5>
                    <p class="text-muted small">
                        Follow a structured 4 to 16-week adaptive roadmap powered by verified courses from freeCodeCamp, NPTEL, and SWAYAM.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- MULTI-DISCIPLINARY DISCIPLINES SUPPORTED -->
<section class="py-5" style="background: var(--main-bg); border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color);">
    <div class="container py-4">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8">
                <span class="badge badge-soft-success px-3 py-1 mb-2">Not Just for Computer Science</span>
                <h2 class="fw-extrabold">Supported Educational Disciplines</h2>
                <p class="text-secondary mb-0">
                    Dynamic recommendations adapted specifically to each degree with regulatory notices for regulated professions.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                <a href="<?= BASE_URL ?>careers.php" class="btn btn-outline-emerald">
                    View All Supported Careers <i class="bi bi-arrow-right ms-1"></i>
                </a>
            </div>
        </div>

        <div class="row g-3">
            <?php foreach ($eduCategories as $cat): ?>
                <div class="col-md-6 col-lg-4">
                    <div class="card p-3 card-hover h-100">
                        <div class="d-flex align-items-start gap-3">
                            <div class="stat-icon flex-shrink-0" style="width: 44px; height: 44px; font-size: 1.3rem;">
                                <i class="bi <?= htmlspecialchars($cat['icon'] ?: 'bi-mortarboard') ?>"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold mb-1 text-dark"><?= htmlspecialchars($cat['name']) ?></h6>
                                <p class="text-muted small mb-2 text-truncate-2" style="font-size: 0.8rem;">
                                    <?= htmlspecialchars($cat['description']) ?>
                                </p>
                                <?php if ($cat['is_regulated']): ?>
                                    <span class="badge badge-soft-warning small" style="font-size: 0.72rem;">
                                        <i class="bi bi-shield-exclamation me-1"></i> Regulated Profession
                                    </span>
                                <?php else: ?>
                                    <span class="badge badge-soft-secondary small" style="font-size: 0.72rem;">
                                        <i class="bi bi-check2-circle me-1"></i> Industry Guided
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- CALL TO ACTION -->
<section class="py-5" style="background: var(--dark-midnight); color: #FFFFFF;">
    <div class="container py-4 text-center">
        <h2 class="display-6 fw-bold text-white mb-3">Bridge Your Career Gap Today</h2>
        <p class="text-light opacity-75 mx-auto mb-4" style="max-width: 600px; font-size: 1.1rem;">
            Join fellow students who transformed uncertainty into structured action with verified free learning roadmaps.
        </p>
        <div class="d-flex justify-content-center gap-3 flex-wrap">
            <a href="<?= BASE_URL ?>auth/register.php" class="btn btn-emerald btn-lg px-4 py-3">
                <i class="bi bi-person-plus-fill me-1"></i> Create Free Account
            </a>
            <a href="<?= BASE_URL ?>auth/login.php" class="btn btn-outline-light btn-lg px-4 py-3">
                <i class="bi bi-box-arrow-in-right me-1"></i> Student Login
            </a>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="py-5" style="background: #FFFFFF; border-top: 1px solid var(--border-color);">
    <div class="container">
        <div class="row g-4 mb-4">
            <div class="col-lg-5">
                <div class="brand-logo mb-3">
                    <div class="brand-icon">
                        <i class="bi bi-compass"></i>
                    </div>
                    <span>Career<span class="accent">Path</span></span>
                </div>
                <p class="text-muted small mb-3" style="max-width: 440px;">
                    CareerPath – Your Skills, Your Future. An evidence-based career guidance platform bridging academic qualification, industry requirements, and verified free educational resources.
                </p>
                <div class="text-muted small">
                    &copy; <?= date('Y') ?> CareerPath. All rights reserved.
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <h6 class="fw-bold mb-3 text-dark">Platform Navigation</h6>
                <ul class="list-unstyled small">
                    <li class="mb-2"><a href="<?= BASE_URL ?>index.php" class="text-secondary">Home</a></li>
                    <li class="mb-2"><a href="<?= BASE_URL ?>about.php" class="text-secondary">About Us</a></li>
                    <li class="mb-2"><a href="<?= BASE_URL ?>careers.php" class="text-secondary">Explore Careers</a></li>
                    <li class="mb-2"><a href="<?= BASE_URL ?>how-it-works.php" class="text-secondary">How It Works</a></li>
                    <li class="mb-2"><a href="<?= BASE_URL ?>learning.php" class="text-secondary">Free Learning</a></li>
                </ul>
            </div>
            <div class="col-6 col-lg-4">
                <h6 class="fw-bold mb-3 text-dark">Free Learning Partners</h6>
                <ul class="list-unstyled small text-secondary">
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> freeCodeCamp</li>
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> SWAYAM & NPTEL</li>
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> Khan Academy</li>
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> MIT OpenCourseWare</li>
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> Microsoft Learn</li>
                    <li class="mb-1"><i class="bi bi-check2 text-success me-1"></i> Cisco Networking Academy</li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

