import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ImageSlide extends FlutterDeckSlideWidget {
  const ImageSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/image',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
        builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Let\'s built for all platforms!',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/meme.png',
                  width: 600,
                )
              ],
            ));
  }
}
