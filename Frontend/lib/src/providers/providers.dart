import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/config/config.dart';
import 'package:flutter_application_1/src/features/core/models/user_doner.dart';
import 'package:flutter_application_1/src/features/core/models/user_model.dart';
import 'package:flutter_application_1/src/features/core/notifiers/blood_request_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/blood_state_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/donation.notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/my_request_notifier.dart';
import 'package:flutter_application_1/src/features/core/notifiers/user_notifier.dart';
import 'package:flutter_application_1/src/features/core/states/blood_request_state.dart';
import 'package:flutter_application_1/src/features/core/states/bloodstate.dart';
import 'package:flutter_application_1/src/features/core/states/my_request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final userProvider = StateNotifierProvider.autoDispose<UserNotifier, User>(
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

final donationProvider =
    StateNotifierProvider.autoDispose<DonationNotifier, List<UserDoner>>(
  (ref) => DonationNotifier(ref.watch(apiService)),
);
final socketProvider = Provider<IO.Socket>((ref) {
  final socket = IO.io(Config.url, <String, dynamic>{
    'transports': ['websocket'],
  });

  socket.on('userConnected', (data) {
    ref.read(onlineUsersProvider).add(data);
  });

  socket.on('messageReceived', (data) {
    final selectedUser = ref.read(selectedUserProvider.notifier).state;
    if (data['senderId'] == selectedUser) {
      ref.read(messagesProvider).add(data['message']);
    }
  });

  return socket;
});

final onlineUsersProvider = StateProvider<List<String>>((ref) => []);
final selectedUserProvider = StateProvider<String?>((ref) => null);
final messagesProvider = StateProvider<List<String>>((ref) => []);
