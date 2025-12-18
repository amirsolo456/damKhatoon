import 'package:flutter/material.dart';

class MenuItem {
  final String label;
  final String id;
  final Icon icon;
  final List<MenuItem>? children;
  final Widget? page;
  final String? routeName;
  final int pageIndex;

  MenuItem({
    required this.label,
    required this.icon,
    this.page,
    this.children,
    required this.pageIndex,
     this.routeName,
    required this.id,
  }) : assert(children == null || children.isNotEmpty);

  factory MenuItem.page({
    required String id,
    required int pageIndex,
    required String label,
    required Icon  icon,
    required Widget page,
  }) {
    return MenuItem(
      id: id,
      pageIndex: pageIndex,
      label: label,
      icon: icon,
      page: page,
    );
  }
}
