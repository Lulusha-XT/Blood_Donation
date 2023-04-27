import 'package:flutter_application_1/src/features/core/models/blood_request_model.dart';

class BloodRequestState {
  BloodRequestState({
    this.bloodRequest,
    this.isLoading = false,
    this.isHidePassword = true,
  });

  BloodRequest? bloodRequest;
  bool isLoading;
  bool isHidePassword;

  BloodRequestState copyWith({
    BloodRequest? bloodRequest,
    bool? isLoading,
    bool? isHidePassword,
  }) {
    return BloodRequestState(
      bloodRequest: bloodRequest ?? this.bloodRequest,
      isLoading: isLoading ?? this.isLoading,
      isHidePassword: isHidePassword ?? this.isHidePassword,
    );
  }
}
