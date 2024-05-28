import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class PlatformsSlide extends FlutterDeckSlideWidget {
  const PlatformsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Platforms',
            route: '/platforms',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        builder: (context) => SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Flutter has stable support for over 6 platforms',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 32),
                  Image.asset(
                    'assets/platforms.png',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ));
  }
}
