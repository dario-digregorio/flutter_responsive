import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ResponsiveChallengesSlide extends FlutterDeckSlideWidget {
  const ResponsiveChallengesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
              title: 'Responsive Challenges',
              route: '/responsive-challenges',
              steps: 6),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) =>
          const FlutterDeckHeader(title: 'Responsive Challenges'),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: FlutterDeckBulletList(
          useSteps: true,
          items: const [
            'Many different form factors (Phone, Tablet, Desktop, Foldable, ...)',
            'Notches, cutouts, punch holes, Dynamic Island',
            'Scaling UI and text for accessibility',
            'Different behaviors for different platforms',
            'Supporting RTL and LTR languages',
            'Screen orientation',
          ],
        ),
      ),
    );
  }
}
