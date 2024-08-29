import 'package:aser_dash_board/view/notification/notification_content/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignalRPage extends StatefulWidget {
  @override
  _SignalRPageState createState() => _SignalRPageState();
}

class _SignalRPageState extends State<SignalRPage> {
  final SignalRServicem _signalRService = SignalRServicem();
  List<String> _messages = [];
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startSignalR();
  }

  void _startSignalR() async {
    await _signalRService.initPlatformDartServer();

  }

  @override
  // void dispose() {
  //   _signalRService.stopConnection();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter SignalR Chat"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: "User Name"),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: "Enter your message"),
            ),
            SizedBox(height: 10),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) => Text(_messages[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}