import 'package:flutter/material.dart';

enum TEBottomSheetSize {
  none,
  s,
  m,
  l;

  double get toPercentHeightScreen => switch (this) {
        none => 1,
        s => 0.5,
        m => 0.68,
        l => 0.85,
      };
}

class TEBottomSheetConfigs {
  final Widget child;
  final TEBottomSheetSize size;
  final bool showHeader;
  final Widget? title;
  final Color? backgroundColor;

  TEBottomSheetConfigs({
    required this.child,
    this.size = TEBottomSheetSize.none,
    this.showHeader = true,
    this.title,
    this.backgroundColor,
  });
}
