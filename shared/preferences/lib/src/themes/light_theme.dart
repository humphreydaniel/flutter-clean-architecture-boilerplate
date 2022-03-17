import 'package:flutter/material.dart';

import '../colors.dart';
import '../dimens.dart';

// ignore: avoid_classes_with_only_static_members
class LightTheme {
  static const Color primaryColor = Color(0xFF2DBE78);
  static const Color disabledTextColor = Color(0xFF808080);
  static const Color disabledColor = Color(0xFFA6A6A6);
  static const Color textColor = Color(0xFF333333);
  static const Color errorColor = Color(0xFFEB4755);
  static const Color dividerColor = Color(0xFFF5F5F5);
  static const Color inputBackgroundColor = Color(0xFFFFFAFAFA);

  static ThemeData data = ThemeData(
      brightness: Brightness.light,
      colorScheme: scheme,
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      accentColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      disabledColor: disabledColor,
      textTheme: text,
      cardTheme: card,
      appBarTheme: appBar,
      errorColor: errorColor,
      dividerColor: StaticColors.black5,
      buttonTheme: button,
      inputDecorationTheme: inputDecoration,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      outlinedButtonTheme: outlineButton,
      elevatedButtonTheme: elevatedButton,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimens.dp20),
            ),
          )));

  static ColorScheme scheme = ColorScheme.light(
    onPrimary: Colors.white,
    primary: primaryColor,
  );

  static ButtonThemeData button = ButtonThemeData(
    buttonColor: primaryColor,
    disabledColor: disabledTextColor,
    padding: EdgeInsets.symmetric(
      vertical: Dimens.dp12,
      horizontal: Dimens.dp24,
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
  );

  static OutlinedButtonThemeData outlineButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: primaryColor,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimens.dp12,
        horizontal: Dimens.dp24,
      ),
      textStyle: text.button.copyWith(
        color: primaryColor,
      ),
    ),
  );

  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
      ),
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(
        vertical: Dimens.dp12,
        horizontal: Dimens.dp24,
      ),
      textStyle: text.button.copyWith(
        color: Colors.white,
      ),
      elevation: 0,
    ),
  );

  static CardTheme card = CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        side: BorderSide.none,
      ));

  static AppBarTheme appBar = AppBarTheme(
      brightness: Brightness.dark,
      textTheme: text.copyWith(
          headline6: text.headline6.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      )),
      elevation: 7,
      shadowColor: disabledColor.withOpacity(0.1),
      actionsIconTheme: IconThemeData(
        size: Dimens.dp24,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        size: Dimens.dp24,
        color: Colors.white,
      ));

  static InputDecorationTheme inputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: inputBackgroundColor,
    contentPadding: const EdgeInsets.symmetric(
      vertical: Dimens.dp12,
      horizontal: Dimens.dp16,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(Dimens.dp8),
    ),
  );

  static TextTheme text = TextTheme(
    // Use for body text
    bodyText1: TextStyle(
      color: textColor,
      fontSize: Dimens.dp12,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      color: disabledTextColor,
      fontSize: Dimens.dp12,
      fontWeight: FontWeight.normal,
    ),
    // Use for heading text
    headline5: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp18,
    ),
    // Use for title text, Appbar
    headline6: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp16,
    ),
    // Use for sub title text
    subtitle1: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp14,
    ),
    button: TextStyle(
      fontSize: Dimens.dp14,
      fontWeight: FontWeight.w600,
    ),
  );
}
