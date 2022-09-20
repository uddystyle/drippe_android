import 'package:drippe/views/alarm_screen.dart';
import 'package:drippe/views/drippe_screen.dart';
import 'package:drippe/views/recipe_screen.dart';
import 'package:drippe/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List pages = [
    DrippeScreen(),
    RecipeScreen(),
    AlarmScreen(),
    SettingScreen(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).toggleableActiveColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "Drippe", icon: Icon(Icons.water_drop)),
          BottomNavigationBarItem(
              label: "Recipe", icon: Icon(Icons.format_list_bulleted)),
          BottomNavigationBarItem(label: "Alarm", icon: Icon(Icons.timer)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
