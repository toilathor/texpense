import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/common/base_scaffold/base_scaffold.dart';

class SettingTabView extends ConsumerStatefulWidget {
  const SettingTabView({super.key});

  @override
  ConsumerState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends ConsumerState<SettingTabView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      configs: BaseScaffoldConfigs(
        body: Container(),
      ),
    );
  }
}
