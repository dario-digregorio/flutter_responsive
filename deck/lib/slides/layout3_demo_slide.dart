import 'package:deck/widgets/demo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_responsive/app.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/core/navigation.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/pages/counters_page.dart';

class Layout3DemoSlide extends FlutterDeckSlideWidget {
  const Layout3DemoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Navigation, Dialogs and Single Page Layouts',
            route: '/layout3-demo',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Navigation, Dialogs and Single Page Layouts Demo',
            ),
        builder: (context) => const DemoApp(
              child: CounterApp(),
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
                child: NavigationLayout(
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
                  child: NavigationLayout(
                child: CountersPage(isPage: true),
              ))
            ],
          ),
        _ => const NavigationLayout(child: CountersPage(isPage: true)),
      },
    );
  }
}
