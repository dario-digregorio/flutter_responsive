// Counter list provider
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.provider.g.dart';

@Riverpod(keepAlive: true)
class CountersIndex extends _$CountersIndex {
  void setIndex(int index) {
    state = index;
  }

  @override
  int build() {
    return 0;
  }
}

@Riverpod(keepAlive: true)
class Counters extends _$Counters {
  void incrementCounter(int index) {
    final counters = [...state];
    counters[index] = counters[index] + 1;
    state = counters;
  }

  void addCounter() {
    state = [...state, 0];
  }

  @override
  List<int> build() {
    return [0];
  }
}
