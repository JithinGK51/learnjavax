import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/simple_models.dart';
import '../controllers/test_controller.dart';
import '../controllers/ads_controller.dart';
import '../widgets/question_widget.dart';

class TestDetailScreen extends StatefulWidget {
  final MockTest test;

  const TestDetailScreen({super.key, required this.test});

  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final testController = Get.find<TestController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test.title),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: [
          if (widget.test.isAttempted) ...[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Get.snackbar(
                  'Test Already Attempted',
                  'You can only attempt this test once.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          ],
        ],
      ),
      body: Obx(() {
        if (testController.isTestActive &&
            testController.currentTest?.id == widget.test.id) {
          return _buildTestInterface();
        } else if (widget.test.isAttempted) {
          return _buildTestResults();
        } else {
          return _buildTestInfo();
        }
      }),
    );
  }

  Widget _buildTestInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Test Header
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryPurple,
                    AppColors.primaryPurpleLight,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.test.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.test.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Test Details
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Test Information',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    Icons.quiz,
                    'Questions',
                    '${widget.test.totalQuestions}',
                  ),
                  _buildInfoRow(
                    Icons.timer,
                    'Time Limit',
                    '${widget.test.timeLimitMinutes} minutes',
                  ),
                  _buildInfoRow(
                    Icons.school,
                    'Level',
                    widget.test.level.displayName,
                  ),
                  _buildInfoRow(
                    Icons.emoji_events,
                    'Passing Score',
                    '${widget.test.passingScore}',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Instructions
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '• You can attempt this test only once\n'
                    '• Read each question carefully\n'
                    '• Select the best answer for each question\n'
                    '• You can navigate between questions\n'
                    '• Submit when you are ready to finish',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Start Test Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => _startTest(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                AppStrings.startTest,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestInterface() {
    final testController = Get.find<TestController>();
    final currentQuestion =
        testController.currentTest?.questions[testController
            .currentQuestionIndex];

    if (currentQuestion == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        // Test Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Progress
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${testController.currentQuestionIndex + 1} of ${testController.currentTest?.totalQuestions}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: testController.getTestProgress(),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Timer
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  testController.formatTime(testController.timeRemaining),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Question
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: QuestionWidget(
              question: currentQuestion,
              onAnswer: (selectedIndex) {
                testController.answerQuestion(
                  currentQuestion.id,
                  selectedIndex,
                );
              },
              selectedAnswer:
                  testController
                      .getAnswerForQuestion(currentQuestion.id)
                      ?.selectedOptionIndex,
            ),
          ),
        ),

        // Navigation Buttons
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Previous Button
              if (testController.currentQuestionIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: testController.previousQuestion,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(AppStrings.previous),
                  ),
                ),

              if (testController.currentQuestionIndex > 0)
                const SizedBox(width: 16),

              // Next/Submit Button
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (testController.currentQuestionIndex <
                        (testController.currentTest?.totalQuestions ?? 0) - 1) {
                      testController.nextQuestion();
                    } else {
                      _submitTest();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    testController.currentQuestionIndex <
                            (testController.currentTest?.totalQuestions ?? 0) -
                                1
                        ? AppStrings.next
                        : AppStrings.submitTest,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTestResults() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Results Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                      widget.test.passed == true
                          ? [
                            AppColors.success,
                            AppColors.success.withOpacity(0.8),
                          ]
                          : [AppColors.error, AppColors.error.withOpacity(0.8)],
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    widget.test.passed == true
                        ? Icons.emoji_events
                        : Icons.cancel,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.test.passed == true
                        ? 'Congratulations!'
                        : 'Better Luck Next Time!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.test.passed == true
                        ? 'You passed the test!'
                        : 'You need to score higher to pass.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Score Details
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Your Score',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildScoreItem(
                        'Score',
                        '${widget.test.score}/${widget.test.totalQuestions}',
                      ),
                      _buildScoreItem(
                        'Percentage',
                        '${((widget.test.score ?? 0) / widget.test.totalQuestions * 100).toStringAsFixed(1)}%',
                      ),
                      _buildScoreItem(
                        'Passing Score',
                        '${widget.test.passingScore}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Back to Tests'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed('/'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Continue Learning'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  void _startTest() {
    final testController = Get.find<TestController>();
    testController.startTest(widget.test);
  }

  Future<void> _submitTest() async {
    final testController = Get.find<TestController>();
    final adsController = Get.find<AdsController>();

    await testController.submitTest();

    // Show interstitial ad after test completion
    await adsController.showInterstitialAd();
  }
}
