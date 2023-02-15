import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/data/exercises.dart';
import 'package:flutter_traning_app_1/riverpod/riverpod.dart';

class TimerWidget extends ConsumerStatefulWidget {
  final int waitTimeInSec;

  const TimerWidget({Key? key, required this.waitTimeInSec}) : super(key: key);

  @override
  ConsumerState<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  Timer? _timer;
  late int _waitTime;
  double _percent = 1.0;
  bool isStarted = true;
  String timeStr = '';

  @override
  void initState() {
    super.initState();
    _waitTime = Exercises()
        .exercisesList[ref.read(exerciseNumberProvider)]
        .durationIsSec;
    // _waitTime = widget.waitTimeInSec;
    _calculationTime();
    start();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void start() {
    if (_waitTime > 0) {
      setState(() {
        isStarted = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _waitTime -= 1;
        _calculationTime();
        if (_waitTime <= 0) {
          onEnd();
        }
      });
    }
  }

  void restart() {
    _waitTime = widget.waitTimeInSec;
    _calculationTime();
  }

  void pause() {
    _timer?.cancel();
    setState(() {
      isStarted = false;
    });
  }

  void _calculationTime() {
    String secondsStr = _waitTime.toString();
    setState(() {
      _percent = _waitTime / widget.waitTimeInSec;
      timeStr = secondsStr;
    });
  }

  void onEnd() {
    if (ref.watch(exerciseNumberProvider) <
        Exercises().exercisesList.length - 1) {
      pause();
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () {
                    ref
                        .watch(exerciseNumberProvider.notifier)
                        .update((state) => state + 1);
                    print(ref.read(exerciseNumberProvider));
                    _waitTime = Exercises()
                        .exercisesList[ref.read(exerciseNumberProvider)]
                        .durationIsSec;
                    _calculationTime();
                    Navigator.pop(context);
                    start();
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          });
      // ref.watch(exerciseNumberProvider.notifier).update((state) => state + 1);
      // print(ref.read(exerciseNumberProvider));
      // _waitTime = Exercises()
      //     .exercisesList[ref.read(exerciseNumberProvider)]
      //     .durationIsSec;
      // _calculationTime();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () {
                    _calculationTime();
                    Navigator.pushNamed(context, '/homePage');
                  },
                  child: Text(
                    'FINISH',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          });

      // ref.read(exerciseNumberProvider.notifier).update((state) => 0);
      pause();
    }
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        isStarted ? pause() : start();
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Restart button
            // Container(
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       restart();
            //     },
            //     child: Icon(Icons.restart_alt_rounded),
            //   ),
            // ),
            /// Timer
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 200,
                    width: 200,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CircularProgressIndicator(
                        color: Colors.blueGrey[400],
                        value: _percent,
                        backgroundColor: Colors.green[400],
                        strokeWidth: 8,
                      ),
                    )),
                Positioned(
                    child: Text(timeStr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ))),
              ],
            ),

            /// Play/pause button
            // Container(
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       isStarted ? pause() : start();
            //     },
            //     child: isStarted
            //         ? Icon(Icons.pause)
            //         : Icon(Icons.play_arrow_rounded),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
