import 'package:flutter/material.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/provider/counter.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountersPage extends ConsumerWidget {
  final bool isFullPage;
  const CountersPage({super.key, this.isFullPage = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counters = ref.watch(countersProvider);
    final selectedIndex = ref.watch(countersIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counters'),
        actions: [
          TextButton.icon(
            onPressed: () => ref.read(countersProvider.notifier).addCounter(),
            icon: const Icon(Icons.add),
            label: const Text('Add Counter'),
          )
        ],
        // actions: [CountersAppBarActions()],
      ),
      body: ListView.separated(
        itemCount: counters.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            selected: isFullPage ? false : index == selectedIndex,
            selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
            selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
            title: const Text('Counter'),
            trailing: Text(counters[index].toString()),
            onTap: () async {
              ref.read(countersIndexProvider.notifier).setIndex(index);
              if (isFullPage) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterDetailPage()),
                );
              }
            },
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}

class CountersAppBarActions extends StatelessWidget {
  const CountersAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final orientation = MediaQuery.orientationOf(context);
    return Row(
      children: [
        Column(
          children: [
            const Text('width'),
            Text('$width'),
          ],
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            const Text('height'),
            Text('$height'),
          ],
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            const Text('Orientation'),
            Text(orientation.name),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
