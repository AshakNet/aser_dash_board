import 'package:flutter/cupertino.dart';

import 'notification_content/ntification_content.dart';

class NotificationPage extends StatelessWidget {
   NotificationPage({super.key});
  PageController notification = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: notification,
      children: [
        NotificationContent(notificationContent: notification,)
      ],
    );
  }
}
