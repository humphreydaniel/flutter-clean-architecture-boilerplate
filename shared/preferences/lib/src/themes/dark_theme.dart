import 'package:flutter/material.dart';

import '../dimens.dart';

// ignore: avoid_classes_with_only_static_members
class DarkTheme {
  static const Color primaryColor = Color(0xFF28A96B);
  static const Color disabledTextColor = Color(0xFF939496);
  static const Color disabledColor = Color(0xFFA0A4A8);
  static const Color textColor = Colors.white;
  static const Color errorColor = Color(0xFFEE4746);
  static const Color backgroundColor = Color(0xFF26292e);
  static const Color cardColor = Color(0xFF32353c);
  static const Color inputBackgroundColor = Color(0xFF40454b);
  static const Color bottomNavColor = Color(0xFF1e1f23);
  static const Color appBarColor = Color(0xFF1e1f23);
  static const Color dividerColor = Color(0xFF36393e);
  static const Color bottomSheetColor = Color(0xFF1e1f23);
  static const Color canvasColor = Color(0xFF1e1f23);

  static ThemeData data = ThemeData(
    brightness: Brightness.dark,
    colorScheme: scheme,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    accentColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    // disabledColor: disabledColor,
    textTheme: text,
    cardTheme: card,
    appBarTheme: appBar,
    errorColor: errorColor,
    dividerColor: dividerColor,
    canvasColor: canvasColor,
    buttonTheme: button,
    inputDecorationTheme: inputDecoration,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: bottomNav,
    outlinedButtonTheme: outlineButton,
    elevatedButtonTheme: elevatedButton,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bottomSheetColor,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimens.dp20),
        ),
      ),
    ),
  );

  static ColorScheme scheme = ColorScheme.dark(
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
      ));

  static CardTheme card = CardTheme(
      elevation: 0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        side: BorderSide.none,
      ));

  static AppBarTheme appBar = AppBarTheme(
      color: appBarColor,
      brightness: Brightness.dark,
      textTheme: text.copyWith(
          headline6: text.headline6.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      )),
      elevation: 7,
      shadowColor: disabledColor.withOpacity(0.1),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: Dimens.dp24,
      ));

  static BottomNavigationBarThemeData bottomNav = BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: bottomNavColor,
  );

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

  static OutlinedButtonThemeData outlineButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
      ),
      side: BorderSide(
        color: primaryColor,
        width: 1,
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
      padding: EdgeInsets.symmetric(
        vertical: Dimens.dp12,
        horizontal: Dimens.dp24,
      ),
      shadowColor: Colors.transparent,
      textStyle: text.button.copyWith(
        color: Colors.white,
      ),
      elevation: 0,
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
    // Use for title text, AppBar
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
