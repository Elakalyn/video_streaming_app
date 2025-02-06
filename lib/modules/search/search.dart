import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/search/search_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: searchBar(),
        ),
   
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            18.h,
            previousSearchesList(),
            searchResulltsList(),
          ],
        ),
      ),
    );
  }
}

