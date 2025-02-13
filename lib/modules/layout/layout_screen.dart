import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/modules/layout/layout_widgets.dart';
import 'package:video_streaming_app/shared/components/icons.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) async {
        print(state);
        if (state is MaximizeMiniplayerState) {
          var cubit = LayoutCubit.get(context);
          Future.delayed(Duration(milliseconds: 200)).whenComplete(() {
            context.go(
                '/video?title=${cubit.currentVideoDetails['title']}&views=${cubit.currentVideoDetails['views']}&thumbnail=${cubit.currentVideoDetails['thumbnail']}&date=${cubit.currentVideoDetails['date']}&uploader=${cubit.currentVideoDetails['uploader']}&video_host=${cubit.currentVideoDetails['video_host']}');
          });
        }
        //

        if (state is NetworkState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.hasNetwork ? "Network available" : "No network"),
              duration: Duration(seconds: 2),
            ),
          );
        }
        UserCubit.get(context).loadUserData();
      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        final userCubit = BlocProvider.of<UserCubit>(context);
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Logo(),
                actions: [
                  IconButton(
                      icon: SearchIcon(),
                      onPressed: () {
                        context.pushNamed('search');
                      }),
                  IconButton(
                      icon: SettingsIcon(),
                      onPressed: () {
                        context.pushNamed('settings');
                      }),
                  20.w,
                ],
              ),
              bottomNavigationBar: NavBar(),
              body: Stack(
                children: [
                  child,
                  if (cubit.miniplayerMode)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Miniplayer(),
                    )
                ],
              ),
            ),
            SafeArea(
              child: Column(children: [
                GestureDetector(
                  child: cubit.miniplayerBuilder(), // <---- Miniplayer (Video)
                  onTap: () => cubit.maximizeMiniplayer(),
                  onVerticalDragUpdate: (details) {
                    if (details.primaryDelta! < 0) {
                      cubit.maximizeMiniplayer();
                    }
                  },
                ),
                if (cubit.miniplayerMode) 60.h,
              ]),
            ),
          ],
        );
      },
    );
  }
}
