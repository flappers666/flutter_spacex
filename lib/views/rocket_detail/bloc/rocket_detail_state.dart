import 'package:equatable/equatable.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

// ignore: must_be_immutable
class RocketDetailState extends Equatable {
  factory RocketDetailState.initial() =>
      RocketDetailState._(infoHeading: '', infoTexts: const []);

  RocketDetailState._({
    required this.infoHeading,
    required this.infoTexts,
    this.rocket,
  });

  RocketModel? rocket;
  final String infoHeading;
  final List<String> infoTexts;

  RocketDetailState copyWith(
      {RocketModel? rocket, String? infoHeading, List<String>? infoTexts}) {
    return RocketDetailState._(
        rocket: rocket ?? this.rocket,
        infoHeading: infoHeading ?? this.infoHeading,
        infoTexts: infoTexts ?? this.infoTexts);
  }

  @override
  List<Object?> get props => [infoHeading, infoTexts, rocket];
}
