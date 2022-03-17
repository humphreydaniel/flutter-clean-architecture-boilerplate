import 'package:flutter/material.dart';

class DashesDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;

  const DashesDivider({this.height = 1, this.color, this.dashWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final width = dashWidth ?? 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * width)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: width,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color ?? Theme.of(context).dividerColor),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
