import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/simple_models.dart';
import '../data/lessons/scratch_lessons.dart';
import '../data/lessons/beginner_lessons.dart';
import '../data/lessons/beginner_lessons_part2.dart';
import '../data/lessons/middle_lessons.dart';
import '../data/lessons/advanced_lessons.dart';
import '../data/lessons/pro_lessons.dart';
import '../data/lessons/master_lessons.dart';

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
    lessons.addAll(AdvancedLessons.getLessons());
    lessons.addAll(ProLessons.getLessons());
    lessons.addAll(MasterLessons.getLessons());

    _lessons.value = lessons;

    // Create mock tests
    _createScratchTests();

    // Create user progress
    _createDefaultUserProgress();
  }

  void _createScratchTests() {
    final tests = <MockTest>[
      MockTest(
        id: 'scratch_test_1',
        title: 'Scratch Level Test 1',
        description: 'Test your knowledge of Java basics',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'q1',
            question: 'Which of these is the entry point of a Java program?',
            options: ['print()', 'start()', 'main()', 'run()'],
            correctAnswerIndex: 2,
            explanation:
                'The main() method is the entry point of every Java program.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q2',
            question: 'Which symbol is used for addition in Java?',
            options: ['-', '+', '*', '/'],
            correctAnswerIndex: 1,
            explanation: 'The + symbol is used for addition in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q3',
            question:
                'What will this program print?\n\nclass Test {\n    public static void main(String[] args) {\n        int x = 5;\n        int y = 2;\n        System.out.println(x * y);\n    }\n}',
            options: ['10', '25', '7', '52'],
            correctAnswerIndex: 0,
            explanation: '5 * 2 = 10',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q4',
            question: 'Which datatype is correct for storing text in Java?',
            options: ['int', 'String', 'double', 'char'],
            correctAnswerIndex: 1,
            explanation: 'String is used for storing text in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q5',
            question: 'Which symbol is used for single-line comment in Java?',
            options: ['/*', '//', '#', '<!--'],
            correctAnswerIndex: 1,
            explanation: '// is used for single-line comments in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 5,
      ),
      MockTest(
        id: 'scratch_test_2',
        title: 'Scratch Level Test 2',
        description: 'Test your knowledge of variables and operators',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'q1',
            question: 'Which of these is a valid variable name?',
            options: ['int', '123name', 'myAge', 'public'],
            correctAnswerIndex: 2,
            explanation:
                'myAge is a valid variable name. Variable names cannot start with numbers or be keywords.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q2',
            question:
                'What will this code print?\n\nint a = 8, b = 2;\nSystem.out.println(a % b);',
            options: ['4', '0', '2', '6'],
            correctAnswerIndex: 1,
            explanation: '8 % 2 = 0 (remainder when 8 is divided by 2)',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q3',
            question: 'Which data type is used for true/false values?',
            options: ['int', 'char', 'boolean', 'String'],
            correctAnswerIndex: 2,
            explanation: 'boolean is used for true/false values in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q4',
            question:
                'What is the output of: System.out.println("Hello" + "World");',
            options: ['Hello World', 'HelloWorld', 'Hello + World', 'Error'],
            correctAnswerIndex: 1,
            explanation:
                'String concatenation with + joins strings together without spaces.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'q5',
            question: 'Which operator is used for multiplication?',
            options: ['+', '-', '*', '/'],
            correctAnswerIndex: 2,
            explanation: 'The * operator is used for multiplication in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 10,
      ),
    ];

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
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
          isUnlocked: true,
        ),
        LearningLevel.master: LevelProgress(
          level: LearningLevel.master,
          completedLessons: 0,
          totalLessons: 40,
          completedTests: 0,
          totalTests: 8,
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
    }
  }

  bool canAccessLesson(String lessonId) {
    // Temporarily disable all lesson restrictions for development
    return true;
  }

  MockTest? getRequiredTestForLesson(String lessonId) {
    final lesson = _lessons.firstWhere((l) => l.id == lessonId);

    return _mockTests.firstWhere(
      (test) =>
          test.level == lesson.level &&
          test.requiredAfterLesson != null &&
          test.requiredAfterLesson! <= lesson.order,
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
  }

  bool isTestRequiredForLesson(String lessonId) {
    // Temporarily disable test requirements for development
    return false;
  }

  Future<void> _updateUserProgress() async {
    if (_userProgress.value == null) return;

    final completedLessons =
        _lessons.where((lesson) => lesson.isCompleted).toList();
    final completedTests =
        _mockTests.where((test) => test.isAttempted).toList();

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
        isUnlocked: true, // All levels unlocked for development
      );
    }

    _userProgress.value = _userProgress.value!.copyWith(
      completedLessons: completedLessons.map((l) => l.id).toList(),
      completedTests: completedTests.map((t) => t.id).toList(),
      levelProgress: levelProgress,
    );
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
}
