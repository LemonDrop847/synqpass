import 'package:flutter/material.dart';

class TierColors {
  static const silver = TierStyle(
    cardBackground: LinearGradient(
      colors: [Color(0xFFbdc3c7), Color(0xFF2c3e50)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    primaryAccent: Color(0xFFFFFFFF),
    secondaryAccent: Color(0xFF333333),
    buttonText: Colors.black,
    textPrimary: Colors.white,
    textSecondary: Color(0xFFE0E0E0),
  );

  static const gold = TierStyle(
    cardBackground: LinearGradient(
      colors: [Color(0xFF2C2C2C), Color(0xFF000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    primaryAccent: Color(0xFFFFD700),
    secondaryAccent: Color(0xFFB8860B),
    buttonText: Colors.black,
    textPrimary: Color(0xFFFFD700),
    textSecondary: Color(0xFFE0E0E0),
  );

  static const platinum = TierStyle(
    cardBackground: LinearGradient(
      colors: [Color(0xFF000428), Color(0xFF004e92)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    primaryAccent: Color(0xFFE5E4E2),
    secondaryAccent: Color(0xFF4A4A4A),
    buttonText: Colors.white,
    textPrimary: Colors.white,
    textSecondary: Color(0xFFCFD8DC),
  );
}

class TierStyle {
  final Gradient cardBackground;
  final Color primaryAccent;
  final Color secondaryAccent;
  final Color buttonText;
  final Color textPrimary;
  final Color textSecondary;

  const TierStyle({
    required this.cardBackground,
    required this.primaryAccent,
    required this.secondaryAccent,
    required this.buttonText,
    required this.textPrimary,
    required this.textSecondary,
  });
}
