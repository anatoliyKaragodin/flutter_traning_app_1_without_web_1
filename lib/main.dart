import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/pages/home_page.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: TimerWidget(waitTimeInSec: 180, onEnd: () {},),
    );
  }
}
