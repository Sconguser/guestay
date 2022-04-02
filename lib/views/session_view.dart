import 'package:flutter/material.dart';
import 'package:guestay/shared/bottom_navigation_bar.dart';
import 'package:guestay/shared/appbar.dart';
import 'package:guestay/shared/constants/background.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomAppBar,
        body: Center(
            child: Container(
                decoration: backgroundDecoration,
                child: Center(child: Text('Session view')))));
  }
}
