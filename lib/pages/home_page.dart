import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/pages/profile_page.dart';
import 'package:flutter_traning_app_1/pages/settings_page.dart';
import 'package:flutter_traning_app_1/pages/training_page.dart';

import '../utils/dimensions_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bottomBarLabels = [
    'Training',
    'Profile',
    'Settings',
  ];

  List<Widget> _pages = <Widget>[
    TrainingPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  /// Index
  int _selectedBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Center(child: _pages.elementAt(_selectedBottomBarIndex)))
          ],
        ),
      ),
      /// Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
      selectedIconTheme: IconThemeData(size: Dimensions.height10*3),
        selectedFontSize: Dimensions.height10*1.6,
        unselectedFontSize: Dimensions.height10*1.2,
        backgroundColor: Colors.blueGrey[100],
        currentIndex: _selectedBottomBarIndex,
        onTap: _onItemTapped,
        items: [
          /// Training page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[0],
              icon: Icon(Icons.fitness_center_rounded)),
          /// Profile page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[1], icon: Icon(Icons.person)),
          /// Settings page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[2], icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }
}
