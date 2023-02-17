import 'package:flutter_traning_app_1/models/exercise_model.dart';

class Exercises {
  static List<ExerciseModel> exercisesList0 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[2],
    AllExercises().allExercises[4],
    AllExercises().allExercises[6],
  ];
  static List<ExerciseModel> exercisesList1 = [
    AllExercises().allExercises[1],
    AllExercises().allExercises[3],
    AllExercises().allExercises[5],
    AllExercises().allExercises[7],
  ];
  static List<ExerciseModel> exercisesList2 = [
    AllExercises().allExercises[2],
    AllExercises().allExercises[4],
    AllExercises().allExercises[6],
    AllExercises().allExercises[8],
  ];
  static List<ExerciseModel> exercisesList3 = [
    AllExercises().allExercises[9],
    AllExercises().allExercises[3],
    AllExercises().allExercises[2],
    AllExercises().allExercises[0],
  ];
  static List<ExerciseModel> exercisesList4 = [
    AllExercises().allExercises[1],
    AllExercises().allExercises[3],
    AllExercises().allExercises[4],
    AllExercises().allExercises[5],
  ];
  static List<ExerciseModel> exercisesList5 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[6],
    AllExercises().allExercises[7],
    AllExercises().allExercises[2],
  ];
  static List<ExerciseModel> exercisesList6 = [
    AllExercises().allExercises[4],
    AllExercises().allExercises[8],
    AllExercises().allExercises[9],
    AllExercises().allExercises[0],
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
        durationIsSec: 60,
        images: ['assets/exercises/1.gif', 'assets/exercises/11.png']),

    /// 1
    ExerciseModel(
        label:
            'Stretches the abdominal muscles, strengthens the back, improves posture.',
        description:
            ' - Stand up straight, put your hands behind your head.\n - With an exhalation, tilt the body forward to 45 degrees, the neck is in line with the back, look at the floor in front of you.\n - With an inhale, straighten up, raise your head.\n - Bend back slightly to feel the stretch in your abdominal muscles. The gaze is directed to the ceiling.\n - Straighten up. The head stays up.',
        durationIsSec: 80,
        images: ['assets/exercises/2.gif', 'assets/exercises/12.png']),

    /// 2
    ExerciseModel(
        label: 'Grow up shoulder strength, strengthens the arch of the foot.',
        description:
            '- Stand straight, raise straight arms to the sides at shoulder level, palms pointing down.\n - With an inhalation, rise on your toes, raise your arms up 45 degrees.\n - With an exhalation, stand on the foot entirely, lower your arms to parallel with the floor.',
        durationIsSec: 100,
        images: ['assets/exercises/3.gif', 'assets/exercises/13.png']),

    /// 3
    ExerciseModel(
        label:
            'Grow up muscles of the shoulders and waist, stimulates the liver and intestines.',
        description:
            '- Stand up straight, raise your arms to the sides at shoulder level, palms down - this is the starting position.\n - Raise your left hand up, lower your right hand down along the body.\n - Start tilting to the right from the hips, the right hand crawls along the leg to the knee, the left twists around the head. At the extreme point, the left palm rests on or near the right ear.\n - Slowly straighten up, turning your arms to the starting position.\n - Make a similar tilt to the other side.',
        durationIsSec: 120,
        images: ['assets/exercises/4.gif', 'assets/exercises/14.png']),

    /// 4
    ExerciseModel(
        label: 'Raises and expands the chest. Stretches the abdominal muscles.',
        description:
            '- Stand up straight, with an inhalation, bend your elbows, place your fists under your armpits.\n - Continuing to inhale, take your shoulders back, slightly bend in the thoracic region, expanding the chest, raise your head up and look at the ceiling.\n - With an exhalation, move your hands forward, then spread them apart.\n - While holding your breath, lean forward until parallel with the floor, take your hands back.\n - Straighten up and move your arms forward, and then spread them apart.',
        durationIsSec: 40,
        images: ['assets/exercises/5.gif', 'assets/exercises/15.png']),

    /// 5
    ExerciseModel(
        label: 'Strengthens the arch of the foot, calf and back muscles.',
        description:
            '- Stand straight, feet shoulder-width apart, raise your arms to the sides at shoulder level, turn your palms down.\n - Inhale as you rise up on your toes.\n - As you continue to inhale, lower yourself into a squat.\n - Exhale as you rise from the squat.\n - Continuing to exhale, lower yourself to a full foot.',
        durationIsSec: 80,
        images: ['assets/exercises/6.gif', 'assets/exercises/16.png']),

    /// 6
    ExerciseModel(
        label: 'Strengthens the muscles of the shoulders.',
        description:
            '- Stand up straight, with an inhalation, raise your shoulders.\n - As you continue to inhale, move your shoulders forward.\n - Exhale as you lower your shoulders.\n - As you continue to exhale, pull your shoulders back.',
        durationIsSec: 60,
        images: ['assets/exercises/7.gif', 'assets/exercises/17.png']),

    /// 7
    ExerciseModel(
        label: 'For shoulders and chest muscles.',
        description:
            "- Stand up straight, arms crossed in front with palms facing you.\n - Raise your arms in a circle crosswise (the right palm outlines a circle on the left side, the left on the right side), at the top, turn your palms outward.\n - Lower your arms in a circle without crossing them (the right palm draws a circle on the right, and the left palm on the left).\n - Lower your arms, don't cross them. The palms are next to the hips.\n - In a circle, raise your arms up, turning your palms outward.\n - Lower your arms crosswise, turning your palms towards you.",
        durationIsSec: 40,
        images: ['assets/exercises/8.gif', 'assets/exercises/18.png']),

    /// 8
    ExerciseModel(
        label:
            'Strengthens the muscles of the neck, improves control over them.',
        description:
            '- Stand up straight, tilt your head forward.\n - Tilt your head to the left.\n - Tilt your head back.\n - Tilt your head to the right.',
        durationIsSec: 120,
        images: ['assets/exercises/9.gif', 'assets/exercises/19.png']),

    /// 9
    ExerciseModel(
        label: 'Raises your flexibility of the back muscles.',
        description:
            '- Stand straight, feet shoulder-width apart, straight arms raise to the sides at shoulder level.\n - Bend over, turning your body to the left and bending your right knee. The right hand touches the floor between the legs, the left is extended upward. The head is turned to the ceiling, the gaze is directed to the left hand.\n - Return to starting position and repeat on the other side.',
        durationIsSec: 100,
        images: ['assets/exercises/10.gif', 'assets/exercises/20.png']),
  ];
}
