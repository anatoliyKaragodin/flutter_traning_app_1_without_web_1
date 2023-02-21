import 'package:flutter_traning_app_1/utils/library.dart';

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

final animationPausedProvider = StateProvider<bool>((ref) {
  return false;
});

// final urlErrorProvider = StateProvider<bool>((ref) => true);

final completedExerciseProvider = StateProvider<int>((ref) {
  return 0;
});

final completedWorkoutProvider = StateProvider<int>((ref) {
  return 0;
});