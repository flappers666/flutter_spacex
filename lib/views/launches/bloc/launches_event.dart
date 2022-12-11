import 'package:equatable/equatable.dart';

abstract class LaunchesEvent extends Equatable {
  const LaunchesEvent();

  @override
  List<Object?> get props => [];
}

class GetLaunches extends LaunchesEvent {}
