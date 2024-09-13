import 'package:flutter/material.dart';

part 'base_scaffold_configs.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key, required this.configs});

  final BaseScaffoldConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: configs.appBar,
      body: configs.body,
      backgroundColor: configs.backgroundColor,
    );
  }
}
