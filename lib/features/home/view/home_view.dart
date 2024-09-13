import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texpense/features/home/provider/home_provider.dart';
import 'package:texpense/features/home/view/tab_view/home_tab.dart';
import 'package:texpense/features/home/view/tab_view/report_tab.dart';
import 'package:texpense/features/home/view/tab_view/setting_tab.dart';
import 'package:texpense/gen/icon_font.gen.dart';
import 'package:texpense/generated/l10n.dart';

@RoutePage(name: 'HomeScreen')
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final tab = [
    const ReportTabView(),
    const HomeTabView(),
    const SettingTabView(),
  ];
  final tabController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeDataProvider);
    final provider = ref.read(homeDataProvider.notifier);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconTExpense.pieChartBlackOutlined),
            activeIcon: Icon(IconTExpense.pieChartBlack),
            label: S.current.report,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconTExpense.homeBlackOutlined),
            activeIcon: Icon(IconTExpense.homeBlack),
            label: S.current.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconTExpense.settingsBlackOutlined),
            activeIcon: Icon(IconTExpense.settingsBlack),
            label: S.current.setting,
          ),
        ],
        currentIndex: state.currentTabIndex,
        onTap: (value) {
          provider.changeCurrentTabIndex(value);
          tabController.jumpToPage(value);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(IconTExpense.addPlusCircle),
        label: Text(S.current.addNew),
      ),
      body: PageView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          provider.changeCurrentTabIndex(value);
        },
        children: tab,
      ),
    );
  }
}
