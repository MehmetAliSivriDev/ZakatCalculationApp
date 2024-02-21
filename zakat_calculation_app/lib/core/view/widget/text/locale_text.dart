import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({super.key, required this.text, this.style, this.align});

  final String text;
  final TextStyle? style;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textAlign: align,
      text,
      style: style,
    );
  }
}
