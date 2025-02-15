import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/shared/components/video_card.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

part 'video_interactions_state.dart';

class VideoInteractionsCubit extends Cubit<VideoInteractionsState> {
  VideoInteractionsCubit() : super(VideoInteractionsInitial());
  static VideoInteractionsCubit get(context) => BlocProvider.of(context);
  Future<void> likeVideo(videoID, context) async {
    // Switch any previous dislike to a like if one was made

    if (UserCubit.get(context).dislikedVideos.contains(videoID)) {
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'disliked_videos': FieldValue.arrayRemove([videoID]),
      });
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
    // Update like status
    FirebaseFirestore.instance.collection('videos').doc(videoID).update({
      'likes': FieldValue.arrayUnion([uid])
    });
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'liked_videos': FieldValue.arrayUnion([videoID])
    });
    // Toggle Like
    if (UserCubit.get(context).likedVideos.contains(videoID)) {
      // Cancel like from user's document
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'liked_videos': FieldValue.arrayRemove([videoID]),
      });
      // Cancel like from video document
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    }

    // Update number of likes
    var updatedLikes;
    await FirebaseFirestore.instance
        .collection('videos')
        .doc(videoID)
        .get()
        .then((v) {
      updatedLikes = v.get('likes');
      print(updatedLikes);
    }).whenComplete(() {
      LayoutCubit.get(context)
          .currentVideoDetails
          .addAll({'likes': updatedLikes.length});
    });
    emit(EngageVideoState());
  }

  Future<void> dislikeVideo(videoID, context) async {
    // Switch any previous like to a dislike if one was made

    if (UserCubit.get(context).likedVideos.contains(videoID)) {
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'liked_videos': FieldValue.arrayRemove([videoID]),
      });
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    }
    // Update dislike status
    FirebaseFirestore.instance.collection('videos').doc(videoID).update({
      'dislikes': FieldValue.arrayUnion([uid])
    });
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'disliked_videos': FieldValue.arrayUnion([videoID])
    });
    // Toggle Dislike
    if (UserCubit.get(context).dislikedVideos.contains(videoID)) {
      // Cancel dislike from user's document
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'disliked_videos': FieldValue.arrayRemove([videoID]),
      });
      // Cancel dislike from video document
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
    // Update number of likes
    var updatedLikes;
    await FirebaseFirestore.instance
        .collection('videos')
        .doc(videoID)
        .get()
        .then((v) {
      updatedLikes = v.get('likes');
      print(updatedLikes);
    }).whenComplete(() {
      LayoutCubit.get(context)
          .currentVideoDetails
          .addAll({'likes': updatedLikes.length});
    });
    emit(EngageVideoState());
  }

  void viewVideo({required videoID}) {
    FirebaseFirestore.instance.collection('videos').doc(videoID).update({
      'views': FieldValue.arrayUnion([uid])
    }); // Add view to video document

    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'watched_videos': FieldValue.arrayUnion([videoID])
    });
  }

  fetchSuggestions({required String videoID}) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('videos').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
              child: Text('Error fetching videos: ${snapshot.error}'));
        }

        final querySnapshot = snapshot.data;
        if (querySnapshot == null || querySnapshot.docs.isEmpty) {
          return Center(child: Text('No videos available'));
        }

        List<Map<String, dynamic>> videos = querySnapshot.docs
            .where((doc) => doc.id != videoID) // Exclude the current video
            .map((doc) => {
                  'title': doc['title'],
                  'date': doc['date'],
                  'duration': doc['duration'],
                  'thumbnail': doc['thumbnail'],
                  'uploader': doc['uploader'],
                  'views': doc['views'].length,
                  'video_host': doc['video_host'],
                  'likes': doc['likes'].length,
                  'videoID': doc.id,
                })
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];
            return VideoCard(
              title: video['title'],
              date: video['date'],
              duration: video['duration'],
              thumbnail: video['thumbnail'],
              uploader: video['uploader'],
              views: video['views'],
              video_host: video['video_host'],
              likes: video['likes'],
              videoID: video['videoID'],
            );
          },
        );
      },
    );
  }
}
