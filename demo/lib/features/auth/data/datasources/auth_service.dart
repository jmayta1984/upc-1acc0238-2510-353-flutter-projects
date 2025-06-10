import 'dart:convert';
import 'dart:io';

import 'package:demo/core/constants/endpoints.dart';
import 'package:demo/features/auth/data/models/user_dto.dart';
import 'package:demo/features/auth/data/models/user_request_dto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserDto> login(String username, String password) async {
    final Uri uri = Uri.parse(Endpoints.authBaseUrl);
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(UserRequestDto(username: username, password: password)),
    );

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return UserDto.fromJson(json);
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
