import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class PlaylistCardHorizontal extends StatelessWidget {
  const PlaylistCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 155,
          height: 88,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: HexColor('151515'),
          ),
        ),
        12.w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Playlist', style: TextStyles.title),
            Text('8 videos', style: TextStyles.videoDetails)
          ],
        )
      ],
    );
  }
}
