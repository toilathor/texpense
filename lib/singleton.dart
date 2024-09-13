import 'package:get_it/get_it.dart';
import 'package:texpense/routes/app_router.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
