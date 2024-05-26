import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const snippetScreenSize = '''
enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}
        ''';

const snippetDeviceSegmentation = '''
bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
bool get isDesktopDevice =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
        ''';

class FoundationSlide extends FlutterDeckSlideWidget {
  const FoundationSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/foundation',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      headerBuilder: (context) => const FlutterDeckHeader(
        title: 'Foundation',
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile first',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 16),
            Text(
              'Start with the smallest screen size and then scale up.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Define Screen-based Breakpoints',
                        style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 16),
                    const CodeSnippet(text: snippetScreenSize),
                  ],
                ),
                const SizedBox(width: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Device Segmentation',
                        style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 16),
                    const CodeSnippet(text: snippetDeviceSegmentation),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
