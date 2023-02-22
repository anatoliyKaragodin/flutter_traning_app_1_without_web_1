import 'package:flutter_traning_app_1/pages/home_page_app.dart';

import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'data/exercises.dart';

final container = ProviderContainer();

void main() async {
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        /// ThemeData
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const HomePageApp(),
        routes: {
          '/homePageApp': (context) => const HomePageApp(),
          '/exercisePage': (context) => ExercisePage(
                /// Delete and check
                exercises: Exercises().listOfDayExercises[0],
              ),
        });
  }
}
