import 'package:flutter/material.dart';
import 'package:flutter_responsive/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: CounterApp()));
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultimate Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const CounterAppContent(),
    );
  }
}

class CounterNavigationBar extends StatelessWidget {
  const CounterNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(selectedIndex: 0, destinations: const [
      NavigationDestination(
        icon: Icon(Icons.list),
        label: 'Counters',
      ),
      NavigationDestination(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ]);
  }
}

class CounterNavigationRail extends StatelessWidget {
  const CounterNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.list),
          label: Text('Counters'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
      selectedIndex: 0,
    );
  }
}
