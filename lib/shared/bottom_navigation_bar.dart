import 'package:flutter/material.dart';
import 'package:guestay/shared/constants/colours.dart';

BottomNavigationBar defaultBottomNavigationBar = BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline), label: 'Favorites'),
    BottomNavigationBarItem(
        icon: Icon(Icons.card_travel_outlined), label: 'Bookings'),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_offer_outlined), label: 'Coupons'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined), label: 'Profile'),
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
