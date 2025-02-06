part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// Fetch Videos
final class FetchVideosLoadingState extends HomeState {}

final class FetchVideosSuccessState extends HomeState {}

final class FetchVideosErrorState extends HomeState {}
