import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLine;
  final TextOverflow overflow;
  final TextAlign align;

  const RegularText(
    this.text, {
    Key key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _baseStyle = Theme.of(context).textTheme.bodyText2;

    return Text(
      text,
      style: _baseStyle?.merge(style),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}
