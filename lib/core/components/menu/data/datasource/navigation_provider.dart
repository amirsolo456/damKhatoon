import 'package:flutter/material.dart';
import 'package:khatoon_container/core/components/menu/domain/entities/menu_item.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  final List<MenuItem> menuItems = <MenuItem>[
    MenuItem(
      label: 'Counters',
      icon:const Icon(Icons.list) ,
      pageIndex: 0,
      id: 'Management',
    ),
    MenuItem(
      label: 'Management',
      icon:const Icon(Icons.dashboard) ,

      id: 'Management',
      pageIndex: -1,
      children: <MenuItem>[
        MenuItem(label: 'Users', icon:  const Icon(Icons.person) ,  pageIndex: 1, id: 'Users'),
        MenuItem(
          label: 'Reports',
          icon:const Icon(Icons.bar_chart) ,

          pageIndex: 2,
          id: 'Users',
        ),
      ],
    ),
    MenuItem(
      label: 'Settings',
      icon:const Icon(Icons.settings) ,

      pageIndex: 3,
      id: 'Settings',
    ),
  ];

  void selectPage(int pageIndex) {
    if (pageIndex >= 0) {
      _selectedPageIndex = pageIndex;
      notifyListeners();
    }
  }
}
