class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String? profilePicture;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
    this.profilePicture,
  });

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data()!;
  //   return UserModel(
  //     id: document.id,
  //     email: data["Email"],
  //     fullName: data["FullName"],
  //     password: data["Password"],
  //     phoneNo: data["Phone"],
  //     profilePicture: data["ProfilePicture"],
  //   );
  // }

  toJosn() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "ProfilePicture": profilePicture,
    };
  }
}
