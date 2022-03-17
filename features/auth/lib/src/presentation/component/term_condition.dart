import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

class TermConditionText extends StatelessWidget {
  const TermConditionText({
    Key key,
    this.onTapTermOfService,
    this.onTapPrivacyPolicy,
    this.align,
    this.style,
  }) : super(key: key);

  final VoidCallback onTapTermOfService;
  final VoidCallback onTapPrivacyPolicy;
  final TextAlign align;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align ?? TextAlign.center,
      text: TextSpan(
          style: style ??
              Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: Dimens.dp10),
          text: S.current.term_and_privacy_message,
          children: [
            TextSpan(
              text: ' ${GetIt.I<GlobalConfiguration>().getValue('app_name')}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: '\'s '),
            TextSpan(
              text: S.current.term_of_service,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapTermOfService,
            ),
            TextSpan(text: ' ${S.current.and} '),
            TextSpan(
              text: S.current.privacy_policy,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapPrivacyPolicy,
            ),
            const TextSpan(text: '.'),
          ]),
    );
  }
}
