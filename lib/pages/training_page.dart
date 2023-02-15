import 'package:flutter/material.dart';
import 'package:flutter_traning_app_1/widgets/timer_widget.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: ElevatedButton(onPressed: () {
            Navigator.of(context).pushNamed('/exercisePage');
          }, child: Text('Start training')),
        ),

        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.fitness_center_rounded),
              title: Text('Exercise $index'),
            );
          }),
        ),
      ],
    );
  }
}
