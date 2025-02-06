import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: MaterialStatePropertyAll(HexColor('0F0F0F')),
      hintText: 'Search History',
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
    );
  }
}