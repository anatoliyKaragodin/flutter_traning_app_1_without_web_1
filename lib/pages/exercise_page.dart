import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/models/exercise_model.dart';
import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
import 'package:flutter_traning_app_1/widgets/exercise_description_widget.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

class ExercisePage extends ConsumerStatefulWidget {
  final List<ExerciseModel> exercises;
  const ExercisePage({Key? key, required this.exercises}) : super(key: key);

  @override
  ConsumerState<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends ConsumerState<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    final currentExerciseNumber = ref.watch(exerciseNumberProvider);
    return SafeArea(
      child: Scaffold(

          /// Comsumer for riverpod
          body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Dimensions.height10*3,
          ),

          /// Timer
          TimerWidget(
            waitTimeInSec: widget.exercises![currentExerciseNumber].durationIsSec,
          ),
          SizedBox(height: Dimensions.height10/2),

          /// Exercise description
          ExerciseDescriptionWidget(
              exercise: widget.exercises![currentExerciseNumber]),
        ],
      )),
    );
  }
}
