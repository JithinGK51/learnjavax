// Simple models without Hive for now
enum LearningLevel { scratch, beginner, middle, advanced, pro, master }

extension LearningLevelExtension on LearningLevel {
  String get displayName {
    switch (this) {
      case LearningLevel.scratch:
        return 'Scratch';
      case LearningLevel.beginner:
        return 'Beginner';
      case LearningLevel.middle:
        return 'Middle';
      case LearningLevel.advanced:
        return 'Advanced';
      case LearningLevel.pro:
        return 'Pro';
      case LearningLevel.master:
        return 'Master';
    }
  }

  String get description {
    switch (this) {
      case LearningLevel.scratch:
        return 'Start your Java journey from absolute basics';
      case LearningLevel.beginner:
        return 'Learn fundamental Java concepts and syntax';
      case LearningLevel.middle:
        return 'Master object-oriented programming principles';
      case LearningLevel.advanced:
        return 'Explore advanced Java features and APIs';
      case LearningLevel.pro:
        return 'Build complex applications and frameworks';
      case LearningLevel.master:
        return 'Become a Java expert and architect';
    }
  }

  int get order {
    switch (this) {
      case LearningLevel.scratch:
        return 0;
      case LearningLevel.beginner:
        return 1;
      case LearningLevel.middle:
        return 2;
      case LearningLevel.advanced:
        return 3;
      case LearningLevel.pro:
        return 4;
      case LearningLevel.master:
        return 5;
    }
  }

  String get iconPath {
    switch (this) {
      case LearningLevel.scratch:
        return 'assets/icons/scratch_icon.svg';
      case LearningLevel.beginner:
        return 'assets/icons/beginner_icon.svg';
      case LearningLevel.middle:
        return 'assets/icons/middle_icon.svg';
      case LearningLevel.advanced:
        return 'assets/icons/advanced_icon.svg';
      case LearningLevel.pro:
        return 'assets/icons/pro_icon.svg';
      case LearningLevel.master:
        return 'assets/icons/master_icon.svg';
    }
  }

  LearningLevel? get nextLevel {
    switch (this) {
      case LearningLevel.scratch:
        return LearningLevel.beginner;
      case LearningLevel.beginner:
        return LearningLevel.middle;
      case LearningLevel.middle:
        return LearningLevel.advanced;
      case LearningLevel.advanced:
        return LearningLevel.pro;
      case LearningLevel.pro:
        return LearningLevel.master;
      case LearningLevel.master:
        return null;
    }
  }
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final LearningLevel level;
  final int order;
  final String content;
  final List<CodeExample> codeExamples;
  final List<GlossaryTerm> glossaryTerms;
  final int estimatedMinutes;
  final bool isCompleted;
  final bool isBookmarked;
  final DateTime? completedAt;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.order,
    required this.content,
    required this.codeExamples,
    required this.glossaryTerms,
    required this.estimatedMinutes,
    this.isCompleted = false,
    this.isBookmarked = false,
    this.completedAt,
  });

  Lesson copyWith({
    String? id,
    String? title,
    String? description,
    LearningLevel? level,
    int? order,
    String? content,
    List<CodeExample>? codeExamples,
    List<GlossaryTerm>? glossaryTerms,
    int? estimatedMinutes,
    bool? isCompleted,
    bool? isBookmarked,
    DateTime? completedAt,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      order: order ?? this.order,
      content: content ?? this.content,
      codeExamples: codeExamples ?? this.codeExamples,
      glossaryTerms: glossaryTerms ?? this.glossaryTerms,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

class CodeExample {
  final String id;
  final String title;
  final String code;
  final String language;
  final String? output;
  final String? explanation;

  CodeExample({
    required this.id,
    required this.title,
    required this.code,
    this.language = 'java',
    this.output,
    this.explanation,
  });
}

class GlossaryTerm {
  final String term;
  final String definition;
  final String? example;

  GlossaryTerm({required this.term, required this.definition, this.example});
}

class MockTest {
  final String id;
  final String title;
  final String description;
  final LearningLevel level;
  final List<Question> questions;
  final int timeLimitMinutes;
  final bool isAttempted;
  final DateTime? attemptedAt;
  final int? score;
  final bool? passed;
  final int? requiredAfterLesson;

  MockTest({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.questions,
    required this.timeLimitMinutes,
    this.isAttempted = false,
    this.attemptedAt,
    this.score,
    this.passed,
    this.requiredAfterLesson,
  });

  MockTest copyWith({
    String? id,
    String? title,
    String? description,
    LearningLevel? level,
    List<Question>? questions,
    int? timeLimitMinutes,
    bool? isAttempted,
    DateTime? attemptedAt,
    int? score,
    bool? passed,
    int? requiredAfterLesson,
  }) {
    return MockTest(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      questions: questions ?? this.questions,
      timeLimitMinutes: timeLimitMinutes ?? this.timeLimitMinutes,
      isAttempted: isAttempted ?? this.isAttempted,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      score: score ?? this.score,
      passed: passed ?? this.passed,
      requiredAfterLesson: requiredAfterLesson ?? this.requiredAfterLesson,
    );
  }

  int get totalQuestions => questions.length;
  int get passingScore => (totalQuestions * 0.6).round(); // 60% passing score
}

class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? explanation;
  final QuestionType type;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation,
    this.type = QuestionType.multipleChoice,
  });
}

