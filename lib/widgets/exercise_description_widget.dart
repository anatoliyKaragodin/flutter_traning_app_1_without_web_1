import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/models/exercise_model.dart';
import 'package:flutter_traning_app_1/widgets/animated_images_widget.dart';

import '../data/exercises.dart';
import '../riverpod/riverpod.dart';
import '../utils/dimensions_util.dart';

class ExerciseDescriptionWidget extends ConsumerStatefulWidget {
  final ExerciseModel exercise;

  const ExerciseDescriptionWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  ConsumerState<ExerciseDescriptionWidget> createState() => _ExerciseDescriptionWidgetState();
}

class _ExerciseDescriptionWidgetState extends ConsumerState<ExerciseDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // bottom: Dimensions.height10,
          left: Dimensions.width10 * 1.5,
          right: Dimensions.width10 * 1.5),
      child: Container(
        child: Column(
          children: [
            AnimatedImagesWidget(
              images: Exercises()
                  .listOfDayExercises[ref.read(selectedDayProvider)][ref.read(exerciseNumberProvider)]
                  .images,
            ),
            Text(
              Exercises()
                  .listOfDayExercises[ref.read(selectedDayProvider)][ref.read(exerciseNumberProvider)]
                  .label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Text('duration ${exercise.durationIsSec.toString()} seconds'),
            SizedBox(
              height: Dimensions.height10,
            ),
            Text(Exercises()
                .listOfDayExercises[ref.read(selectedDayProvider)][ref.read(exerciseNumberProvider)]
                .description),
          ],
        ),
      ),
    );
  }
}
