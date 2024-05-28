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
            tableBody: const TextStyle(fontSize: 24),
          ),
          padding: const EdgeInsets.all(32),
          selectable: true,
          data: '''
# What device should you use for testing your app with different screen sizes?


| Environment               | HotReload |        Resizable Window         | Text Scaling | UI Scaling | Lib Compatibility |
| ------------------------- | :-------: | :-----------------------------: | :----------: | :--------: | :---------------: |
| Windows/Mac/Linux         |    Yes    |               Yes               |     Yes      |    Yes     |      Middle       |
| Web                       |    No     |               Yes               |     Yes      |    Yes     |        Low        |
| Android Emulator          |    Yes    | Experimental (only breakpoints) |     Yes      |    Yes     |       High        |
| iOS Simulator             |    Yes    |               No                |     Yes      |    Yes     |       High        |
| iPadOS (Stage Manager)    |    Yes    |             Limited             |     Yes      |    Yes     |       High        |
| MacOS (Designed for iPad) |    Yes    |               Yes               |      No      |     No     |       High        |

# See the README.md for more details.
'''),
    );
  }
}
