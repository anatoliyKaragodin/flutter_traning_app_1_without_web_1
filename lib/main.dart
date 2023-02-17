import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'package:flutter_traning_app_1/pages/home_page.dart';
import 'data/exercises.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/homePage': (context) => const HomePage(),
          '/exercisePage': (context) => ExercisePage(
                exercises: Exercises().listOfDayExercises[0],
              ),
        });
  }
}
