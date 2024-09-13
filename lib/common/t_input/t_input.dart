import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 't_input.freezed.dart';
part 't_input_configs.dart';

class TInput extends StatelessWidget {
  const TInput({super.key, required this.configs});

  final TInputConfigs configs;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: configs.focusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(configs.labelText ?? ""),
        hintText: configs.hintText,
      ),
      textCapitalization: configs.textCapitalization,
      enabled: configs.enabled,
      onTapOutside: configs.onTapOutside,
      textInputAction: configs.textInputAction,
      maxLines: configs.maxLines,
      minLines: configs.minLines,
      controller: configs.controller,
      validator: configs.validator,
      autovalidateMode: configs.autovalidateMode,
      obscureText: configs.obscureText,
      obscuringCharacter: configs.obscuringCharacter,
      enableSuggestions: configs.enableSuggestions,
      inputFormatters: configs.inputFormatters,
      maxLength: configs.maxLength,
      expands: configs.expands,
      style: configs.style,
      onChanged: configs.onChanged,
      onTap: configs.onTap,
      scrollPhysics: const ClampingScrollPhysics(),
      keyboardType: configs.keyboardType,
      autofocus: configs.autofocus,
      onEditingComplete: configs.onEditingComplete,
      onFieldSubmitted: configs.onFieldSubmitted,
      readOnly: configs.readOnly,
      onSaved: configs.onSaved,
    );
  }
}
