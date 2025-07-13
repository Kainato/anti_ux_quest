import '../core/core_utils.dart';

extension IntExtension on int {
  int get widthDivisor {
    if (CoreUtils.width ~/ this < 0) {
      return 1;
    } else {
      return (CoreUtils.width / this).round();
    }
  }
}
