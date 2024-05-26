import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const snippet = '''
class _CounterAppState extends State<CounterApp> {
  // ...
  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context); // Listen to orientation changes
    return Scaffold(
      bottomNavigationBar: switch ((screenSize, orientation)) {
        (ScreenSize.normal || ScreenSize.small, Orientation.portrait) =>
          const CounterNavigationBar(),
        (_) => null,
      },
      body: switch ((screenSize, orientation)) { // Use a record type to handle multiple values
          // Use _ to ignore the orientation
          (ScreenSize.large || ScreenSize.extraLarge, _) => Row(
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
          // Use _ to ignore the screen size
          (_, Orientation.landscape) => Row(
              children: [
                const CounterNavigationRail(),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: CountersPage(isPage: true))
              ],
            ),
          // Default layout for every other screen size
          (_) => CountersPage(isPage: true),
        },
      );
  }
}
''';

class Layout2Slide extends FlutterDeckSlideWidget {
  const Layout2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/layout2',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Adapting to Orientation Changes',
            ),
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use a record type to handle multiple values like screen size and orientation. This approach helps in adapting the layout based on the orientation of the device.',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      const Center(child: CodeSnippet(text: snippet)),
                    ]),
              ),
            ));
  }
}
