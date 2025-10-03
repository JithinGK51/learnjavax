import 'package:get/get.dart';
import '../models/simple_models.dart';
import 'app_controller.dart';

class ProgressController extends GetxController {
  final Rx<UserProgress?> _userProgress = Rx<UserProgress?>(null);
  final RxInt _dailyStreak = 0.obs;
  final RxList<UserBadge> _earnedBadges = <UserBadge>[].obs;
  final RxInt _totalLearningMinutes = 0.obs;

  UserProgress? get userProgress => _userProgress.value;
  int get dailyStreak => _dailyStreak.value;
  List<UserBadge> get earnedBadges => _earnedBadges;
  int get totalLearningMinutes => _totalLearningMinutes.value;

  @override
  void onInit() {
    super.onInit();
    _loadUserProgress();
  }

  Future<void> _loadUserProgress() async {
    // Load user progress from AppController
    try {
      final appController = Get.find<AppController>();
      if (appController.userProgress != null) {
        _userProgress.value = appController.userProgress;
        _dailyStreak.value = appController.userProgress!.dailyStreak;
        _earnedBadges.value = appController.userProgress!.earnedBadges;
        _totalLearningMinutes.value =
            appController.userProgress!.totalLearningMinutes;
      }
    } catch (e) {
      // If AppController is not available, create default progress
      _createDefaultProgress();
    }
  }

