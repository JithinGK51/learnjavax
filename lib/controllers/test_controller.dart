import 'package:get/get.dart';
import '../models/simple_models.dart';
import '../views/test_results_screen.dart';
import 'app_controller.dart';

class TestController extends GetxController {
  final Rx<MockTest?> _currentTest = Rx<MockTest?>(null);
  final RxList<Answer> _currentAnswers = <Answer>[].obs;
  final RxInt _currentQuestionIndex = 0.obs;
  final RxInt _timeRemaining = 0.obs;
  final RxBool _isTestActive = false.obs;
  final RxList<String> _completedTests = <String>[].obs;

  MockTest? get currentTest => _currentTest.value;
  List<Answer> get currentAnswers => _currentAnswers;
  int get currentQuestionIndex => _currentQuestionIndex.value;
  int get timeRemaining => _timeRemaining.value;
  bool get isTestActive => _isTestActive.value;
  List<String> get completedTests => _completedTests;

  @override
  void onInit() {
    super.onInit();
    _loadCompletedTests();
  }

  Future<void> _loadCompletedTests() async {
    // Load completed tests from memory for now
    _completedTests.value = [];
  }

  void startTest(MockTest test) {
    if (_completedTests.contains(test.id)) {
      Get.snackbar(
        'Test Already Attempted',
        'You have already completed this test.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    _currentTest.value = test;
    _currentAnswers.clear();
    _currentQuestionIndex.value = 0;
    _timeRemaining.value = test.timeLimitMinutes * 60; // Convert to seconds
    _isTestActive.value = true;

    // Start timer
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_isTestActive.value && _timeRemaining.value > 0) {
        _timeRemaining.value--;
        _startTimer();
      } else if (_timeRemaining.value == 0) {
        submitTest();
      }
    });
  }

  void answerQuestion(String questionId, int selectedOptionIndex) {
    final question = _currentTest.value?.questions.firstWhere(
      (q) => q.id == questionId,
    );

    if (question != null) {
      final existingAnswerIndex = _currentAnswers.indexWhere(
        (answer) => answer.questionId == questionId,
      );

      final answer = Answer(
        questionId: questionId,
        selectedOptionIndex: selectedOptionIndex,
        isCorrect: selectedOptionIndex == question.correctAnswerIndex,
      );

      if (existingAnswerIndex != -1) {
        _currentAnswers[existingAnswerIndex] = answer;
      } else {
        _currentAnswers.add(answer);
      }
    }
  }

  void nextQuestion() {
    if (_currentQuestionIndex.value <
        (_currentTest.value?.totalQuestions ?? 0) - 1) {
      _currentQuestionIndex.value++;
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex.value > 0) {
      _currentQuestionIndex.value--;
    }
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < (_currentTest.value?.totalQuestions ?? 0)) {
      _currentQuestionIndex.value = index;
    }
  }

  Answer? getAnswerForQuestion(String questionId) {
    try {
      return _currentAnswers.firstWhere(
        (answer) => answer.questionId == questionId,
      );
    } catch (e) {
      return null;
    }
  }

  bool isQuestionAnswered(String questionId) {
    return getAnswerForQuestion(questionId) != null;
  }

  int getAnsweredQuestionsCount() {
    return _currentAnswers.length;
  }

  Future<void> submitTest() async {
    if (_currentTest.value == null) return;

    _isTestActive.value = false;

    final test = _currentTest.value!;
    final score = _currentAnswers.where((answer) => answer.isCorrect).length;
    final passed = score >= test.passingScore;

    // Create test attempt record
    final attempt = TestAttempt(
      testId: test.id,
      startedAt: DateTime.now().subtract(
        Duration(seconds: test.timeLimitMinutes * 60 - _timeRemaining.value),
      ),
      completedAt: DateTime.now(),
      answers: _currentAnswers,
      score: score,
      passed: passed,
    );

    // Mark test as completed in TestController
    _completedTests.add(test.id);

    // Update test in AppController
    try {
      final appController = Get.find<AppController>();
      await appController.completeTest(
        test.id,
        score,
        _currentAnswers.map((answer) => answer.selectedOptionIndex).toList(),
      );
    } catch (e) {
      // AppController not available, that's okay
    }

    // Update test with results
    final updatedTest = test.copyWith(
      isAttempted: true,
      attemptedAt: DateTime.now(),
      score: score,
      passed: passed,
    );

    // Navigate to results screen using direct navigation to avoid route issues
    Get.to(() => TestResultsScreen(test: updatedTest, attempt: attempt));
  }

  void resetTest() {
    _currentTest.value = null;
    _currentAnswers.clear();
    _currentQuestionIndex.value = 0;
    _timeRemaining.value = 0;
    _isTestActive.value = false;
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  double getTestProgress() {
    if (_currentTest.value == null) return 0.0;
    return (_currentQuestionIndex.value + 1) /
        _currentTest.value!.totalQuestions;
  }

  List<MockTest> getAvailableTests(
    List<MockTest> allTests,
    LearningLevel level,
  ) {
    return allTests
        .where(
          (test) => test.level == level && !_completedTests.contains(test.id),
        )
        .toList();
  }

  List<MockTest> getCompletedTests(List<MockTest> allTests) {
    return allTests.where((test) => _completedTests.contains(test.id)).toList();
  }

  void resetAllTests() {
    _currentTest.value = null;
    _currentAnswers.clear();
    _currentQuestionIndex.value = 0;
    _timeRemaining.value = 0;
    _isTestActive.value = false;
    _completedTests.clear();
  }

  @override
  void onClose() {
    _isTestActive.value = false;
    super.onClose();
  }
}
