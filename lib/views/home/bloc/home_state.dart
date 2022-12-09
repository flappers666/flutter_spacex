import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  factory HomeState.initial() => const HomeState._(selectedTabIndex: 0);

  final int selectedTabIndex;
  const HomeState._({this.selectedTabIndex = 0});

  HomeState copyWith({int? selectedTabIndex}) {
    return HomeState._(
        selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex);
  }

  @override
  List<Object?> get props => [selectedTabIndex];
}
