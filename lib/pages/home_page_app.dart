import 'package:flutter_traning_app_1/pages/profile_page.dart';
import 'package:flutter_traning_app_1/pages/settings_page.dart';
import 'package:flutter_traning_app_1/pages/training_page.dart';
import 'package:flutter_traning_app_1/utils/library.dart';

import '../app_icons.dart';
import '../utils/dimensions_util.dart';

class HomePageApp extends StatefulWidget {
  const HomePageApp({Key? key}) : super(key: key);

  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {

  final List<String> bottomBarLabels = [
    'Training',
    'Profile',
    'Settings',
  ];

  final List<Widget> _pages = <Widget>[
    const TrainingPage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  /// Index
  int _selectedBottomBarIndex = 0;

  final double iconSize = Dimensions.height10 * 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: _pages.elementAt(_selectedBottomBarIndex)))
        ],
      ),
    ),

    /// Bottom navigation bar
    bottomNavigationBar: BottomNavigationBar(
      selectedIconTheme:
      IconThemeData(size: Dimensions.height10 * 3),
      selectedFontSize: Dimensions.height10 * 1.8,
      unselectedFontSize: Dimensions.height10 * 1.2,
      backgroundColor: Colors.grey[200],
      currentIndex: _selectedBottomBarIndex,
      onTap: _onItemTapped,
      items: [
        /// Training page tab
        BottomNavigationBarItem(
            label: bottomBarLabels[0],
            icon: Icon(
              MyFlutterApp.exercise,
              size: iconSize,
            )),

        /// Profile page tab
        BottomNavigationBarItem(
            label: bottomBarLabels[1],
            icon: Icon(MyFlutterApp.profile, size: iconSize)),

        /// Settings page tab
        BottomNavigationBarItem(
            label: bottomBarLabels[2],
            icon: Icon(MyFlutterApp.settings, size: iconSize)),
      ],
    ),
    );
  }
}
