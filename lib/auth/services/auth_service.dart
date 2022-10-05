import 'dart:convert';
import 'dart:io';

import 'package:flutter_login/service_locator.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  Future<User> logIn(User user) async {
    final response = await getIt.get<http.Client>().post(
          Uri.parse('https://example.com/login'),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: user.toJson(),
        );
    if (response.statusCode == HttpStatus.ok) {
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      return User.fromJson(jsonMap);
    } else {
      throw Exception('Failed to login user');
    }
  }
}
