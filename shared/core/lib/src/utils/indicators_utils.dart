import 'package:component/component.dart';
import 'package:component/molecule/dialog/dialog.dart';
import 'package:flutter/material.dart';

/// Utils for all indicators, for example loading, error message,
/// success message, etc
class IndicatorsUtils {
  /// Show loading indicator
  /// [context] param must child of [Scaffold] widget
  static void showLoadingSnackBar(BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragStart: (_) {},
            child: Row(
              children: [
                Expanded(child: Text('Please wait...')),
                CircularProgressIndicator(),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(days: 1),
        ),
      );
  }

  /// Show Error indicator
  /// [context] param must child of [Scaffold] widget
  static void showErrorSnackBar(BuildContext context, String errorMessage) {
    if (errorMessage != null && errorMessage.isNotEmpty) {
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Expanded(
                    child: Text(
                  errorMessage ?? '',
                  style: TextStyle(color: Theme.of(context).errorColor),
                )),
              ],
            ),
            backgroundColor: Color(0xFFFFD9D9),
          ),
        );
    }
  }

  /// Hide current snackBar, when current scaffold available snackBar active
  static void hideCurrentSnackBar(BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar();
  }

  static Future<void> showDialogLoading(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (_) => LoadingDialog(
        barrierDismissible: false,
      ),
    );
  }
}
