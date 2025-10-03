import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_strings.dart';
import '../views/home_screen.dart';
import '../views/levels_screen.dart';
import '../views/tests_screen.dart';
import '../views/progress_screen.dart';
import '../views/settings_screen.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  
  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex) return; // Don't navigate to same screen
        
        switch (index) {
          case 0:
            Get.offAll(() => const HomeScreen());
            break;
          case 1:
            Get.offAll(() => const LevelsScreen());
            break;
          case 2:
            Get.offAll(() => const TestsScreen());
            break;
          case 3:
            Get.offAll(() => const ProgressScreen());
            break;
          case 4:
            Get.offAll(() => const SettingsScreen());
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: AppStrings.levels,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: AppStrings.tests,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: AppStrings.progress,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: AppStrings.settings,
        ),
      ],
    );
  }
}
