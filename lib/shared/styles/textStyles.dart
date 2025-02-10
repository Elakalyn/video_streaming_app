import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

class TextStyles {
  static TextStyle details = TextStyle(
    fontSize: 10,
    color: darkThemeValue ? Colors.white : Colors.black,
  );

  static TextStyle title = TextStyle(
    fontSize: 14,
    color: darkThemeValue ? Colors.white : Colors.black,
  );

  static TextStyle videoDetails = TextStyle(
    fontSize: 12,
    color: HexColor('878787'),
  );

  static TextStyle tinyDetails = const TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle link = TextStyle(
    fontSize: 14,
    color: HexColor('5CA4F8'),
    fontWeight: FontWeight.w500,
  );
  static TextStyle previousSearch = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle header = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle miniplayerTitle = TextStyle(
    fontSize: 14,
    color: darkThemeValue ? Colors.white : Colors.black,
  );

  static TextStyle miniplayerUploader = TextStyle(
    fontSize: 14,
    color: HexColor('878787'),
  );
}
