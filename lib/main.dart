import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'constants/app_themes.dart';
import 'constants/app_strings.dart';
import 'controllers/app_controller.dart';
import 'controllers/theme_controller.dart';
import 'controllers/lesson_controller.dart';
import 'controllers/test_controller.dart';
import 'controllers/progress_controller.dart';
import 'controllers/tts_controller.dart';
import 'controllers/ads_controller.dart';
import 'controllers/coupon_controller.dart';
import 'controllers/connectivity_controller.dart';
import 'views/splash_screen.dart';
import 'views/test_results_screen.dart';
import 'views/app_wrapper.dart';
import 'models/simple_models.dart';
import 'services/notification_service.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Google Mobile Ads with error handling
    try {
      await MobileAds.instance.initialize();
    } catch (e) {
      debugPrint('Failed to initialize Mobile Ads: $e');
    }

    // Initialize services with error handling
    try {
      await NotificationService.init();
    } catch (e) {
      debugPrint('Failed to initialize Notification Service: $e');
    }

    // Initialize controllers before app starts
    Get.put(ConnectivityController());
    Get.put(ThemeController());
    Get.put(AppController());
    Get.put(LessonController());
    Get.put(TestController());
    Get.put(ProgressController());
    Get.put(TTSController());
    Get.put(AdsController());
    Get.put(CouponController());

    // Set preferred orientations with error handling
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } catch (e) {
      debugPrint('Failed to set preferred orientations: $e');
    }

    // Set system UI overlay style with error handling
    try {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } catch (e) {
      debugPrint('Failed to set system UI overlay style: $e');
    }

    runApp(const LearnJavaXApp());
  } catch (e, stackTrace) {
    debugPrint('Fatal error during app initialization: $e');
    debugPrint('Stack trace: $stackTrace');
    
    // Run a minimal app in case of critical failure
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'App initialization failed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Error: $e'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LearnJavaXApp extends StatelessWidget {
  const LearnJavaXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeController.themeMode,
          home: const AppWrapper(),
          getPages: [
            GetPage(
              name: '/test-results',
              page: () {
                final args = Get.arguments as Map<String, dynamic>;
                return TestResultsScreen(
                  test: args['test'] as MockTest,
                  attempt: args['attempt'] as TestAttempt,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
