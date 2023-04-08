import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider<UserModel?>(
  (ref) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getUsersData();
  },
);
