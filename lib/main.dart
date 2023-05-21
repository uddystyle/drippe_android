import 'package:drippe/Themes/dark_theme_data.dart';
import 'package:drippe/Themes/light_theme_data.dart';
import 'package:drippe/viewModels/theme_view_model.dart';
import 'package:drippe/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  setupLocator();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  final Widget _myHomePage = const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final bool isDarkMode = ref.watch(appThemeProvider).getTheme();

    return MaterialApp(
      localizationsDelegates: const [
        I10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I10n.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportLocals) {
        if (supportLocals
            .map((e) => e.languageCode)
            .contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? darkThemeData : lightThemeData,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      home: _myHomePage,
    );
  }
}
