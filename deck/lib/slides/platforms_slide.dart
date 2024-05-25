import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class PlatformsSlide extends FlutterDeckSlideWidget {
  const PlatformsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/platforms',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      headerBuilder: (context) => Container(),
      title: 'Flutter has stable support for over 6 platforms',
    );
  }
}
