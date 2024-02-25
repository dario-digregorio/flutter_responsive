import 'package:flutter/material.dart';
import 'package:flutter_responsive/notifier/counters_notifier.dart';

class CounterDetailPage extends StatelessWidget {
  final bool isPage;

  const CounterDetailPage({super.key, required this.isPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isPage
          ? null
          : Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
      appBar: isPage
          ? AppBar(
              title: isPage ? Text(notifier.selectedCounter.label) : null,
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ListenableBuilder(
                listenable: notifier,
                builder: (context, child) {
                  return Text(
                    '${notifier.selectedCounter.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.increment(),
        tooltip: 'Increment',
        heroTag: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
