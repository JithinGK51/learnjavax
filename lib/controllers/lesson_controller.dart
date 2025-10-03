import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/simple_models.dart';
import '../services/tts_service.dart';

class LessonController extends GetxController {
  final Rx<Lesson?> _currentLesson = Rx<Lesson?>(null);
  final RxInt _currentLessonIndex = 0.obs;
  final RxBool _isPlayingTTS = false.obs;
  final RxList<String> _bookmarkedLessons = <String>[].obs;

  Lesson? get currentLesson => _currentLesson.value;
  int get currentLessonIndex => _currentLessonIndex.value;
  bool get isPlayingTTS => _isPlayingTTS.value;
  List<String> get bookmarkedLessons => _bookmarkedLessons;

  final TTSService _ttsService = TTSService();

  @override
  void onInit() {
    super.onInit();
    _loadBookmarkedLessons();
  }

  Future<void> _loadBookmarkedLessons() async {
    // Load bookmarks from SharedPreferences or keep in memory for now
    _bookmarkedLessons.value = [];
  }

  void setCurrentLesson(Lesson lesson, int index) {
    _currentLesson.value = lesson;
    _currentLessonIndex.value = index;
  }

  Future<void> playTTS(String text) async {
    if (_isPlayingTTS.value) {
      await stopTTS();
      return;
    }

    try {
      _isPlayingTTS.value = true;
      await _ttsService.speak(text);
    } catch (e) {
      debugPrint('TTS Error: $e');
      Get.snackbar(
        'Error',
        'Failed to play text-to-speech',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isPlayingTTS.value = false;
    }
  }

  Future<void> stopTTS() async {
    await _ttsService.stop();
    _isPlayingTTS.value = false;
  }

  Future<void> toggleBookmark(String lessonId) async {
    if (_bookmarkedLessons.contains(lessonId)) {
      _bookmarkedLessons.remove(lessonId);
    } else {
      _bookmarkedLessons.add(lessonId);
    }
  }

  bool isBookmarked(String lessonId) {
    return _bookmarkedLessons.contains(lessonId);
  }

  Future<void> copyCode(String code) async {
    // Implementation for copying code to clipboard
    // This would use the clipboard package
  }

  Future<void> shareLesson(Lesson lesson) async {
    // Implementation for sharing lesson
    // This would use the share_plus package
  }

  List<Lesson> getBookmarkedLessons(List<Lesson> allLessons) {
    return allLessons
        .where((lesson) => _bookmarkedLessons.contains(lesson.id))
        .toList();
  }

  List<Lesson> searchLessons(List<Lesson> allLessons, String query) {
    if (query.isEmpty) return allLessons;

    return allLessons.where((lesson) {
      return lesson.title.toLowerCase().contains(query.toLowerCase()) ||
          lesson.description.toLowerCase().contains(query.toLowerCase()) ||
          lesson.content.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}
