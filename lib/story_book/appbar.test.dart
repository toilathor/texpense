import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:texpense/common/app_bar_custom/app_bar_custom.dart';

@RoutePage(name: 'AppBarTestScreen')
class AppBarTestView extends StatefulWidget {
  const AppBarTestView({super.key});

  @override
  State<AppBarTestView> createState() => _AppBarTestViewState();
}

class _AppBarTestViewState extends State<AppBarTestView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        level: AppBarLevel.level1,
        title: "Title (AppBarLevel 1)",
        showLogo: true,
      ),
      body: Scaffold(
        appBar: AppBarCustom(
          level: AppBarLevel.level2,
          title: "Title (AppBarLevel 2)",
          showLogo: true,
        ),
        body: Scaffold(
          appBar: AppBarCustom(
            level: AppBarLevel.level3,
            title: "Title (AppBarLevel 3)",
            showLogo: true,
          ),
        ),
      ),
    );
  }
}
