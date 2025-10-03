import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/simple_models.dart';
import '../widgets/level_card.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/connectivity_status_widget.dart';
import '../controllers/app_controller.dart';
import 'lesson_list_screen.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,  // Use theme-aware background
      appBar: AppBar(
        title: const Text(AppStrings.levels),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: const [
          ConnectivityStatusWidget(),
        ],
      ),
      body: GetBuilder<AppController>(
        builder:
            (appController) => CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Choose Your Learning Level',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start from scratch or continue where you left off',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                                fontWeight: FontWeight.w500,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),

                // Levels Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              1.1, // Slightly reduced to prevent overflow
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final level = LearningLevel.values[index];
                      final isUnlocked = appController.isLevelUnlocked(level);
                      return LevelCard(
                        level: level,
                        isUnlocked: isUnlocked,
                        onTap:
                            isUnlocked
                                ? () =>
                                    Get.to(() => LessonListScreen(level: level))
                                : () => _showLockedLevelDialog(context, level),
                      );
                    }, childCount: LearningLevel.values.length),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Banner Ad
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: const BannerAdWidget(),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(currentIndex: 1),
    );
  }

  void _showLockedLevelDialog(BuildContext context, LearningLevel level) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(Icons.lock, color: Colors.orange, size: 24),
                const SizedBox(width: 8),
                Text('Level Locked'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Complete ${_getPreviousLevelName(level)} Level',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Complete all lessons and tests in the previous level to unlock this level.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  LearningLevel? _getPreviousLevel(LearningLevel level) {
    final levels = LearningLevel.values;
    final currentIndex = levels.indexOf(level);
    if (currentIndex > 0) {
      return levels[currentIndex - 1];
    }
    return null;
  }

  String _getPreviousLevelName(LearningLevel level) {
    final previousLevel = _getPreviousLevel(level);
    if (previousLevel == null) return 'Previous';

    switch (previousLevel) {
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
}
