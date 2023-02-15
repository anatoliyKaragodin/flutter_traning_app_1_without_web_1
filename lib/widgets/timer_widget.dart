import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int waitTimeInSec;
  final VoidCallback onEnd;
  const TimerWidget({Key? key, required this.waitTimeInSec, required this.onEnd}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late int _waitTime;
  double _percent = 1.0;
  bool isStarted = true;
  String timeStr = '';

  @override
  void initState() {
    super.initState();
    _waitTime = widget.waitTimeInSec;
    _calculationTime();
    start();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void start() {
    if(_waitTime > 0) {
      setState(() {
        isStarted = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _waitTime -= 1;
        _calculationTime();
        if(_waitTime <= 0) pause();
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
    String secondsStr =  _waitTime.toString();
    setState(() {
      _percent = _waitTime/widget.waitTimeInSec;
      timeStr = secondsStr;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  InkWell(
        onTap: () {isStarted ? pause() : start();},
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
                      height: 150,
                      width: 150,
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
