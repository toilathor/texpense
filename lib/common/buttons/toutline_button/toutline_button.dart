import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toutline_button.freezed.dart';
part 'toutline_button_configs.dart';

enum TOutlineButtonType { expand, loose }

enum TOutlineButtonState { $default, enabled, disabled }

class TOutlineButton extends StatelessWidget {
  const TOutlineButton({super.key, required this.configs});

  final TOutlineButtonConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: configs.state == TOutlineButtonState.disabled
            ? null
            : configs.onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(
            configs.type == TOutlineButtonType.expand ? double.infinity : 130,
            32,
          ),
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
