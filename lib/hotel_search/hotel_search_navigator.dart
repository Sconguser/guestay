import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/guest_picker/guest_picker_view.dart';
import 'package:guestay/hotel_search/hotel_search_repository.dart';

import '../date_picker/date_picker_view.dart';
import 'hotel_search_navigator_cubit.dart';
import 'hotel_search_view.dart';

class HotelSearchNavigator extends StatelessWidget {
  const HotelSearchNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    return BlocProvider(
        create: (context) => HotelSearchNavigatorCubit(
            hotelSearchRepository: hotelSearchRepository),
        // hotelSearchRepository: context.read()<HotelSearchRepository>()),
        child:
            BlocBuilder<HotelSearchNavigatorCubit, HotelSearchNavigatorState>(
                builder: (context, state) {
          return Navigator(
            pages: [
              MaterialPage(child: HotelSearchView()),
              if (state == HotelSearchNavigatorState.guestPicker)
                MaterialPage(child: GuestPicker()),

              /// show guestPicker
              ///
              if (state == HotelSearchNavigatorState.datepicker)
                MaterialPage(child: DatePickerView()),

              /// showdatepicker
            ],
            onPopPage: (route, result) {
              context.read<HotelSearchNavigatorCubit>().showDefaultView();
              return route.didPop(result);
            },
          );
        }));
  }
}
