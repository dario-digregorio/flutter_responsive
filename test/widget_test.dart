import 'package:flutter/material.dart';
import 'package:flutter_responsive/main.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/pages/counters_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should add counter', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(App), findsOneWidget);
    // Tap the 'Add Counter'
    await tester.tap(find.text('Add Counter'));
    await tester.pump();

    // Verify that counter has been added
    expect(find.byType(ListTile), findsOneWidget);
  });

  group('Test Responsive', () {
    testWidgets('should have only CountersPage', (WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0; // Set to 1.0 have use a specific size
      tester.view.physicalSize =
          const Size(500, 800); // to test layout on smaller devices
      await tester.pumpWidget(const App());

      expect(find.byType(CountersPage), findsOneWidget);
      expect(find.byType(CounterDetailPage), findsNothing);
      tester.view.reset();
    });

    testWidgets('should have CountersPage and Detail',
        (WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize =
          const Size(800, 1200); // to test layout on larger devices
      await tester.pumpWidget(const App());

      expect(find.byType(CountersPage), findsOneWidget);
      expect(find.byType(CounterDetailPage), findsOneWidget);
      tester.view.reset();
    });
  });
}
