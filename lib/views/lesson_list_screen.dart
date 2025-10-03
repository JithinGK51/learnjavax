import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';
import '../controllers/app_controller.dart';
import '../controllers/lesson_controller.dart';
import '../widgets/lesson_card.dart';
import '../widgets/banner_ad_widget.dart';
import 'lesson_detail_screen.dart';
import 'test_detail_screen.dart';

class LessonListScreen extends StatefulWidget {
  final LearningLevel level;

  const LessonListScreen({super.key, required this.level});

  @override
  State<LessonListScreen> createState() => _LessonListScreenState();
}

class _LessonListScreenState extends State<LessonListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    final lessonController = Get.find<LessonController>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,  // Use theme-aware background
      appBar: AppBar(
        title: Text(widget.level.displayName),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: LessonSearchDelegate(widget.level),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surface,  // Use theme-aware background
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, 
                fontSize: 16, 
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'Search lessons...',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6), 
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search, 
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                suffixIcon:
                    _searchQuery.isNotEmpty
                        ? IconButton(
                          icon: Icon(
                            Icons.clear, 
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.primaryPurple,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Lessons List
          Expanded(
            child: Obx(() {
              final lessons = appController.getLessonsByLevel(widget.level);
              final filteredLessons =
                  _searchQuery.isEmpty
                      ? lessons
                      : lessonController.searchLessons(lessons, _searchQuery);

              if (filteredLessons.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _searchQuery.isEmpty
                            ? 'No lessons available'
                            : 'No lessons found',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredLessons.length + 1, // +1 for banner ad
                itemBuilder: (context, index) {
                  if (index == filteredLessons.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: BannerAdWidget(),
                    );
                  }

                  final lesson = filteredLessons[index];
                  final isUnlocked = appController.isLessonUnlocked(lesson.id);
                  final requiredTest = appController.getRequiredTestForLesson(
                    lesson.id,
                  );
                  final isTestRequired = appController.isTestRequiredForLesson(
                    lesson.id,
                  );

                  return LessonCard(
                    lesson: lesson,
                    onTap:
                        isUnlocked
                            ? () =>
                                Get.to(() => LessonDetailScreen(lesson: lesson))
                            : () {
                              if (isTestRequired &&
                                  requiredTest?.id.isNotEmpty == true) {
                                _showTestRequiredDialog(context, requiredTest!);
                              } else {
                                _showLockedLessonDialog(context, lesson);
                              }
                            },
                    isLocked: !isUnlocked,
                    requiredTest: isTestRequired ? requiredTest : null,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showTestRequiredDialog(BuildContext context, MockTest requiredTest) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.quiz, color: AppColors.primaryPurple),
              const SizedBox(width: 8),
              const Text('Test Required'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You must complete the following test before accessing more lessons:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requiredTest.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      requiredTest.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${requiredTest.timeLimitMinutes} minutes',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.help_outline,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${requiredTest.totalQuestions} questions',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'This test covers lessons 1-${requiredTest.requiredAfterLesson}. Complete it to continue your learning journey!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(() => TestDetailScreen(test: requiredTest));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Take Test'),
            ),
          ],
        );
      },
    );
  }

  void _showLockedLessonDialog(BuildContext context, Lesson lesson) {
    final appController = Get.find<AppController>();
    final isLevelLocked = !appController.isLevelUnlocked(lesson.level);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                isLevelLocked ? Icons.lock : Icons.schedule,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(isLevelLocked ? 'Level Locked' : 'Lesson Locked'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isLevelLocked) ...[
                Text(
                  'Complete the previous level to unlock this level:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
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
                        'Complete ${_getPreviousLevelName(lesson.level)} Level',
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
              ] else ...[
                Text(
                  'Complete the previous lessons and tests to unlock this lesson:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.quiz, color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Complete Previous Tests',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Take mock tests after every 5 lessons to unlock the next group.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _getPreviousLevelName(LearningLevel level) {
    switch (level) {
      case LearningLevel.scratch:
        return '';
      case LearningLevel.beginner:
        return 'Scratch';
      case LearningLevel.middle:
        return 'Beginner';
      case LearningLevel.advanced:
        return 'Middle';
      case LearningLevel.pro:
        return 'Advanced';
      case LearningLevel.master:
        return 'Pro';
    }
  }
}

class LessonSearchDelegate extends SearchDelegate<String> {
  final LearningLevel level;

  LessonSearchDelegate(this.level);

  void _showTestRequiredDialog(BuildContext context, MockTest requiredTest) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.quiz, color: AppColors.primaryPurple),
              const SizedBox(width: 8),
              const Text('Test Required'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You must complete the following test before accessing more lessons:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requiredTest.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      requiredTest.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${requiredTest.timeLimitMinutes} minutes',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.help_outline,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${requiredTest.totalQuestions} questions',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'This test covers lessons 1-${requiredTest.requiredAfterLesson}. Complete it to continue your learning journey!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(() => TestDetailScreen(test: requiredTest));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Take Test'),
            ),
          ],
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final appController = Get.find<AppController>();
    final lessonController = Get.find<LessonController>();
    final lessons = appController.getLessonsByLevel(level);
    final filteredLessons = lessonController.searchLessons(lessons, query);

    return ListView.builder(
      itemCount: filteredLessons.length,
      itemBuilder: (context, index) {
        final lesson = filteredLessons[index];
        final canAccess = appController.canAccessLesson(lesson.id);
        final requiredTest = appController.getRequiredTestForLesson(lesson.id);
        final isTestRequired = appController.isTestRequiredForLesson(lesson.id);

        return LessonCard(
          lesson: lesson,
          onTap:
              canAccess
                  ? () {
                    close(context, '');
                    Get.to(() => LessonDetailScreen(lesson: lesson));
                  }
                  : () {
                    if (isTestRequired && requiredTest?.id.isNotEmpty == true) {
                      _showTestRequiredDialog(context, requiredTest!);
                    }
                  },
          isLocked: !canAccess,
          requiredTest: isTestRequired ? requiredTest : null,
        );
      },
    );
  }
}
