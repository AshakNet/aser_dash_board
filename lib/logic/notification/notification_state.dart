
import 'package:meta/meta.dart';


@immutable
abstract class SignalRState {}

class SignalRInitial extends SignalRState {}
class SendNotifi extends SignalRState {}

class SignalRConnected extends SignalRState {
  final List<String> messages;
  SignalRConnected(this.messages);
}

class SignalRDisconnected extends SignalRState {}

class SignalRMessageReceived extends SignalRState {
  final String message;
  SignalRMessageReceived(this.message);
}

