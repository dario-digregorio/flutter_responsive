import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AdaptiveVsResponsiveSlide extends FlutterDeckSlideWidget {
  const AdaptiveVsResponsiveSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/adaptive-vs-responsive',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: '',
      subtitle: '',
    );
  }
}
