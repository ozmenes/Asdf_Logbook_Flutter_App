import 'package:flutter/material.dart';
import 'constants.dart';

class MyTheme {
  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'ProductSans',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgColor,
    //backgroundColor: darkHeader,
    colorScheme: const ColorScheme.dark(),
    //primaryColor: darkHeader,
    //secondaryHeaderColor: Colors.grey.shade900.withOpacity(0.5),
    iconTheme: const IconThemeData(color: lightBlueColor),
    primaryTextTheme:
        const TextTheme(headline6: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
      backgroundColor: bgColor,
      elevation: 0,
      iconTheme: IconThemeData(color: lightBlueColor),
      actionsIconTheme: IconThemeData(color: lightBlueColor),
    ),
    drawerTheme:
        const DrawerThemeData(backgroundColor: bgColor, elevation: 8),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightBlueColor,
      foregroundColor: Colors.white
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Poppins',//GoogleFonts.lato(fontSize: 18),//'RobotoMono',
    scaffoldBackgroundColor: whiteColor,
    backgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
    brightness: Brightness.light,
    primaryColor: blueColor,
    secondaryHeaderColor: lightGreyColor,
    iconTheme: const IconThemeData(
      color: blueColor,
    ),
    primaryTextTheme:
    const TextTheme(headline6: TextStyle(color: blackColor)),
    appBarTheme: const AppBarTheme(
      foregroundColor: blackColor,
      backgroundColor: Colors.transparent,
      //color: blackColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      actionsIconTheme: IconThemeData(color: blackColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkBlueColor,
        foregroundColor: Colors.white
    ),
  );
}
