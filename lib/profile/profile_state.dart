import 'package:flutter/cupertino.dart';
import 'package:guestay/auth/form_submission_status.dart';

import '../auth/user.dart';

class ProfileState {
  final User user;
  final bool isCurrentUser;
  final String? avatarPath;
  final String? userDescription;

  String? get username => user.username;

  String? get email => user.email;

  final FormSubmissionStatus formSubmissionStatus;

  ProfileState(
      {required User user,
      required bool isCurrentUser,
      String? avatarPath,
      String? userDescription,
      this.formSubmissionStatus = const InitialFormStatus()})
      : this.user = user,
        this.isCurrentUser = isCurrentUser,
        this.avatarPath = avatarPath,
        this.userDescription = userDescription ?? user.name;

  ProfileState copyWith(
      {User? user,
      String? avatarPath,
      String? userDescription,
      FormSubmissionStatus? formSubmissionStatus}) {
    return ProfileState(
        user: user ?? this.user,
        isCurrentUser: this.isCurrentUser,
        avatarPath: avatarPath ?? this.avatarPath,
        formSubmissionStatus:
            formSubmissionStatus ?? this.formSubmissionStatus);
  }
}
