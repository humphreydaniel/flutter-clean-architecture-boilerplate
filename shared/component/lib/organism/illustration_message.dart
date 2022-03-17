import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../component.dart';

class IllustrationMessage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;
  final Widget customWidget;

  const IllustrationMessage({
    Key key,
    @required this.imagePath,
    this.title,
    this.message,
    this.customWidget,
  })  : assert(imagePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.width(context) * .6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(height: Dimens.dp16),
          (title != null)
              ? Padding(
                  padding: EdgeInsets.only(bottom: Dimens.dp16),
                  child: TitleText(title),
                )
              : SizedBox(),
          RegularText(
            message ?? '',
            align: TextAlign.center,
          ),
          SizedBox(height: Dimens.dp28),
          customWidget ?? SizedBox(),
        ],
      ),
    );
  }
}
