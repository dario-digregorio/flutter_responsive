import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:flutter_responsive/core/constants.dart';
import 'package:flutter_responsive/main.dart';

class DemoApp extends StatefulWidget {
  final Widget child;
  const DemoApp({super.key, required this.child});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  late Rect rect = Rect.fromCenter(
    center: MediaQuery.of(context).size.center(const Offset(0, -150)),
    width: 800,
    height: 600,
  );
  ScreenSize? screenSize;
  MediaQueryData? mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (mediaQuery != null && screenSize != null)
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading: const Icon(Icons.height_rounded),
                    title: const Text('Height'),
                    subtitle: Text(mediaQuery!.size.height.round().toString())),
                ListTile(
                    leading: const RotatedBox(
                        quarterTurns: 1, child: Icon(Icons.height_rounded)),
                    title: const Text('Width'),
                    subtitle: Text(mediaQuery!.size.width.round().toString())),
                ListTile(
                    leading: const Icon(Icons.photo_size_select_small_rounded),
                    title: const Text('Screen Size'),
                    subtitle: Text(screenSize!.name)),
                ListTile(
                    leading: const Icon(Icons.rotate_90_degrees_cw_rounded),
                    title: const Text('Orientation'),
                    subtitle: Text(mediaQuery!.orientation.name)),
              ].toList()),
        TransformableBox(
          rect: rect,
          allowContentFlipping: false,
          flip: Flip.none,
          clampingRect: Offset.zero & MediaQuery.sizeOf(context),
          onChanged: (result, event) {
            setState(() {
              rect = result.rect;
            });
          },
          visibleHandles: const {},
          contentBuilder: (context, rect, flip) {
            return LayoutBuilder(builder: (context, constraints) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    size: Size(constraints.maxWidth, constraints.maxHeight)),
                child: Builder(builder: (context) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      screenSize = ScreenUtils.getScreenSize(context);
                      mediaQuery = MediaQuery.of(context);
                    });
                  });
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 10,
                    child: App(
                      child: widget.child,
                    ),
                  );
                }),
              );
            });
          },
        ),
      ],
    );
  }
}
