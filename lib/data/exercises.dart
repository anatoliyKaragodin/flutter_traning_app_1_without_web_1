import 'package:flutter_traning_app_1/models/exercise_model.dart';

class Exercises {
  static List<ExerciseModel> exercisesList0 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  static List<ExerciseModel> exercisesList1 = [
    AllExercises().allExercises[4],
    AllExercises().allExercises[5],
    AllExercises().allExercises[6],
    AllExercises().allExercises[7],
  ];
  static List<ExerciseModel> exercisesList2 = [
    AllExercises().allExercises[8],
    AllExercises().allExercises[9],
    AllExercises().allExercises[0],
    AllExercises().allExercises[1],
  ];
  static List<ExerciseModel> exercisesList3 = [
    AllExercises().allExercises[7],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  static List<ExerciseModel> exercisesList4 = [
    AllExercises().allExercises[7],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  static List<ExerciseModel> exercisesList5 = [
    AllExercises().allExercises[7],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  static List<ExerciseModel> exercisesList6 = [
    AllExercises().allExercises[7],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  List<List<ExerciseModel>> listOfDayExercises = [
    exercisesList0,
    exercisesList1,
    exercisesList2,
    exercisesList3,
    exercisesList4,
    exercisesList5,
    exercisesList6,
  ];
}

class AllExercises {
  List<ExerciseModel> allExercises = [
    /// 0
    ExerciseModel(
        label:
            'Build the muscles of the shoulders, back and chest, improves posture.',
        description: '- Stand straight, raise straight arms to the sides at shoulder level, palms facing up.\n - Slowly describe small circles with a diameter of about 15 centimeters with your hands. Most of the movement comes from the shoulders, the tension is felt in their back.',
        durationIsSec: 6,
        imagesList: ['assets/exercises/1/1.png', 'assets/exercises/1/2.png']),

    /// 1
    ExerciseModel(
        label:
            'Stretches the abdominal muscles, strengthens the back, improves posture.',
        description:
            ' - Stand up straight, put your hands behind your head.\n - With an exhalation, tilt the body forward to 45 degrees, the neck is in line with the back, look at the floor in front of you.\n - With an inhale, straighten up, raise your head.\n - Bend back slightly to feel the stretch in your abdominal muscles. The gaze is directed to the ceiling.\n - Straighten up. The head stays up.',
        durationIsSec: 6,
        imagesList: [
          'assets/exercises/2/1.png',
          'assets/exercises/2/2.png',
          'assets/exercises/2/3.png'
        ]),

    /// 2
    ExerciseModel(
        label: 'Grow up shoulder strength, strengthens the arch of the foot.',
        description:
            '- Stand straight, raise straight arms to the sides at shoulder level, palms pointing down.\n - With an inhalation, rise on your toes, raise your arms up 45 degrees.\n - With an exhalation, stand on the foot entirely, lower your arms to parallel with the floor.',
        durationIsSec: 6,
        imagesList: ['assets/exercises/3/1.png', 'assets/exercises/3/2.png']),

    /// 3
    ExerciseModel(
        label:
            'Grow up muscles of the shoulders and waist, stimulates the liver and intestines.',
        description:
            '- Stand up straight, raise your arms to the sides at shoulder level, palms down - this is the starting position.\n - Raise your left hand up, lower your right hand down along the body.\n - Start tilting to the right from the hips, the right hand crawls along the leg to the knee, the left twists around the head. At the extreme point, the left palm rests on or near the right ear.\n - Slowly straighten up, turning your arms to the starting position.\n - Make a similar tilt to the other side.',
        durationIsSec: 6,
        imagesList: [
          'assets/exercises/4/1.png',
          'assets/exercises/4/2.png',
          'assets/exercises/4/3.png'
        ]),

    /// 4
    ExerciseModel(
        label: 'Raises and expands the chest. Stretches the abdominal muscles.',
        description:
            '- Stand up straight, with an inhalation, bend your elbows, place your fists under your armpits.\n - Continuing to inhale, take your shoulders back, slightly bend in the thoracic region, expanding the chest, raise your head up and look at the ceiling.\n - With an exhalation, move your hands forward, then spread them apart.\n - While holding your breath, lean forward until parallel with the floor, take your hands back.\n - Straighten up and move your arms forward, and then spread them apart.',
        durationIsSec: 60,
        imagesList: [
          'assets/exercises/5/1.png',
          'assets/exercises/5/2.png',
          'assets/exercises/5/3.png'
        ]),

    /// 5
    ExerciseModel(
        label: 'Strengthens the arch of the foot, calf and back muscles.',
        description:
            '- Stand straight, feet shoulder-width apart, raise your arms to the sides at shoulder level, turn your palms down.\n - Inhale as you rise up on your toes.\n - As you continue to inhale, lower yourself into a squat.\n - Exhale as you rise from the squat.\n - Continuing to exhale, lower yourself to a full foot.',
        durationIsSec: 60,
        imagesList: [
          'assets/exercises/6/1.png',
          'assets/exercises/6/2.png',
          'assets/exercises/6/3.png',
          'assets/exercises/6/4.png',
          'assets/exercises/6/5.png'
        ]),

    /// 6
    ExerciseModel(
        label: 'Strengthens the muscles of the shoulders.',
        description:
            '- Stand up straight, with an inhalation, raise your shoulders.\n - As you continue to inhale, move your shoulders forward.\n - Exhale as you lower your shoulders.\n - As you continue to exhale, pull your shoulders back.',
        durationIsSec: 60,
        imagesList: ['assets/exercises/7/1.png', 'assets/exercises/7/2.png']),

    /// 7
    ExerciseModel(
        label: 'For shoulders and chest muscles.',
        description:
            "- Stand up straight, arms crossed in front with palms facing you.\n - Raise your arms in a circle crosswise (the right palm outlines a circle on the left side, the left on the right side), at the top, turn your palms outward.\n - Lower your arms in a circle without crossing them (the right palm draws a circle on the right, and the left palm on the left).\n - Lower your arms, don't cross them. The palms are next to the hips.\n - In a circle, raise your arms up, turning your palms outward.\n - Lower your arms crosswise, turning your palms towards you.",
        durationIsSec: 60,
        imagesList: ['assets/exercises/8/1.png', 'assets/exercises/8/2.png']),

    /// 8
    ExerciseModel(
        label:
            'Strengthens the muscles of the neck, improves control over them.',
        description:
            '- Stand up straight, tilt your head forward.\n - Tilt your head to the left.\n - Tilt your head back.\n - Tilt your head to the right.',
        durationIsSec: 60,
        imagesList: [
          'assets/exercises/9/1.png',
          'assets/exercises/9/2.png',
          'assets/exercises/9/3.png',
          'assets/exercises/9/4.png',
          'assets/exercises/9/5.png'
        ]),

    /// 9
    ExerciseModel(
        label: 'Raises your flexibility of the back muscles.',
        description:
            '- Stand straight, feet shoulder-width apart, straight arms raise to the sides at shoulder level.\n - Bend over, turning your body to the left and bending your right knee. The right hand touches the floor between the legs, the left is extended upward. The head is turned to the ceiling, the gaze is directed to the left hand.\n - Return to starting position and repeat on the other side.',
        durationIsSec: 60,
        imagesList: [
          'assets/exercises/10/1.png',
          'assets/exercises/10/2.png',
          'assets/exercises/10/3.png',
          'assets/exercises/10/4.png'
        ]),
  ];
}
