import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/app/shared/values.dart';

class AuthServices {
  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: headerContent,
        body: jsonEncode(
          {
            'name': name,
            'username': username,
            'email': email,
            'password': password,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        String token = 'Bearer ${data['access_token']}';
        saveDataToStorage('user', data['user']);
        saveDataToStorage('token', token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: headerContent,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        String token = 'Bearer ${data['access_token']}';
        saveDataToStorage('user', data['user']);
        saveDataToStorage('token', token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future logout() async {
    final token = getDataFromStorage('token');
    var response = await http.post(Uri.parse('$baseUrl/logout'), headers: {
      'Content-Type': 'application/json',
      'Authorization': token,
    });
    if (response.statusCode == 200) {
      removeDataFromStorage('user');
      removeDataFromStorage('token');
      return true;
    } else {
      return false;
    }
  }

  saveDataToStorage(String key, dynamic value) {
    final box = GetStorage();
    return box.write(key, value);
  }

  getDataFromStorage(String key) {
    final box = GetStorage();
    return box.read(key);
  }

  removeDataFromStorage(String key) {
    final box = GetStorage();
    return box.remove(key);
  }
}
