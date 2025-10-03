import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';
import '../controllers/progress_controller.dart';

class LevelCard extends StatelessWidget {
  final LearningLevel level;
  final VoidCallback onTap;
  final bool isUnlocked;

  const LevelCard({
    super.key,
    required this.level,
    required this.onTap,
    this.isUnlocked = true,
  });

  @override
  Widget build(BuildContext context) {
    final progressController = Get.find<ProgressController>();

    return Obx(() {
      final levelProgress = progressController.getLevelProgress(level);

      return Card(
        elevation: isUnlocked ? 6 : 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: isUnlocked ? onTap : null,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient:
                  isUnlocked
                      ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primaryPurple,
                          AppColors.primaryPurpleLight,
                        ],
                      )
                      : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey.shade300, Colors.grey.shade400],
                      ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Level Icon
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(17.5),
                  ),
                  child: Icon(
                    _getLevelIcon(level),
                    color: isUnlocked ? Colors.white : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                    size: 18,
                  ),
                ),

                const SizedBox(height: 6),

                // Level Name
                Text(
                  level.displayName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isUnlocked ? Colors.white : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                // Progress Bar or Lock Icon
                if (isUnlocked && levelProgress != null) ...[
                  LinearProgressIndicator(
                    value: levelProgress.progressPercentage / 100,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                    minHeight: 2,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${levelProgress.completedLessons}/${levelProgress.totalLessons}',
                    style: const TextStyle(fontSize: 9, color: Colors.white70),
                  ),
                ] else if (!isUnlocked) ...[
                  Icon(Icons.lock, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4), size: 12),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }

  IconData _getLevelIcon(LearningLevel level) {
    switch (level) {
      case LearningLevel.scratch:
        return Icons.auto_awesome;
      case LearningLevel.beginner:
        return Icons.play_arrow;
      case LearningLevel.middle:
        return Icons.trending_up;
      case LearningLevel.advanced:
        return Icons.speed;
      case LearningLevel.pro:
        return Icons.star;
      case LearningLevel.master:
        return Icons.emoji_events;
    }
  }
}
