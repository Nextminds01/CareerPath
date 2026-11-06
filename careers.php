<?php
/**
 * Public Career Paths Explorer
 */
$pageTitle = "Explore Career Paths";
$activeNav = 'careers';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/functions.php';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/navbar.php';

$pdo = getDBConnection();

// Filters
$selectedEdu = isset($_GET['edu']) && is_numeric($_GET['edu']) ? (int)$_GET['edu'] : 0;
$search = isset($_GET['q']) ? trim($_GET['q']) : '';

// Fetch education categories for the dropdown filter
$eduCategories = $pdo->query("SELECT * FROM education_categories ORDER BY name ASC")->fetchAll();

// Build query for job roles
$sql = "
    SELECT jr.*, ec.name AS edu_name, ec.is_regulated, ec.regulatory_notice, cc.name AS cat_name, cc.icon AS cat_icon
    FROM job_roles jr
    JOIN education_categories ec ON jr.primary_education_category_id = ec.id
    JOIN career_categories cc ON jr.career_category_id = cc.id
    WHERE jr.is_active = 1
";
$params = [];

if ($selectedEdu > 0) {
    $sql .= " AND jr.primary_education_category_id = ?";
    $params[] = $selectedEdu;
}

if (!empty($search)) {
    $sql .= " AND (jr.title LIKE ? OR jr.short_description LIKE ? OR jr.industry_domain LIKE ?)";
    $like = "%$search%";
    $params[] = $like;
    $params[] = $like;
    $params[] = $like;
}

$sql .= " ORDER BY ec.name ASC, jr.title ASC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$roles = $stmt->fetchAll();
?>

