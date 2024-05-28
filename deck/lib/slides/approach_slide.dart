import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ApproachSlide extends FlutterDeckSlideWidget {
  const ApproachSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'General Approach',
            route: '/approach',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'General Approach',
            ),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'The general approach on creating responsive widgets is explained in detailed by the Flutter Team:',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 32),
                  Image.asset('assets/approach.png'),
                  const SizedBox(height: 16),
                  const Text(
                      'Read more: https://docs.flutter.dev/ui/adaptive-responsive'),
                  const Text(
                      'Watch on YouTube: https://www.youtube.com/watch?v=LeKLGzpsz9I'),
                ],
              ),
            ));
  }
}
