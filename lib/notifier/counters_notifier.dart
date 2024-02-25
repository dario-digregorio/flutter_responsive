import 'package:flutter/material.dart';

/// It is bad practice to use a global variable to store the state of the app.
/// But for the sake of simplicity, we will use a global variable.
/// This implementation would also rebuild multiple times unnecessarily and
/// splitting the state into multiple notifiers would be a better approach.
final notifier = CountersNotifier();

class Counter {
  final int value;
  final String label;

  const Counter({required this.label, required this.value});

  Counter copyWith({int? value}) {
    return Counter(
      label: label,
      value: value ?? this.value,
    );
  }
}

class CountersNotifier with ChangeNotifier {
  final List<Counter> _counters = [
    const Counter(label: 'Flutter Counter', value: 0),
  ];
  int _selectedCounterIndex = 0;
  int _selectedNavigationIndex = 0;

  List<Counter> get counters => _counters;
  int get selectedCounterIndex => _selectedCounterIndex;
  Counter get selectedCounter => _counters[_selectedCounterIndex];
  int get selectedNavigationIndex => _selectedNavigationIndex;

  void selectCounter(int index) {
    _selectedCounterIndex = index;
    notifyListeners();
  }

  void increment() {
    _counters[_selectedCounterIndex] =
        _counters[_selectedCounterIndex].copyWith(
      value: _counters[_selectedCounterIndex].value + 1,
    );
    notifyListeners();
  }

  void add(String label) {
    if (label.isEmpty) {
      label = 'Counter';
    }
    _counters.add(Counter(label: label, value: 0));
    notifyListeners();
  }

  void selectDestination(int index) {
    _selectedNavigationIndex = index;
    notifyListeners();
  }
}
