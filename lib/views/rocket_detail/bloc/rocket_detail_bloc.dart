import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_event.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_state.dart';
import 'package:intl/intl.dart';

class RocketDetailBloc extends Bloc<RocketDetailEvent, RocketDetailState> {
  RocketDetailBloc() : super(RocketDetailState.initial()) {
    on<UpdateInfo>((event, emit) => _updateInfoTab(event, emit));
    on<UpdateRocket>((event, emit) => _updateRocket(event, emit));
  }

  List<String> getPayloads(RocketModel rocket) {
    List<String> payloads = [];
    for (var payload in rocket.payloadWeights) {
      payloads.add('${payload.name}: ${payload.kg}KG');
    }
    return payloads;
  }

  String calculateHeaderText(int infoTab) {
    switch (infoTab) {
      case 1:
        return 'Payloads:';
      case 2:
        return 'Details:';
      case 3:
        return 'Size:';
      case 4:
        return 'Stats:';
      case 5:
        return 'Engines:';
      default:
        return 'Details:';
    }
  }

  List<String> calculateInfoText(int infoTab) {
    RocketModel rocket = state.rocket!;
    switch (infoTab) {
      case 1:
        return getPayloads(rocket);
      case 2:
        return [rocket.description];
      case 3:
        return [
          'Height: ${rocket.height.meters}M',
          'Diameter: ${rocket.diameter.meters}M',
          'Mass: ${rocket.mass.kg}KG'
        ];
      case 4:
        return [
          'Cost per launch: \$${rocket.costPerLaunch}',
          'Success rate: ${rocket.successRatePct}%',
          'First Flight: ${DateFormat('dd/MM/yyyy').format(rocket.firstFlight)}',
        ];
      case 5:
        return [
          'Type: ${rocket.engines.type}',
          'Propellant 1: ${rocket.engines.propellant1}',
          'Propellant 2: ${rocket.engines.propellant2}',
        ];
      default:
        return [rocket.description];
    }
  }

  void _updateRocket(UpdateRocket event, Emitter<RocketDetailState> emit) {
    emit(state.copyWith(rocket: event.rocketModel));
    add(const UpdateInfo(1));
  }

  void _updateInfoTab(UpdateInfo event, Emitter<RocketDetailState> emit) {
    emit(state.copyWith(
        infoHeading: calculateHeaderText(event.infoIndex),
        infoTexts: calculateInfoText(event.infoIndex)));
  }
}
