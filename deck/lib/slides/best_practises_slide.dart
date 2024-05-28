import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BestPractisesSlide extends FlutterDeckSlideWidget {
  const BestPractisesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Best Practises',
            route: '/best-practises',
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Best Practises',
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: FlutterDeckBulletList(
          useSteps: true,
          items: const [
            'Break down your widgets',
            'Design to the strengths of each form factor',
            'Solve touch first (Mobile first)',
            'Don\'t lock the orientation of your app',
            'Don\'t gobble up all of the horizontal space',
            'Restore state',
          ],
        ),
      ),
    );
  }
}
