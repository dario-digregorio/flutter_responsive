import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const snippet = '''
group('Test Responsive', () {
  testWidgets('should have only CountersPage', (WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0; // Not necessary but makes it easier to use the same values from our ScreenSizes
      tester.view.physicalSize =
          const Size(500, 800); // to test layout on smaller devices
      await tester.pumpWidget(const App());

      expect(find.byType(CountersPage), findsOneWidget);
      expect(find.byType(CounterDetailPage), findsNothing);
      tester.view.reset(); // Don't forget to reset view
      // https://github.com/flutter/flutter/issues/100836
    });

    testWidgets('should have CountersPage and Detail',
        (WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize =
          const Size(800, 1200); // to test layout on larger devices
      await tester.pumpWidget(const App());

      expect(find.byType(CountersPage), findsOneWidget);
      expect(find.byType(CounterDetailPage), findsOneWidget);
      tester.view.reset(); // Don't forget to reset view
    });
  });
''';

class TestingSlide extends FlutterDeckSlideWidget {
  const TestingSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Testing Responsive Designs',
            route: '/testing',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) =>
          const FlutterDeckHeader(title: 'Testing Responsive Designs'),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Test your responsive designs by specifying the device size and orientation in your tests. Use the `testWidgets` method to test the layout based on the screen size and orientation.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            const Center(child: CodeSnippet(text: snippet)),
          ]),
        ),
      ),
    );
  }
}
