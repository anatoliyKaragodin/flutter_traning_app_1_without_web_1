import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

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
        Container(
          height: Dimensions.height10 * 6,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                // final selectedDay = ref.watch(selectedDayProvider);
                return Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10 * 1.5,
                      bottom: Dimensions.height10,
                      left: Dimensions.width10 / 2,
                      right: Dimensions.width10 / 2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: selectedDay == index
                            ? MaterialStatePropertyAll(Colors.blue[100])
                            : MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      ref
                          .read(selectedDayProvider.notifier)
                          .update((state) => index);
                    },
                    child: Text(days[index]),
                  ),
                );
              }),
        ),

        /// Start training button
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height10 * 3, bottom: Dimensions.height10 * 2),
          child: ElevatedButton(
            onPressed: () {
              /// Play start sound
              cache.play('training start.mp3', isNotification: true);
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
                      ref.read(animationPausedProvider.notifier).update((state) => false);

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
                                    ExerciseDescriptionWidget(
                                      exercise: Exercises()
                                              .listOfDayExercises[selectedDay]
                                          [index],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: Dimensions.height10,
                                          bottom: Dimensions.height10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ref.read(changeImageProvider.notifier).update((state) => 1);
                                          // ref.read(animationPausedProvider.notifier).update((state) => true);
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.check),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    leading: Icon(Icons.fitness_center_rounded),
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
