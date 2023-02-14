import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 20,
              width: 40,
              child: TextButton(
                onPressed: () {},
                child: Text('$index'),
              ),
            );
          }),

    );
  }
}
