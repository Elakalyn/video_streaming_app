import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/home/cubit/home_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/modules/video/cubit/video_interactions_cubit.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class VideoCard extends StatelessWidget {
  VideoCard({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.duration,
    required this.date,
    required this.views,
    required this.uploader,
    this.uploaderPfp,
    required this.video_host,
    required this.likes,
    required this.videoID,
  });
  final title;
  final thumbnail;
  final duration;
  var date;
  final views;
  final uploader;
  final uploaderPfp;
  final video_host;
  final likes;
  final videoID;

  @override
  Widget build(BuildContext context) {
    date = HomeCubit.get(context).getTimeSinceDate(date);
    var currentVideoDetails = LayoutCubit.get(context).currentVideoDetails;
    return GestureDetector(
      onTap: () async {
        
        // User clicked on one of the video suggestions in the video screen
        if (currentVideoDetails.isNotEmpty) {
          currentVideoDetails.clear();
          currentVideoDetails.addAll({
            'title': title,
            'thumbnail': thumbnail,
            'duration': duration,
            'date': date,
            'views': views,
            'uploader': uploader,
            'uploaderPfp': uploaderPfp,
            'likes': likes,
            'video_host': video_host,
            'videoID': videoID,
          });
          context.go('/');
          await Future.delayed(Duration(milliseconds: 1)).whenComplete(() {
            context.go('/video');
          });
        } else {
          // User clicked on a video from the home screen
          currentVideoDetails.addAll({
            'title': title,
            'thumbnail': thumbnail,
            'duration': duration,
            'date': date,
            'views': views,
            'uploader': uploader,
            'uploaderPfp': uploaderPfp,
            'likes': likes,
            'video_host': video_host,
            'videoID': videoID,
          });
          context.go('/video');
          VideoInteractionsCubit.get(context).viewVideo(videoID: videoID);
        }
      },
      child: Container(
        height: 313,
        child: Column(
          children: [
            Container(
              height: 210,
              child: Stack(
                children: [
                  Image.network(
                    thumbnail,
                    fit: BoxFit.fill,
                    height: double.maxFinite,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: HexColor('0F0F0F').withOpacity(.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          duration,
                          style: TextStyles.tinyDetails,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 103,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 14,
                      ),
                    ),
                    10.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.title,
                        ),
                        Text(
                          '${uploader} • ${views.toString()} views • ${date}',
                          style: TextStyles.videoDetails,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class mockVideoCard extends StatelessWidget {
  mockVideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 313,
        child: Column(
          children: [
            Container(
              height: 210,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Icons/video_bg.png',
                    fit: BoxFit.fill,
                    height: double.maxFinite,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: HexColor('0F0F0F').withOpacity(.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '5:26',
                          style: TextStyles.tinyDetails,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 103,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 14,
                      ),
                    ),
                    10.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Video title',
                          style: TextStyles.title,
                        ),
                        Text(
                          'System • 534 views • 5 days ago',
                          style: TextStyles.videoDetails,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonVideoCard extends StatelessWidget {
  const SkeletonVideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 313,
        child: Column(
          children: [
            Container(
              height: 210,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: HexColor('0F0F0F').withOpacity(.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '12:34',
                          style: TextStyles.tinyDetails,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 103,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Example Video title',
                      style: TextStyles.title,
                    ),
                    Text(
                      'System • 342 views • 7 Days ago',
                      style: TextStyles.videoDetails,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
