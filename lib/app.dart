import 'package:flutter/material.dart';
import 'package:flutter_responsive/constants.dart';
import 'package:flutter_responsive/main.dart';
import 'package:flutter_responsive/pages/counter_detail_page.dart';
import 'package:flutter_responsive/pages/counters_page.dart';

class CounterAppContent extends StatelessWidget {
  const CounterAppContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    return Scaffold(
      bottomNavigationBar: switch ((screenSize, orientation)) {
        (_, Orientation.landscape) => null,
        (ScreenSize.large, _) => null,
        (_, _) => const CounterNavigationBar(),
      },
      body: SafeArea(
        child: switch ((screenSize, orientation)) {
          (ScreenSize.large, _) => const Row(
              children: [
                CounterNavigationRail(),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: CountersPage(isFullPage: false),
                ),
                Expanded(
                  child: CounterDetailPage(),
                ),
              ],
            ),
          (_, Orientation.landscape) => const Row(
              children: [
                CounterNavigationRail(),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: CountersPage(),
                )
              ],
            ),
          (_, _) => const CountersPage(),
        },
      ),
    );
  }
}
