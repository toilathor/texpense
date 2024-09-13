import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/core/shared_provider/shared_providers.dart';
import 'package:texpense/features/home/data/api/home_api.dart';
import 'package:texpense/features/home/data/models/home_state.dart';
import 'package:texpense/features/home/data/repository/home_repository.dart';
import 'package:texpense/features/home/provider/home_state_provider.dart';

final homeApiProvider = Provider<HomeApi>((ref) {
  return HomeApi(ref.read(dioClientProvider));
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.read(homeApiProvider));
});

final homeDataProvider =
    StateNotifierProvider<HomeDataNotifier, HomeState>((ref) {
  return HomeDataNotifier(ref.read(homeRepositoryProvider));
});
