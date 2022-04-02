import 'package:guestay/auth/form_submission_status.dart';

import 'auth/user.dart';

class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  User user = User();
  final String searchBarText;
  final FormSubmissionStatus? formSubmissionStatus;
  Authenticated(
      {required this.user,
      this.searchBarText = '',
      this.formSubmissionStatus = const InitialFormStatus()});
  Authenticated copyWith(
      {String? searchBarText,
      FormSubmissionStatus? formSubmissionStatus,
      User? user}) {
    return Authenticated(
        searchBarText: searchBarText ?? this.searchBarText,
        user: user ?? this.user,
        formSubmissionStatus:
            formSubmissionStatus ?? this.formSubmissionStatus);
  }
}
