import 'package:flutter/cupertino.dart';

import 'notification_content/ntification_content.dart';
import 'notification_content/sinngelt page.dart';

class NotificationPage extends StatelessWidget {
   NotificationPage({super.key});
  PageController notification = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: notification,
      children: [
        SignalRPage()
      ],
    );
  }
}
