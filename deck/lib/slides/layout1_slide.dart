import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_responsive/app.dart';
import 'package:flutter_responsive/main.dart';

const snippet = '''
class _CounterAppState extends State<CounterApp> {
  // ...
  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    return Scaffold(
      bottomNavigationBar: switch (screenSize) {
        ScreenSize.normal || ScreenSize.small => const CounterNavigationBar(),
        _ => null,
      },
      body: switch (screenSize) {
          ScreenSize.large || ScreenSize.extraLarge => Row(
              children: [
                const CounterNavigationRail(),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: CountersPage(isPage: false)),
                Expanded(child: CounterDetailPage(isPage: false)),
              ],
            ),
          _ => CountersPage(isPage: true),
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
              title: 'Defining a Responsive Layout',
            ),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Layout 1',
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 16),
                    Text(
                      'Define a responsive layout based on the screen size.',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 64),
                    const CodeSnippet(text: snippet),
                  ]),
            ));
  }
}
