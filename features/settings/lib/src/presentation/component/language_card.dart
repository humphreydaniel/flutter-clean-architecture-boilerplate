import 'package:component/component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class LanguageCard extends StatelessWidget {
  final bool isActive;
  final String image, country;
  final VoidCallback onPressed;

  const LanguageCard(
      {Key key,
      this.isActive = false,
      this.image,
      this.country,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).dividerColor.withOpacity(0.5),
      margin: EdgeInsets.all(Dimens.dp6),
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimens.dp12, horizontal: Dimens.dp20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCheck(context),
              SizedBox(width: Dimens.dp14),
              _buildFlag(),
              SizedBox(width: Dimens.dp4),
              RegularText(country)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheck(BuildContext context) {
    return isActive
        ? Icon(
            Icons.check_circle_outline,
            size: Dimens.dp20,
            color: Colors.green,
          )
        : Icon(
            Icons.lens,
            color: Theme.of(context).dividerColor.withOpacity(0.7),
            size: Dimens.dp20,
          );
  }

  Widget _buildFlag() {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: Dimens.dp16,
      height: Dimens.dp12,
    );
  }
}
