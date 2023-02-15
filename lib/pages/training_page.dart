import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/pages/exercise_page.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

import '../riverpod/riverpod.dart';
import '../utils/dimensions_util.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Start training button
        Padding(
          padding: EdgeInsets.only(top: Dimensions.height10*3, bottom: Dimensions.height10*2),
          child: ElevatedButton(
              onPressed: () {
                ref.read(exerciseNumberProvider.notifier).update((state) => 0);
                ExercisePage(exercises: Exercises().exercisesList,);
                Navigator.of(context).pushNamed('/exercisePage');
              },
              child: Text('Start training')),
        ),

        /// Exercises ListView
        Expanded(
          child: ListView.builder(
              itemCount: Exercises().exercisesList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.fitness_center_rounded),
                  title: Text(Exercises().exercisesList[index].label),
                );
              }),
        ),
      ],
    );
  }
}
