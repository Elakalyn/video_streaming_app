part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class BNBChangeState extends LayoutState {}

final class EnableMiniplayerState extends LayoutState {}

// User clicks on X button to exit the video entirely
final class ExitMiniplayerState extends LayoutState {}

// User maximizes video
final class MaximizeMiniplayerState extends LayoutState {}

final class MiniplayerAnimationState extends LayoutState {}

final class MiniplayerTogglePlayPause extends LayoutState {}

// Connection States
final class NetworkState extends LayoutState {
  final bool
      hasNetwork; // true = WiFi/Mobile Data available, false = no connection

  NetworkState({required this.hasNetwork});
}
