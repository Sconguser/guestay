abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String userEmail;

  LoginUsernameChanged({required this.userEmail});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}
