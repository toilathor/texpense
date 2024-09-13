import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:texpense/gen/colors.gen.dart';

part 't_dropdown.freezed.dart';
part 't_dropdown_configs.dart';

class TDropDown<T> extends StatelessWidget {
  const TDropDown({super.key, required this.configs});

  final TDropDownConfigs configs;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      initialSelection: configs.initialSelection,
      dropdownMenuEntries: configs.items
          .map(
            (e) => DropdownMenuEntry<T>(value: e, label: "$e"),
          )
          .toList(),
      expandedInsets: EdgeInsets.zero,
      enableFilter: configs.enableFilter,
      requestFocusOnTap: configs.requestFocusOnTap,
      label: configs.label,
      controller: configs.controller,
      menuStyle: MenuStyle(
        backgroundColor: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
        ).backgroundColor,
      ),
      enabled: configs.enabled,
      menuHeight: MediaQuery.of(context).size.height * 0.5,
      onSelected: configs.onSelected,
    );
  }
}
