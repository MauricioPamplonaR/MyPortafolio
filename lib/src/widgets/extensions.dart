import 'package:flutter/material.dart';
import 'package:portafolio_app_web/l10n/app_localizations.dart';
import 'package:portafolio_app_web/styles/app_size.dart';
import 'package:portafolio_app_web/styles/app_text_style.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;
  bool get isDesktopOrTablet => isDesktop || isTablet;

  AppTextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyles();
      case FormFactorType.desktop:
        return LargeTextStyle();
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
        return SmallInsets();
      case FormFactorType.tablet:
      case FormFactorType.desktop:
        return LargeInsets();
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ??
      lookupAppLocalizations(const Locale('es', 'ES'));

  ColorScheme get colorScheme => theme.colorScheme;
}

extension NullableUrlString on String? {
  String? get validNetworkUrl {
    final value = this?.trim();
    if (value == null || value.isEmpty) return null;

    final uri = Uri.tryParse(value);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;

    return value;
  }
}
