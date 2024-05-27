import 'package:deck/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeSnippet extends StatelessWidget {
  final String text;
  const CodeSnippet({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final highlighter = isDark ? highlighterDark : highlighterLight;
    var highlightedCode = highlighter.highlight(text);
    return SelectionArea(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text.rich(
            highlightedCode,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 16,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
