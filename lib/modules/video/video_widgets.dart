import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/modules/video/cubit/video_interactions_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:pod_player/pod_player.dart';

class VideoInteractions extends StatelessWidget {
  const VideoInteractions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = VideoInteractionsCubit.get(context);
    var ucubit = UserCubit.get(context);
    var lcubit = LayoutCubit.get(context);
    bool isLiked = false;
    bool isDisliked = false;
    if (ucubit.likedVideos.contains(lcubit.currentVideoDetails['videoID'])) {
      isLiked = true;
      isDisliked = false;
    } else if (ucubit.dislikedVideos
        .contains(lcubit.currentVideoDetails['videoID'])) {
      isDisliked = true;
      isLiked = false;
    }
    return BlocConsumer<VideoInteractionsCubit, VideoInteractionsState>(
      listener: (context, state) {
        print(state);
        print(ucubit.dislikedVideos);
        if (ucubit.likedVideos
            .contains(lcubit.currentVideoDetails['videoID'])) {
          isLiked = true;
          isDisliked = false;
        } else if (ucubit.dislikedVideos
            .contains(lcubit.currentVideoDetails['videoID'])) {
          isDisliked = true;
          isLiked = false;
        }
      },
      builder: (context, state) {
        return Container(
          color: HexColor('0F0F0F'),
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 12.0, left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LayoutCubit.get(context).currentVideoDetails['title'],
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: Colors.white,
                  ),
                ),
                7.h,
                Row(
                  children: [
                    Text(
                      '${lcubit.currentVideoDetails['views']} views  ${lcubit.currentVideoDetails['date']}  Config 2022',
                      style: TextStyle(
                        fontSize: 12,
                        color: HexColor('999999'),
                      ),
                    ),
                    16.w,
                    Text(
                      '...more',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32 / 2,
                      ),
                      12.w,
                      Text(
                        '${lcubit.currentVideoDetails['uploader']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.w,
                      Text(
                        '62.4k',
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor('999999'),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            child: Text(
                              'Subscribe',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 108,
                        decoration: BoxDecoration(
                          color: HexColor("1A1A1A"),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cubit.likeVideo(
                                      lcubit.currentVideoDetails['videoID'],
                                      context);
                                },
                                child: LikeIcon(
                                  liked: isLiked,
                                ),
                              ),
                              8.w,
                              Text(
                                lcubit.currentVideoDetails['likes'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              8.w,
                              Container(
                                width: 1,
                                height: 16,
                                color: HexColor('313131'),
                              ),
                              8.w,
                              GestureDetector(
                                  onTap: () {
                                    cubit.dislikeVideo(
                                        lcubit.currentVideoDetails['videoID'],context);
                                  },
                                  child: DislikeIcon(
                                    disliked: isDisliked,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      8.w,
                      Container(
                        width: 81,
                        decoration: BoxDecoration(
                          color: HexColor("1A1A1A"),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            children: [
                              ShareIcon(),
                              4.w,
                              Text(
                                'Share',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.w,
                      Container(
                        width: 109,
                        decoration: BoxDecoration(
                          color: HexColor("1A1A1A"),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            children: [
                              DownloadIcon(),
                              4.w,
                              Text(
                                'Download',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.w,
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          color: HexColor("1A1A1A"),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            children: [
                              SaveIcon(),
                              4.w,
                              Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.h,
                Container(
                  decoration: BoxDecoration(
                    color: HexColor("1A1A1A"),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 351,
                  height: 83,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Comments',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            4.w,
                            Text(
                              '18',
                              style: TextStyle(
                                color: HexColor('8C8C8C'),
                              ),
                            ),
                          ],
                        ),
                        4.h,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                            ),
                            7.w,
                            SizedBox(
                              width: 268 - 21,
                              child: Text(
                                'Will AI ing',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            18.w,
                            DownIcon()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                8.h,
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlayVideoFromNetwork extends StatefulWidget {
  final video_host;
  var videoTimestamp;
  PlayVideoFromNetwork(
      {Key? key, required this.video_host, this.videoTimestamp})
      : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: [
          VideoQalityUrls(
              quality: 250,
              url: LayoutCubit.get(context).currentVideoDetails['video_host']),
          VideoQalityUrls(quality: 360, url: widget.video_host),
          VideoQalityUrls(quality: 480, url: widget.video_host),
          VideoQalityUrls(quality: 720, url: widget.video_host),
          VideoQalityUrls(quality: 1080, url: widget.video_host),
        ]),
        podPlayerConfig: const PodPlayerConfig(
          autoPlay: true,
        ))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var timestamp = LayoutCubit.get(context).currentVideoDetails['timestamp'];
    if (timestamp != null) controller.videoSeekTo(timestamp);
    LayoutCubit.get(context).miniplayerController = controller;
    if (widget.video_host == LayoutCubit.get(context).iminiplayer_video_host) {
      controller.hideOverlay();
    } else {}
    return PodVideoPlayer(controller: controller);
  }
}
