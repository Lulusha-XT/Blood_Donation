import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_application_1/src/features/core/notifiers/blood_request_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/blood_state_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/my_request_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/user_notifier.dart';
import 'package:flutter_application_1/src/features/core/states/blood_request_state.dart';
import 'package:flutter_application_1/src/features/core/states/bloodstate.dart';
import 'package:flutter_application_1/src/features/core/states/my_request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>(
  (ref) => UserNotifier(
    ref.watch(apiService),
  ),
);
final bloodRequestProvider =
    StateNotifierProvider<BloodRequestNotifier, BloodRequestState>(
        (ref) => BloodRequestNotifier(ref.watch(apiService)));

final myRequestsProvider =
    StateNotifierProvider<MyRequestsNotifier, MyRequestState>(
        (ref) => MyRequestsNotifier(ref.watch(apiService)));

final bloodFilterStateProvider =
    StateNotifierProvider<BloodStateNotifier, BloodState>(
        (ref) => BloodStateNotifier());
