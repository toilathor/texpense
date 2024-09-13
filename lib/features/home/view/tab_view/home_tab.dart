import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/common/app_bar_custom/app_bar_custom.dart';
import 'package:texpense/common/base_scaffold/base_scaffold.dart';
import 'package:texpense/core/constants/constants.dart';

class HomeTabView extends ConsumerStatefulWidget {
  const HomeTabView({super.key});

  @override
  ConsumerState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends ConsumerState<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      configs: BaseScaffoldConfigs(
        appBar: const AppBarCustom(
          level: AppBarLevel.level1,
          title: Constants.appName,
          showLogo: true,
        ),
        body: Container(),
      ),
    );
  }
}
