import 'package:equatable/equatable.dart';

class LaunchState extends Equatable {
  factory LaunchState.initial() => const LaunchState._();

  const LaunchState._();

  LaunchState copyWith() {
    return LaunchState._();
  }

  @override
  List<Object?> get props => [];
}
