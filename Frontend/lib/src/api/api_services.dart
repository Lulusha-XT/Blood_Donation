import 'dart:convert';

import 'package:flutter_application_1/src/config/config.dart';
import 'package:flutter_application_1/src/features/models/login_response_model.dart';
import 'package:flutter_application_1/src/utils/shared_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => ApiService());

class ApiService {
  static var client = http.Client();

  static Future<bool> registerUser(String fullName, String bloodType,
      String email, String phoneNo, String password) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.registerApi);
    var response = await client.post(url,
        headers: requestHeader,
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "password": password,
          "phoneNo": phoneNo,
          "bloodType": bloodType,
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};

    var url = Uri.http(
      Config.apiURL,
      Config.loginApi,
    );
    var respons = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode({"email": email, "password": password}),
    );

    if (respons.statusCode == 200) {
      await SharedService.setLoginDetail(loginResponseJson(respons.body));
      return true;
    } else {
      return false;
    }
  }
}
