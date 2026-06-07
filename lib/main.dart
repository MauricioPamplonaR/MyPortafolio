import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portafolio_app_web/firebase_options.dart';
import 'package:portafolio_app_web/l10n/app_localizations.dart';
import 'package:portafolio_app_web/routes/app_routes.dart';
import 'package:portafolio_app_web/shared/app_locale_controller.dart';
import 'package:portafolio_app_web/shared/app_theme_controller.dart';
import 'package:portafolio_app_web/styles/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp.router(
      title: 'mauriciopamplona.com',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      darkTheme: AppTheme(fontFamily: _fontFamily(locale.value)).dark,
      theme: AppTheme(fontFamily: _fontFamily(locale.value)).light,
      themeMode: theme.value,
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      locale: Locale(locale.value ?? 'en'),
      routerConfig: AppRoutes.routes,
    );
  }

  String _fontFamily(String? locale) {
    return (locale ?? 'en') == 'en' ? 'Urbanist' : 'Urbanist';
  }
}
