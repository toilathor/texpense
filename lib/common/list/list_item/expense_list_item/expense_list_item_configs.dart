part of 'expense_list_item.dart';

class ExpenseListItemConfigs {
  const ExpenseListItemConfigs({
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.money,
    this.icon,
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;
  final String money;
  final IconData? icon;
}
