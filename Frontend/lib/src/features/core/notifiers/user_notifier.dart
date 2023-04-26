import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoNotifier extends StateNotifier<UserModel> {
  UserInfoNotifier()
      : super(UserModel(bloodType: '', email: '', fullName: '', phoneNo: ''));

  void updateUserInfo(UserModel newUserInfo) {
    state = newUserInfo;
  }
}
