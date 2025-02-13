import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/layout/cubit/layout_cubit.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

part 'video_interactions_state.dart';

class VideoInteractionsCubit extends Cubit<VideoInteractionsState> {
  VideoInteractionsCubit() : super(VideoInteractionsInitial());
  static VideoInteractionsCubit get(context) => BlocProvider.of(context);
  Future<void> likeVideo(videoID, context) async {
    // Switch any previous dislike to a like if one was made
    if (UserCubit.get(context).dislikedVideos.contains(videoID)) {
      List x = [videoID];
      List y = [uid];
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'disliked_videos': FieldValue.arrayRemove(x),
      });
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'dislikes': FieldValue.arrayRemove(y),
      });
    }
    // Update like status
    FirebaseFirestore.instance.collection('videos').doc(videoID).update({
      'likes': FieldValue.arrayUnion([uid])
    });
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'liked_videos': FieldValue.arrayUnion([videoID])
    });

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
      List x = [videoID];
      List y = [uid];
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'liked_videos': FieldValue.arrayRemove(x),
      });
      FirebaseFirestore.instance.collection('videos').doc(videoID).update({
        'likes': FieldValue.arrayRemove(y),
      });
    }
    // Update dislike status
    await FirebaseFirestore.instance.collection('videos').doc(videoID).update({
      'dislikes': FieldValue.arrayUnion([uid])
    });
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'disliked_videos': FieldValue.arrayUnion([videoID])
    });
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
}
