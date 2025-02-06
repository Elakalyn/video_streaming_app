import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_streaming_app/modules/home/cubit/home_cubit.dart';
import 'package:video_streaming_app/modules/home/home_widgets.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return VideosList();
  }
}
