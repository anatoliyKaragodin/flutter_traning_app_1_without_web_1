import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/models/exercise_model.dart';

import '../utils/dimensions_util.dart';

class ExerciseDescriptionWidget extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDescriptionWidget({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            exercise.label,
            style: TextStyle(fontSize: Dimensions.height10*2.5, fontWeight: FontWeight.bold),
          ),
          // Text('duration ${exercise.durationIsSec.toString()} seconds'),
          SizedBox(height: Dimensions.height10,),
          Text(exercise.description),
        ],
      ),
    );
  }
}
