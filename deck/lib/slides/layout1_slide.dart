import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const snippet = '''
class _CounterAppState extends State<CounterApp> {
  // ...
  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context); // Use helper method to determine screen size
    return Scaffold(
      bottomNavigationBar: switch (screenSize) { // Bottom Navigation Bar
        ScreenSize.normal || ScreenSize.small => const CounterNavigationBar(),
        _ => null,
      },
      body: switch (screenSize) { // Switch expression based on screen size
          ScreenSize.large || ScreenSize.extraLarge => Row(
              children: [
                const CounterNavigationRail(), // Navigation Rail
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: CountersPage(isPage: false)),
                Expanded(child: CounterDetailPage(isPage: false)),
              ],
            ),
          // Default layout for every other screen size
          // Using (_) could lead to not handling cases that have been added later
          _ => CountersPage(isPage: true), // isPage true to handle navigation
        },
      );
  }
}
''';

class Layout1Slide extends FlutterDeckSlideWidget {
  const Layout1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/layout1',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Defining the Responsive Layout',
            ),
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use the `getScreenSize` helper method and switch expressions to determine the screen size and adapt the layout accordingly.',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      const Center(child: CodeSnippet(text: snippet)),
                    ]),
              ),
            ));
  }
}
