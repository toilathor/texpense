import 'package:auto_route/auto_route.dart';
import 'package:texpense/app_guard.dart';
import 'package:texpense/features/home/view/home_view.dart';
import 'package:texpense/features/login/presentation/pages/login_view.dart';
import 'package:texpense/routes/routes.dart';
import 'package:texpense/story_book/appbar.test.dart';
import 'package:texpense/story_book/button/tfilled_button.test.dart';
import 'package:texpense/story_book/button/toutline_button.test.dart';
import 'package:texpense/story_book/button/ttext_button.test.dart';
import 'package:texpense/story_book/dropdown/dropdown.test.dart';
import 'package:texpense/story_book/list/list_item/expense_list_group.test.dart';
import 'package:texpense/story_book/list/list_item/expense_list_item.test.dart';
import 'package:texpense/story_book/storybook.dart';
import 'package:texpense/story_book/t_input/t_input.test.dart';
import 'package:texpense/story_book/theme/icon_texpense.test.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginScreen.page, path: Routes.root, initial: true),
        AutoRoute(page: HomeScreen.page, path: Routes.home),
        AutoRoute(
          page: StoryBookScreen.page,
          path: Routes.storyBookScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: AppBarTestScreen.page,
          path: Routes.appBarTestScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: TOutlineButtonScreen.page,
          path: Routes.tOutlineButtonScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: TTextButtonScreen.page,
          path: Routes.tTextButtonScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: TFilledButtonScreen.page,
          path: Routes.tFilledButtonScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: IconTExpenseScreen.page,
          path: Routes.iconTExpenseScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: TInputScreen.page,
          path: Routes.tInputScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: TDropDownScreen.page,
          path: Routes.tDropdownScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: ExpenseListItemScreen.page,
          path: Routes.expenseListItemScreen,
          guards: [CheckDebugModeGuard()],
        ),
        AutoRoute(
          page: ExpenseListGroupScreen.page,
          path: Routes.expenseListGroupScreen,
          guards: [CheckDebugModeGuard()],
        ),
      ];
}
