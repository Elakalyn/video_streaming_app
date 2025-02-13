part of 'video_interactions_cubit.dart';

@immutable
sealed class VideoInteractionsState {}

final class VideoInteractionsInitial extends VideoInteractionsState {}

final class EngageVideoState extends VideoInteractionsState {}
