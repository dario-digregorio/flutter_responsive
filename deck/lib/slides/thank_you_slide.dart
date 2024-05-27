import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ThankYouSlide extends FlutterDeckSlideWidget {
  const ThankYouSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
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
                  children: <Widget>[
                    Text('Thank You!',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 64),
                    Image.asset(
                      'assets/qrcode_linkedIn.png',
                      width: 250,
                    ),
                    const SizedBox(height: 16),
                    Text('Scan to know how to connect with me',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 64),
                    Text('You can find me on LinkedIn, GitHub, X and Medium!',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ]),
            ));
  }
}
