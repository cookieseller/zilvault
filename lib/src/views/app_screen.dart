import 'package:flutter/material.dart';
import 'package:zilvault/src/views/bottomnavigation/bottom_navigation_route.dart';
import 'package:zilvault/src/views/bottomnavigation/navigation_bar_item.dart';

class AppScreen extends StatefulWidget {
  AppScreen({required this.title}) : super();

  final String title;

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _currentIndex,
            children: routes.map<Widget>((BottomNavigationRoute route) => route.view).toList(),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: routes.map((BottomNavigationRoute route) => NavigationBarItem(route)).toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
