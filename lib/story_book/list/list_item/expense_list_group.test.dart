import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:texpense/common/list/list_item/expense_list_item/expense_list_item.dart';
import 'package:texpense/core/constants/app_text_styles.dart';
import 'package:texpense/gen/colors.gen.dart';
import 'package:texpense/gen/icon_font.gen.dart';

@RoutePage(name: "ExpenseListGroupScreen")
class ExpenseListGroupView extends StatelessWidget {
  const ExpenseListGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense List Item"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Gap(8);
          },
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.colorE0E0E0,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title'.toUpperCase(),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.color424242,
                          ),
                        ),
                        Text(
                          '- 100 ₫'.toUpperCase(),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.color424242,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ExpenseListItem(
                    configs: ExpenseListItemConfigs(
                      title: "Title",
                      subtitle: "Subtitle",
                      money: "- 100",
                      icon: IconTExpense
                          .values[Random().nextInt(IconTExpense.values.length)],
                    ),
                  ),
                  ExpenseListItem(
                    configs: ExpenseListItemConfigs(
                      title: "Title",
                      subtitle: "Subtitle",
                      money: "-100",
                      icon: IconTExpense
                          .values[Random().nextInt(IconTExpense.values.length)],
                    ),
                  ),
                  ExpenseListItem(
                    configs: ExpenseListItemConfigs(
                      title: "Title",
                      subtitle: "Subtitle",
                      money: "-100",
                      icon: IconTExpense
                          .values[Random().nextInt(IconTExpense.values.length)],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
