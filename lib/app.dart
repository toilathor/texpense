import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/custom_overscroll_behavior.dart';
import 'package:texpense/core/constants/app_theme.dart';
import 'package:texpense/generated/l10n.dart';
import 'package:texpense/routes/app_router.dart';
import 'package:texpense/singleton.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  AppView({super.key}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // ThemeData themeDataOverride = ThemeData(
        //   pageTransitionsTheme: const PageTransitionsTheme(
        //     builders: <TargetPlatform, PageTransitionsBuilder>{
        //       TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //     },
        //   ),
        // );

        return OverlaySupport.global(
          child: MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: themeData,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: const AppLocalizationDelegate().supportedLocales,
            // locale: locale,
            // localeResolutionCallback: (_, __) {
            //   localizationCubit.notifyUpdatedLocale();
            //
            //   return _;
            // },
            scrollBehavior: const CustomOverscrollBehavior(
              isDisableOverscrollColor: true,
            ),
            builder: (context, child) => ClipRRect(
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
