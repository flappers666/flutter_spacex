import 'package:equatable/equatable.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

abstract class RocketDetailEvent extends Equatable {
  const RocketDetailEvent();

  @override
  List<Object?> get props => [];
}

class UpdateInfo extends RocketDetailEvent {
  final int infoIndex;
  const UpdateInfo(this.infoIndex);
}

class UpdateRocket extends RocketDetailEvent {
  final RocketModel rocketModel;
  const UpdateRocket(this.rocketModel);
}
