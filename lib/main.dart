import 'package:drippe/Themes/dark_theme_data.dart';
import 'package:drippe/Themes/light_theme_data.dart';
import 'package:drippe/viewModels/theme_view_model.dart';
import 'package:drippe/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

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
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? darkThemeData : lightThemeData,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      home: _myHomePage,
    );
  }
}
