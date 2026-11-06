<?php
/**
 * Public Free Learning Resource Finder
 */
$pageTitle = "Free Learning Resources Library";
$activeNav = 'learning';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/functions.php';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/navbar.php';

$pdo = getDBConnection();

$selectedPlatform = isset($_GET['platform']) ? trim($_GET['platform']) : '';
$search = isset($_GET['q']) ? trim($_GET['q']) : '';

// Fetch distinct platforms
$platforms = $pdo->query("SELECT DISTINCT platform FROM learning_resources WHERE is_verified = 1 ORDER BY platform ASC")->fetchAll(PDO::FETCH_COLUMN);

// Build query
$sql = "
    SELECT lr.*, s.name AS skill_name, sc.name AS category_name
    FROM learning_resources lr
    JOIN skills s ON lr.skill_id = s.id
    JOIN skill_categories sc ON s.category_id = sc.id
    WHERE lr.is_verified = 1
";
$params = [];

if (!empty($selectedPlatform)) {
    $sql .= " AND lr.platform = ?";
    $params[] = $selectedPlatform;
}

if (!empty($search)) {
    $sql .= " AND (lr.title LIKE ? OR lr.description LIKE ? OR s.name LIKE ?)";
    $like = "%$search%";
    $params[] = $like;
    $params[] = $like;
    $params[] = $like;
}

$sql .= " ORDER BY lr.rating DESC, lr.title ASC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$resources = $stmt->fetchAll();
?>

<div class="py-5" style="background: linear-gradient(180deg, #FFFFFF 0%, #F0F8F4 100%); border-bottom: 1px solid var(--border-color);">
    <div class="container py-2 text-center">
        <span class="badge badge-soft-success px-3 py-1 mb-2"><i class="bi bi-shield-check me-1"></i> 100% Verified Quality Education</span>
        <h1 class="display-6 fw-extrabold mb-2">Free Learning Resource Directory</h1>
        <p class="text-secondary mx-auto mb-4" style="max-width: 650px;">
            High-quality, certified, and accredited courses from top universities and global open-source platforms. No paywalls, no false advertisements.
        </p>

        <!-- Search & Filter Form -->
        <form method="GET" action="learning.php" class="row g-2 justify-content-center mx-auto" style="max-width: 800px;">
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" name="q" class="form-control border-start-0" placeholder="Search course, skill, keyword..." value="<?= htmlspecialchars($search) ?>">
                </div>
            </div>
            <div class="col-md-4">
                <select name="platform" class="form-select">
                    <option value="">All Learning Platforms</option>
                    <?php foreach ($platforms as $p): ?>
                        <option value="<?= htmlspecialchars($p) ?>" <?= $selectedPlatform === $p ? 'selected' : '' ?>>
                            <?= htmlspecialchars($p) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-emerald w-100">
                    <i class="bi bi-filter"></i> Search
                </button>
            </div>
        </form>
    </div>
</div>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h5 class="fw-bold mb-0">Showing <?= count($resources) ?> Verified Free Educational Resources</h5>
            <span class="small text-muted">Direct links to official courses, open documentation, and hands-on modules.</span>
        </div>
        <?php if (!empty($selectedPlatform) || !empty($search)): ?>
            <a href="learning.php" class="btn btn-sm btn-outline-secondary">
                <i class="bi bi-x-circle me-1"></i> Clear Filters
            </a>
        <?php endif; ?>
    </div>

    <div class="row g-4">
        <?php if (empty($resources)): ?>
            <div class="col-12 text-center py-5">
                <i class="bi bi-book text-muted display-4"></i>
                <h5 class="fw-bold mt-3">No matching learning resources found</h5>
                <p class="text-muted">Try clearing your filters or searching with a different skill keyword.</p>
                <a href="learning.php" class="btn btn-emerald mt-2">Reset Filters</a>
            </div>
        <?php else: ?>
            <?php foreach ($resources as $res): ?>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 card-hover p-4 d-flex flex-column justify-content-between">
                        <div>
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge badge-soft-primary px-2 py-1">
                                    <i class="bi bi-mortarboard me-1"></i> <?= htmlspecialchars($res['platform']) ?>
                                </span>
                                <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 small">
                                    <i class="bi bi-star-fill text-warning me-1"></i> <?= $res['rating'] ?>
                                </span>
                            </div>

                            <h5 class="fw-bold mb-2 text-dark" style="font-size: 1.1rem; line-height: 1.35;">
                                <?= htmlspecialchars($res['title']) ?>
                            </h5>

                            <div class="small mb-2">
                                <span class="badge badge-soft-secondary">
                                    <i class="bi bi-tag-fill me-1"></i> <?= htmlspecialchars($res['skill_name']) ?>
                                </span>
                            </div>

                            <p class="small text-secondary mb-3" style="line-height: 1.5;">
                                <?= htmlspecialchars($res['description']) ?>
                            </p>
                        </div>

                        <div>
                            <div class="p-2 rounded-2 mb-3 small" style="background: var(--soft-green); border: 1px solid var(--border-color);">
                                <div class="d-flex justify-content-between mb-1">
                                    <span class="text-muted">Access Status:</span>
                                    <span class="fw-bold text-success"><?= htmlspecialchars($res['free_status']) ?></span>
                                </div>
                                <div class="d-flex justify-content-between mb-1">
                                    <span class="text-muted">Format:</span>
                                    <span class="text-dark fw-medium"><?= htmlspecialchars($res['learning_format']) ?></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="text-muted">Certificate:</span>
                                    <span class="text-dark fw-medium"><?= htmlspecialchars($res['certificate_info']) ?></span>
                                </div>
                            </div>

                            <div class="d-flex gap-2">
                                <a href="<?= htmlspecialchars($res['url']) ?>" target="_blank" rel="noopener noreferrer" class="btn btn-emerald btn-sm flex-grow-1">
                                    <i class="bi bi-box-arrow-up-right me-1"></i> Go to Free Course
                                </a>
                                <a href="<?= BASE_URL ?>auth/login.php" class="btn btn-outline-emerald btn-sm" title="Add to My Learning Plan">
                                    <i class="bi bi-bookmark-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

