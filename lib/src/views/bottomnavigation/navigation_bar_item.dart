import 'package:flutter/material.dart';

import 'bottom_navigation_route.dart';

class NavigationBarItem extends BottomNavigationBarItem {
  NavigationBarItem(BottomNavigationRoute route) : super(icon: new Icon(route.icon), label: route.title, backgroundColor: route.color);
}
