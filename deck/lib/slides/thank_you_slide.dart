import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ThankYouSlide extends FlutterDeckSlideWidget {
  const ThankYouSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Thank You',
            route: '/thank-you',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
        builder: (context) => Padding(
              padding: const EdgeInsets.all(128),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Thank You!',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 64),
                    Image.asset(
                      'assets/qrcode_github.png',
                      width: 250,
                    ),
                    const SizedBox(height: 32),
                    Text('Scan to to connect with me',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 64),
                    Text('You can find me on LinkedIn, GitHub and X!',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ]),
            ));
  }
}
