import 'package:currency_charts/resources/strings.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(Function(int) onTap, int currentIndex) {
  return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
      items: navBarItems());
}

List<BottomNavigationBarItem> navBarItems() {
  return const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: Strings.menuMain,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.currency_exchange),
      label: Strings.menuCurrency,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.money),
      label: Strings.menuBank,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.area_chart),
      label: Strings.menuChart,
    )
  ];
}
