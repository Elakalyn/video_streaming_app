import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  CollectionReference videos = FirebaseFirestore.instance.collection('videos');

  String getTimeSinceDate(String dateString) {
    DateTime date = DateFormat('MMMM d, yyyy').parse(dateString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return 'Just now';
      } else {
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      }
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    }
  }

  fetchVideos({videoID}) {
    return StreamBuilder<QuerySnapshot>(
      stream: videos.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final QuerySnapshot? querySnapshot = snapshot.data;

        if (snapshot.hasError) {
          emit(FetchVideosErrorState());

          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          emit(FetchVideosLoadingState());
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SkeletonVideoCard();
              },
              itemCount: querySnapshot?.docs.length,
            ),
          );
        }

        if (querySnapshot == null) {
          emit(FetchVideosErrorState());
          return const Text(
            'No data available',
          );
        }
        emit(FetchVideosSuccessState());
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final DocumentSnapshot<Object?> document =
                querySnapshot.docs[index];
            if (videoID != document.id) {
              return VideoCard(
                title: document['title'],
                date: document['date'],
                duration: document['duration'],
                thumbnail: document['thumbnail'],
                uploader: document['uploader'],
                views: document['views'].length,
                video_host: document['video_host'],
                likes: document['likes'].length,
                videoID: document.id,
              );
            }
          },
          itemCount: querySnapshot.docs.length,
        );
      },
    );
  }
}
