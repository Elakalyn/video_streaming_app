import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/modules/layout/layout_widgets.dart';
import 'package:video_streaming_app/shared/components/icons.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
          body: child,
        );
      },
    );
  }
}
