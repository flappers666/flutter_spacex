import 'package:equatable/equatable.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';

enum LaunchViewState { notLoaded, loading, loaded, failed }

class LaunchesState extends Equatable {
  factory LaunchesState.initial() => const LaunchesState._(
      launches: [], errorMessage: '', viewState: LaunchViewState.notLoaded);

  const LaunchesState._(
      {required this.launches,
      required this.errorMessage,
      required this.viewState});

  final String errorMessage;
  final List<LaunchModel> launches;
  final LaunchViewState viewState;
  final int launchesSkeletonCount = 10;

  LaunchesState copyWith(
      {List<LaunchModel>? launches,
      String? errorMessage,
      LaunchViewState? viewState}) {
    return LaunchesState._(
        launches: launches ?? this.launches,
        errorMessage: errorMessage ?? this.errorMessage,
        viewState: viewState ?? this.viewState);
  }

  @override
  List<Object?> get props =>
      [errorMessage, launches, viewState, launchesSkeletonCount];
}
