import 'package:bloc/bloc.dart';
import 'package:guestay/auth/auth_cubit.dart';
import 'package:guestay/auth/auth_repository.dart';
import 'package:guestay/session_cubit.dart';
import 'package:guestay/session_event.dart';
import 'package:guestay/session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;
  final SessionCubit sessionCubit;
  SessionBloc(
      {required this.authRepository,
      required this.authCubit,
      required this.sessionCubit})
      : super(SessionState()) {
    on<SearchBarTextChanged>(
        (event,emit)=>emit(state.copyWith(searchBarText:event.searchBarText));
    )
  }
}