<div class="py-5" style="background: linear-gradient(180deg, #FFFFFF 0%, #F0F8F4 100%); border-bottom: 1px solid var(--border-color);">
    <div class="container py-2 text-center">
        <span class="badge badge-soft-primary px-3 py-1 mb-2">Explore Opportunities</span>
        <h1 class="display-6 fw-extrabold mb-2">Multi-Disciplinary Career Directory</h1>
        <p class="text-secondary mx-auto mb-4" style="max-width: 650px;">
            Explore suitable career roles across engineering, commerce, software, healthcare, and forensic science.
        </p>

        <!-- Search & Filter Form -->
        <form method="GET" action="careers.php" class="row g-2 justify-content-center mx-auto" style="max-width: 800px;">
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" name="q" class="form-control border-start-0" placeholder="Search by role, keyword..." value="<?= htmlspecialchars($search) ?>">
                </div>
            </div>
            <div class="col-md-5">
                <select name="edu" class="form-select">
                    <option value="0">All Educational Disciplines</option>
                    <?php foreach ($eduCategories as $ec): ?>
                        <option value="<?= $ec['id'] ?>" <?= $selectedEdu === (int)$ec['id'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($ec['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-emerald w-100">
                    <i class="bi bi-funnel-fill"></i> Filter
                </button>
            </div>
        </form>
    </div>
</div>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h5 class="fw-bold mb-0">Showing <?= count($roles) ?> Supported Career Paths</h5>
            <span class="small text-muted">Select any role to inspect required competencies and gap analysis.</span>
        </div>
        <?php if ($selectedEdu > 0 || !empty($search)): ?>
            <a href="careers.php" class="btn btn-sm btn-outline-secondary">
                <i class="bi bi-x-circle me-1"></i> Clear Filters
            </a>
        <?php endif; ?>
    </div>

    <div class="row g-4">
        <?php if (empty($roles)): ?>
            <div class="col-12 text-center py-5">
                <i class="bi bi-search text-muted display-4"></i>
                <h5 class="fw-bold mt-3">No matching career paths found</h5>
                <p class="text-muted">Try adjusting your search criteria or resetting filters.</p>
                <a href="careers.php" class="btn btn-emerald mt-2">Reset All Filters</a>
            </div>
        <?php else: ?>
            <?php foreach ($roles as $r): ?>
                <?php
                // Fetch top 3 required skills for preview
                $stmtSkills = $pdo->prepare("
                    SELECT s.name, jrs.required_level, jrs.is_essential
                    FROM job_required_skills jrs
                    JOIN skills s ON jrs.skill_id = s.id
                    WHERE jrs.job_role_id = ?
                    ORDER BY jrs.is_essential DESC, jrs.required_level DESC
                    LIMIT 3
                ");
                $stmtSkills->execute([$r['id']]);
                $roleSkills = $stmtSkills->fetchAll();
                ?>
                <div class="col-xl-4 col-md-6 col-12">
                    <div class="card h-100 card-hover p-4 d-flex flex-column justify-content-between" style="min-width: 0; max-width: 100%;">
                        <div>
                            <div class="d-flex justify-content-between align-items-start mb-3 flex-wrap gap-2">
                                <span class="badge badge-soft-primary px-2 py-1 text-wrap">
                                    <i class="bi <?= htmlspecialchars($r['cat_icon'] ?: 'bi-briefcase') ?> me-1"></i>
                                    <?= htmlspecialchars($r['cat_name']) ?>
                                </span>
                                <?php if ($r['is_regulated']): ?>
                                    <span class="badge badge-soft-warning px-2 py-1 text-wrap" title="Statutory council registration required">
                                        <i class="bi bi-shield-exclamation me-1"></i> Regulated
                                    </span>
                                <?php endif; ?>
                            </div>

                            <h5 class="fw-bold mb-2 text-dark text-break"><?= htmlspecialchars($r['title']) ?></h5>
                            <div class="small text-muted mb-2 text-break">
                                <i class="bi bi-mortarboard me-1 text-success"></i> <?= htmlspecialchars($r['edu_name']) ?>
                            </div>
                            <p class="small text-secondary mb-3 text-break" style="line-height: 1.5;">
                                <?= htmlspecialchars($r['short_description']) ?>
                            </p>

                            <!-- Required Skills Preview -->
                            <div class="mb-3">
                                <span class="small fw-bold text-dark d-block mb-1">Key Required Competencies:</span>
                                <div class="d-flex flex-wrap gap-1">
                                    <?php foreach ($roleSkills as $sk): ?>
                                        <span class="badge badge-soft-secondary text-wrap" style="font-size: 0.75rem;">
                                            <?= htmlspecialchars($sk['name']) ?> (L<?= $sk['required_level'] ?>)
                                        </span>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>

                        <div class="pt-3 border-top mt-2">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="small text-muted">Typical Range:</span>
                                <span class="fw-bold text-dark small"><?= htmlspecialchars($r['average_salary_range'] ?: 'Industry Standard') ?></span>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="button" class="btn btn-sm btn-outline-emerald flex-grow-1" data-bs-toggle="modal" data-bs-target="#modalRole<?= $r['id'] ?>">
                                    <i class="bi bi-info-circle me-1"></i> Role Details
                                </button>
                                <a href="<?= BASE_URL ?>auth/login.php" class="btn btn-sm btn-emerald" title="Set as preferred career">
                                    <i class="bi bi-bullseye"></i> Target
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal for Detailed Role Information -->
                <div class="modal fade" id="modalRole<?= $r['id'] ?>" tabindex="-1" aria-labelledby="modalLabel<?= $r['id'] ?>" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header border-bottom">
                                <div>
                                    <h5 class="modal-title fw-bold text-dark" id="modalLabel<?= $r['id'] ?>"><?= htmlspecialchars($r['title']) ?></h5>
                                    <span class="small text-muted"><?= htmlspecialchars($r['industry_domain']) ?> • <?= htmlspecialchars($r['edu_name']) ?></span>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body p-4">
                                <?php if (!empty($r['licensing_requirements'])): ?>
                                    <div class="regulatory-alert mb-3">
                                        <h6 class="fw-bold mb-1"><i class="bi bi-shield-exclamation me-1"></i> Mandatory Statutory Licensing Requirement</h6>
                                        <p class="small mb-0"><?= nl2br(htmlspecialchars($r['licensing_requirements'])) ?></p>
                                    </div>
                                <?php endif; ?>

                                <h6 class="fw-bold text-dark mb-2">Role Overview</h6>
                                <p class="text-secondary small mb-4"><?= nl2br(htmlspecialchars($r['full_description'])) ?></p>

                                <h6 class="fw-bold text-dark mb-2">Typical Responsibilities</h6>
                                <p class="text-secondary small mb-4" style="white-space: pre-line;"><?= htmlspecialchars($r['typical_responsibilities']) ?></p>

                                <h6 class="fw-bold text-dark mb-2">Educational Qualification Required</h6>
                                <p class="text-secondary small mb-3"><?= htmlspecialchars($r['required_qualification']) ?></p>

                                <div class="p-3 rounded-3" style="background: var(--soft-green); border: 1px solid var(--border-color);">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <span class="small fw-bold text-dark d-block">Ready to check your skill readiness?</span>
                                            <span class="small text-muted">Take a diagnostic assessment to see your exact skill match score.</span>
                                        </div>
                                        <a href="<?= BASE_URL ?>auth/register.php" class="btn btn-sm btn-emerald">
                                            Start Free Assessment
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

