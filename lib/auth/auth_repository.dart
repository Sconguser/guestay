import 'dart:convert';
import 'package:guestay/auth/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  late User _user;
  User get user => _user;
  final String url = 'morning-coast-93264.herokuapp.com';
  final String urlAddition = '/users/sign_in.json';
  Future<User> login({required String email, required String password}) async {
    try {
      final response = await http.post(Uri.https(url, urlAddition),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'user': {
              'email': email,
              'password': password,
            }
          }));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _user = User.fromJson(response.headers, jsonDecode(response.body));
        return user;
      } else {
        throw Exception('Could not authorize');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
