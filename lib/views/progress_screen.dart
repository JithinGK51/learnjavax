import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/simple_models.dart';
import '../controllers/progress_controller.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/badge_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/connectivity_status_widget.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressController = Get.find<ProgressController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.progress),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: const [
          ConnectivityStatusWidget(),
        ],
      ),
      body: Obx(() {
        if (progressController.userProgress == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return CustomScrollView(
          slivers: [
            // Overall Progress
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: _buildOverallProgressCard(context),
              ),
            ),

            // Daily Streak
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildStreakCard(context),
              ),
            ),

            // Level Progress
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Level Progress',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Levels List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final level = LearningLevel.values[index];
                  final levelProgress = progressController.getLevelProgress(level);
                  
                  if (levelProgress == null) return const SizedBox.shrink();
                  
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: _buildLevelProgressCard(context, level, levelProgress),
                  );
                },
                childCount: LearningLevel.values.length,
              ),
            ),

            // Badges Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Earned Badges',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Badges Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final badges = progressController.earnedBadges;
                    if (index >= badges.length) {
                      return _buildEmptyBadgeSlot(context);
                    }
                    return BadgeWidget(badge: badges[index]);
                  },
                  childCount: (progressController.earnedBadges.length / 3).ceil() * 3,
                ),
              ),
            ),

            // Banner Ad
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const BannerAdWidget(),
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavigationWidget(currentIndex: 3),
    );
  }

  Widget _buildOverallProgressCard(BuildContext context) {
    final progressController = Get.find<ProgressController>();
    final overallProgress = progressController.getOverallProgress();

    return Card(
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
              'Overall Progress',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${overallProgress.toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: overallProgress / 100,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '${progressController.userProgress?.completedLessons.length ?? 0}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lessons',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCard(BuildContext context) {
    final progressController = Get.find<ProgressController>();
    final streak = progressController.dailyStreak;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.local_fire_department,
                color: AppColors.warning,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Streak',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$streak days in a row',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$streak',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.warning,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelProgressCard(BuildContext context, LearningLevel level, LevelProgress levelProgress) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getLevelIcon(level),
                  color: levelProgress.isCompleted ? AppColors.success : AppColors.primaryPurple,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        level.displayName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${levelProgress.completedLessons}/${levelProgress.totalLessons} lessons',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (levelProgress.isCompleted)
                  Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 24,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: levelProgress.progressPercentage / 100,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                levelProgress.isCompleted ? AppColors.success : AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyBadgeSlot(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
      ),
      child: Icon(
        Icons.emoji_events_outlined,
        color: Colors.grey.shade400,
        size: 32,
      ),
    );
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
