import 'package:flutter_application_1/src/config/config.dart';

class UserModel {
  String? id;
  String fullName;
  String email;
  String phoneNo;
  String? password;
  String bloodType;
  String? profilePicture;
  String? medicalCondition;
  String? dateOfBirth;

  UserModel({
    this.id,
    required this.email,
    this.password,
    required this.bloodType,
    required this.fullName,
    required this.phoneNo,
    this.profilePicture,
    this.medicalCondition,
    this.dateOfBirth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["userId"],
      fullName: json["fullName"],
      email: json["email"],
      phoneNo: json["phoneNo"],
      password: json["password"],
      bloodType: json["bloodType"],
      profilePicture: json["profilePicture"],
      medicalCondition: json["medicalCondition"],
      dateOfBirth: json["dateOfBirth"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": id,
      "email": email,
      "fullName": fullName,
      "phoneNo": phoneNo,
      "password": password,
      "bloodType": bloodType,
      "profilePicture": profilePicture,
      "medicalCondition": medicalCondition,
      "dateOfBirth": dateOfBirth,
    };
  }
}

extension UserModelExt on UserModel {
  String get fullImagePath =>
      profilePicture != null ? Config.imageURL + profilePicture! : '';
}
