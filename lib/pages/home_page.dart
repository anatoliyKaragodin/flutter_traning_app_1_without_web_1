import 'package:flutter_traning_app_1/main.dart';
import 'package:flutter_traning_app_1/pages/home_page_app.dart';
import 'package:flutter_traning_app_1/pages/home_page_web.dart';

import 'package:flutter_traning_app_1/utils/library.dart';

import 'home_page_clear.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final List<Widget> homePages = <Widget>[
    const HomePageApp(),
    const HomePageWeb(),
    const HomePageClear(),
  ];

  @override
  Widget build(BuildContext context) {
    print('__________________________HOME PAGE INDEX: $homePageIndex');

    return SafeArea(
      child: homePages.elementAt(homePageIndex));
  }

 
}
