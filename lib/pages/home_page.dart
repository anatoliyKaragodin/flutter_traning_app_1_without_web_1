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
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
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
            Container(
              height: Dimensions.height10*5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(Dimensions.height10*0.8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(days[index]),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Center(child: _pages.elementAt(_selectedBottomBarIndex)))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomBarIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              label: bottomBarLabels[0],
              icon: Icon(Icons.fitness_center_rounded)),
          BottomNavigationBarItem(
              label: bottomBarLabels[1], icon: Icon(Icons.person)),
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
