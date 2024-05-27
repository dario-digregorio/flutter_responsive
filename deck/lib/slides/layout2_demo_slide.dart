import 'package:deck/widgets/demo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_responsive/app.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/core/navigation.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/pages/counters_page.dart';

class Layout2DemoSlide extends FlutterDeckSlideWidget {
  const Layout2DemoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/layout2-demo',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Adapting to Orientation Changes',
            ),
        builder: (context) => const DemoApp(
              child: CounterDemoLayout(),
            ));
  }
}

class CounterDemoLayout extends StatelessWidget {
  const CounterDemoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);
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
              Expanded(child: CountersPage(isPage: false)),
              Expanded(child: CounterDetailPage(isPage: false)),
            ],
          ),
        (_, Orientation.landscape) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(child: CountersPage(isPage: true))
            ],
          ),
        _ => const CountersPage(isPage: true),
      },
    );
  }
}
