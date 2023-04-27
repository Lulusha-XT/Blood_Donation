import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/features/core/models/blood_request_model.dart';
import 'package:flutter_application_1/src/features/core/states/blood_request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodRequestNotifier extends StateNotifier<BloodRequestState> {
  BloodRequestNotifier(this._apiService) : super(BloodRequestState());
  final ApiService _apiService;

  Future<bool> createBloodRequest(BloodRequest bloodRequest) async {
    final result = await _apiService.createBloodeRequest(bloodRequest);
    return result;
  }

  Future<void> getBloodRequest() async {
    final bloodRequest = await _apiService.getBloodRequest();
    state.bloodRequest = bloodRequest!;
    print("user ${bloodRequest}");
  }

  Future<bool> updateBloodRequest(BloodRequest bloodRequest) async {
    final updatedUser = await _apiService.updateBloodRequest(bloodRequest);
    if (updatedUser) {
      final bloodRequest = await _apiService.getBloodRequest();
      state.bloodRequest = bloodRequest!;
      return true;
    }
    return false;
  }
}
