import 'package:flutter/material.dart';
import 'package:guestay/shared/constants/colours.dart';

BottomNavigationBar defaultBottomNavigationBar = BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'home',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'booking'),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_offer_outlined), label: 'coupons'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined), label: 'profile'),
  ],
);

BottomAppBar bottomAppBar = BottomAppBar(
  shape: CircularNotchedRectangle(),
  notchMargin: 12,
  color: Colors.blue,
  child: Container(
    height: 60,
  ),
);
