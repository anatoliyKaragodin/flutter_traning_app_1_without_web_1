import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/app_icons.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import '../riverpod/riverpod.dart';
import '../utils/dimensions_util.dart';
import '../widgets/exercise_description_widget.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  @override
  Widget build(BuildContext context) {
    AudioCache cache = AudioCache();
    final selectedDay = ref.watch(selectedDayProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Days list
        SizedBox(
          height: Dimensions.height10 * 6,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10 * 1.5,
                      bottom: Dimensions.height10,
                      left: Dimensions.width10 / 2,
                      right: Dimensions.width10 / 2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(Dimensions.height10 * 3))),
                        backgroundColor: selectedDay == index
                            ? MaterialStatePropertyAll(Colors.blue)
                            : const MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      ref
                          .read(selectedDayProvider.notifier)
                          .update((state) => index);
                    },
                    child: Text(days[index], style: TextStyle(color: selectedDay != index
                        ? Colors.blue
                        : Colors.white)),
                  ),
                );
              }),
        ),

        /// Start training button
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height10 * 3, bottom: Dimensions.height10 * 2),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height10 * 3)))),
            onPressed: () {
              ref.read(completedExerciseProvider.notifier).update((state) => state + 1);
              ref
                  .read(animationPausedProvider.notifier)
                  .update((state) => false);

              /// Play start sound
              if (ref.read(soundOnProvider) == true) {
                cache.play('training start.mp3', isNotification: true);
              }

              /// Vibration
              if (ref.read(vibrationOnProvider) == true) {
                Vibration.vibrate(duration: 800);
              }

              ref.read(exerciseNumberProvider.notifier).update((state) => 0);

              ExercisePage(
                exercises: Exercises().listOfDayExercises[selectedDay],
              );
              Navigator.of(context).pushNamed('/exercisePage');
            },
            child: Text('Start training',
                style: TextStyle(fontSize: Dimensions.height10 * 2)),
          ),
        ),

        /// Exercises ListView
        Expanded(
          child: ListView.builder(
              itemCount: Exercises().listOfDayExercises[selectedDay].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10, bottom: Dimensions.height10),
                  child: ListTile(
                    onTap: () {
                      /// Run animation
                      ref
                          .read(animationPausedProvider.notifier)
                          .update((state) => false);

                      ref
                          .read(exerciseNumberProvider.notifier)
                          .update((state) => index);

                      /// Dialog exercise description
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                height: Dimensions.height10 * 65,
                                width: Dimensions.width10 * 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height10 * 3),
                                  color:
                                      Theme.of(context).dialogBackgroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// Exercise description widget
                                    ExerciseDescriptionWidget(
                                      exercise: Exercises()
                                              .listOfDayExercises[selectedDay]
                                          [ref.read(exerciseNumberProvider)],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: Dimensions.height10,
                                          bottom: Dimensions.height10),

                                      /// Close button
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(Dimensions.height10 * 3)))),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(Icons.check),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    leading: Icon(
                      MyFlutterApp.exercise,
                      size: Dimensions.height10 * 4,
                      color: Colors.black87,
                    ),
                    title: Text(Exercises()
                        .listOfDayExercises[selectedDay][index]
                        .label),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
