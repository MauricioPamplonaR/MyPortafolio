import 'package:flutter/material.dart';
import 'package:portafolio_app_web/styles/app_colors.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class AppTheme {
  final String fontFamily;

  AppTheme({
    required this.fontFamily,
  });

  ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
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
        surface: AppColors.gray[600]!,
        outline: AppColors.gray[600]!,
        outlineVariant: AppColors.gray[400]!,
        onSurface: AppColors.gray[700]!,
        onSurfaceVariant: AppColors.gray[600]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.gray[100]!,
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
          fixedSize: WidgetStateProperty.all(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10)),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(Size.fromHeight(40)),
          side: _outlineButtonStates,
          textStyle: outlinedButtonTextStyle,
          backgroundColor: WidgetStateProperty.all(colorScheme.surface),
          foregroundColor: WidgetStateProperty.all(colorScheme.onSurface),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
      ),
    );
  }

  final WidgetStateProperty<Color> _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return Color(0xff564895);
    }
    return AppColors.primaryColor;
  });

  final WidgetStateProperty<BorderSide> _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return BorderSide(color: Color(0xff561895), width: 2);
    }
    return BorderSide(color: Color(0xff561895));
  });

  WidgetStateProperty<TextStyle> get _darkElevatedButtonTextStyle => WidgetStateProperty.all(
    TextStyle(
      color: AppColors.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  WidgetStateProperty<TextStyle> get _lightElevatedButtonTextStyle => WidgetStateProperty.all(
    TextStyle(
      color: AppColors.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  WidgetStateProperty<TextStyle> get _darkOutlinedButtonTextStyle => WidgetStateProperty.all(
    TextStyle(
      color: AppColors.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  WidgetStateProperty<TextStyle> get _lightOutlinedButtonTextStyle => WidgetStateProperty.all(
    TextStyle(
      color: AppColors.gray[800],
      fontFamily: fontFamily,
    ),
  );
}