import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: HomeIcon(),
          label: 'Home',
          selectedIcon: HomeIcon(state: 'selected'),
        ),
        NavigationDestination(
          icon: LibraryIcon(),
          label: 'Library',
          selectedIcon: LibraryIcon(
            state: 'selected',
          ),
        ),
      ],
      selectedIndex: LayoutCubit.get(context).selectedIndex,
      onDestinationSelected: (index) {
        LayoutCubit.get(context).changeIndex(index, context);
      },
    );
  }
}

class Miniplayer extends StatelessWidget {
  const Miniplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Container(
          height: 54,
          width: 360,
          color: HexColor('0F0F0F'),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: HexColor('878787'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${cubit.currentVideoDetails['title']}',
                              style: TextStyles.miniplayerTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${cubit.currentVideoDetails['uploader']}',
                              style: TextStyles.miniplayerUploader,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: cubit.miniplayerVideoPlaying
                                  ? PauseIcon()
                                  : PlayIcon(),
                              onTap: () {
                                cubit.controlMiniplayer();
                              },
                            ),
                            Spacer(),
                            GestureDetector(
                              child: CloseIcon(),
                              onTap: () {
                                cubit.closeMiniplayer();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 2,
                  width: 5,
                  color: HexColor('E23325'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
