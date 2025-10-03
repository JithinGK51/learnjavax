import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';
import '../controllers/ads_controller.dart';

class TestResultsScreen extends StatelessWidget {
  final MockTest test;
  final TestAttempt attempt;

  const TestResultsScreen({
    super.key,
    required this.test,
    required this.attempt,
  });

  @override
  Widget build(BuildContext context) {
    final adsController = Get.find<AdsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results'),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Get.offAllNamed('/'),
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        attempt.passed
                            ? [
                              AppColors.success,
                              AppColors.success.withOpacity(0.8),
                            ]
                            : [
                              AppColors.error,
                              AppColors.error.withOpacity(0.8),
                            ],
                  ),
                ),
                child: Column(
                  children: [
                    // Result Icon
                    Icon(
                      attempt.passed ? Icons.check_circle : Icons.cancel,
                      size: 80,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),

                    // Result Text
                    Text(
                      attempt.passed
                          ? 'Congratulations!'
                          : 'Better Luck Next Time',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      attempt.passed
                          ? 'You passed the test!'
                          : 'You need more practice',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Score Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Score',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _buildScoreItem(
                            context,
                            'Correct',
                            '${attempt.score}',
                            AppColors.success,
                            Icons.check_circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildScoreItem(
                            context,
                            'Incorrect',
                            '${test.totalQuestions - attempt.score}',
                            AppColors.error,
                            Icons.cancel,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Progress Bar
                    LinearProgressIndicator(
                      value: attempt.score / test.totalQuestions,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        attempt.passed ? AppColors.success : AppColors.error,
                      ),
                      minHeight: 8,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '${((attempt.score / test.totalQuestions) * 100).toStringAsFixed(1)}%',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            attempt.passed
                                ? AppColors.success
                                : AppColors.error,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Test Details
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Test Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildDetailRow(
                      context,
                      'Test Name',
                      test.title,
                      Icons.quiz,
                    ),
                    _buildDetailRow(
                      context,
                      'Level',
                      test.level.displayName,
                      Icons.school,
                    ),
                    _buildDetailRow(
                      context,
                      'Questions',
                      '${test.totalQuestions}',
                      Icons.help_outline,
                    ),
                    _buildDetailRow(
                      context,
                      'Time Limit',
                      '${test.timeLimitMinutes} minutes',
                      Icons.timer,
                    ),
                    _buildDetailRow(
                      context,
                      'Passing Score',
                      '${test.passingScore}/${test.totalQuestions}',
                      Icons.flag,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retake Test'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Get.offAllNamed('/'),
                    icon: const Icon(Icons.home),
                    label: const Text('Go Home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurpleLight,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Banner Ad
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Obx(() => adsController.getBannerAd()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreItem(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryPurple, size: 20),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
