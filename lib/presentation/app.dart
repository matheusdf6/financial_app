import 'package:financial_app/presentation/screens/graphics_screen.dart';
import 'package:financial_app/presentation/screens/home_screen.dart';
import 'package:financial_app/presentation/screens/plans_screen.dart';
import 'package:financial_app/presentation/screens/summaries_screen.dart';
import 'package:flutter/material.dart';

import 'navigation/bottom_navigation_class.dart';
import 'navigation/tab_item_class.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  static int currentTab = 0;
  bool isAppBarCurved = false;

  final List<TabItem> tabs = [
    TabItem(tabName: "Home", icon: Icons.home, page: HomeScreen()),
    TabItem(
        tabName: "Receitas", icon: Icons.attach_money, page: SummariesScreen()),
    TabItem(tabName: "Gráficos", icon: Icons.bar_chart, page: GraphicsScreen()),
    TabItem(tabName: "Planos", icon: Icons.show_chart, page: PlansScreen())
  ];

  AppState() {
    this.tabs.asMap().forEach((index, tab) {
      tab.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
    setState(() => isAppBarCurved = index != 0);
  }

  _getAppBarShape() {
    return isAppBarCurved
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))
        : null;
  }

  _getAppBarTitle(BuildContext context) {
    return currentTab != 0
        ? Text(tabs[currentTab].tabName, style: TextStyle(
          color: Theme.of(context).primaryColor
        ))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0.0,
              shape: _getAppBarShape(),
              title: _getAppBarTitle(context),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.settings,
                        color: Theme.of(context).primaryColorDark),
                    onPressed: () {})
              ],
              backgroundColor: Theme.of(context).primaryColorLight),
          body: IndexedStack(
            index: currentTab,
            children: tabs.map((e) => e.page).toList(),
          ),
          bottomNavigationBar: BottomNavigation(
            onSelectTab: _selectTab,
            tabs: tabs,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add, color: Theme.of(context).accentColor),
            onPressed: () {},
            tooltip: 'Novo',
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await tabs[currentTab].key.currentState.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (currentTab != 0) {
              _selectTab(0);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        });
  }
}
