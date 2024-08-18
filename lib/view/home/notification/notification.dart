import 'package:aser_dash_board/view/home/notification/notification_content/ntification_content.dart';
import 'package:flutter/cupertino.dart';

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
