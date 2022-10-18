import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/views/alarm_screen.dart';
import 'package:drippe/views/drippe_screen.dart';
import 'package:drippe/views/recipe_screen.dart';
import 'package:drippe/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final I10n _i10n = locator<I10n>();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List pages = [
    DrippeScreen(),
    RecipeScreen(),
    const AlarmScreen(),
    const SettingScreen(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2118603199974248/4195095683',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: adWidget,
    );

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // adContainer,
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: Theme.of(context).toggleableActiveColor,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: _i10n.drippe,
                icon: const Icon(Icons.water_drop),
              ),
              BottomNavigationBarItem(
                label: _i10n.recipeTitle,
                icon: const Icon(Icons.format_list_bulleted),
              ),
              BottomNavigationBarItem(
                label: _i10n.alarmTitle,
                icon: const Icon(Icons.timer),
              ),
              BottomNavigationBarItem(
                label: _i10n.alarmTitle,
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
