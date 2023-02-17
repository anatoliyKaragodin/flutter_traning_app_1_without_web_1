import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseNumberProvider = StateProvider<int>((ref) {
  return 0;
});

final exerciseIsStartedProvider = StateProvider<bool>((ref) {
  return true;
});

final soundOnProvider = StateProvider<bool>((ref) {
  return true;
});

final vibrationOnProvider = StateProvider<bool>((ref) {
  return true;
});

final selectedDayProvider = StateProvider<int>((ref) {
  return 0;
});

// final changeImageProvider = StateProvider<int>((ref) {
//   return 1;
// });

// final animationPausedProvider = StateProvider<bool>((ref) {
//   return false;
// });