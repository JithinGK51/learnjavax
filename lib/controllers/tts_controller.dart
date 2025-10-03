import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/tts_service.dart';

class TTSController extends GetxController {
  final TTSService _ttsService = TTSService();

  final RxBool _isPlaying = false.obs;
  final RxBool _isEnabled = true.obs;
  final RxDouble _speechRate = 0.5.obs;
  final RxDouble _volume = 1.0.obs;
  final RxString _selectedLanguage = 'en-US'.obs;

  bool get isPlaying => _isPlaying.value;
  bool get isEnabled => _isEnabled.value;
  double get speechRate => _speechRate.value;
  double get volume => _volume.value;
  String get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    // Load TTS settings from storage
    // Implementation would load from SharedPreferences
  }

  Future<void> speak(String text) async {
    if (!_isEnabled.value || text.isEmpty) return;

    try {
      _isPlaying.value = true;
      await _ttsService.speak(
        text,
        rate: _speechRate.value,
        volume: _volume.value,
        language: _selectedLanguage.value,
      );
    } catch (e) {
      debugPrint('TTS Error: $e');
      Get.snackbar(
        'TTS Error',
        'Failed to play text-to-speech',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isPlaying.value = false;
    }
  }

  Future<void> stop() async {
    await _ttsService.stop();
    _isPlaying.value = false;
  }

  Future<void> pause() async {
    await _ttsService.pause();
    _isPlaying.value = false;
  }

  Future<void> resume() async {
    await _ttsService.resume();
    _isPlaying.value = true;
  }

  void setEnabled(bool enabled) {
    _isEnabled.value = enabled;
    if (!enabled && _isPlaying.value) {
      stop();
    }
  }

  void setSpeechRate(double rate) {
    _speechRate.value = rate.clamp(0.1, 2.0);
  }

  void setVolume(double volume) {
    _volume.value = volume.clamp(0.0, 1.0);
  }

  void setLanguage(String language) {
    _selectedLanguage.value = language;
  }

  Future<void> saveSettings() async {
    // Save TTS settings to storage
    // Implementation would save to SharedPreferences
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}
