import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/shared/bottom_navigation_bar.dart';
import 'package:guestay/shared/appbar.dart';
import 'package:guestay/shared/constants/background.dart';

class SessionView extends StatelessWidget {
  SessionView({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: defaultBottomNavigationBar,
        body: BlocProvider(
          create:(context)
          child: Center(
              child: Container(
                  decoration: backgroundDecoration,
                  child: Center(child: Text('Session view')))),
        ));
  }

  Widget _searchBar(){

  }
}
