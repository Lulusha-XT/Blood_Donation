import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this._apiService)
      : super(UserModel(bloodType: '', email: '', fullName: '', phoneNo: ''));
  final ApiService _apiService;
  Future<void> getUser() async {
    final user = await _apiService.getUsersData();
    state = user!;
    print("user ${user}");
  }

  Future<bool> updateUserInfo(UserModel user) async {
    final updatedUser = await _apiService.updtaProfile(user);
    if (updatedUser) {
      final user = await _apiService.getUsersData();
      state = user!;
      return true;
    }
    return false;
  }
}
