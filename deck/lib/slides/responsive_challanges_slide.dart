import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ResponsiveChallangesSlide extends FlutterDeckSlideWidget {
  const ResponsiveChallangesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/responsive-challanges', steps: 6),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) =>
          const FlutterDeckHeader(title: 'Responsive Challanges'),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: FlutterDeckBulletList(
          useSteps: true,
          items: const [
            'Many different Form Factors (Phone, Tablet, Desktop, Foldable, ...)',
            'Notches, Cutouts, Punch holes',
            'Scaling UI and Text for accessibility',
            'Different behaviors for different platforms',
            'Supporting RTL and LTR languages',
            'Screen Orientation',
          ],
        ),
      ),
    );
  }
}
