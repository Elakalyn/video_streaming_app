import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/home/home_widgets.dart';
import 'package:video_streaming_app/modules/video/video_widgets.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/components/myDivider.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';

import '../layout/cubit/layout_cubit.dart';

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
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit.currentVideoDetails.addAll({
          'title': title,
          'date': date,
          'video_host': video_host,
          'views': views,
          'uploader': uploader,
          'thumbnail': thumbnail,
        });
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onVerticalDragEnd: (drag) {
                          print('${drag.globalPosition} #### DRAG');
                          if (drag.globalPosition.dy >= 150) {
                            context.goNamed('home');

                            cubit.enableMiniplayer(
                              miniplayer_video_host: video_host,
                            );
                          }
                        },
                        child: PlayVideoFromNetwork(
                          video_host: video_host,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            context.goNamed('home');

                            cubit.enableMiniplayer(
                              miniplayer_video_host: video_host,
                            );
                          },
                          icon: Image.asset(
                            'assets/Icons/down.png',
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
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
      },
    );
  }
}
