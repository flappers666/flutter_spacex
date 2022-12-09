import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class TabSelected extends HomeEvent {
  final int tabIndex;

  const TabSelected({required this.tabIndex});

  @override
  List<Object?> get props => [...super.props, tabIndex];
}
