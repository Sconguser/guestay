import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/home/home_navigator_cubit.dart';

import '../profile/provile_view.dart';
import 'home_view.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNavigatorCubit(),
      child: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
          builder: (context, state) {
        return Navigator(
          pages: [
            MaterialPage(child: (HomeView())),
            if (state == HomeNavigatorState.profile)
              MaterialPage(child: ProfileView()),
          ],
          onPopPage: (route, result) {
            context.read<HomeNavigatorCubit>().showHome();
            return route.didPop(result);
          },
        );
      }),
    );
  }
}
