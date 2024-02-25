import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/core/navigation.dart';
import 'package:flutter_responsive/notifier/counters_notifier.dart';
import 'package:flutter_responsive/pages/settings_page.dart';

import 'pages/counter_detail_page.dart';
import 'pages/counters_page.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({
    super.key,
  });

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);
    var isBigDevice = ScreenUtils.isBigDevice(screenSize);
    if (isBigDevice) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        title: const Text('Ultimate Counter App'),
        actions: [
          TextButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    if (isBigDevice) {
                      return Dialog(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: ScreenSize.normal.size),
                          child: const AddCounterDialog(),
                        ),
                      );
                    }
                    return const Dialog.fullscreen(
                      child: AddCounterDialog(),
                    );
                  });
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Counter'),
          )
        ],
      ),
      bottomNavigationBar: switch (layoutInfo) {
        (ScreenSize.normal || ScreenSize.small, Orientation.portrait) =>
          const CounterNavigationBar(),
        (_) => null,
      },
      body: switch (layoutInfo) {
        (ScreenSize.large || ScreenSize.extraLarge, _) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: NavigationCounter(
                  child: Row(
                    children: [
                      Expanded(
                        child: CountersPage(isPage: false),
                      ),
                      Expanded(
                        child: CounterDetailPage(isPage: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        (_, Orientation.landscape) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  child: NavigationCounter(
                child: CountersPage(isPage: true),
              ))
            ],
          ),
        _ => const NavigationCounter(child: CountersPage(isPage: true)),
      },
    );
  }
}

class AddCounterDialog extends StatelessWidget {
  const AddCounterDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Add Counter',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: Spacing.x5),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Counter Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Spacing.x4),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {
                notifier.add(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationCounter extends StatelessWidget {
  final Widget child;
  const NavigationCounter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return IndexedStack(
              index: notifier.selectedNavigationIndex,
              children: [
                child,
                const SettingsPage(),
              ]);
        });
  }
}
