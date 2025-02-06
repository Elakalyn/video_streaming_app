import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';
import 'package:pod_player/pod_player.dart';

class VideoStreamingCard extends StatelessWidget {
  const VideoStreamingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.black,
        height: 215,
        child: Stack(
          children: [
            SizedBox(
              height: 210,
              child: Image.asset(
                'assets/Icons/video_bg.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 210,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DownIcon(),
                              ),
                              Spacer(),
                              AutoplayIcon(),
                              22.w,
                              CastIcon(),
                              22.w,
                              SubtitleIcon(),
                              22.w,
                              SettingsIcon()
                            ],
                          ),
                        ),
                      ),
                      30.h,
                      SizedBox(
                        height: 54,
                        width: 214,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 38 / 2,
                              child: RewindIcon(),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 54 / 2,
                              child: PauseIcon(),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 38 / 2,
                              child: ForwardIcon(),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      44.h,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '0:07',
                                    style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(1.0), // 100% opacity
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w500, // Medium weight
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' / ',
                                    style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.7), // 70% opacity
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w500, // Medium weight
                                    ),
                                  ),
                                  TextSpan(
                                    text: '47:25',
                                    style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.7), // 70% opacity
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w500, // Medium weight
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            FullScreenIcon(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Transform.translate(
                        offset: Offset(0, 5),
                        child: Row(
                          children: [
                            Container(
                              height: 2,
                              color: Colors.white.withOpacity(0.2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 2,
                                  width: 90,
                                  color: HexColor('E23325'),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: HexColor('E23325'),
                              radius: 6,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VideoInteractions extends StatelessWidget {
  final title;
  final date;
  final video_host;
  final views;
  final uploader;
  final thumbnail;
  const VideoInteractions({
    super.key,
    required this.title,
    required this.date,
    required this.video_host,
    required this.views,
    required this.uploader,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 12.0, left: 12, right: 12, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
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
                  '$views views  $date  Config 2022',
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
                    'Figma',
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
                          LikeIcon(),
                          8.w,
                          Text(
                            '652',
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
                          DislikeIcon()
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
  }
}

class PlayVideoFromNetwork extends StatefulWidget {
  final video_host;
  const PlayVideoFromNetwork({Key? key, required this.video_host})
      : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(
          widget.video_host,
          
        ),
        podPlayerConfig:
            const PodPlayerConfig(autoPlay: true, videoQualityPriority: [360]))
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
    return PodVideoPlayer(controller: controller);
  }
}
