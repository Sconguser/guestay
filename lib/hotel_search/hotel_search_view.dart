import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:guestay/home/home_navigator_cubit.dart';
import 'package:guestay/hotel_search/hotel_search_navigator.dart';
import 'package:guestay/hotel_search/hotel_search_navigator_cubit.dart';
import 'package:guestay/hotel_search/hotel_search_repository.dart';
import 'package:guestay/shared/constants/background.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../shared/constants/colours.dart';

class HotelSearchView extends StatelessWidget {
  const HotelSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: loginBackGroundDecoration,
        child: Column(
          children: [
            SizedBox(height: 20),
            _cityName(hotelSearchRepository.destination, context),
            SizedBox(height: 20),
            _datePickerButton(context),
            SizedBox(height: 20),
            _guestsPickerButton(context),
            SizedBox(height: 20),
            _pickedDates(context),
            SizedBox(height: 20),
            _pickedGuests(context),
            SizedBox(height: 100),
            _debugButton(context)
          ],
        ),
      ),
    );
    // return DatePickerDialog(
    //     initialDate: DateTime.now(), firstDate: D, lastDate: DateTime.now());
  }

  Widget _cityName(String? cityName, BuildContext context) {
    cityName ??= 'Where to?';
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // padding: EdgeInsets.fromLTRB(0, 20, 0, bottom),
        width: 400,
        height: 50,
        color: primaryColor,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                context.read<HomeNavigatorCubit>().showHome();
              },
              // alignment: ,
            ),
            SizedBox(width: 90),
            Text(
              cityName,
              style: TextStyle(height: 2, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _datePickerButton(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: primaryColor, elevation: 0),
            onPressed: () {
              _datePickerButtonPressed(context);
            },
            child: Text(
              'Check-In and Check-out',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  void _datePickerButtonPressed(BuildContext context) {
    context.read<HotelSearchNavigatorCubit>().showDatePicker();
  }

  Widget _guestsPickerButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: primaryColor, elevation: 0),
            onPressed: () {
              _guestPickerButtonPressed(context);
            },
            child: Text(
              'Guests',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  void _guestPickerButtonPressed(BuildContext context) {
    context.read<HotelSearchNavigatorCubit>().showGuestPicker();
  }

  Widget _debugButton(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: primaryColor, elevation: 0),
            onPressed: () {
              print(hotelSearchRepository.startDate);
              print(hotelSearchRepository.endDate);
              print(hotelSearchRepository.adults);
            },
            child: Text(
              'Debug',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  Widget _pickedDates(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    if (hotelSearchRepository.startDate != null) {
      return Visibility(
        visible: hotelSearchRepository.startDate != null,
        child: Row(
          children: [
            Text(hotelSearchRepository.startDate!.day.toString()),
            SizedBox(width: 10),
            Text(hotelSearchRepository.endDate!.day.toString())
          ],
        ),
      );
    } else {
      return SizedBox(height: 0);
    }
  }

  Widget _pickedGuests(BuildContext context) {
    HotelSearchRepository hotelSearchRepository =
        context.read<HotelSearchRepository>();
    if (hotelSearchRepository.adults != null &&
        hotelSearchRepository.children != null &&
        hotelSearchRepository.infants != null &&
        hotelSearchRepository.pets != null) {
      return Visibility(
        visible: true,
        child: Column(
          children: [
            Text('Adults: ${hotelSearchRepository.adults.toString()}'),
            Text('Children: ${hotelSearchRepository.children.toString()}'),
            Text('Infants: ${hotelSearchRepository.infants.toString()}'),
            Text('Pets: ${hotelSearchRepository.pets.toString()}'),
          ],
        ),
      );
    } else {
      return SizedBox(height: 1);
    }
  }
}
