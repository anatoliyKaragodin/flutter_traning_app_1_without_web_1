import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final soundState = ref.watch(soundOnProvider);
    final vibrationState = ref.watch(vibrationOnProvider);
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.width10*12,
          right: Dimensions.width10*12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Sound option
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sound'),
              Checkbox(
                  value: soundState,
                  onChanged: (value) {
                    ref.read(soundOnProvider.notifier).update((state) => value!);
                  }),
            ],
          ),
          /// Vibration option
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Vibration'),
              Checkbox(
                  value: vibrationState,
                  onChanged: (vibrOn) {
                    ref.read(vibrationOnProvider.notifier).update((state) => vibrOn!);
                  }),
            ],
          ),
          SizedBox(height: Dimensions.height10*3,),
         /// Exit button
          ElevatedButton(onPressed: () {
            SystemNavigator.pop();
          },
              child: const Text('Exit'))
        ],
      ),
    );
  }
}
