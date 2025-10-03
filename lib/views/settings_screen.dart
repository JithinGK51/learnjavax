import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../controllers/theme_controller.dart';
import '../controllers/app_controller.dart';
import '../controllers/progress_controller.dart';
import '../controllers/test_controller.dart';
import '../widgets/settings_tile.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/connectivity_status_widget.dart';
import 'privacy_policy_screen.dart';
import 'terms_conditions_screen.dart';
import 'developer_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        actions: const [
          ConnectivityStatusWidget(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Section
          _buildSectionHeader(context, 'Appearance'),
          SettingsTile(
            icon: Icons.palette,
            title: 'Theme',
            subtitle: _getThemeSubtitle(themeController.themeMode),
            onTap: () => _showThemeDialog(context, themeController),
          ),

          const SizedBox(height: 16),

          // About Section
          _buildSectionHeader(context, 'About'),
          SettingsTile(
            icon: Icons.info,
            title: 'App Version',
            subtitle: AppStrings.appVersion,
            onTap: () => _showAboutDialog(context),
          ),

          SettingsTile(
            icon: Icons.privacy_tip,
            title: AppStrings.privacyPolicy,
            subtitle: 'View our privacy policy',
            onTap: () => Get.to(() => const PrivacyPolicyScreen()),
          ),

          SettingsTile(
            icon: Icons.description,
            title: AppStrings.termsAndConditions,
            subtitle: 'View terms and conditions',
            onTap: () => Get.to(() => const TermsConditionsScreen()),
          ),

          SettingsTile(
            icon: Icons.code,
            title: 'Developers',
            subtitle: 'Meet the development team',
            onTap: () => Get.to(() => const DeveloperScreen()),
          ),

          const SizedBox(height: 16),

          // Data Section
          _buildSectionHeader(context, 'Data'),
          SettingsTile(
            icon: Icons.delete_forever,
            title: 'Clear All Data',
            subtitle: 'Reset app data and progress',
            onTap: () => _showClearDataDialog(context),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(currentIndex: 4),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryPurple,
        ),
      ),
    );
  }

  String _getThemeSubtitle(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return AppStrings.lightTheme;
      case ThemeMode.dark:
        return AppStrings.darkTheme;
      case ThemeMode.system:
        return AppStrings.systemTheme;
    }
  }

  void _showThemeDialog(BuildContext context, ThemeController themeController) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Choose Theme'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  title: const Text(AppStrings.lightTheme),
                  value: ThemeMode.light,
                  groupValue: themeController.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeController.setThemeMode(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: const Text(AppStrings.darkTheme),
                  value: ThemeMode.dark,
                  groupValue: themeController.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeController.setThemeMode(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: const Text(AppStrings.systemTheme),
                  value: ThemeMode.system,
                  groupValue: themeController.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeController.setThemeMode(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppStrings.appName,
      applicationVersion: AppStrings.appVersion,
      applicationLegalese: '© 2025 LearnJavaX. All rights reserved.',
      children: [const Text(AppStrings.appDescription)],
    );
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear All Data'),
            content: const Text(
              'This will permanently delete all your progress, bookmarks, and settings. This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _clearAllData();
                },
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                child: const Text('Clear Data'),
              ),
            ],
          ),
    );
  }

  void _clearAllData() async {
    try {
      // Get all controllers
      final appController = Get.find<AppController>();
      final progressController = Get.find<ProgressController>();
      final testController = Get.find<TestController>();

      // Reset all lessons to not completed
      final resetLessons =
          appController.lessons
              .map(
                (lesson) =>
                    lesson.copyWith(isCompleted: false, completedAt: null),
              )
              .toList();

      // Reset all tests to not attempted
      final resetTests =
          appController.mockTests
              .map(
                (test) => test.copyWith(
                  isAttempted: false,
                  attemptedAt: null,
                  score: 0,
                  passed: false,
                ),
              )
              .toList();

      // Update lessons and tests in AppController
      await appController.resetAllData(resetLessons, resetTests);

      // Reset progress controller
      progressController.resetAllProgress();

      // Reset test controller
      testController.resetAllTests();

      // Show success message
      Get.snackbar(
        'Data Cleared',
        'All app data has been cleared. You can start fresh!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // Navigate to home screen
      Get.offAllNamed('/');
    } catch (e) {
      // Show error message
      Get.snackbar(
        'Error',
        'Failed to clear data. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
      );
    }
  }
}
