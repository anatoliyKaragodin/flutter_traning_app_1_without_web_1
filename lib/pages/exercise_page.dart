import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/models/exercise_model.dart';
import 'package:flutter_traning_app_1/widgets/exercise_widget.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseModel? exercise;
  const ExercisePage({Key? key, this.exercise}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TimerWidget(waitTimeInSec: 10, onEnd: () {}),
          ExerciseDescriptionWidget(exercise: Exercises().exercisesList[0]),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homePage');
              },
              icon: Icon(Icons.close))
        ],
      ),
    );
  }
}
