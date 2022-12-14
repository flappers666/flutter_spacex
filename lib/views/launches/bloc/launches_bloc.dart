import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/repositories/launches_repository.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_event.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_state.dart';

class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  final LaunchesRepository launchesRepository;
  LaunchesBloc({required this.launchesRepository})
      : super(LaunchesState.initial()) {
    on<GetLaunches>((event, emit) async => await _getLaunches(event, emit));
  }

  Future<void> _getLaunches(event, emit) async {
    var valueOrFail = await launchesRepository.getUpcomingLaunches();
    if (valueOrFail.hasValue) {
      valueOrFail.value!.sort((a, b) => b.dateUnix.compareTo(a.dateUnix));
      emit(state.copyWith(
          launches: valueOrFail.value, viewState: LaunchViewState.loaded));
    } else {
      emit(state.copyWith(
          errorMessage: valueOrFail.errorMessage,
          viewState: LaunchViewState.failed));
    }
  }
}
