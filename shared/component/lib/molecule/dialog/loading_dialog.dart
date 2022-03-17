import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../component.dart';

class LoadingDialog extends StatelessWidget {
  final bool barrierDismissible;
  final VoidCallback onDismiss;
  const LoadingDialog({
    Key key,
    this.barrierDismissible,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _DialogBackground(
      barrierDismissible: barrierDismissible,
      onDismiss: onDismiss,
      dialog: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        padding: EdgeInsets.all(Dimens.dp16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Dimens.dp28,
              height: Dimens.dp28,
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
            SizedBox(height: Dimens.dp12),
            RegularText(S.current.please_wait),
          ],
        ),
      ),
    );
  }
}

class _DialogBackground extends StatelessWidget {
  /// Widget of dialog, you can use NDialog, Dialog,
  ///  AlertDialog or Custom your own Dialog
  final Widget dialog;

  /// Because blur dialog cover the barrier, you have to declare here
  final bool barrierDismissible;

  /// Action before dialog dismissed
  final Function onDismiss;

  _DialogBackground({
    this.dialog,
    this.barrierDismissible,
    this.onDismiss,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.black.withOpacity(0.5),
      child: WillPopScope(
        onWillPop: () async {
          if (barrierDismissible ?? true) {
            if (onDismiss != null) onDismiss();
          }
          Navigator.pop(context);
          return;
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: barrierDismissible ?? true
                    ? () {
                        if (onDismiss != null) {
                          onDismiss();
                        }
                        Navigator.pop(context);
                      }
                    : () {},
                child: Container(
                  color: Colors.transparent,
                )),
            dialog
          ],
        ),
      ),
    );
  }
}
