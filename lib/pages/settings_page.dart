import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sound'),
              Checkbox(
                  value: soundState,
                  onChanged: (value) {
                    ref.read(soundOnProvider.notifier).update((state) => value!);
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Vibration'),
              Checkbox(
                  value: vibrationState,
                  onChanged: (vibrOn) {
                    ref.read(vibrationOnProvider.notifier).update((state) => vibrOn!);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