enum QuestionType { multipleChoice, trueFalse, codeAnalysis }

class TestAttempt {
  final String testId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final List<Answer> answers;
  final int score;
  final bool passed;

  TestAttempt({
    required this.testId,
    required this.startedAt,
    this.completedAt,
    required this.answers,
    required this.score,
    required this.passed,
  });
}

class Answer {
  final String questionId;
  final int selectedOptionIndex;
  final bool isCorrect;

  Answer({
    required this.questionId,
    required this.selectedOptionIndex,
    required this.isCorrect,
  });
}

class UserProgress {
  final String userId;
  final Map<LearningLevel, LevelProgress> levelProgress;
  final int dailyStreak;
  final DateTime lastLearningDate;
  final List<String> completedLessons;
  final List<String> bookmarkedLessons;
  final List<String> completedTests;
  final List<UserBadge> earnedBadges;
  final int totalLearningMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProgress({
    required this.userId,
    required this.levelProgress,
    this.dailyStreak = 0,
    required this.lastLearningDate,
    this.completedLessons = const [],
    this.bookmarkedLessons = const [],
    this.completedTests = const [],
    this.earnedBadges = const [],
    this.totalLearningMinutes = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  UserProgress copyWith({
    String? userId,
    Map<LearningLevel, LevelProgress>? levelProgress,
    int? dailyStreak,
    DateTime? lastLearningDate,
    List<String>? completedLessons,
    List<String>? bookmarkedLessons,
    List<String>? completedTests,
    List<UserBadge>? earnedBadges,
    int? totalLearningMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProgress(
      userId: userId ?? this.userId,
      levelProgress: levelProgress ?? this.levelProgress,
      dailyStreak: dailyStreak ?? this.dailyStreak,
      lastLearningDate: lastLearningDate ?? this.lastLearningDate,
      completedLessons: completedLessons ?? this.completedLessons,
      bookmarkedLessons: bookmarkedLessons ?? this.bookmarkedLessons,
      completedTests: completedTests ?? this.completedTests,
      earnedBadges: earnedBadges ?? this.earnedBadges,
      totalLearningMinutes: totalLearningMinutes ?? this.totalLearningMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LevelProgress {
  final LearningLevel level;
  final int completedLessons;
  final int totalLessons;
  final int completedTests;
  final int totalTests;
  final bool isUnlocked;
  final bool isCompleted;
  final DateTime? unlockedAt;
  final DateTime? completedAt;

  LevelProgress({
    required this.level,
    required this.completedLessons,
    required this.totalLessons,
    required this.completedTests,
    required this.totalTests,
    this.isUnlocked = false,
    this.isCompleted = false,
    this.unlockedAt,
    this.completedAt,
  });

  double get progressPercentage {
    if (totalLessons == 0) return 0.0;
    return (completedLessons / totalLessons) * 100;
  }

  LevelProgress copyWith({
    LearningLevel? level,
    int? completedLessons,
    int? totalLessons,
    int? completedTests,
    int? totalTests,
    bool? isUnlocked,
    bool? isCompleted,
    DateTime? unlockedAt,
    DateTime? completedAt,
  }) {
    return LevelProgress(
      level: level ?? this.level,
      completedLessons: completedLessons ?? this.completedLessons,
      totalLessons: totalLessons ?? this.totalLessons,
      completedTests: completedTests ?? this.completedTests,
      totalTests: totalTests ?? this.totalTests,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      isCompleted: isCompleted ?? this.isCompleted,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

class UserBadge {
  final String id;
  final String name;
  final String description;
  final String iconPath;
  final BadgeType type;
  final DateTime earnedAt;

  UserBadge({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.type,
    required this.earnedAt,
  });
}

enum BadgeType {
  levelCompletion,
  streak,
  testMaster,
  speedLearner,
  codeExplorer,
}
