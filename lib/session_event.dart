abstract class SessionEvent {}

class SearchBarTextChanged extends SessionEvent {
  final String searchBarText;

  SearchBarTextChanged({required this.searchBarText});
}
