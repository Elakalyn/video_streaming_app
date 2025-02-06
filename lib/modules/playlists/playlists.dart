import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/playlists/playlists_widgets.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Play lists',
          style: TextStyles.header,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              18.h,
              ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              separatorBuilder: (BuildContext context, int index) {
                return  16.h;
              },
              itemBuilder: (BuildContext context, int index) {
                return  PlaylistCardHorizontal();
              },
            ),
             
            ],
          ),
        ),
      ),
    );
  }
}
