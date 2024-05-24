import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Flutter Heroes 2024',
      subtitle: 'Building Responsive UIs in Flutter',
    );
  }
}
