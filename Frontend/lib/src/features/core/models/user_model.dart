class UserModel {
  late final String? id;
  late final String fullName;
  late final String email;
  late final String phoneNo;
  final String password;
  late final String bloodType;
  late final String? profilePicture;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.bloodType,
    required this.fullName,
    required this.phoneNo,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["userId"],
      email: json["email"],
      fullName: json["fullName"],
      phoneNo: json["phoneNo"],
      password: json["password"],
      bloodType: json["bloodType"],
      profilePicture: json["profilePicture"],
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
    };
  }
}
