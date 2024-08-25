
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRService {
  HubConnection? _connection;

  Future<void> connect() async {
    const url = '${EndPoint.baseUrl}/NotificationHub';
    _connection = HubConnectionBuilder()
        .withUrl(url)
        .build();

    _connection?.on('ReceiveNotification', (message) {
      // Handle incoming messages
    });

    await _connection?.start();
  }

  void sendMessage(String message) {
    _connection?.invoke('SendMessage', args: [message]);
  }
}
