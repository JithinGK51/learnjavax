// This is a basic Flutter widget test for LearnJavaX app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:learnjavax/main.dart';
import 'package:learnjavax/controllers/app_controller.dart';
import 'package:learnjavax/controllers/theme_controller.dart';
import 'package:learnjavax/controllers/lesson_controller.dart';
import 'package:learnjavax/controllers/test_controller.dart';
import 'package:learnjavax/controllers/progress_controller.dart';
import 'package:learnjavax/controllers/tts_controller.dart';
import 'package:learnjavax/controllers/ads_controller.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Initialize GetX controllers
    Get.put(AppController());
    Get.put(ThemeController());
    Get.put(LessonController());
    Get.put(TestController());
    Get.put(ProgressController());
    Get.put(TTSController());
    Get.put(AdsController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const LearnJavaXApp());

    // Wait for the splash screen to complete
    await tester.pumpAndSettle();

    // Verify that the app loads without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
