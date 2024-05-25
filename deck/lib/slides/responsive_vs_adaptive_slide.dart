import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ReponsiveVsAdaptiveSlide extends FlutterDeckSlideWidget {
  const ReponsiveVsAdaptiveSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/responsive-vs-adaptive',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.quote(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Responsive vs. Adaptive',
      ),
      attribution: 'flutter.dev',
      quote:
          'Responsive design is about fitting the UI. \n Adaptive design is about the UI being usable.',
    );
  }
}
