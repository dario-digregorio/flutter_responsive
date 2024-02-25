import 'package:flutter/material.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/notifier/counters_notifier.dart';

class CountersPage extends StatelessWidget {
  final bool isPage;

  const CountersPage({super.key, this.isPage = true});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(Spacing.x3),
            itemCount: notifier.counters.length,
            itemBuilder: (context, index) => ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              selected: isPage ? false : index == notifier.selectedCounterIndex,
              selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
              selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
              title: Text(notifier.counters[index].label),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.x3, vertical: Spacing.x2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(notifier.counters[index].value.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
              ),
              onTap: () async {
                notifier.selectCounter(index);
                if (isPage) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CounterDetailPage(
                              isPage: isPage,
                            )),
                  );
                }
              },
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: Spacing.x3);
            },
          );
        });
  }
}
