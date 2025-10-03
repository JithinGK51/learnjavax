import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/simple_models.dart';
import '../data/lessons/scratch_lessons.dart';
import '../data/lessons/beginner_lessons.dart';
import '../data/lessons/beginner_lessons_part2.dart';
import '../data/lessons/middle_lessons.dart';
import '../data/lessons/middle_lessons_part2.dart';
import '../data/lessons/advanced_lessons.dart';
import '../data/lessons/advanced_lessons_part2.dart';
import '../data/lessons/pro_lessons.dart';
import '../data/lessons/master_lessons.dart';
import '../data/lessons/master_projects.dart';
import '../data/mock_tests/level_mock_tests.dart';
import 'progress_controller.dart';

class AppController extends GetxController {
  final RxBool _isInitialized = false.obs;
  final RxList<Lesson> _lessons = <Lesson>[].obs;
  final RxList<MockTest> _mockTests = <MockTest>[].obs;
  final Rx<UserProgress?> _userProgress = Rx<UserProgress?>(null);
  final Rx<LearningLevel> _currentLevel = LearningLevel.scratch.obs;

  bool get isInitialized => _isInitialized.value;
  List<Lesson> get lessons => _lessons;
  List<MockTest> get mockTests => _mockTests;
  UserProgress? get userProgress => _userProgress.value;
  LearningLevel get currentLevel => _currentLevel.value;

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await _loadLessons();
      await _loadMockTests();
      await _loadUserProgress();
      _isInitialized.value = true;
    } catch (e) {
      debugPrint('Error initializing app: $e');
    }
  }

  Future<void> _loadLessons() async {
    // Create default lessons for now
    await _createDefaultLessons();
  }

  Future<void> _loadMockTests() async {
    // Mock tests are loaded in _loadLessons()
  }

  Future<void> _loadUserProgress() async {
    // User progress is loaded in _loadLessons()
  }

  Future<void> _createDefaultLessons() async {
    // Create sample lessons for each level
    final lessons = <Lesson>[];

    // Scratch Level Lessons
    lessons.addAll(ScratchLessons.getLessons());
    lessons.addAll(BeginnerLessons.getLessons());
    lessons.addAll(BeginnerLessonsPart2.getLessons());
    lessons.addAll(MiddleLessons.getLessons());
    lessons.addAll(MiddleLessonsPart2.getLessons());
    lessons.addAll(AdvancedLessons.getLessons());
    lessons.addAll(AdvancedLessonsPart2.getLessons());
    lessons.addAll(ProLessons.getLessons());
    lessons.addAll(MasterLessons.getLessons());
    lessons.addAll(MasterProjects.getProjects());

    _lessons.value = lessons;

    // Create mock tests
    _createAllMockTests();

    // Create user progress
    _createDefaultUserProgress();
  }

  void _createAllMockTests() {
    final tests = LevelMockTests.getAllMockTests();
    _mockTests.value = tests;
  }

  void _createDefaultUserProgress() {
    _userProgress.value = UserProgress(
      userId: 'user_progress',
      lastLearningDate: DateTime.now(),
      levelProgress: {
        LearningLevel.scratch: LevelProgress(
          level: LearningLevel.scratch,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
          isUnlocked: true,
        ),
        LearningLevel.beginner: LevelProgress(
          level: LearningLevel.beginner,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
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
      dailyStreak: 0,
      completedLessons: <String>[],
      completedTests: <String>[],
      earnedBadges: <UserBadge>[],
      totalLearningMinutes: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  List<Lesson> getLessonsByLevel(LearningLevel level) {
    return _lessons.where((lesson) => lesson.level == level).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  List<MockTest> getTestsByLevel(LearningLevel level) {
    return _mockTests.where((test) => test.level == level).toList();
  }

  Future<void> completeLesson(String lessonId) async {
    // Mark lesson as completed and update progress
    final lessonIndex = _lessons.indexWhere((lesson) => lesson.id == lessonId);
    if (lessonIndex != -1) {
      _lessons[lessonIndex] = _lessons[lessonIndex].copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
      );

      // Update user progress
      await _updateUserProgress();

      // Check if a mock test is required after this lesson
      final requiredTest = getRequiredTestForLesson(lessonId);
      if (requiredTest != null) {
        // Navigate to mock test
        Get.toNamed('/test-detail', arguments: requiredTest);
      }
    }
  }

  bool canAccessLesson(String lessonId) {
    // Temporarily disable all lesson restrictions for development
    return true;
  }

  MockTest? getRequiredTestForLesson(String lessonId) {
    final lesson = _lessons.firstWhere((l) => l.id == lessonId);

    // Check if this lesson is a multiple of 5 (5, 10, 15, 20, etc.)
    if (lesson.order % 5 == 0) {
      // Find the test that should be taken after this lesson
      final requiredTest = _mockTests.firstWhere(
        (test) =>
            test.level == lesson.level &&
            test.requiredAfterLesson == lesson.order,
        orElse:
            () => MockTest(
              id: '',
              title: '',
              description: '',
              level: lesson.level,
              questions: [],
              timeLimitMinutes: 0,
            ),
      );

      // Return null if no test found (empty test with id '')
      return requiredTest.id.isEmpty ? null : requiredTest;
    }

    return null;
  }

  bool isTestRequiredForLesson(String lessonId) {
    return getRequiredTestForLesson(lessonId) != null;
  }

  Future<void> _updateUserProgress() async {
    if (_userProgress.value == null) return;

    final completedLessons =
        _lessons.where((lesson) => lesson.isCompleted).toList();
    final completedTests =
        _mockTests.where((test) => test.isAttempted).toList();

    // Calculate total learning minutes
    final totalLearningMinutes = completedLessons.fold<int>(
      0,
      (total, lesson) => total + lesson.estimatedMinutes,
    );

    // Calculate daily streak
    final today = DateTime.now();
    final lastLearningDate = _userProgress.value!.lastLearningDate;
    final dailyStreak = _calculateDailyStreak(lastLearningDate, today);

    // Update level progress
    final levelProgress = <LearningLevel, LevelProgress>{};
    for (final level in LearningLevel.values) {
      final levelLessons = getLessonsByLevel(level);
      final levelTests = getTestsByLevel(level);

      levelProgress[level] = LevelProgress(
        level: level,
        completedLessons: levelLessons.where((l) => l.isCompleted).length,
        totalLessons: levelLessons.length,
        completedTests: levelTests.where((t) => t.isAttempted).length,
        totalTests: levelTests.length,
        isUnlocked: isLevelUnlocked(level),
      );
    }

    _userProgress.value = _userProgress.value!.copyWith(
      completedLessons: completedLessons.map((l) => l.id).toList(),
      completedTests: completedTests.map((t) => t.id).toList(),
      levelProgress: levelProgress,
      totalLearningMinutes: totalLearningMinutes,
      dailyStreak: dailyStreak,
      lastLearningDate: today,
      updatedAt: today,
    );

    // Update ProgressController if it exists
    try {
      final progressController = Get.find<ProgressController>();
      progressController.updateProgressFromApp(
        _userProgress.value!,
        dailyStreak,
        totalLearningMinutes,
      );
    } catch (e) {
      // ProgressController not available, that's okay
    }
  }

  int _calculateDailyStreak(DateTime lastLearningDate, DateTime today) {
    final difference = today.difference(lastLearningDate).inDays;

    if (difference == 0) {
      // Same day, maintain current streak
      return _userProgress.value?.dailyStreak ?? 0;
    } else if (difference == 1) {
      // Consecutive day, increment streak
      return (_userProgress.value?.dailyStreak ?? 0) + 1;
    } else {
      // Gap in days, reset streak
      return 1;
    }
  }

  Future<void> resetAllData(
    List<Lesson> resetLessons,
    List<MockTest> resetTests,
  ) async {
    _lessons.value = resetLessons;
    _mockTests.value = resetTests;

    // Reset user progress to initial state
    _createDefaultUserProgress();

    // Update progress
    await _updateUserProgress();
  }

  void setCurrentLevel(LearningLevel level) {
    _currentLevel.value = level;
  }

  Lesson? getLessonById(String id) {
    try {
      return _lessons.firstWhere((lesson) => lesson.id == id);
    } catch (e) {
      return null;
    }
  }

  MockTest? getTestById(String id) {
    try {
      return _mockTests.firstWhere((test) => test.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> completeTest(
    String testId,
    int score,
    List<int> selectedAnswers,
  ) async {
    final testIndex = _mockTests.indexWhere((test) => test.id == testId);
    if (testIndex != -1) {
      _mockTests[testIndex] = _mockTests[testIndex].copyWith(
        isAttempted: true,
        attemptedAt: DateTime.now(),
        score: score,
        passed: score >= 60, // Assuming 60% is passing
      );

      // Update user progress
      await _updateUserProgress();
    }
  }

  List<Lesson> searchLessons(String query) {
    if (query.isEmpty) return _lessons;

    final lowercaseQuery = query.toLowerCase();
    return _lessons.where((lesson) {
      return lesson.title.toLowerCase().contains(lowercaseQuery) ||
          lesson.description.toLowerCase().contains(lowercaseQuery) ||
          lesson.content.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  List<GlossaryTerm> searchGlossary(String query) {
    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    final allTerms = <GlossaryTerm>[];

    for (final lesson in _lessons) {
      allTerms.addAll(lesson.glossaryTerms);
    }

    return allTerms.where((term) {
      return term.term.toLowerCase().contains(lowercaseQuery) ||
          term.definition.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  // ========== PROGRESSIVE UNLOCKING METHODS ==========

  // Check if a lesson is unlocked (progressive unlocking)
  bool isLessonUnlocked(String lessonId) {
    final lesson = _lessons.firstWhere((l) => l.id == lessonId);
    final level = lesson.level;

    // Check if the level is unlocked
    if (!isLevelUnlocked(level)) {
      return false;
    }

    // Check if this lesson is within the unlocked range for this level
    final unlockedLessons = _getUnlockedLessonsCount(level);

    return lesson.order <= unlockedLessons;
  }

  // Check if a level is unlocked
  bool isLevelUnlocked(LearningLevel level) {
    if (level == LearningLevel.scratch) {
      return true; // Scratch level is always unlocked
    }

    // Check if previous level is completed
    final previousLevel = _getPreviousLevel(level);
    if (previousLevel == null) return true;

    return isLevelCompleted(previousLevel);
  }

  // Check if a level is completed (all lessons + all tests)
  bool isLevelCompleted(LearningLevel level) {
    final levelLessons = getLessonsByLevel(level);
    final levelTests = getTestsByLevel(level);

    // Check if all lessons are completed
    final completedLessons =
        levelLessons.where((lesson) => lesson.isCompleted).length;
    if (completedLessons < levelLessons.length) {
      return false;
    }

    // Check if all tests are completed
    final completedTests = levelTests.where((test) => test.isAttempted).length;
    if (completedTests < levelTests.length) {
      return false;
    }

    return true;
  }

  // Get the number of unlocked lessons for a level
  int _getUnlockedLessonsCount(LearningLevel level) {
    final completedTests = getCompletedTestsCount(level);

    // Calculate how many lesson groups are unlocked
    // Each group of 5 lessons requires a test to be completed
    final unlockedGroups = (completedTests + 1); // +1 for the first group
    final maxUnlockedLessons = (unlockedGroups * 5).clamp(
      0,
      getLessonsByLevel(level).length,
    );

    return maxUnlockedLessons;
  }

  // Get previous level
  LearningLevel? _getPreviousLevel(LearningLevel level) {
    switch (level) {
      case LearningLevel.scratch:
        return null;
      case LearningLevel.beginner:
        return LearningLevel.scratch;
      case LearningLevel.middle:
        return LearningLevel.beginner;
      case LearningLevel.advanced:
        return LearningLevel.middle;
      case LearningLevel.pro:
        return LearningLevel.advanced;
      case LearningLevel.master:
        return LearningLevel.pro;
    }
  }

  // Get completed lessons count for a level
  int getCompletedLessonsCount(LearningLevel level) {
    return _lessons
        .where((lesson) => lesson.level == level && lesson.isCompleted)
        .length;
  }

  // Get completed tests count for a level
  int getCompletedTestsCount(LearningLevel level) {
    return _mockTests
        .where((test) => test.level == level && test.isAttempted)
        .length;
  }

  // Get next unlocked level
  LearningLevel? getNextUnlockedLevel() {
    final levels = [
      LearningLevel.scratch,
      LearningLevel.beginner,
      LearningLevel.middle,
      LearningLevel.advanced,
      LearningLevel.pro,
      LearningLevel.master,
    ];

    for (final level in levels) {
      if (isLevelUnlocked(level) && !isLevelCompleted(level)) {
        return level;
      }
    }

    return null; // All levels completed
  }
}
