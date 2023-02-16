import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/models/exercise_model.dart';
import 'package:flutter_traning_app_1/widgets/animated_images_widget.dart';

import '../utils/dimensions_util.dart';

class ExerciseDescriptionWidget extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDescriptionWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

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
              imageList: exercise.imagesList,
            ),
            Text(
              exercise.label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Text('duration ${exercise.durationIsSec.toString()} seconds'),
            SizedBox(
              height: Dimensions.height10,
            ),
            Text(exercise.description),
          ],
        ),
      ),
    );
  }
}
