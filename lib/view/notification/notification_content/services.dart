
import 'dart:io';

import 'package:aser_dash_board/main.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRServicem {
  late HubConnection _hubConnection;
  final storage = const FlutterSecureStorage();

  final String _serverUrl = "http://ashal.runasp.net/notificationHub"; // Replace with your SignalR server URL


  Future<void> initPlatformDartServer() async {
    Future<String?> tokenKey() async {
      //var token = await storage.read(key: "token");
      var token = "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoibWFobW91ZCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkFkbWluMTIzQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiMDlkOTE0ODktY2I5NS00YzNlLWE1MTUtMjc1MWU2NTQyNmViIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3MjcyNTE4NTksImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyMTcvIiwiYXVkIjoiQXNhclNlY3VyZWRBcGlVc2VycyJ9.r5IkiFGrl29wOeNCtkVOVrfG-cItqkIJEER_NqrBW4g";
      return token;
    }

    _hubConnection = HubConnectionBuilder()
        .withUrl(
      '${EndPoint.baseUrl}/notificationHub',
      HttpConnectionOptions(
        accessTokenFactory: tokenKey,
        client: IOClient(
          HttpClient()
            ..badCertificateCallback = (x, y, z) {
              return true;
            },
        ),
        logMessageContent: true,
        withCredentials: true,
      ),
    )
        .withAutomaticReconnect()
        .build();

  await  _hubConnection.start()!.then((value) {

      print("_hubConnection.connectionId${_hubConnection.connectionId}");
       _hubConnection.on(
        "ReceiveNotification",
            (arguments) {
              if (arguments != null && arguments.isNotEmpty) {
                print('Received notification: ${arguments[0]}');
              } else {
                print('No arguments received');
              }

        },
      );
      print("object");

    });

    _hubConnection.onclose((exception) {
      initPlatformDartServer();
    });
    _hubConnection.onreconnecting((exception) {
      print('Error');
      print(exception);
    });

    //await _hubConnection.invoke('ReceiveNotification', args: ["79f2aa3c-afe8-4844-b9f1-07003dda807e","mahmoud zahran"]);
  }

  // Future<void> startConnection() async {
  //   await _hubConnection.start();
  //   print("Connection started");
  // }
  //
  // void stopConnection() {
  //   _hubConnection.stop();
  //   print("Connection stopped");
  // }
  //
  // void onReceiveMessage(Function(dynamic message) callback) {
  //   _hubConnection.on("ReceiveMessage", (message) {
  //     callback(message![0]);
  //   });
  // }
  //
  // Future<void> sendMessage(String message) async {
  //   if (_hubConnection.state == HubConnectionState.connected) {
  //     await _hubConnection.invoke("SendMessage", args: <Object>[message]);
  //   }
  // }
}