import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    _isInitialized = true;
  }

  Future<void> speak(
    String text, {
    double? rate,
    double? volume,
    String? language,
  }) async {
    if (!_isInitialized) await init();

    if (rate != null) await _flutterTts.setSpeechRate(rate);
    if (volume != null) await _flutterTts.setVolume(volume);
    if (language != null) await _flutterTts.setLanguage(language);

    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> pause() async {
    await _flutterTts.pause();
  }

  Future<void> resume() async {
    await _flutterTts.speak("");
  }

  Future<List<dynamic>> getLanguages() async {
    return await _flutterTts.getLanguages;
  }

  Future<List<dynamic>> getEngines() async {
    return await _flutterTts.getEngines;
  }

  void dispose() {
    _flutterTts.stop();
  }
}
