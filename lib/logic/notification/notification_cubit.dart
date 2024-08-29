// // // // import 'package:bloc/bloc.dart';
// // // // import 'package:signalr_core/signalr_core.dart';
// // // //
// // // // class NotificationState {
// // // //   final List<String> notifications;
// // // //   final HubConnectionState connectionState;
// // // //
// // // //   NotificationState({required this.notifications, required this.connectionState});
// // // // }
// // // //
// // // // class NotificationCubit extends Cubit<NotificationState> {
// // // //   final HubConnection _hubConnection;
// // // //
// // // //   NotificationCubit(this._hubConnection)
// // // //       : super(NotificationState(notifications: [], connectionState: HubConnectionState.disconnected));
// // // //
// // // //   Future<void> startConnection() async {
// // // //
// // // //
// // // //         await _hubConnection.start();
// // // //         _hubConnection.on('ReceiveNotification', (message) {
// // // //           final updatedNotifications = List<String>.from(state.notifications)
// // // //             ..add(message?.first ?? 'New notification');
// // // //           emit(NotificationState(
// // // //             notifications: updatedNotifications,
// // // //             connectionState: _hubConnection.state ?? HubConnectionState.disconnected,
// // // //           ));
// // // //         });
// // // //         print(state.notifications.length);
// // // //         emit(NotificationState(
// // // //           notifications: state.notifications,
// // // //           connectionState: _hubConnection.state ?? HubConnectionState.disconnected,
// // // //         ));
// // // //
// // // //
// // // //
// // // //   }
// // // //
// // // //   Future<void> stopConnection() async {
// // // //     if (_hubConnection.state != HubConnectionState.disconnected) {
// // // //       try {
// // // //         await _hubConnection.stop();
// // // //         emit(NotificationState(
// // // //           notifications: state.notifications,
// // // //           connectionState: _hubConnection.state ?? HubConnectionState.disconnected,
// // // //         ));
// // // //       } catch (e) {
// // // //         print('Error stopping connection: $e');
// // // //       }
// // // //     }
// // // //   }
// // // // }
// // // import 'package:aser_dash_board/logic/notification/siganr/signal.dart';
// // // import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:signalr_core/signalr_core.dart';
// // //
// // // import 'notification_state.dart';
// // //
// // // class SignalRCubit extends Cubit<SignalRState> {
// // //   // final SignalRService _signalRService;
// // //   HubConnection? _connection;
// // //   final List<String> _messages = [];
// // //
// // //   List<String> get messages => List.unmodifiable(_messages);
// // //
// // //
// // //   SignalRCubit() : super(SignalRInitial());
// // //
// // //   Future<void> connect() async {
// // //     try {
// // //       const url = 'http://ashal.runasp.net/NotificationHub';
// // //       _connection = HubConnectionBuilder()
// // //           .withUrl(url)
// // //           .build();
// // //
// // //       _connection?.onclose((error) {
// // //         print("Connection closed with error: $error");
// // //         // Optionally, handle reconnection here
// // //       });
// // //
// // //       // Handle incoming messages
// // //       _connection?.on('ReceiveNotification', (message) {
// // //
// // //         print("message of notification $message");
// // //         // if (message != null && message.isNotEmpty) {
// // //         //   print("Received message: $message");  // Debug print
// // //         //   // Assuming message is a list of strings
// // //         //   final notifications = List<String>.from(message);
// // //         //   _messages.addAll(notifications);
// // //         //   emit(SignalRConnected(_messages)); // Update state with new messages
// // //         // }
// // //       });
// // //
// // //       await _connection?.start();
// // //       print("SignalR connection established");
// // //       emit(SignalRConnected(_messages));
// // //     } catch (e) {
// // //       print("Connection error: $e");  // Debug print
// // //       emit(SignalRDisconnected());
// // //     }
// // //   }
// // //
// // //
// // //
// // //   void sendMessage(String message) {
// // //     void sendNotification(String message) {
// // //       if (_connection?.state == HubConnectionState.connected) {
// // //         _connection?.invoke('SendNotification', args: [message]);
// // //         emit(SendNotifi());
// // //       } else {
// // //         print("Cannot send notification, not connected.");
// // //       }
// // //     }
// // //
// // //   }
// // //
// // //   void onMessageReceived(String message) {
// // //     emit(SignalRMessageReceived(message));
// // //   }
// // // }
// //
// //
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:signalr_core/signalr_core.dart';
// //
// // class NotificationCubit extends Cubit<List<String>> {
// //   final HubConnection _hubConnection;
// //   NotificationCubit(this._hubConnection) : super([]);
// //
// //   void connect() {
// //     _hubConnection.on('ReceiveNotification', (message) {
// //       final currentState = List<String>.from(state);
// //       currentState.add(message as String);
// //       print(message);
// //       emit(currentState);
// //     });
// //
// //     _hubConnection.start();
// //   }
// //
// //   void disconnect() {
// //     _hubConnection.stop();
// //   }
// // }
//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class NotificationCubit extends Cubit<List<String>> {
//   final HubConnection _hubConnection;
//   bool _isConnecting = false;
//
//   NotificationCubit(this._hubConnection) : super([]);
//
//   Future<void> connect() async {
//     if (_hubConnection.state == HubConnectionState.connected) {
//       // Already connected
//       return;
//     }
//
//     if (_isConnecting) {
//       // Already trying to connect
//       return;
//     }
//
//     _isConnecting = true;
//
//     try {
//       await _hubConnection.start();
//       _hubConnection.on('ReceiveNotification', (message) {
//         final currentState = List<String>.from(state);
//         currentState.add(message as String);
//         emit(currentState);
//       });
//     } catch (e) {
//       // Handle connection errors
//       print('Error connecting to SignalR hub: $e');
//     } finally {
//       _isConnecting = false;
//     }
//   }
//
//   Future<void> disconnect() async {
//     if (_hubConnection.state == HubConnectionState.disconnected) {
//       // Already disconnected
//       return;
//     }
//
//     try {
//       await _hubConnection.stop();
//     } catch (e) {
//       // Handle disconnection errors
//       print('Error disconnecting from SignalR hub: $e');
//     }
//   }
// }
