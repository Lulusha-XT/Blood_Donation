import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_application_1/src/features/core/notifiers/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>(
  (ref) => UserNotifier(
    ref.watch(apiService),
  ),
);
