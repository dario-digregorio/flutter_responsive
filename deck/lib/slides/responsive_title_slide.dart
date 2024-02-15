import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_responsive/main.dart';

class ResponsiveTitleSlide extends FlutterDeckSlideWidget {
  const ResponsiveTitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/responsive-title',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return ExcludeFocus(
          child: Stack(
            children: [
              const SizedBox(
                height: 200,
                width: 250,
                child: CounterApp(),
              ),
              Row(
                children: [
                  const Expanded(
                      child: SizedBox(
                    child: CounterApp(),
                  )),
                  Expanded(
                      child: Transform.scale(
                    scaleX: 0.1,
                    child: Container(
                      color: Colors.blue,
                    ),
                  )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
