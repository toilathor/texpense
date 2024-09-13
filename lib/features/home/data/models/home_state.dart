import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(true) bool isLoading,
    @Default(1) int currentTabIndex,
  }) = _HomeState;
}
