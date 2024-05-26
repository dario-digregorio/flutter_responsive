import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BranchSlide extends FlutterDeckSlideWidget {
  const BranchSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/branch',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Branch',
      ),
      title:
          'Decide what sizing breakpoints to use when choosing what version of the UI to display',
    );
  }
}
