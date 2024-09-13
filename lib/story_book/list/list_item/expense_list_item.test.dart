import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/list/list_item/expense_list_item/expense_list_item.dart';
import 'package:texpense/gen/icon_font.gen.dart';

@RoutePage(name: "ExpenseListItemScreen")
class ExpenseListItemView extends StatelessWidget {
  const ExpenseListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense List Item"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ExpenseListItem(
              configs: ExpenseListItemConfigs(
                title: "Title",
                subtitle: "Subtitle",
                money: "-100",
                icon: IconTExpense
                    .values[Random().nextInt(IconTExpense.values.length)],
                onTap: () {
                  toast('You pressed on $index');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
