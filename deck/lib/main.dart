import 'package:deck/slides/about_slide.dart';
import 'package:deck/slides/devices_table_slide.dart';
import 'package:deck/slides/image_slide.dart';
import 'package:deck/slides/intro_slide.dart';
import 'package:deck/slides/platforms_slide.dart';
import 'package:deck/slides/responsive_challanges_slide.dart';
import 'package:deck/slides/responsive_vs_adaptive_slide.dart';
import 'package:deck/slides/thank_you_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_deck_web_client/flutter_deck_web_client.dart';

void main() {
  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    // This is an entry point for the Flutter Deck app.
    return FlutterDeckApp(
      client: FlutterDeckWebClient(),
      configuration: const FlutterDeckConfiguration(
          controls:
              FlutterDeckControlsConfiguration(presenterToolbarVisible: true),
          header: FlutterDeckHeaderConfiguration(
            showHeader: true,
            title: 'Responsive Design in Flutter',
          ),
          footer: FlutterDeckFooterConfiguration(
            showFooter: true,
            showSocialHandle: false,
          )),
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'Dario Digregorio',
        description: 'info@dario-digregorio.de',
        imagePath: 'assets/profile.jpeg',
        socialHandle: '@digregoriodario',
      ),
      slides: const [
        IntroSlide(),
        AboutSlide(),
        PlatformsSlide(),
        ImageSlide(),
        ResponsiveChallangesSlide(),
        DevicesTableSlide(),
        ReponsiveVsAdaptiveSlide(),
        ThankYouSlide(),
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
