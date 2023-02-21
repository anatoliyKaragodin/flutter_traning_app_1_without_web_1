import 'package:flutter_traning_app_1/data/get_url.dart';
import 'package:flutter_traning_app_1/data/shared_preferences.dart';
import 'package:flutter_traning_app_1/pages/home_page.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'data/exercises.dart';

void main() async {
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  // /// Load url
  // GetUrl().url = await LocalData().getUrl();
  // print('LOAD URL: ${GetUrl().url}');
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
        home: const HomePage(),
        routes: {
          '/homePage': (context) => const HomePage(),
          '/exercisePage': (context) => ExercisePage(
                /// Delete and check
                exercises: Exercises().listOfDayExercises[0],
              ),
        });
  }
}
