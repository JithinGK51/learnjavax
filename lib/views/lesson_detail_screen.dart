import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/simple_models.dart';
import '../controllers/lesson_controller.dart';
import '../controllers/progress_controller.dart';
import '../controllers/ads_controller.dart';
import '../controllers/app_controller.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/glossary_widget.dart';
import '../widgets/code_example_widget.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessonController = Get.find<LessonController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: [
          // TTS Button
          Obx(() {
            return IconButton(
              icon: Icon(
                lessonController.isPlayingTTS ? Icons.stop : Icons.volume_up,
              ),
              onPressed: () => lessonController.playTTS(widget.lesson.content),
            );
          }),

          // Bookmark Button
          Obx(() {
            final isBookmarked = lessonController.isBookmarked(
              widget.lesson.id,
            );
            return IconButton(
              icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
              onPressed:
                  () => lessonController.toggleBookmark(widget.lesson.id),
            );
          }),

          // Share Button
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => lessonController.shareLesson(widget.lesson),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Notes', icon: Icon(Icons.article)),
            Tab(text: 'Code', icon: Icon(Icons.code)),
            Tab(text: 'Glossary', icon: Icon(Icons.book)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Notes Tab
                _buildNotesTab(),

                // Code Tab
                _buildCodeTab(),

                // Glossary Tab
                _buildGlossaryTab(),
              ],
            ),
          ),

          // Banner Ad
          const BannerAdWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _completeLesson(),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.check),
        label: const Text('Mark Complete'),
      ),
    );
  }

  Widget _buildNotesTab() {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lesson Content
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              widget.lesson.content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Lesson Info
          _buildLessonInfo(),
        ],
      ),
    );
  }

  Widget _buildCodeTab() {
    if (widget.lesson.codeExamples.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.code_off, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No code examples available',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.lesson.codeExamples.length,
      itemBuilder: (context, index) {
        final codeExample = widget.lesson.codeExamples[index];
        return CodeExampleWidget(
          codeExample: codeExample,
          onCopy: () => _copyCode(codeExample.code),
        );
      },
    );
  }

  Widget _buildGlossaryTab() {
    if (widget.lesson.glossaryTerms.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No glossary terms available',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.lesson.glossaryTerms.length,
      itemBuilder: (context, index) {
        final term = widget.lesson.glossaryTerms[index];
        return GlossaryWidget(term: term);
      },
    );
  }

  Widget _buildLessonInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lesson Information',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.timer,
              'Duration',
              '${widget.lesson.estimatedMinutes} minutes',
            ),
            _buildInfoRow(
              Icons.code,
              'Code Examples',
              '${widget.lesson.codeExamples.length}',
            ),
            _buildInfoRow(
              Icons.book,
              'Glossary Terms',
              '${widget.lesson.glossaryTerms.length}',
            ),
            _buildInfoRow(
              Icons.school,
              'Level',
              widget.lesson.level.displayName,
            ),
          ],
        ),
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

  void _copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    Get.snackbar(
      'Copied!',
      'Code copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
    );
  }

  Future<void> _completeLesson() async {
    if (widget.lesson.isCompleted) {
      Get.snackbar(
        'Already Completed',
        'This lesson is already marked as complete',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Mark lesson as completed
    final progressController = Get.find<ProgressController>();
    final appController = Get.find<AppController>();

    await progressController.completeLesson(
      widget.lesson.id,
      widget.lesson.level,
      widget.lesson.estimatedMinutes,
    );

    // Also update app controller
    await appController.completeLesson(widget.lesson.id);

    // Check if a mock test is required
    final requiredTest = appController.getRequiredTestForLesson(
      widget.lesson.id,
    );

    // Show completion dialog
    if (mounted) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Lesson Completed!'),
              content:
                  requiredTest != null
                      ? const Text(
                        'Great job! You\'ve completed this lesson. Now it\'s time for a mock test to test your knowledge!',
                      )
                      : const Text('Great job! You\'ve completed this lesson.'),
              actions: [
                if (requiredTest != null) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.back();
                      // Navigate to mock test
                      Get.toNamed('/test-detail', arguments: requiredTest);
                    },
                    child: const Text('Take Mock Test'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.back();
                    },
                    child: const Text('Continue Learning'),
                  ),
                ] else ...[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.back();
                    },
                    child: const Text('Continue Learning'),
                  ),
                ],
              ],
            ),
      );
    }

    // Show interstitial ad after completion
    final adsController = Get.find<AdsController>();
    await adsController.showInterstitialAd();
  }
}
