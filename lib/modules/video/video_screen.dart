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
  const VideoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    bool isLiked;
    bool isDisliked;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
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
                              miniplayer_video_host: LayoutCubit.get(context)
                                  .currentVideoDetails['video_host'],
                            );
                          }
                        },
                        child: PlayVideoFromNetwork(
                          video_host: LayoutCubit.get(context)
                              .currentVideoDetails['video_host'],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            context.goNamed('home');

                            cubit.enableMiniplayer(
                              miniplayer_video_host: LayoutCubit.get(context)
                                  .currentVideoDetails['video_host'],
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
                  VideoInteractions(),
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
