import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBW_vQZ1aBROdtWwzt1B6NZC30HtqesNEE';
    var response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
  }
}
