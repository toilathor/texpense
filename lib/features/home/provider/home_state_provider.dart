import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/features/home/data/models/home_state.dart';
import 'package:texpense/features/home/data/repository/home_repository.dart';

class HomeDataNotifier extends StateNotifier<HomeState> {
  HomeDataNotifier(this.homeRepository) : super(HomeState()) {
    // getJoke();
  }

  HomeRepository homeRepository;

  // Future<void> getJoke() async {
  //   state = state.copyWith(isLoading: true);
  //   await homeRepository.fetchJoke().then((data) {
  //     state = state.copyWith(joke: data, isLoading: false);
  //   });
  // }

  void changeCurrentTabIndex(int index) {
    state = state.copyWith(currentTabIndex: index);
  }
}
