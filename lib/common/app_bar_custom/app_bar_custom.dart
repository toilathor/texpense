import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:texpense/core/constants/app_text_styles.dart';
import 'package:texpense/gen/assets.gen.dart';
import 'package:texpense/gen/colors.gen.dart';
import 'package:texpense/gen/icon_font.gen.dart';
import 'package:texpense/routes/app_router.dart';
import 'package:texpense/singleton.dart';

enum AppBarLevel {
  level1,
  level2,
  level3,
  level4,
  level5,
  level6,
  level7,
  level8,
  level9,
  level10,
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.level,
    this.onPressBack,
    this.title,
    this.showLogo = false,
  });

  final AppBarLevel level;
  final Function()? onPressBack;
  final String? title;
  final bool showLogo;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: _getColorAppBar(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leftPanel(),
            _rightPanel(),
          ],
        ),
      ),
    );
  }

  Widget _leftPanel() {
    return Row(
      children: [
        if (level.index == 0 && showLogo) ...[
          Container(
            height: 32,
            padding: const EdgeInsets.all(4),
            child: AppAssets.imagesLogo.image(),
          ),
          const SizedBox(width: 4),
        ],
        if (level.index > 0) ...[
          IconButton(
            icon: Icon(
              IconTExpense.arrowBackBlack,
              size: 24,
            ),
            onPressed: () {
              if (onPressBack != null) {
                onPressBack?.call();
              }

              getIt<AppRouter>().back();
              return;
            },
          ),
          const Gap(16),
        ],
        Text(title ?? "", style: _getStyleTitle()),
      ],
    );
  }

  Widget _rightPanel() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            IconTExpense.searchBlack,
            size: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  TextStyle? _getStyleTitle() {
    return switch (level) {
      AppBarLevel.level1 => AppTextStyles.titleBold,
      AppBarLevel.level2 => AppTextStyles.subTitle1,
      _ => null
    };
  }

  Color _getColorAppBar() {
    return switch (level) {
      AppBarLevel.level1 => AppColors.white,
      AppBarLevel.level2 => AppColors.colorF5F5F5,
      _ => AppColors.white
    };
  }
}
