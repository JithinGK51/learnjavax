import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';

class TestCard extends StatelessWidget {
  final MockTest test;
  final VoidCallback onTap;
  final bool showResults;

  const TestCard({
    super.key,
    required this.test,
    required this.onTap,
    this.showResults = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  // Test Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getTestColor(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      _getTestIcon(),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Title and Level
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          test.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          test.level.displayName,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Status Badge
                  if (showResults && test.isAttempted) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: test.passed == true ? AppColors.success : AppColors.error,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        test.passed == true ? 'PASSED' : 'FAILED',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ] else if (test.isAttempted) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.info,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'COMPLETED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Description
              Text(
                test.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 16),
              
              // Footer Row
              Row(
                children: [
                  // Questions Count
                  Icon(
                    Icons.quiz,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${test.totalQuestions} questions',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Time Limit
                  Icon(
                    Icons.timer,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${test.timeLimitMinutes} min',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Score (if completed)
                  if (showResults && test.isAttempted && test.score != null) ...[
                    Text(
                      'Score: ${test.score}/${test.totalQuestions}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getTestColor(),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  
                  // Arrow Icon
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTestColor() {
    if (showResults && test.isAttempted) {
      return test.passed == true ? AppColors.success : AppColors.error;
    }
    return AppColors.primaryPurple;
  }

  IconData _getTestIcon() {
    if (showResults && test.isAttempted) {
      return test.passed == true ? Icons.check_circle : Icons.cancel;
    }
    return Icons.quiz;
  }
}
