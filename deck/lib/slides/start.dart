import 'package:deck/widgets/demo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_responsive/app.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/core/navigation.dart';
import 'package:flutter_responsive/pages/counters_page.dart';

class StartSlide extends FlutterDeckSlideWidget {
  const StartSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/start',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Starting Point',
            ),
        builder: (context) => const DemoApp(
              showData: false,
              child: CounterDemoLayout(),
            ));
  }
}

class CounterDemoLayout extends StatelessWidget {
  const CounterDemoLayout({super.key});

  @override
  Widget build(BuildContext context) {
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
                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: ScreenSize.small.size),
                      child: const Dialog(
                        child: AddCounterDialog(),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Counter'),
          )
        ],
      ),
      bottomNavigationBar: const CounterNavigationBar(),
      body: const CountersPage(isPage: true),
    );
  }
}
