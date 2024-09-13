import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tfilled_button.freezed.dart';
part 'tfilled_button_configs.dart';

enum TFilledButtonType { expand, loose }

enum TFilledButtonState { $default, enabled, disabled }

class TFilledButton extends StatelessWidget {
  const TFilledButton({super.key, required this.configs});

  final TFilledButtonConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: configs.state == TFilledButtonState.disabled
            ? null
            : configs.onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(130, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        icon: configs.icon ?? const SizedBox(),
        label: configs.label,
      ),
    );
  }
}
