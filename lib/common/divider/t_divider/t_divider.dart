import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 't_divider.freezed.dart';
part 't_divider_configs.dart';

enum TDividerType { spacing, line, dash }

class TDivider extends StatelessWidget {
  const TDivider({super.key, required this.configs});

  final TDividerConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: configs.padding,
      child: switch (configs.type) {
        TDividerType.line => Container(
            width: configs.width,
            height: configs.strokeWidth,
            color: configs.color,
          ),
        TDividerType.dash => SizedBox(
            width: configs.width,
            child: DottedBorder(
              customPath: (size) => Path()
                ..moveTo(0, 0)
                ..lineTo(size.width, 0),
              strokeWidth: configs.strokeWidth,
              padding: EdgeInsets.zero,
              dashPattern: const [4, 4],
              color: configs.color,
              child: const SizedBox.shrink(),
            ),
          ),
        _ => SizedBox.square(
            dimension: configs.width,
          )
      },
    );
  }
}
