import 'package:bloc/bloc.dart';
import 'package:flutter_spacex/views/launches/bloc/launch_event.dart';
import 'package:flutter_spacex/views/launches/bloc/launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc() : super(LaunchState.initial());
}
