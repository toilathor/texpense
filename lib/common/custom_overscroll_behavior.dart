import 'package:flutter/material.dart';

class CustomOverscrollBehavior extends MaterialScrollBehavior {
  final bool isDisableOverscrollColor;

  const CustomOverscrollBehavior({
    required this.isDisableOverscrollColor,
  });

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        );
      default:
        return super.getScrollPhysics(context);
    }
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return isDisableOverscrollColor
        ? child
        : super.buildOverscrollIndicator(
            context,
            child,
            details,
          );
  }
}
