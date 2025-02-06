import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/components/mini_video_card.dart';
import 'package:video_streaming_app/shared/components/myDivider.dart';
import 'package:video_streaming_app/shared/components/playlist_card.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              PlaybackIcon(),
              12.w,
              Text(
                'History',
                style: TextStyles.title,
              ),
              Spacer(),
              TextButton(
                child: Text(
                  'View all',
                  style: TextStyles.link,
                ),
                onPressed: () {
                  context.pushNamed('history');
                },
              ),
            ],
          ),
          SizedBox(
            height: 126,
            child: ListView.separated(
              itemCount: 8,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MiniVideoCard();
              },
              separatorBuilder: (context, index) {
                return 16.w;
              },
            ),
          ),
          48.h,
          myDivider(),
          Row(
            children: [
              PlaylistIcon(),
              12.w,
              Text(
                'Play lists',
                style: TextStyles.title,
              ),
              Spacer(),
              TextButton(
                child: Text(
                  'View all',
                  style: TextStyles.link,
                ),
                onPressed: () {
                  context.pushNamed('playlists');

                },
              ),
            ],
          ),
          SizedBox(
            height: 126,
            child: ListView.separated(
              itemCount: 8,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return PlaylistsScreenVertical();
              },
              separatorBuilder: (context, index) {
                return 16.w;
              },
            ),
          ),
        ],
      ),
    );
  }
}
