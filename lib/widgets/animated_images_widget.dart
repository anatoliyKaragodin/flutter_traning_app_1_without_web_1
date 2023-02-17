import 'package:flutter_traning_app_1/utils/library.dart';

import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
import 'package:flutter_traning_app_1/utils/dimensions_util.dart';

class AnimatedImagesWidget extends ConsumerStatefulWidget {
  final List<String> images;
  const AnimatedImagesWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  ConsumerState<AnimatedImagesWidget> createState() =>
      _AnimatedImagesWidgetState();
}

class _AnimatedImagesWidgetState extends ConsumerState<AnimatedImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: ref.watch(animationPausedProvider) ?
                  AssetImage(widget.images[1])
                  : AssetImage(widget.images[0]))),
      height: Dimensions.height10 * 22,
      width: Dimensions.width10 * 22,
    );
  }
}
