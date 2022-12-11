import 'package:equatable/equatable.dart';

class LaunchDetailState extends Equatable {
  factory LaunchDetailState.initial() =>
      const LaunchDetailState._(selectedTabIndex: 0);

  final int selectedTabIndex;
  const LaunchDetailState._({this.selectedTabIndex = 0});

  LaunchDetailState copyWith({int? selectedTabIndex}) {
    return LaunchDetailState._(
        selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex);
  }

  @override
  List<Object?> get props => [selectedTabIndex];
}
