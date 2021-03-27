import 'package:flutter/material.dart';

import "../app.dart";
import "tab_item_class.dart";

class BottomNavigation extends StatelessWidget {
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  BottomNavigation({this.onSelectTab, this.tabs});

  Color _tabColor(index, context) {
    return AppState.currentTab == index
        ? Theme.of(context).primaryColor
        : Colors.grey;
  }

  List<Widget> _buildBottomAppBarItems(BuildContext context) {
    final items = tabs
        .map((tab) => Expanded(
              child: SizedBox(
                height: 60.0,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => onSelectTab(tab.getIndex()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(tab.icon,
                            color: _tabColor(tab.getIndex(), context)),
                        Text(tab.tabName,
                            style: TextStyle(
                                color: _tabColor(tab.getIndex(), context)))
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return items;
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24.0),
            Text(
              'Novo',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildBottomAppBarItems(context);

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}
