import 'package:flutter/material.dart';
import 'package:video_streaming_app/modules/history/history_widgets.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyles.header,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: searchBar(),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
               // return VideoCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
