import 'package:guestay/auth/form_submission_status.dart';

class LoginState {
  final String? userEmail;
  bool get isValidUsername => userEmail != null && userEmail!.length > 6;
  final String? password;
  bool get isValidPassword => password != null && password!.length > 6;
  final FormSubmissionStatus? formSubmissionStatus;

  LoginState({
    this.userEmail,
    this.password,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? userEmail,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
