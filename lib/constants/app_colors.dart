import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Purple Theme
  static const Color primaryPurple = Color(0xFF6A1B9A);
  static const Color primaryPurpleLight = Color(0xFF8E24AA);
  static const Color primaryPurpleDark = Color(0xFF4A148C);

  // Secondary Colors
  static const Color secondaryWhite = Color(0xFFFFFFFF);
  static const Color secondaryLightGray = Color(0xFFF5F5F5);
  static const Color secondaryGray = Color(0xFFE0E0E0);

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkPurple = Color(0xFF4A148C);
  static const Color darkPurpleLight = Color(0xFF6A1B9A);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF424242);  // Darker for better contrast
  static const Color textTertiary = Color(0xFF757575);   // Original secondary for less important text
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFFB0B0B0);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryPurple, primaryPurpleLight],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkPurple, darkPurpleLight],
  );

  // Code Highlighting Colors
  static const Color codeBackground = Color(0xFF2D2D2D);
  static const Color codeKeyword = Color(0xFF569CD6);
  static const Color codeString = Color(0xFFCE9178);
  static const Color codeComment = Color(0xFF6A9955);
  static const Color codeNumber = Color(0xFFB5CEA8);
}
