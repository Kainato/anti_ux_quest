import 'dart:math';

extension RandomElement<T> on List<T> {
  T get pickRandom => this[Random().nextInt(length)];
}
