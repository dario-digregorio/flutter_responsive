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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text('Thank You!',
                          style: Theme.of(context).textTheme.displayLarge),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/qrcode_linkedIn.png',
                                  width: 250,
                                ),
                                const SizedBox(height: 16),
                                Text('LinkedIn: Dario Digregorio',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/qrcode_yawa.png',
                                  width: 250,
                                ),
                                const SizedBox(height: 16),
                                Text('My App: Yawa',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: Text(
                          'You can find me on LinkedIn, GitHub, X and Medium!',
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ]),
            ));
  }
}
