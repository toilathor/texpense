import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:texpense/gen/icon_font.gen.dart';

@RoutePage(name: "IconTExpenseScreen")
class IconTExpenseView extends StatelessWidget {
  const IconTExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Icons TExpened")),
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        children: IconTExpense.values.map((e) => _getItem(e)).toList(),
      ),
    );
  }

  Widget _getItem(IconData icon) => Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade200,
          ),
          child: Icon(icon),
        ),
      );
}
