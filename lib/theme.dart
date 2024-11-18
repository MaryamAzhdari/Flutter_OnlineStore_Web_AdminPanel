import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 0, 65, 88); // Custom blue color
const Color primaryColorDark =
    Color.fromARGB(255, 255, 255, 255); // A darker shade

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static const Color _lightPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;
  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // CustomColor
  static const Color mcCustomBtnBackgroundColor =
      Color.fromARGB(255, 49, 157, 220);
  static const Color mcCustomBtnGradientFirstColor =
      Color.fromARGB(255, 2, 48, 98);
  static const Color mcCustomBtnGradientSecondColor =
      Color.fromARGB(255, 105, 116, 144);
  static Color mcTextFormFieldBackColor =
      const Color.fromARGB(255, 96, 96, 96).withOpacity(0.3);
  static const Color mcCustomBtnCircle1Color =
      Color.fromARGB(255, 49, 157, 220);
  static const Color mcCustomBtnCircle2Color = Colors.white;
  static const Color mcTextColorLight = Colors.black;
  static const Color mcTextColorDark = Colors.white;
  static const Color mcTextBottonColorLight = Colors.white;
  static const Color mcTextBottonColorDark = Colors.white;
  static const Color mcTextLinkColorLight = Color.fromARGB(255, 17, 29, 255);
  static const Color mcTextLinkColorDark = Color.fromARGB(255, 114, 217, 255);
  static const Color mcHintColor = Colors.white70;
  static const Color mcDarkGreyColor = Color.fromARGB(255, 47, 47, 47);
  static const Color mcLightGreyColor = Color.fromARGB(255, 194, 194, 194);
  static const Color mcWhiteColor = Colors.white;
  static const Color mcBackButtonColor =Color.fromARGB(255, 35, 70, 131);
  

  static const Color mcBottonNavBackgroundColorLight =
      Color.fromARGB(255, 196, 242, 255);
  //Color.fromARGB(255, 188, 207, 213).withOpacity(0.8);
  static const Color mcBottonNavBackgroundColorDark =
      Color.fromARGB(255, 33, 50, 69);
  //Color.fromARGB(255, 2, 48, 98).withOpacity(0.2);

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle _lightBodyMediumText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle _lightBodySmallText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyMediumText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkBodyMediumText =
      _lightBodyMediumText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkBodySmallText =
      _lightBodySmallText.copyWith(color: _darkTextColorPrimary);
  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkHeadingText,
    bodyLarge: _darkBodyMediumText,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color.fromRGBO(33, 150, 243, 1)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 131, 156, 162),
        selectedIconTheme: IconThemeData(
          color: primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 66, 66, 66),
        ),
        selectedItemColor: primaryColor,
        unselectedItemColor: Color.fromARGB(255, 66, 66, 66),
        selectedLabelStyle: _lightBodySmallText),
    //textTheme: _lightTextTheme,
    hintColor: primaryColor.withOpacity(0.7),
    textTheme: const TextTheme(
      //Add font in assets
      //fonts:
      //- family: VarelaRound
      //fonts:
      //- asset: assets/fonts/VarelaRound-Regular.ttf
      //For Texts
      titleLarge: TextStyle(
        fontSize: 24.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        //fontFamily: 'varelaRound',
        color: mcTextColorLight,
      ),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.1,
          //fontFamily: 'varelaRound',
          color: mcTextColorLight),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          //fontFamily: 'hind',
          color: mcTextColorLight),
      //For Buttons
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        //fontFamily: 'hind',
        color: mcTextBottonColorLight,
      ), //For Links
      labelMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: mcTextLinkColorLight,
      ),
      //For Titles
      headlineLarge: TextStyle(
        fontSize: 24.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        color: mcTextBottonColorLight,
      ),
      //For Hints
      displayMedium: TextStyle(
        fontSize: 14.0,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w200,
        color: mcHintColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    primaryColorDark: primaryColorDark,
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: mcBottonNavBackgroundColorDark,
        selectedIconTheme: const IconThemeData(
          color: primaryColorDark,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        selectedItemColor: primaryColorDark,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: _darkBodySmallText),
    hintColor: primaryColorDark.withOpacity(0.7),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        color: mcTextColorDark,
      ),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.1,
          color: mcTextColorDark),
      titleSmall: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: mcTextColorDark),
      //For Buttons
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: mcTextBottonColorDark,
      ),
      //For Links
      labelMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: mcTextLinkColorDark,
      ),
      //For Titles
      headlineLarge: TextStyle(
        fontSize: 24.0,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        color: mcTextBottonColorDark,
      ),
      //For Hints
      displayMedium: TextStyle(
        fontSize: 14.0,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w200,
        color: mcHintColor,
      ),
    ),
  );
}
