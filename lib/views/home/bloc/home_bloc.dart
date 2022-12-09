import 'package:bloc/bloc.dart';
import 'package:flutter_spacex/views/home/bloc/home_event.dart';
import 'package:flutter_spacex/views/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<TabSelected>((event, emit) => _tabChanged(event, emit));
  }

  _tabChanged(TabSelected event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedTabIndex: event.tabIndex));
  }
}
