import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';
import '../controllers/lesson_controller.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;
  final bool isLocked;
  final MockTest? requiredTest;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.onTap,
    this.isLocked = false,
    this.requiredTest,
  });

  @override
  Widget build(BuildContext context) {
    final lessonController = Get.find<LessonController>();

    return Card(
      elevation: isLocked ? 2 : 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).colorScheme.surface,  // Use theme-aware background
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isLocked 
                ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.5)
                : Theme.of(context).colorScheme.surface,
            border: isLocked 
                ? Border.all(
                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3), 
                    width: 1,
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  // Lesson Number
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          isLocked
                              ? Colors.grey.shade400
                              : lesson.isCompleted
                              ? AppColors.success
                              : AppColors.primaryPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child:
                          isLocked
                              ? const Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 20,
                              )
                              : lesson.isCompleted
                              ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              )
                              : Text(
                                '${lesson.order}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Title and Status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color:
                                isLocked
                                    ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)
                                    : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lesson.description,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color:
                                isLocked
                                    ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)
                                    : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w500,  // Make it slightly bolder
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Bookmark Button (only if not locked)
                  if (!isLocked)
                    Obx(() {
                      final isBookmarked = lessonController.isBookmarked(
                        lesson.id,
                      );
                      return IconButton(
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color:
                              isBookmarked
                                  ? AppColors.primaryPurple
                                  : Colors.grey,
                        ),
                        onPressed:
                            () => lessonController.toggleBookmark(lesson.id),
                      );
                    }),
                ],
              ),

              // Test Required Indicator
              if (isLocked && requiredTest != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber,
                        size: 16,
                        color: AppColors.error,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Test Required: ${requiredTest?.title ?? 'Unknown Test'}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // Content Preview
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isLocked 
                      ? Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
                      : AppColors.primaryPurple.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isLocked 
                        ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)
                        : AppColors.primaryPurple.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                child: Text(
                  lesson.content.length > 100
                      ? '${lesson.content.substring(0, 100)}...'
                      : lesson.content,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isLocked
                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)
                            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,  // Make it readable
                    height: 1.4,  // Better line height
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 16),

              // Footer Row
              Row(
                children: [
                  // Duration
                  Icon(
                    Icons.timer,
                    size: 16,
                    color:
                        isLocked
                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)
                            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${lesson.estimatedMinutes} min',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          isLocked
                              ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)
                              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,  // Make it more visible
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Code Examples Count
                  Icon(
                    Icons.code,
                    size: 16,
                    color:
                        isLocked
                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)
                            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${lesson.codeExamples.length} examples',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          isLocked
                              ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)
                              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,  // Make it more visible
                    ),
                  ),

                  const Spacer(),

                  // Arrow Icon
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        isLocked
                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)
                            : Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
