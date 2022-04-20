import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guestay/profile/profile_event.dart';
import 'package:guestay/profile/profile_state.dart';

import '../auth/user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required User user, required bool isCurrentUser})
      : super(ProfileState(user: user, isCurrentUser: isCurrentUser)) {
    on<ProvideImagePath>(
        (event, emit) => emit(state.copyWith(avatarPath: event.avatarPath)));
    on<ChangeAvatarRequest>((event, emit) => null);
    on<OpenImagePicker>((event, emit) => null);
    on<ProfileDescriptionChanged>((event, emit) =>
        emit(state.copyWith(userDescription: event.userDescription)));
    on<SaveProfileChanges>((event, emit) => null);
  }
}
