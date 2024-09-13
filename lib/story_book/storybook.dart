import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:texpense/common/divider/t_divider/t_divider.dart';
import 'package:texpense/routes/routes.dart';

@RoutePage(name: 'StoryBookScreen')
class StoryBookView extends StatefulWidget {
  const StoryBookView({super.key});

  @override
  State<StoryBookView> createState() => _StoryBookViewState();
}

class _StoryBookViewState extends State<StoryBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoryBook'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const Gap(16),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.appBarTestScreen);
              },
              child: const Text("AppBar"),
            ),
            const TDivider(
              configs: TDividerConfigs(
                type: TDividerType.dash,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.tOutlineButtonScreen);
              },
              child: const Text("TOutlineButton"),
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.tTextButtonScreen);
              },
              child: const Text("TTextButtonView"),
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.tFilledButtonScreen);
              },
              child: const Text("TFilledButtonView"),
            ),
            const TDivider(
              configs: TDividerConfigs(
                type: TDividerType.dash,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.iconTExpenseScreen);
              },
              child: const Text("Icon TExpense"),
            ),
            const TDivider(
              configs: TDividerConfigs(
                type: TDividerType.dash,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.tInputScreen);
              },
              child: const Text("T Input"),
            ),
            const TDivider(
              configs: TDividerConfigs(
                type: TDividerType.dash,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.tDropdownScreen);
              },
              child: const Text("T Dropdown"),
            ),
            const TDivider(
              configs: TDividerConfigs(
                type: TDividerType.dash,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.expenseListItemScreen);
              },
              child: const Text("Expense List Item"),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(Routes.expenseListGroupScreen);
              },
              child: const Text("Expense List Group"),
            ),
          ],
        ),
      ),
    );
  }
}
