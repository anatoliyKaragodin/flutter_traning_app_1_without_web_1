import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/pages/check.dart';
import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'package:flutter_traning_app_1/pages/home_page.dart';
import 'package:flutter_traning_app_1/widgets/animated_images_widget.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'data/exercises.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          '/homePage': (context) => HomePage(),
          '/exercisePage': (context) => ExercisePage(exercises: Exercises().listOfDayExercises[0],),
        });
  }
}
