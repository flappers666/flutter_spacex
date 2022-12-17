import 'package:equatable/equatable.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

enum RocketsViewState { notLoaded, loading, loaded, failed }

class RocketsState extends Equatable {
  factory RocketsState.initial() => const RocketsState._(
      rockets: [], errorMessage: '', viewState: RocketsViewState.notLoaded);

  const RocketsState._(
      {required this.rockets,
      required this.errorMessage,
      required this.viewState});

  final String errorMessage;
  final List<RocketModel> rockets;
  final RocketsViewState viewState;
  final int rocketsSkeletonCount = 4;

  RocketsState copyWith(
      {List<RocketModel>? rockets,
      String? errorMessage,
      RocketsViewState? viewState}) {
    return RocketsState._(
        rockets: rockets ?? this.rockets,
        errorMessage: errorMessage ?? this.errorMessage,
        viewState: viewState ?? this.viewState);
  }

  @override
  List<Object?> get props =>
      [errorMessage, rockets, viewState, rocketsSkeletonCount];
}
