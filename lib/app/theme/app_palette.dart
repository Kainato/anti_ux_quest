import 'package:flutter/material.dart';

/// Cores semânticas do app; cada tema fornece a sua instância.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.textPrimary,
    required this.textMuted,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.success,
    required this.successSurface,
    required this.successBorder,
    required this.progressTrack,
    required this.progressTrackLocked,
    required this.faintText,
    required this.fainterText,
  });

  /// Base: blue sea #00C0FE (primary) sobre dark night #0E162C (background).
  static const dark = AppPalette(
    background: Color(0xFF0E162C),
    surface: Color(0xFF17213D),
    surfaceAlt: Color(0xFF1F2B4A),
    border: Color(0xFF2A3860),
    textPrimary: Color(0xFFEAF2FF),
    textMuted: Color(0xFF8A97B8),
    primary: Color(0xFF00C0FE),
    onPrimary: Color(0xFF0E162C),
    accent: Color(0xFFFF6D52),
    success: Color(0xFF4FD18B),
    successSurface: Color(0xFF12302A),
    successBorder: Color(0xFF1F5A46),
    progressTrack: Color(0xFF25325A),
    progressTrackLocked: Color(0xFF1C2748),
    faintText: Color(0xFF2C3A5E),
    fainterText: Color(0xFF34436A),
  );

  /// Inverte os papéis: dark night vira o texto e o blue sea escurece para manter contraste.
  static const light = AppPalette(
    background: Color(0xFFF1F9FD),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFDFF0F8),
    border: Color(0xFFC5DDEA),
    textPrimary: Color(0xFF0E162C),
    textMuted: Color(0xFF5B6B88),
    primary: Color(0xFF0079AD),
    onPrimary: Color(0xFFFFFFFF),
    accent: Color(0xFFD94A30),
    success: Color(0xFF2E7D4F),
    successSurface: Color(0xFFE3F4EA),
    successBorder: Color(0xFFAFD6BE),
    progressTrack: Color(0xFFCFE3EE),
    progressTrackLocked: Color(0xFFD6E6EF),
    faintText: Color(0xFFC4D8E3),
    fainterText: Color(0xFFD2E2EB),
  );

  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color textPrimary;
  final Color textMuted;
  final Color primary;
  final Color onPrimary;
  final Color accent;
  final Color success;
  final Color successSurface;
  final Color successBorder;
  final Color progressTrack;
  final Color progressTrackLocked;

  /// Usadas de propósito com baixo contraste nas fases de acessibilidade.
  final Color faintText;
  final Color fainterText;

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? textPrimary,
    Color? textMuted,
    Color? primary,
    Color? onPrimary,
    Color? accent,
    Color? success,
    Color? successSurface,
    Color? successBorder,
    Color? progressTrack,
    Color? progressTrackLocked,
    Color? faintText,
    Color? fainterText,
  }) {
    return AppPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      successSurface: successSurface ?? this.successSurface,
      successBorder: successBorder ?? this.successBorder,
      progressTrack: progressTrack ?? this.progressTrack,
      progressTrackLocked: progressTrackLocked ?? this.progressTrackLocked,
      faintText: faintText ?? this.faintText,
      fainterText: fainterText ?? this.fainterText,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      success: Color.lerp(success, other.success, t)!,
      successSurface: Color.lerp(successSurface, other.successSurface, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      progressTrack: Color.lerp(progressTrack, other.progressTrack, t)!,
      progressTrackLocked: Color.lerp(
        progressTrackLocked,
        other.progressTrackLocked,
        t,
      )!,
      faintText: Color.lerp(faintText, other.faintText, t)!,
      fainterText: Color.lerp(fainterText, other.fainterText, t)!,
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
}
