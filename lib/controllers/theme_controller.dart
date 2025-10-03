import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String _themeKey = 'theme_mode';

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  final Rx<Color> _accentColor = const Color(0xFF9C6ADE).obs;

  ThemeMode get themeMode => _themeMode.value;
  Color get accentColor => _accentColor.value;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 0;
    _themeMode.value = ThemeMode.values[themeIndex];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
    Get.changeThemeMode(mode);
  }

  Future<void> setAccentColor(Color color) async {
    _accentColor.value = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accent_color', color.value);
  }

  Future<void> loadAccentColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('accent_color');
    if (colorValue != null) {
      _accentColor.value = Color(colorValue);
    }
  }

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;
  bool get isLightMode => _themeMode.value == ThemeMode.light;
  bool get isSystemMode => _themeMode.value == ThemeMode.system;
}
