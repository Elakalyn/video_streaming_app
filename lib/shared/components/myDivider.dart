import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class myDivider extends StatelessWidget {
  const myDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.maxFinite,
      color: HexColor('272727'),
    );
  }
}
