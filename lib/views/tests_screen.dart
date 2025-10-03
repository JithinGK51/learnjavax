import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/simple_models.dart';
import '../controllers/app_controller.dart';
import '../controllers/test_controller.dart';
import '../widgets/test_card.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/connectivity_status_widget.dart';
import 'test_detail_screen.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.tests),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: const [
          ConnectivityStatusWidget(),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Available', icon: Icon(Icons.quiz)),
            Tab(text: 'Completed', icon: Icon(Icons.check_circle)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Available Tests
          _buildAvailableTests(),
          // Completed Tests
          _buildCompletedTests(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(currentIndex: 2),
    );
  }

  Widget _buildAvailableTests() {
    final appController = Get.find<AppController>();
    final testController = Get.find<TestController>();

    return Obx(() {
      final allTests = appController.mockTests;
      final availableTests = <MockTest>[];

      for (final level in LearningLevel.values) {
        availableTests.addAll(
          testController.getAvailableTests(allTests, level),
        );
      }

      if (availableTests.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.quiz_outlined, size: 64, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              Text(
                'No tests available',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
              Text(
                'Complete more lessons to unlock tests',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: availableTests.length + 1, // +1 for banner ad
        itemBuilder: (context, index) {
          if (index == availableTests.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: BannerAdWidget(),
            );
          }

          final test = availableTests[index];
          return TestCard(
            test: test,
            onTap: () => Get.to(() => TestDetailScreen(test: test)),
          );
        },
      );
    });
  }

  Widget _buildCompletedTests() {
    final appController = Get.find<AppController>();
    final testController = Get.find<TestController>();

    return Obx(() {
      final allTests = appController.mockTests;
      final completedTests = testController.getCompletedTests(allTests);

      if (completedTests.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.quiz_outlined, size: 64, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              Text(
                'No completed tests',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
              Text(
                'Take some tests to see your results here',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: completedTests.length + 1, // +1 for banner ad
        itemBuilder: (context, index) {
          if (index == completedTests.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: BannerAdWidget(),
            );
          }

          final test = completedTests[index];
          return TestCard(
            test: test,
            onTap: () => Get.to(() => TestDetailScreen(test: test)),
            showResults: true,
          );
        },
      );
    });
  }
}
