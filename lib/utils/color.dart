import 'package:flutter/material.dart';

class AppColors {
  // Core Brand Colors - Ultra Premium Light Theme
  static const Color primaryColor = Color(0xFF6366F1); // Energetic Electric Indigo
  static const Color secondaryColor = Color(0xFFFFFFFF); // Clean White Surface
  static const Color backgroundColor = Color(0xFFF8FAFC); // Crisp Light Slate Canvas
  static const Color whiteColor = Color(0xFF0F172A); // Dark Slate for main text
  static const Color pureWhite = Color(0xFFFFFFFF); // Pure White
  static const Color blackOpacityColor = Color(0x1A000000);
  static const Color limeColor = Color(0xFF10B981); // Emerald Green Accent

  // Modern Fiverr / Dribbble UI Accent Palette
  static const Color accentCyan = Color(0xFF06B6D4);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentOrange = Color(0xFFFF5964);
  static const Color accentYellow = Color(0xFFF59E0B);

  // Surfaces & Borders
  static const Color cardSurface = Color(0xFFFFFFFF);
  static const Color cardSurfaceLight = Color(0xFFF1F5F9);
  static const Color cardBorder = Color(0xFFE2E8F0);
  static const Color cardBorderGlow = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textDark = Color(0xFF0F172A);

  // Luxury Dribbble Gradients
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFA855F7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient limeGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coralGradient = LinearGradient(
    colors: [Color(0xFFFF5964), Color(0xFFF43F5E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanGradient = LinearGradient(
    colors: [Color(0xFF06B6D4), Color(0xFF0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightCardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}