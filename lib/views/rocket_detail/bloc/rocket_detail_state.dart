import 'package:equatable/equatable.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

// ignore: must_be_immutable
class RocketDetailState extends Equatable {
  factory RocketDetailState.initial() =>
      RocketDetailState._(infoTab: 1, infoHeading: '', infoTexts: const []);

  RocketDetailState._({
    required this.infoTab,
    required this.infoHeading,
    required this.infoTexts,
    this.rocket,
  });

  RocketModel? rocket;
  final int infoTab;
  final String infoHeading;
  final List<String> infoTexts;

  RocketDetailState copyWith(
      {RocketModel? rocket,
      int? infoTab,
      String? infoHeading,
      List<String>? infoTexts}) {
    return RocketDetailState._(
        rocket: rocket ?? this.rocket,
        infoTab: infoTab ?? this.infoTab,
        infoHeading: infoHeading ?? this.infoHeading,
        infoTexts: infoTexts ?? this.infoTexts);
  }

  @override
  List<Object?> get props => [infoTab, infoHeading, infoTexts, rocket];
}
