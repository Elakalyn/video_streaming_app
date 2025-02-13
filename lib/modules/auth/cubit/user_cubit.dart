import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_streaming_app/network/local/cacheHelper.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
  bool isViewable = false;
  void changeViewable() {
    if (isViewable == true) {
      isViewable = false;
    } else if (isViewable == false) {
      isViewable = true;
    }
    print(isViewable);

    emit(SuffixChangeState());
  }

  Future<void> login({required email, required password}) async {
    emit(LoadingLoginState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((v) async {
      uid = v.user!.uid;
      await CacheHelper.saveData(key: 'uid', value: v.user!.uid);
      emit(SuccessLoginState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorLoginState());
    });
  }

  Future<void> register(
      {required email, required password, required name}) async {
    emit(LoadingRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((v) async {
      uid = v.user!.uid;
      await CacheHelper.saveData(key: 'uid', value: v.user!.uid);
      await createUser(email: email, name: name);
      emit(SuccessRegisterState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorRegisterState());
    });
  }

  Future<void> createUser({required email, required name}) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'name': name,
      'profileImage': '',
      'likes': [],
    });
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    await CacheHelper.removeData(key: 'uid');
    emit(LogoutState());
  }

  Future<void> deleteAccount() async {
    await FirebaseFirestore.instance
        .doc('users/25OLoYZbGcMBy2dGZviMbUZkaUt1')
        .delete()
        .catchError((e) {
      print("Error deleting user from Firestore: ${e.toString()}");
    });
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.delete();
        print("User account deleted successfully!");
      } else {
        print("No user is currently signed in.");
      }
    } catch (e) {
      print("Error deleting user from FirebaseAuth: $e");
    }
    await CacheHelper.removeData(key: 'uid');
  }

  List<String> likedVideos = [];
  List<String> dislikedVideos = [];

  void loadUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        likedVideos = List<String>.from(snapshot['liked_videos']);
        dislikedVideos = List<String>.from(snapshot['disliked_videos']);
      }
    });
    print('user data loaded');
  }
}
