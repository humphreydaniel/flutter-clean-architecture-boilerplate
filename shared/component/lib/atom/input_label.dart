import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

import 'atom.dart';

class InputLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  const InputLabel({
    Key key,
    this.label,
    this.isRequired,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (label == null) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RegularText(
              label ?? '',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline5.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: Dimens.dp8),
            isRequired == true
                ? RegularText(
                    S.current.required,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Dimens.dp10,
                    ),
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(height: Dimens.dp8),
      ],
    );
  }
}
