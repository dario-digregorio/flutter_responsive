import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BranchSlide extends FlutterDeckSlideWidget {
  const BranchSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Branch',
            route: '/branch',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Branch',
            ),
        builder: (context) => Center(
                child: Text(
              'Decide what sizing breakpoints to use \n when choosing what version of the UI to display',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            )));
  }
}
