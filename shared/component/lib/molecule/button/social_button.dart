import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../atom/atom.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.onPressed,
    this.textColor,
  }) : super(key: key);

  final String icon;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: Dimens.dp16,
            height: Dimens.dp16,
          ),
          const SizedBox(width: Dimens.dp24),
          SubTitleText(
            text,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
