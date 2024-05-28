import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AbstractSlide extends FlutterDeckSlideWidget {
  const AbstractSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'Abstract',
            route: '/abstract',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Abstract',
            ),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Identify the widgets that you plan to make responsive.',
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 32),
                  Text(
                    '''
        - Dialogs, both fullscreen and modal
        - Navigation UI, both rail and bottom bar
        - Custom layout, such as "is the UI area taller or wider?"
        ''',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ));
  }
}
