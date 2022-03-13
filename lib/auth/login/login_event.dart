abstract class LoginEvent {}

class LoginUserEmailChanged extends LoginEvent {
  final String userEmail;

  LoginUserEmailChanged({required this.userEmail});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}
