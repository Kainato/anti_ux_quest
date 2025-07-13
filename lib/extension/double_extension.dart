import '../core/core_utils.dart';

extension DoubleExtension on double {
  double get widthDivisor {
    if (CoreUtils.width ~/ this < 0) {
      return 1;
    } else {
      return CoreUtils.width / this;
    }
  }
}
