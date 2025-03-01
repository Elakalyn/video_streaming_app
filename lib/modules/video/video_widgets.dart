// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/modules/video/cubit/video_interactions_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:pod_player/pod_player.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

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
    var commentController = TextEditingController();
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
        if (ucubit.likedVideos
            .contains(lcubit.currentVideoDetails['videoID'])) {
          isLiked = true;
          isDisliked = false;
        } else if (ucubit.dislikedVideos
            .contains(lcubit.currentVideoDetails['videoID'])) {
          isDisliked = true;
          isLiked = false;
        } else {
          isDisliked = false;
          isLiked = false;
        }
      },
      builder: (context, state) {
        cubit.getFirstComment(context);
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 12.0, left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LayoutCubit.get(context).currentVideoDetails['title'],
                  style: TextStyles.videoScreenTitle,
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
                        style: TextStyles.videoScreenUploader,
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
                            color:
                                darkThemeValue! ? Colors.white : Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            child: Text(
                              'Subscribe',
                              style: TextStyle(
                                color: darkThemeValue!
                                    ? Colors.black
                                    : Colors.white,
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
                        decoration: BoxDecoration(
                          color: darkThemeValue!
                              ? HexColor("1A1A1A")
                              : HexColor("F2F2F2"),
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
                                        lcubit.currentVideoDetails['videoID'],
                                        context);
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
                          color: darkThemeValue!
                              ? HexColor("1A1A1A")
                              : HexColor("F2F2F2"),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.w,
                      Container(
                        width: 109,
                        decoration: BoxDecoration(
                          color: darkThemeValue!
                              ? HexColor("1A1A1A")
                              : HexColor("F2F2F2"),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.w,
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          color: darkThemeValue!
                              ? HexColor("1A1A1A")
                              : HexColor("F2F2F2"),
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
                  width: 351,
                  height: 83,
                  decoration: BoxDecoration(
                    color: darkThemeValue!
                        ? HexColor("1A1A1A")
                        : HexColor("F2F2F2"),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: 360,
                              height: 800 - 270,
                              decoration: BoxDecoration(
                                color: HexColor('212121'),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      8.h,
                                      Container(
                                        width: 40,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: HexColor('606060'),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                      ),
                                      10.h,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Comments',
                                              style: TextStyles.header,
                                            ),
                                            8.w,
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                color: HexColor('909090'),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  // TODO: Add sorting options
                                                },
                                                icon: AdjustIcon()),
                                            IconButton(
                                                icon: CloseIcon(),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                }),
                                          ],
                                        ),
                                      ),
                                      8.h,
                                      Container(
                                        width: 360,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: HexColor('606060'),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                      ),
                                      8.h,
                                      cubit.fetchComments(
                                          videoID: lcubit
                                              .currentVideoDetails['videoID'])
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 52,
                                      width: 360,
                                      color: HexColor('0F0F0F'),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                            ),
                                            10.w,
                                            Expanded(
                                                child: TextFormField(
                                              controller: commentController,
                                              onChanged: (v) =>
                                                  cubit.updateComment(),
                                              decoration: InputDecoration(
                                                hintText: 'Add a comment...',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                                fillColor: HexColor('272727'),
                                                filled: true,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide:
                                                        BorderSide.none),
                                              ),
                                            )),
                                            10.w,
                                            sendIcon(
                                                commentController:
                                                    commentController)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      splashColor: Colors.grey.withOpacity(0.3),
                      highlightColor: Colors.grey.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Comments'),
                                SizedBox(width: 4),
                                Text(
                                  '18',
                                  style: TextStyle(
                                    color: HexColor('8C8C8C'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                CircleAvatar(radius: 12),
                                SizedBox(width: 7),
                                SizedBox(
                                  width: 268 - 21,
                                  child: cubit.featuredComment == null
                                      ? Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2),
                                          ),
                                        )
                                      : Text(
                                          cubit.featuredComment!,
                                          style: TextStyles.commentsPreview,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                ),
                                SizedBox(width: 18),
                              ],
                            )
                          ],
                        ),
                      ),
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

class sendIcon extends StatelessWidget {
  const sendIcon({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoInteractionsCubit, VideoInteractionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return IconButton(
            disabledColor: Colors.grey[800],
            onPressed: commentController.text.isEmpty
                ? null
                : () => VideoInteractionsCubit.get(context).postComment(
                      comment_data: commentController.text,
                      date: 'a week ago',
                      user_uid: uid,
                      controller: commentController,
                    ),
            icon: state is PostCommentLoadingState
                ? CircularProgressIndicator()
                : Icon(Icons.send));
      },
    );
  }
}

class commentBuilder extends StatelessWidget {
  const commentBuilder({
    super.key,
    required this.comment_data,
    required this.date,
    required this.user_uid,
    required this.commentID,
  });

  final comment_data;
  final date;
  final user_uid;
  final commentID;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: () {
          if (user_uid == uid) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return InkWell(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28)),
                    onTap: () {
                      VideoInteractionsCubit.get(context).deleteComment(
                          commentID: commentID, context: context);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text('Delete comment'),
                    ));
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 12,
              ),
              10.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user_uid} • ${date}',
                      style: TextStyles.videoDetails,
                    ),
                    4.h,
                    Text(
                      '$comment_data',
                    ),
                    16.h,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