  void _createDefaultProgress() {
    _userProgress.value = UserProgress(
      userId: 'default_user',
      levelProgress: {
        LearningLevel.scratch: LevelProgress(
          level: LearningLevel.scratch,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 2,
          isUnlocked: true,
        ),
        LearningLevel.beginner: LevelProgress(
          level: LearningLevel.beginner,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 2,
          isUnlocked: true,
        ),
        LearningLevel.middle: LevelProgress(
          level: LearningLevel.middle,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
          isUnlocked: true,
        ),
        LearningLevel.advanced: LevelProgress(
          level: LearningLevel.advanced,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
          isUnlocked: true,
        ),
        LearningLevel.pro: LevelProgress(
          level: LearningLevel.pro,
          completedLessons: 0,
          totalLessons: 10,
          completedTests: 0,
          totalTests: 2,
          isUnlocked: true,
        ),
        LearningLevel.master: LevelProgress(
          level: LearningLevel.master,
          completedLessons: 0,
          totalLessons: 25,
          completedTests: 0,
          totalTests: 5,
          isUnlocked: true,
        ),
      },
      lastLearningDate: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Future<void> updateProgress() async {
    if (_userProgress.value == null) return;

    _userProgress.value = _userProgress.value!.copyWith(
      updatedAt: DateTime.now(),
    );
  }

  Future<void> completeLesson(
    String lessonId,
    LearningLevel level,
    int estimatedMinutes,
  ) async {
    if (_userProgress.value == null) return;

    final progress = _userProgress.value!;
    final levelProgress = progress.levelProgress[level];

    if (levelProgress != null) {
      final updatedLevelProgress = levelProgress.copyWith(
        completedLessons: levelProgress.completedLessons + 1,
        isCompleted:
            levelProgress.completedLessons + 1 >= levelProgress.totalLessons,
        completedAt:
            levelProgress.completedLessons + 1 >= levelProgress.totalLessons
                ? DateTime.now()
                : null,
      );

      final updatedLevelProgressMap = Map<LearningLevel, LevelProgress>.from(
        progress.levelProgress,
      );
      updatedLevelProgressMap[level] = updatedLevelProgress;

      _userProgress.value = progress.copyWith(
        levelProgress: updatedLevelProgressMap,
        completedLessons: [...progress.completedLessons, lessonId],
        totalLearningMinutes: progress.totalLearningMinutes + estimatedMinutes,
        lastLearningDate: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _updateDailyStreak();
      await _checkForNewBadges();
      await updateProgress();
    }
  }

  Future<void> completeTest(
    String testId,
    LearningLevel level,
    bool passed,
  ) async {
    if (_userProgress.value == null) return;

    final progress = _userProgress.value!;
    final levelProgress = progress.levelProgress[level];

    if (levelProgress != null) {
      final updatedLevelProgress = levelProgress.copyWith(
        completedTests: levelProgress.completedTests + 1,
      );

      final updatedLevelProgressMap = Map<LearningLevel, LevelProgress>.from(
        progress.levelProgress,
      );
      updatedLevelProgressMap[level] = updatedLevelProgress;

      _userProgress.value = progress.copyWith(
        levelProgress: updatedLevelProgressMap,
        completedTests: [...progress.completedTests, testId],
        lastLearningDate: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _updateDailyStreak();
      await _checkForNewBadges();
      await updateProgress();
    }
  }

  Future<void> _updateDailyStreak() async {
    if (_userProgress.value == null) return;

    final now = DateTime.now();
    final lastLearningDate = _userProgress.value!.lastLearningDate;
    final daysDifference = now.difference(lastLearningDate).inDays;

    int newStreak = _userProgress.value!.dailyStreak;

    if (daysDifference == 0) {
      // Same day, no change
    } else if (daysDifference == 1) {
      // Next day, increment streak
      newStreak++;
    } else {
      // More than one day gap, reset streak
      newStreak = 1;
    }

    _dailyStreak.value = newStreak;
    _userProgress.value = _userProgress.value!.copyWith(
      dailyStreak: newStreak,
      lastLearningDate: now,
    );
  }

  Future<void> _checkForNewBadges() async {
    if (_userProgress.value == null) return;

    final newBadges = <UserBadge>[];
    final currentBadges =
        _userProgress.value!.earnedBadges.map((b) => b.id).toSet();

    // Level completion badges
    for (final level in LearningLevel.values) {
      final levelProgress = _userProgress.value!.levelProgress[level];
      if (levelProgress?.isCompleted == true) {
        final badgeId = '${level.name}_completion';
        if (!currentBadges.contains(badgeId)) {
          newBadges.add(
            UserBadge(
              id: badgeId,
              name: '${level.displayName} Master',
              description:
                  'Completed all lessons in ${level.displayName} level',
              iconPath: 'assets/icons/badges/${level.name}_badge.svg',
              type: BadgeType.levelCompletion,
              earnedAt: DateTime.now(),
            ),
          );
        }
      }
    }

    // Streak badges
    if (_dailyStreak.value >= 7 && !currentBadges.contains('week_streak')) {
      newBadges.add(
        UserBadge(
          id: 'week_streak',
          name: 'Week Warrior',
          description: 'Maintained a 7-day learning streak',
          iconPath: 'assets/icons/badges/week_streak.svg',
          type: BadgeType.streak,
          earnedAt: DateTime.now(),
        ),
      );
    }

    if (_dailyStreak.value >= 30 && !currentBadges.contains('month_streak')) {
      newBadges.add(
        UserBadge(
          id: 'month_streak',
          name: 'Monthly Master',
          description: 'Maintained a 30-day learning streak',
          iconPath: 'assets/icons/badges/month_streak.svg',
          type: BadgeType.streak,
          earnedAt: DateTime.now(),
        ),
      );
    }

    // Test master badges
    final completedTestsCount = _userProgress.value!.completedTests.length;
    if (completedTestsCount >= 5 && !currentBadges.contains('test_master_5')) {
      newBadges.add(
        UserBadge(
          id: 'test_master_5',
          name: 'Test Taker',
          description: 'Completed 5 mock tests',
          iconPath: 'assets/icons/badges/test_master_5.svg',
          type: BadgeType.testMaster,
          earnedAt: DateTime.now(),
        ),
      );
    }

    if (completedTestsCount >= 20 &&
        !currentBadges.contains('test_master_20')) {
      newBadges.add(
        UserBadge(
          id: 'test_master_20',
          name: 'Test Master',
          description: 'Completed 20 mock tests',
          iconPath: 'assets/icons/badges/test_master_20.svg',
          type: BadgeType.testMaster,
          earnedAt: DateTime.now(),
        ),
      );
    }

    // Add new badges
    if (newBadges.isNotEmpty) {
      _earnedBadges.addAll(newBadges);
      _userProgress.value = _userProgress.value!.copyWith(
        earnedBadges: [..._userProgress.value!.earnedBadges, ...newBadges],
      );

      // Show badge notification
      for (final badge in newBadges) {
        Get.snackbar(
          'New Badge Earned!',
          '${badge.name}: ${badge.description}',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  LevelProgress? getLevelProgress(LearningLevel level) {
    return _userProgress.value?.levelProgress[level];
  }

  double getOverallProgress() {
    if (_userProgress.value == null) return 0.0;

    int totalLessons = 0;
    int completedLessons = 0;

    for (final levelProgress in _userProgress.value!.levelProgress.values) {
      totalLessons += levelProgress.totalLessons;
      completedLessons += levelProgress.completedLessons;
    }

    return totalLessons > 0 ? (completedLessons / totalLessons) * 100 : 0.0;
  }

  LearningLevel getCurrentLevel() {
    if (_userProgress.value == null) return LearningLevel.scratch;

    for (final level in LearningLevel.values) {
      final levelProgress = _userProgress.value!.levelProgress[level];
      if (levelProgress != null && !levelProgress.isCompleted) {
        return level;
      }
    }

    return LearningLevel.master; // All levels completed
  }

  bool isLevelUnlocked(LearningLevel level) {
    // Temporarily unlock all levels for development
    return true;
  }

  void unlockNextLevel(LearningLevel currentLevel) {
    final nextLevel = currentLevel.nextLevel;
    if (nextLevel != null && _userProgress.value != null) {
      final progress = _userProgress.value!;
      final levelProgress = progress.levelProgress[nextLevel];

      if (levelProgress != null) {
        final updatedLevelProgress = levelProgress.copyWith(
          isUnlocked: true,
          unlockedAt: DateTime.now(),
        );

        final updatedLevelProgressMap = Map<LearningLevel, LevelProgress>.from(
          progress.levelProgress,
        );
        updatedLevelProgressMap[nextLevel] = updatedLevelProgress;

        _userProgress.value = progress.copyWith(
          levelProgress: updatedLevelProgressMap,
        );
      }
    }
  }

  void updateProgressFromApp(
    UserProgress progress,
    int dailyStreak,
    int totalLearningMinutes,
  ) {
    _userProgress.value = progress;
    _dailyStreak.value = dailyStreak;
    _totalLearningMinutes.value = totalLearningMinutes;
  }

  void resetAllProgress() {
    _createDefaultProgress();
  }
}
