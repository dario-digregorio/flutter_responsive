import 'package:flutter/material.dart';
import 'package:flutter_responsive/provider/counter.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterDetailPage extends ConsumerWidget {
  const CounterDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(countersIndexProvider);
    final counters = ref.watch(countersProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counters[index]}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(countersProvider.notifier).incrementCounter(index),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
