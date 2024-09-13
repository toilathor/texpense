import 'dart:math';

import 'package:flutter/material.dart';
import 'package:texpense/core/constants/app_text_styles.dart';
import 'package:texpense/gen/colors.gen.dart';
import 'package:texpense/gen/icon_font.gen.dart';

part 'expense_list_item_configs.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({super.key, required this.configs});

  final ExpenseListItemConfigs configs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)].shade200,
        ),
        child: Icon(
          configs.icon ?? IconTExpense.attachMoney,
          size: 24,
        ),
      ),
      onTap: configs.onTap,
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(
        configs.title,
        style: AppTextStyles.body2.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 2,
      ),
      subtitle: Text(
        configs.subtitle,
        style: AppTextStyles.subTitle2.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 2,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      horizontalTitleGap: 8,
      trailing: Text(
        "${configs.money} ₫",
        style: AppTextStyles.body2.copyWith(
          color: AppColors.colorE53935,
        ),
        maxLines: 1,
      ),
    );
  }
}
