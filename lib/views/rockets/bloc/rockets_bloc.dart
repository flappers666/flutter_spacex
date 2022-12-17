import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/repositories/rockets_repository.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_events.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final RocketsRepository rocketsRepository;
  RocketsBloc({required this.rocketsRepository})
      : super(RocketsState.initial()) {
    on<GetRockets>((event, emit) async => await _getRockets(event, emit));
  }

  Future<void> _getRockets(event, emit) async {
    var valueOrFail = await rocketsRepository.getRockets();
    if (valueOrFail.hasValue) {
      emit(state.copyWith(
          rockets: valueOrFail.value, viewState: RocketsViewState.loaded));
    } else {
      emit(state.copyWith(
          errorMessage: valueOrFail.errorMessage,
          viewState: RocketsViewState.failed));
    }
  }
}
