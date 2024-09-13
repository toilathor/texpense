import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/bubble_menu/bubble_menu_widget.dart';
import 'package:texpense/common/te_popup/te_bottom_sheet_config.dart';
import 'package:texpense/common/te_popup/te_popup.dart';
import 'package:texpense/core/constants/app_text_styles.dart';
import 'package:texpense/core/firebase/firestore_helper.dart';
import 'package:texpense/gen/colors.gen.dart';
import 'package:texpense/routes/app_router.dart';
import 'package:texpense/routes/routes.dart';
import 'package:texpense/singleton.dart';

class BubbleMenuManager {
  BubbleMenuManager._internal();

  static BubbleMenuManager? _instance;

  static BubbleMenuManager get shared {
    _instance ??= BubbleMenuManager._internal();

    return _instance!;
  }

  OverlaySupportEntry? _overlay;

  void show(BuildContext? context) {
    try {
      _overlay ??= showOverlay(
        (context, __) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: BubbleMenuWidget(
            onTap: showBottomSheetMenu,
          ),
        ),
        context: context,
        duration: Duration.zero,
      );
    } catch (e) {
      _overlay = null;
    }
  }

  Future<void> showBottomSheetMenu() async {
    hide();
    await showTEBottomSheet(
      configs: TEBottomSheetConfigs(
        child: const MenuAppDev(),
        backgroundColor: AppColors.color2b2b2b,
        showHeader: true,
        title: Text(
          "Menu Dev",
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.white,
          ),
        ),
        size: TEBottomSheetSize.m,
      ),
    );

    show(getIt<AppRouter>().navigatorKey.currentContext);
  }

  void hide() {
    try {
      _overlay?.dismiss(animate: false);
      _overlay = null;
    } catch (e) {
      _overlay = null;
    }
  }
}

class MenuAppDev extends StatelessWidget {
  const MenuAppDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        fontFamily: GoogleFonts.spaceMono().fontFamily,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () async {
                await getIt<AppRouter>().pushNamed(Routes.storyBookScreen);
                await getIt<AppRouter>().maybePop();
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text("Story Book"),
                ),
              ),
            ),
            const Gap(8),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () async {
                CollectionReference<Map<String, dynamic>>? users =
                    FireStorageHelper.shared.firestore?.collection('users');

                await users?.doc().set({
                  "email": "toilathor.job@gmail.com",
                  "phoneNumber": "097371208",
                  "fullName": "Lê Quang Thọ",
                });
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text("Setup Emulator Firestore"),
                ),
              ),
            ),
            const Gap(8),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () async {},
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text("Test"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
