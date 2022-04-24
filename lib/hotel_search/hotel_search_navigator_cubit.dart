import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/date_picker/date_picker_cubit.dart';
import 'package:guestay/hotel_search/hotel_search_repository.dart';

enum HotelSearchNavigatorState { defaultView, guestPicker, datepicker }

class HotelSearchNavigatorCubit extends Cubit<HotelSearchNavigatorState> {
  final HotelSearchRepository hotelSearchRepository;
  HotelSearchNavigatorCubit({required this.hotelSearchRepository})
      : super(HotelSearchNavigatorState.defaultView);
  // HotelSearchNavigatorCubit() : super(HotelSearchNavigatorState.defaultView);
  late DatePickerCubit datePickerCubit =
      DatePickerCubit(hotelSearchRepository: hotelSearchRepository);

  void confirmChosenDates(DateTime startDate, DateTime endDate) {
    hotelSearchRepository.startDate = startDate;
    hotelSearchRepository.endDate = endDate;
    showDefaultView();
  }

  void confirmChosenGuests(int adults, int children, int pets, int infants) {
    hotelSearchRepository.children = children;
    hotelSearchRepository.adults = adults;
    hotelSearchRepository.pets = pets;
    hotelSearchRepository.infants = infants;
    showDefaultView();
  }

  void showGuestPicker() => emit(HotelSearchNavigatorState.guestPicker);
  void showDatePicker() => emit(HotelSearchNavigatorState.datepicker);
  void showDefaultView() => emit(HotelSearchNavigatorState.defaultView);
}
