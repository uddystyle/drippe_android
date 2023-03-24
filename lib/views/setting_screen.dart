import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/viewModels/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

final I10n _i10n = locator<I10n>();

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool darkIsOn = false;

  final String mailUrl = 'mailto:info@uddystyle.com';

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appThemeProvider).getTheme();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _i10n.settings,
          style: Theme.of(context).textTheme.headline4,
        ),
        toolbarHeight: 100.0,
        elevation: 0,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              _i10n.basicSettings,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  ref.read(appThemeProvider.notifier).setTheme(!isDarkMode);
                },
                activeSwitchColor: Colors.orange,
                initialValue: isDarkMode,
                leading: const Icon(Icons.format_paint),
                title: Text(_i10n.darkMode),
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              _i10n.aboutApp,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            tiles: <SettingsTile>[
              // SettingsTile.navigation(
              //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              //   title: const Text('レビューをする'),
              //   onPressed: (context) {},
              // ),
              SettingsTile.navigation(
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                title: Text(_i10n.contact),
                onPressed: (context) {
                  openMailApp(mailUrl);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void openMailApp(String url) async {
    return launchMail(
      Uri.parse(url),
    );
  }

  Future<void> launchMail(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      final Error error = ArgumentError('Error launching $url');
      throw error;
    }
  }
}
