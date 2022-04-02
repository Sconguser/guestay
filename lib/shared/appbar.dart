import 'package:flutter/material.dart';
import 'constants/colours.dart';

AppBar gradientAppBar = AppBar(
  title: const Text('Gradient appbar'),
  titleSpacing: 1,
  elevation: 0,
  flexibleSpace: Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [gradientPrimaryColor, gradientSecondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.notifications_none),
      color: Colors.black,
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search_outlined),
      color: Colors.black,
    )
  ],
);
