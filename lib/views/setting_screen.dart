import 'package:drippe/viewModels/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool darkIsOn = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appThemeProvider).getTheme();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline4,
        ),
        toolbarHeight: 100.0,
        elevation: 0,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              '基本設定',
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
                title: const Text('ダークモード'),
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              'アプリについて',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                title: const Text('レビューをする'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                title: const Text('お問合せ・ご要望'),
                onPressed: (context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
