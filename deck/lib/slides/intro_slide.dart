import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Bulding Responsive UIs',
            route: '/intro',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      footerBuilder: (context) => const FlutterDeckFooter(
        widget: Text('Build with flutter_deck'),
      ),
      headerBuilder: (context) => Container(),
      title: 'Bulding Responsive UIs',
    );
  }
}
