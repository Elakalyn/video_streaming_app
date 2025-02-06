import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/home/home_widgets.dart';
import 'package:video_streaming_app/modules/video/video_widgets.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/components/myDivider.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';

class VideoScreen extends StatelessWidget {
  final title;
  final date;
  final video_host;
  final views;
  final uploader;
  final thumbnail;

  const VideoScreen(
      {super.key,
      required this.title,
      required this.date,
      required this.video_host,
      required this.views,
      required this.uploader,
      required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              PlayVideoFromNetwork(
                video_host: video_host,
              ),
              VideoInteractions(
                title: title,
                date: date,
                thumbnail: thumbnail,
                uploader: uploader,
                video_host: video_host,
                views: views,
              ),
              mockVideoCard()
            ],
          ),
        ),
      ),
    );
  }
}
