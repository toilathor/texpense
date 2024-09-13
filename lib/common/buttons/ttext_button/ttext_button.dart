import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ttext_button.freezed.dart';

part 'ttext_button_configs.dart';

enum TTextButtonType { expand, loose }

enum TTextButtonState { $default, enabled, disabled }

class TTextButton extends StatelessWidget {
  const TTextButton({super.key, required this.configs});

  final TTextButtonConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: configs.state == TTextButtonState.disabled
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
