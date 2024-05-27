import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DevicesTableSlide extends FlutterDeckSlideWidget {
  const DevicesTableSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/devices-table',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) =>
          const FlutterDeckHeader(title: 'Devices Table'),
      builder: (context) => Markdown(
          styleSheet: MarkdownStyleSheet(
            tableBody: const TextStyle(fontSize: 26),
          ),
          padding: const EdgeInsets.all(32),
          selectable: true,
          data: '''
# What device should you use for testing your app with different screen sizes?


| Environment               | HotReload |        Resizable Window         | Text Scaling | UI Scaling |
| ------------------------- | :-------: | :-----------------------------: | :----------: | :--------: |
| Windows/Mac/Linux         |    Yes    |               Yes               |     Yes      |    Yes     |
| Web                       |    No     |               Yes               |     Yes      |    Yes     |
| Android Emulator          |    Yes    | Experimental (only breakpoints) |     Yes      |    Yes     |
| iOS Simulator             |    Yes    |               No                |     Yes      |    Yes     |
| iPadOS (Stage Manager) [iOS Target]    |    Yes    |             Limited             |     Yes      |    Yes     |
| MacOS (Designed for iPad) [iOS Target] |    Yes    |               Yes               |      No      |     No     |

# See the README.md for more details.
'''),
    );
  }
}
