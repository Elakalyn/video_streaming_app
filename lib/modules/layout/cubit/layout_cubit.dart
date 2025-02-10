import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meta/meta.dart';
import 'package:video_streaming_app/modules/layout/layout_widgets.dart';
import 'package:video_streaming_app/modules/video/video_widgets.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:pod_player/pod_player.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  var selectedIndex = 0;
  void changeIndex(index, context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed('home');
        break;
      case 1:
        GoRouter.of(context).goNamed('library');
        break;
    }

    selectedIndex = index;
    emit(BNBChangeState());
  }

  // Mini-Player

  bool miniplayerMode = false;
  bool mp_anim = false;
  var iminiplayer_video_host = '';
  void MP_animation() {
    if (mp_anim == false) {
      print('animation ongoing');
      Future.delayed(Duration(milliseconds: 250)).whenComplete(() {
        mp_anim = true;
        emit(MiniplayerAnimationState());
      });
    }
  }

  PodPlayerController? miniplayerController;
  maximizeMiniplayer() {
    miniplayerMode = false;
    currentVideoDetails
        .addAll({'timestamp': miniplayerController!.currentVideoPosition});
    emit(MaximizeMiniplayerState());
  }

  miniplayerBuilder() {
    if (miniplayerMode) {
      MP_animation();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: mp_anim ? 580 : 0,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: mp_anim ? 120 : 360,
            height: mp_anim ? 84 : 210,
            transformAlignment: Alignment(25, 25),
            child: PlayVideoFromNetwork(
              video_host: iminiplayer_video_host,
            ),
          ),
        ],
      );
    } else if (state is MaximizeMiniplayerState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: mp_anim ? 0 : 580,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: mp_anim ? 360 : 120,
            height: mp_anim ? 210 : 84,
            child: PlayVideoFromNetwork(
              video_host: iminiplayer_video_host,
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  bool miniplayerVideoPlaying = true;
  void enableMiniplayer({
    required var miniplayer_video_host,
  }) {
     currentVideoDetails
         .addAll({'timestamp': miniplayerController!.currentVideoPosition});
    miniplayerMode = true;
    iminiplayer_video_host = miniplayer_video_host;
    emit(EnableMiniplayerState());
  }

  void closeMiniplayer() {
    miniplayerMode = false;
    iminiplayer_video_host = '';
    miniplayerVideoPlaying = true;
    mp_anim = false;
    currentVideoDetails.clear();
    emit(ExitMiniplayerState());
  }

  void controlMiniplayer() {
    miniplayerController!.togglePlayPause();
    miniplayerVideoPlaying = miniplayerController!.isVideoPlaying;

    emit(MiniplayerTogglePlayPause());
  }

  Map currentVideoDetails = {'': ''};
}
