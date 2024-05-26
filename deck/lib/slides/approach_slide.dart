import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ApproachSlide extends FlutterDeckSlideWidget {
  const ApproachSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/approach',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'General Approach',
            ),
        builder: (context) => const Padding(
              padding: EdgeInsets.all(64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('approach.png')),
                  SizedBox(height: 16),
                  Text(
                      'Read more: https://docs.flutter.dev/ui/adaptive-responsive'),
                  Text(
                      'Watch on YouTube: https://www.youtube.com/watch?v=LeKLGzpsz9I'),
                ],
              ),
            ));
  }
}
