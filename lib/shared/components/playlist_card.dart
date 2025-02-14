import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class PlaylistsScreenVertical extends StatelessWidget {
  const PlaylistsScreenVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: darkThemeValue! ? HexColor('272727') : Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: PlaylistIcon(),
            ),
          ),
        ),
        6.h,
        Text('Playlist', style: TextStyles.title),
        Text('8 videos', style: TextStyles.videoDetails)
      ],
    );
  }
}
