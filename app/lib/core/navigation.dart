import 'package:flutter/material.dart';
import 'package:flutter_responsive/notifier/counters_notifier.dart';

class CounterNavigationDestination {
  final String label;
  final Icon icon;

  CounterNavigationDestination({required this.icon, required this.label});
}

final List<CounterNavigationDestination> _navigationDestinations = [
  CounterNavigationDestination(
    icon: const Icon(Icons.list),
    label: 'Counters',
  ),
  CounterNavigationDestination(
    icon: const Icon(Icons.settings),
    label: 'Settings',
  ),
];

class CounterNavigationBar extends StatelessWidget {
  const CounterNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return NavigationBar(
              onDestinationSelected: (value) =>
                  notifier.selectDestination(value),
              selectedIndex: notifier.selectedNavigationIndex,
              destinations: _navigationDestinations
                  .map((destination) => NavigationDestination(
                      icon: destination.icon, label: destination.label))
                  .toList());
        });
  }
}

class CounterNavigationRail extends StatelessWidget {
  const CounterNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return NavigationRail(
            onDestinationSelected: (value) => notifier.selectDestination(value),
            labelType: NavigationRailLabelType.all,
            destinations: _navigationDestinations
                .map((destination) => NavigationRailDestination(
                      icon: destination.icon,
                      label: Text(destination.label),
                    ))
                .toList(),
            selectedIndex: notifier.selectedNavigationIndex,
          );
        });
  }
}
