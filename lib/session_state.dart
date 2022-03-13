import 'auth/user.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  User user = User();

  Authenticated({required this.user});
}
