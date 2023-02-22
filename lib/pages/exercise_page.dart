import 'dart:async';

import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/models/exercise_model.dart';
import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
import 'package:flutter_traning_app_1/widgets/exercise_description_widget.dart';
import 'dart:math' as math;

import '../data/exercises.dart';

class ExercisePage extends ConsumerStatefulWidget {
  final List<ExerciseModel> exercises;
  const ExercisePage({Key? key, required this.exercises}) : super(key: key);

  @override
  ConsumerState<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends ConsumerState<ExercisePage> {
  Timer? _timer;
  late int _waitTime;
  double _percent = 1.0;
  bool isStarted = true;
  String timeStr = '';

  /// Init state
  @override
  void initState() {
    super.initState();
    _waitTime = Exercises()
        .listOfDayExercises[ref.read(selectedDayProvider)]
    [ref.read(exerciseNumberProvider)]
        .durationIsSec;
    // _waitTime = widget.waitTimeInSec;
    _calculationTime();
    start();
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  /// Start
  void start() {
    if (_waitTime > 0) {
      ref.read(animationPausedProvider.notifier).update((state) => false);
      setState(() {
        isStarted = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _waitTime -= 1;
        _calculationTime();
        if (_waitTime <= 0) {
          onEnd();
        }
      });
    }
  }

  // void restart() {
  //   _waitTime = widget.waitTimeInSec;
  //   _calculationTime();
  // }

  /// Pause
  void pause() {
    _timer?.cancel();
    ref.read(animationPausedProvider.notifier).update((state) => true);
    setState(() {
      isStarted = false;
    });
  }

  /// Calculation time
  void _calculationTime() {
    String secondsStr = _waitTime.toString();
    setState(() {
      _percent = _waitTime /
          Exercises()
              .listOfDayExercises[ref.read(selectedDayProvider)]
          [ref.read(exerciseNumberProvider)]
              .durationIsSec;
      timeStr = secondsStr;
    });
  }

  /// On end
  void onEnd() {

    // ref.read(animationPausedProvider.notifier).update((state) => true);
    if (ref.watch(exerciseNumberProvider) <
        Exercises().listOfDayExercises[ref.watch(selectedDayProvider)].length -
            1) {
      pause();

      /// Dialog 'NEXT'
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: Dimensions.height10 * 20,
                width: Dimensions.width10 * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () {
                    ref.read(completedExerciseProvider.notifier).update((state) => state + 1);
                    ref
                        .watch(exerciseNumberProvider.notifier)
                        .update((state) => state + 1);

                    _waitTime = Exercises()
                        .listOfDayExercises[ref.read(selectedDayProvider)]
                    [ref.read(exerciseNumberProvider)]
                        .durationIsSec;
                    _calculationTime();
                    Navigator.pop(context);
                    start();
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: Dimensions.height10 * 3),
                  ),
                ),
              ),
            );
          });
    } else {
      /// Dialog 'FINISH'
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: Dimensions.height10 * 20,
                width: Dimensions.width10 * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () {
                    onEnd();

                    ref.read(completedWorkoutProvider.notifier).update((state) => state + 1);

                    _calculationTime();
                    Navigator.pushNamed(context, '/homePageApp');
                  },
                  child: Text(
                    'FINISH',
                    style: TextStyle(fontSize: Dimensions.height10 * 3),
                  ),
                ),
              ),
            );
          });

      pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentExerciseNumber = ref.watch(exerciseNumberProvider);
       return SafeArea(
      child: Scaffold(
          body:
          InkWell(
        onTap: () {
          isStarted ? pause() : start();

        },
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10 * 5,
            ),

            /// Timer
              timer(),

            SizedBox(height: Dimensions.height10 / 2),

            /// Exercise description
            ExerciseDescriptionWidget(
                exercise: widget.exercises![currentExerciseNumber]),
          ],
        ),
      )),
    );
  }

  /// Timer builder
  Center timer() {
    return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Timer
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: Dimensions.height10 * 15,
                          width: Dimensions.width10 * 15,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: CircularProgressIndicator(
                              color: Colors.blueGrey[100],
                              value: _percent,
                              backgroundColor: Colors.green[400],
                              strokeWidth: 8,
                            ),
                          )),
                      Positioned(
                          child: Text(timeStr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ))),
                    ],
                  ),
                ],
              ),
            );
  }
}
