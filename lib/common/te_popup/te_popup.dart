import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:texpense/common/te_popup/te_bottom_sheet_config.dart';
import 'package:texpense/gen/colors.gen.dart';
import 'package:texpense/routes/app_router.dart';
import 'package:texpense/singleton.dart';

FutureOr<T?> showTEBottomSheet<T>({
  required TEBottomSheetConfigs configs,
}) async {
  final context = getIt<AppRouter>().navigatorKey.currentContext;
  if (context == null) return null;

  final heightScreen = MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;

  return await showMaterialModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: configs.backgroundColor,
      child: Container(
        height: heightScreen * configs.size.toPercentHeightScreen,
        constraints: BoxConstraints(
          maxHeight: heightScreen,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.colorBDBDBD,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Visibility(
              visible: configs.showHeader,
              child: Center(
                child: configs.title ?? const SizedBox.shrink(),
              ),
            ),
            const Gap(16),
            configs.child,
          ],
        ),
      ),
    ),
  );
}
