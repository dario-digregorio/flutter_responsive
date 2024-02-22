import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ResponsiveChallangesSlide extends FlutterDeckSlideWidget {
  const ResponsiveChallangesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/responsive-challanges',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: false,
        items: const [
          'Many different Form Factors (Phone, Tablet, Desktop, Foldable, ...)',
          'Notches, Cutouts, Punch holes',
          'Scaling UI and Text for accessibility',
          'Different behaviors for different platforms',
          'Supporting RTL and LTR languages',
          'Screen Orientation',
        ],
      ),
    );
  }
}
