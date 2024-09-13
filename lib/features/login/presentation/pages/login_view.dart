import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gap/gap.dart';
import 'package:texpense/common/bubble_menu/bubble_menu_manager.dart';
import 'package:texpense/common/buttons/toutline_button/toutline_button.dart';
import 'package:texpense/core/constants/app_text_styles.dart';
import 'package:texpense/core/firebase/fireauth_helper.dart';
import 'package:texpense/gen/assets.gen.dart';
import 'package:texpense/generated/l10n.dart';
import 'package:texpense/routes/app_router.dart';
import 'package:texpense/routes/routes.dart';
import 'package:texpense/singleton.dart';

@RoutePage(name: 'LoginScreen')
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> isStart = ValueNotifier<bool>(false);
  ValueNotifier<bool> finishInit = ValueNotifier<bool>(false);
  final iconHeight = 128.0;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BubbleMenuManager.shared.show(context);
      Future.delayed(
        const Duration(seconds: 1),
        () {
          isStart.value = true;
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: ValueListenableBuilder(
        valueListenable: isStart,
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                top:
                    value ? height / 2 - iconHeight : (height - iconHeight) / 2,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutBack,
                child: AppAssets.imagesLogoNoBackground.image(
                  height: iconHeight,
                ),
              ),
              Positioned(
                top: (height + iconHeight) / 2.1,
                right: 0,
                left: 0,
                child: Visibility(
                  visible: value,
                  child: Column(
                    children: [
                      Text(
                        S.current.createAccount,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h6.copyWith(color: Colors.white),
                      ),
                      const Gap(8),
                      SizedBox(
                        width: 312,
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                          animatedTexts: [
                            TyperAnimatedText(
                              S.current.createAccountDes,
                              textAlign: TextAlign.center,
                              textStyle: AppTextStyles.body2
                                  .copyWith(color: Colors.white),
                              speed: Duration(
                                milliseconds:
                                    2000 ~/ S.current.createAccountDes.length,
                              ),
                            ),
                          ],
                          onFinished: () {
                            finishInit.value = true;
                          },
                        ),
                      ),
                      const Gap(56),
                      ValueListenableBuilder(
                        valueListenable: finishInit,
                        builder: (context, value, child) {
                          return Visibility(
                            visible: value,
                            child: TOutlineButton(
                              configs: TOutlineButtonConfigs(
                                icon: AppAssets.svgLogoGoogle.svg(),
                                label: Text(
                                  S.current.signUpGoogle,
                                  style: AppTextStyles.labelButton.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  FireAuthHelper.shared.signOut();
                                  final user =
                                      await FireAuthHelper.shared.signIn();
                                  if (user != null) {
                                    getIt<AppRouter>().pushNamed(Routes.home);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
