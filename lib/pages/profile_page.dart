import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
import 'package:flutter_traning_app_1/utils/library.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Exercises:  ${ref.watch(completedExerciseProvider)}',
            style: TextStyle(fontSize: Dimensions.height10 * 1.6),
          )),
          SizedBox(
            height: Dimensions.height10,
          ),
          Center(
              child: Text('Workouts completed:  ${ref.watch(completedWorkoutProvider)}',
                  style: TextStyle(fontSize: Dimensions.height10 * 1.6))),
        ],
      ),
    );
  }
}
