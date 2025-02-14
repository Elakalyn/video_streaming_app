import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('FFFFFF'),
     textTheme: Typography.blackCupertino.apply(
      bodyColor: Colors.black, // Default color for all text
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: HexColor('FFFFFF'),
        scrolledUnderElevation: 0),
    inputDecorationTheme: InputDecorationTheme(),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: HexColor('FFFFFF'),
      overlayColor:
          WidgetStateProperty.all(Colors.transparent), // Removes splash effect
      labelTextStyle: WidgetStatePropertyAll(TextStyles.details),
      indicatorColor: HexColor('FFFFFF'),
      iconTheme: WidgetStatePropertyAll(IconThemeData(
        color: Colors.black,
      )),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('0F0F0F'),
    textTheme: Typography.blackCupertino.apply(
      bodyColor: Colors.white, // Default color for all text
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: HexColor('0F0F0F'),
        scrolledUnderElevation: 0),
    inputDecorationTheme: InputDecorationTheme(),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: HexColor('0F0F0F'),
      overlayColor:
          WidgetStateProperty.all(Colors.transparent), // Removes splash effect
      labelTextStyle: WidgetStatePropertyAll(TextStyles.details),
      indicatorColor: HexColor('0F0F0F'),
      iconTheme: WidgetStatePropertyAll(IconThemeData(
        color: Colors.white,
      )),
    ),
  );
}
