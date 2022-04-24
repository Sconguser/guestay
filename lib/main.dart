import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/auth/auth_repository.dart';
import 'package:guestay/hotel_search/hotel_search_repository.dart';
import 'package:guestay/session_cubit.dart';

import 'app_navigator.dart';

import 'shared/constants/decorations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guestay',
      theme: mainThemeData,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => HotelSearchRepository()),
        ],
        child: BlocProvider(
          create: (context) =>
              SessionCubit(authRepository: context.read<AuthRepository>()),
          child: const AppNavigator(),
        ),
      ),
    );
  }
}
