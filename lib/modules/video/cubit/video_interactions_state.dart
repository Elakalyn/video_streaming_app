part of 'video_interactions_cubit.dart';

@immutable
sealed class VideoInteractionsState {}

final class VideoInteractionsInitial extends VideoInteractionsState {}

final class EngageVideoState extends VideoInteractionsState {}

final class FetchCommentsState extends VideoInteractionsState {}

// Fetch comments
final class FetchCommentsLoadingState extends VideoInteractionsState {}

final class FetchCommentsSuccessState extends VideoInteractionsState {}

final class FetchCommentsErrorState extends VideoInteractionsState {}

// Posting comments
final class UserCommentUpdateState extends VideoInteractionsState {}

final class PostCommentLoadingState extends VideoInteractionsState {}

final class PostCommentSuccessState extends VideoInteractionsState {}

final class PostCommentErrorState extends VideoInteractionsState {}
