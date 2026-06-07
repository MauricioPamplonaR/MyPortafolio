import 'package:flutter/material.dart';
import 'package:portafolio_app_web/styles/app_colors.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class AppTheme {
  final String fontFamily;

  AppTheme({required this.fontFamily});

  ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimaryColor,
        onPrimary: AppColors.gray[900]!,
        surface: AppColors.darkBackgroundColor,
        onSurface: AppColors.gray[100]!,
        outline: AppColors.gray[800]!,
        outlineVariant: AppColors.gray[400]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
      outlinedButtonTextStyle: _darkOutlinedButtonTextStyle,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    );
  }

  ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.gray[100]!,
        surface: AppColors.gray[200]!,
        outline: AppColors.gray[400]!,
        outlineVariant: AppColors.gray[300]!,
        onSurface: AppColors.gray[900]!,
        onSurfaceVariant: AppColors.gray[700]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
      outlinedButtonTextStyle: _lightOutlinedButtonTextStyle,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[200]!),
    );
  }

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(const Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates(colorScheme),
          foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.primary;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed) ||
                states.contains(WidgetState.focused)) {
              return colorScheme.primary.withValues(alpha: 0.12);
            }
            return null;
          }),
          textStyle: WidgetStateProperty.all(
            TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(const Size.fromHeight(40)),
          side: _outlineButtonStates(colorScheme),
          textStyle: outlinedButtonTextStyle,
          backgroundColor: WidgetStateProperty.all(colorScheme.surface),
          foregroundColor: WidgetStateProperty.all(colorScheme.onSurface),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }

  WidgetStateProperty<Color> _primaryButtonStates(ColorScheme colorScheme) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return Color.lerp(colorScheme.primary, colorScheme.onSurface, 0.1)!;
      }
      return colorScheme.primary;
    });
  }

  WidgetStateProperty<BorderSide> _outlineButtonStates(
    ColorScheme colorScheme,
  ) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return BorderSide(color: colorScheme.primary, width: 2);
      }
      return BorderSide(color: colorScheme.primary);
    });
  }

  WidgetStateProperty<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStateProperty.all(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStateProperty<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStateProperty.all(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStateProperty<TextStyle> get _darkOutlinedButtonTextStyle =>
      WidgetStateProperty.all(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStateProperty<TextStyle> get _lightOutlinedButtonTextStyle =>
      WidgetStateProperty.all(
        TextStyle(color: AppColors.gray[800], fontFamily: fontFamily),
      );
}
