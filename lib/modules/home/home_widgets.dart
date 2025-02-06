import 'package:flutter/material.dart';
import 'package:video_streaming_app/modules/home/cubit/home_cubit.dart';

class VideosList extends StatelessWidget {
  const VideosList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);

    return cubit.fetchVideos();
  }
}
