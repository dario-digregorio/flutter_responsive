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
  // you can choose on which side you want to calculate the size
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    '⚠️ We will not use additional packages. It is recommended to use some form of state management solution like Riverpod or Bloc to manage your app\'s state effectively.',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Text('Mobile first',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 16),
              Text(
                'Starting your design with mobile in mind makes scaling up to larger screens smoother. This approach helps in efficiently adapting your designs for tablets or desktops. We will implement a Master-Detail layout for larger screens.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 64),
              Text('Define Screen-based Breakpoints',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 32),
              const Center(child: CodeSnippet(text: snippetScreenSize)),
              const SizedBox(height: 64),
              Text('Device Segmentation',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 32),
              const Center(child: CodeSnippet(text: snippetDeviceSegmentation)),
            ],
          ),
        ),
      ),
    );
  }
}
