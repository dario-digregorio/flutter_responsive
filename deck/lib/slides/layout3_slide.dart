import 'package:deck/widgets/code_snippet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const snippetScaffold = '''
class _CounterAppState extends State<CounterApp> {
  // ...
  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenUtils.getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    final layoutInfo = (screenSize, orientation);
    var isBigDevice = ScreenUtils.isBigDevice(screenSize);
    if (isBigDevice) { // If the screen size changes to a bigger size pop the navigation stack
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    }
    return Scaffold(
      appBar: AppBar(
        // ...
        actions: [
          TextButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    // Use a dialog for bigger devices
                    if (isBigDevice) { 
                      return Dialog(
                        child: ConstrainedBox(
                          constraints: // Limit the dialog width
                              BoxConstraints(maxWidth: ScreenSize.normal.size),
                          child: const AddCounterDialog(),
                        ),
                      );
                    }
                    // Use a fullscreen dialog for smaller devices
                    return const Dialog.fullscreen(
                      child: AddCounterDialog(),
                    );
                  });
            },
            // ...
          )
        ],
      ),
      body: switch (layoutInfo) {
        (ScreenSize.large || ScreenSize.extraLarge, _) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: NavigationLayout( // Used to react to selected Page index
                  child: Row(
                    children: [
                      Expanded(
                        child: CountersPage(isPage: false),
                      ),
                      Expanded(
                        child: CounterDetailPage(isPage: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        (_, Orientation.landscape) => const Row(
            children: [
              CounterNavigationRail(),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  child: NavigationLayout(
                child: CountersPage(isPage: true),
              ))
            ],
          ),
        _ => const NavigationLayout(child: CountersPage(isPage: true)),
      },
    );
  }
}
''';

const snippetNavigation = '''
class NavigationLayout extends StatelessWidget {
  final Widget child;
  const NavigationLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return IndexedStack(
              index: notifier.selectedNavigationIndex,
              children: [
                child,
                const SettingsPage(),
              ]);
        });
  }
}
''';

const snippetSettings = '''
return Scaffold(body:
 LayoutBuilder(builder: (context, constraints) {
      double horizontalPadding = constraints.maxWidth > ScreenSize.large.size
          ? ((constraints.maxWidth - ScreenSize.large.size) / 2)
          : Spacing.x3;
      return ListView(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: Spacing.x3),
//...
)}));
''';

class Layout3Slide extends FlutterDeckSlideWidget {
  const Layout3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/layout3',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
        headerBuilder: (context) => const FlutterDeckHeader(
              title: 'Navigation, Dialogs and Single Page Layouts',
            ),
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use a record type to handle multiple values like screen size and orientation. This approach helps in adapting the layout based on the orientation of the device.',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      const Center(child: CodeSnippet(text: snippetScaffold)),
                      const SizedBox(height: 64),
                      Text(
                        'Navigation Layout',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 32),
                      const Center(child: CodeSnippet(text: snippetNavigation)),
                      const SizedBox(height: 64),
                      Text(
                        'Settings Page',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 32),
                      const Center(child: CodeSnippet(text: snippetSettings)),
                    ]),
              ),
            ));
  }
}
