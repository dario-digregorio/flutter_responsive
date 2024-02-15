import 'package:deck/slides/responsive_title_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    // This is an entry point for the Flutter Deck app.
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
          controls:
              FlutterDeckControlsConfiguration(presenterToolbarVisible: false),
          footer: FlutterDeckFooterConfiguration(
            showFooter: true,
            showSocialHandle: true,
          )),
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'Dario Digregorio',
        description: 'info@dario-digregorio.de',
        imagePath: 'assets/profile.jpeg',
        socialHandle: '@digregoriodario',
      ),
      slides: const [
        ResponsiveTitleSlide(),
        BlankSlide(),
      ],
    );
  }
}

class BlankSlide extends FlutterDeckSlideWidget {
  const BlankSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/blank-slide',
            header: FlutterDeckHeaderConfiguration(
              title: 'Blank slide template',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Text('Here goes the content of the slide'),
    );
  }
}
