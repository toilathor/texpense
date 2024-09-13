import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:texpense/core/utils/app_logger.dart';

class CheckDebugModeGuard extends AutoRouteGuard {
  CheckDebugModeGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!kDebugMode) {
      AppLogger.log(
        "Navigate to ${resolver.routeName} but fail because mode debug",
      );
      resolver.next(false);
    }
    resolver.next(true);
  }
}
