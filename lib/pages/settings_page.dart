import 'package:flutter/material.dart';
import 'package:flutter_responsive/core/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double horizontalPadding = width > ScreenSize.large.size
        ? ((width - ScreenSize.large.size) / 2)
        : Spacing.x3;
    return Scaffold(
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: Spacing.x3),
            children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: const Text('Setting 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Setting 2'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Licenses'),
            onTap: () {
              showLicensePage(context: context);
            },
          ),
        ]));
  }
}
