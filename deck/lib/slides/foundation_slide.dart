import 'package:deck/main.dart';
import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

const snippet = '''
enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}
        ''';

class FoundationSlide extends FlutterDeckSlideWidget {
  const FoundationSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/foundation',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Foundation',
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile first',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 16),
            Text(
              'Start with the smallest screen size and then scale up.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 64),
            const CodeSnippet(text: snippet),
          ],
        ),
      ),
    );
  }
}
