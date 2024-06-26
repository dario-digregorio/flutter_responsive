import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MeasureSlide extends FlutterDeckSlideWidget {
  const MeasureSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Measure',
            route: '/measure',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Measure',
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MediaQuery',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text('''
- Provides the size of the window
- Should be used only for root Layout Widgets
- Use  `sizeoOf` method to get the size to prevent unnecessary rebuilds
''', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text('LayoutBuilder',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text('''
- Provides the size of the parent widget
- Should be generally used
''', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
