import 'dart:convert';

import 'package:flutter_application_1/src/config/config.dart';
import 'package:flutter_application_1/src/features/authentication/models/login_response_model.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
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

  Future<UserModel?> getUsersData() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeader = {
      "Content-Type": "application/json",
      'Authorization': 'Basic ${loginDetails!.data.token.toString()}',
    };

    var url = Uri.http(
      Config.apiURL,
      "${Config.getUserById}${loginDetails.data.userId.toString()}",
    );

    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);

      UserModel user = UserModel.fromJson(data["data"]);

      return user;
    } else {
      return null;
    }
  }

  Future<bool?> updtaProfile(UserModel user) async {
    var lodingDetail = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${lodingDetail?.data.token.toString()}'
    };
    var url = Uri.http(Config.apiURL, Config.updateUserById);
    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode({user.toJson()}),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      // navigatorKey.currentState
      //     ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return false;
    }
    return null;
  }
}
