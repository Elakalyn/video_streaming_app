import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/shared/components/icons.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.w,
        Image.asset('assets/icon.png'),
      ],
    );
  }
}

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
          selectedIcon: LibraryIcon(state: 'selected',),
        ),
      ],
      selectedIndex: LayoutCubit.get(context).selectedIndex,
      onDestinationSelected: (index) {
        LayoutCubit.get(context).changeIndex(index, context);
      },
    );
  }
}


