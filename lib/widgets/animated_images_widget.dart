import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';

class AnimatedImagesWidget extends StatelessWidget {
  final List<String> imageList;
  const AnimatedImagesWidget({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
        // ref.read(animationPausedProvider.notifier).update((state) => false);
        final imageNumber = ref.watch(changeImageProvider);
        final animationPaused = ref.watch(animationPausedProvider);
        if (animationPaused == false) {
          Future.delayed(Duration(milliseconds: 500), () {
            imageNumber < imageList.length
                ? ref
                    .read(changeImageProvider.notifier)
                    .update((state) => state + 1)
                : ref.read(changeImageProvider.notifier).update((state) => 1);
          });
        }
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(imageList[imageNumber - 1]))),
          height: Dimensions.height10 * 22,
          width: Dimensions.width10 * 22,
        );
      },
    );
  }
}
