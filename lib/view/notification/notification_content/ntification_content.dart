// // // // // import 'package:aser_dash_board/constant/color.dart';
// // // // // import 'package:aser_dash_board/logic/notification/notification_cubit.dart';
// // // // // import 'package:aser_dash_board/logic/notification/notification_state.dart';
// // // // // import 'package:aser_dash_board/logic/notification/siganr/signal.dart';
// // // // // import 'package:aser_dash_board/main.dart';
// // // // // import 'package:aser_dash_board/widgets/customText/customtext.dart';
// // // // // import 'package:flutter/cupertino.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // //
// // // // // class NotificationContent extends StatelessWidget {
// // // // //
// // // // //   PageController notificationContent =PageController();
// // // // //    NotificationContent({super.key,required this.notificationContent});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final cubit = context.read<NotificationCubit>();
// // // // //
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: const Text('Notifications')),
// // // // //       body: BlocBuilder<NotificationCubit, List<String>>(
// // // // //         builder: (context, notifications) {
// // // // //           return ListView.builder(
// // // // //             itemCount: notifications.length,
// // // // //             itemBuilder: (context, index) {
// // // // //               return ListTile(title: Text(notifications[index]));
// // // // //             },
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //       floatingActionButton: FloatingActionButton(
// // // // //         onPressed: () {
// // // // //           print("df");
// // // // //           cubit.connect();
// // // // //         },
// // // // //         child: const Icon(Icons.connect_without_contact,color: Colors.black,),
// // // // //       ),
// // // // //     );
// // // // //
// // // // //
// // // // //
// // // // //
// // // // //     // return Scaffold(
// // // // //     //   body: SingleChildScrollView(
// // // // //     //     child: Column(
// // // // //     //       children: [
// // // // //     //         Padding(
// // // // //     //           padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
// // // // //     //           child: Row(
// // // // //     //             children: [
// // // // //     //               CustomText(
// // // // //     //                   text: "Home",
// // // // //     //                   size: 12.sp,
// // // // //     //                   color: darkGrey,
// // // // //     //                   fontWeight: FontWeight.w600),
// // // // //     //               SizedBox(
// // // // //     //                 width: 5.w,
// // // // //     //               ),
// // // // //     //               GestureDetector(
// // // // //     //                 onTap: (){
// // // // //     //                   notificationContent.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
// // // // //     //                 },
// // // // //     //                 child: CustomText(
// // // // //     //                     text: "Notifications<<",
// // // // //     //                     size: 12.sp,
// // // // //     //                     color: black,
// // // // //     //                     fontWeight: FontWeight.w700),
// // // // //     //               ),
// // // // //     //               SizedBox(
// // // // //     //                 width: 5.w,
// // // // //     //               ),
// // // // //     //
// // // // //     //             ],
// // // // //     //           ),
// // // // //     //         ),
// // // // //     //
// // // // //     //         SizedBox(height: 40.h,),
// // // // //     //
// // // // //     //         Padding(
// // // // //     //           padding:  EdgeInsets.symmetric(horizontal: 40.w),
// // // // //     //           child: Row(
// // // // //     //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //     //             children: [
// // // // //     //               Expanded(
// // // // //     //                 flex: 60,
// // // // //     //                 child: Container(
// // // // //     //                   decoration: BoxDecoration(
// // // // //     //                     borderRadius: BorderRadiusDirectional.circular(15.r),
// // // // //     //                     color: white,
// // // // //     //
// // // // //     //                   ),child: Padding(
// // // // //     //                     padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 30.h),
// // // // //     //                     child: Column(
// // // // //     //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // //     //                     children: [
// // // // //     //
// // // // //     //
// // // // //     //                       CustomText(text: "Notifications", size: 20.sp, color: black, fontWeight: FontWeight.w600),
// // // // //     //
// // // // //     //                       SizedBox(height: 10.h,),
// // // // //     //                       CustomText(text: "Target", size: 20.sp, color: black, fontWeight: FontWeight.w600),
// // // // //     //                       SizedBox(height: 10.h,),
// // // // //     //
// // // // //     //                       SizedBox(
// // // // //     //                         width:  600.w,
// // // // //     //                         child: TextFormField(
// // // // //     //                           controller: TextEditingController(),
// // // // //     //                           maxLines: 1,minLines: 1,
// // // // //     //                           validator: (value) {},
// // // // //     //                           style: TextStyle(
// // // // //     //                             fontSize: 16.sp,
// // // // //     //                             color: Colors.black,
// // // // //     //                           ),
// // // // //     //                           decoration: InputDecoration(
// // // // //     //
// // // // //     //                             //filled: true,
// // // // //     //
// // // // //     //                             fillColor: Color.fromRGBO(247, 247, 247, 1),
// // // // //     //                             contentPadding: EdgeInsets.symmetric(
// // // // //     //                               horizontal: 13.w,
// // // // //     //                               vertical: 5.h,
// // // // //     //                             ),
// // // // //     //                             constraints: BoxConstraints(
// // // // //     //                               minHeight: 64.h,
// // // // //     //                               minWidth: 372.w,
// // // // //     //                             ),
// // // // //     //
// // // // //     //                             hintStyle: TextStyle(
// // // // //     //                                 fontSize: 16.sp,
// // // // //     //                                 color: darkGrey,
// // // // //     //                                 fontWeight: FontWeight.w400
// // // // //     //                             ),
// // // // //     //                             hintText: 'Search',
// // // // //     //                             border: OutlineInputBorder(
// // // // //     //                               borderRadius: BorderRadius.circular(8.r),
// // // // //     //                               borderSide: BorderSide(color: orange),
// // // // //     //                             ),
// // // // //     //                           ),
// // // // //     //                         ),
// // // // //     //                       ),
// // // // //     //
// // // // //     //                       CustomText(text: "Notification Title", size: 14.sp, color: black, fontWeight: FontWeight.w700),
// // // // //     //
// // // // //     //                       SizedBox(height: 5.h,),
// // // // //     //                       SizedBox(
// // // // //     //                         width:  600.w,
// // // // //     //                         child: TextFormField(
// // // // //     //                           controller: TextEditingController(),
// // // // //     //                           maxLines: 1,minLines: 1,
// // // // //     //                           validator: (value) {},
// // // // //     //                           style: TextStyle(
// // // // //     //                             fontSize: 16.sp,
// // // // //     //                             color: Colors.black,
// // // // //     //                           ),
// // // // //     //                           decoration: InputDecoration(
// // // // //     //
// // // // //     //                             //filled: true,
// // // // //     //
// // // // //     //                             fillColor: Color.fromRGBO(247, 247, 247, 1),
// // // // //     //                             contentPadding: EdgeInsets.symmetric(
// // // // //     //                               horizontal: 13.w,
// // // // //     //                               vertical: 5.h,
// // // // //     //                             ),
// // // // //     //                             constraints: BoxConstraints(
// // // // //     //                               minHeight: 64.h,
// // // // //     //                               minWidth: 372.w,
// // // // //     //                             ),
// // // // //     //
// // // // //     //                             hintStyle: TextStyle(
// // // // //     //                                 fontSize: 16.sp,
// // // // //     //                                 color: darkGrey,
// // // // //     //                                 fontWeight: FontWeight.w400
// // // // //     //                             ),
// // // // //     //                             hintText: 'Title',
// // // // //     //                             border: OutlineInputBorder(
// // // // //     //                               borderRadius: BorderRadius.circular(8.r),
// // // // //     //                               borderSide: BorderSide(color: orange),
// // // // //     //                             ),
// // // // //     //                           ),
// // // // //     //                         ),
// // // // //     //                       ),
// // // // //     //
// // // // //     //                       CustomText(text: "Notification Content", size: 14.sp, color: black, fontWeight: FontWeight.w700),
// // // // //     //
// // // // //     //                       SizedBox(height: 5.h,),
// // // // //     //                       SizedBox(
// // // // //     //                         width:  600.w,
// // // // //     //                         child: TextFormField(
// // // // //     //                           controller: TextEditingController(),
// // // // //     //                           maxLines: 6,minLines: 5,
// // // // //     //                           validator: (value) {},
// // // // //     //                           style: TextStyle(
// // // // //     //                             fontSize: 16.sp,
// // // // //     //                             color: Colors.black,
// // // // //     //                           ),
// // // // //     //                           decoration: InputDecoration(
// // // // //     //
// // // // //     //                             //filled: true,
// // // // //     //
// // // // //     //                             fillColor: Color.fromRGBO(247, 247, 247, 1),
// // // // //     //                             contentPadding: EdgeInsets.symmetric(
// // // // //     //                               horizontal: 13.w,
// // // // //     //                               vertical: 5.h,
// // // // //     //                             ),
// // // // //     //                             constraints: BoxConstraints(
// // // // //     //                               minHeight: 64.h,
// // // // //     //                               minWidth: 372.w,
// // // // //     //                             ),
// // // // //     //
// // // // //     //
// // // // //     //                             hintStyle: TextStyle(
// // // // //     //                                 fontSize: 16.sp,
// // // // //     //                                 color: darkGrey,
// // // // //     //                                 fontWeight: FontWeight.w400
// // // // //     //                             ),
// // // // //     //                             hintText: 'Placeholder',
// // // // //     //                             border: OutlineInputBorder(
// // // // //     //                               borderRadius: BorderRadius.circular(8.r),
// // // // //     //                               borderSide: BorderSide(color: orange),
// // // // //     //                             ),
// // // // //     //                           ),
// // // // //     //                         ),
// // // // //     //                       ),
// // // // //     //
// // // // //     //                       SizedBox(height: 20.h,),
// // // // //     //
// // // // //     //                       Row(
// // // // //     //                         mainAxisAlignment: MainAxisAlignment.end,
// // // // //     //                         children: [
// // // // //     //                           Container(
// // // // //     //                             width: 120.w,
// // // // //     //                             height: 40.h,
// // // // //     //
// // // // //     //                             decoration: BoxDecoration(
// // // // //     //                               borderRadius: BorderRadiusDirectional.circular(10.r),
// // // // //     //                               color: orange,
// // // // //     //
// // // // //     //
// // // // //     //                             ),
// // // // //     //                             child: CustomText(text: "Send", size: 18.sp, color: white, fontWeight: FontWeight.w400,alignment: Alignment.center,),
// // // // //     //                           ),
// // // // //     //                         ],
// // // // //     //                       ),
// // // // //     //
// // // // //     //
// // // // //     //                     ],
// // // // //     //                                         ),
// // // // //     //                   ),
// // // // //     //                 ),
// // // // //     //               ),
// // // // //     //
// // // // //     //               SizedBox(width: 30.w,),
// // // // //     //
// // // // //     //               Expanded(
// // // // //     //                 flex: 40,
// // // // //     //                 child: Container(
// // // // //     //                   decoration: BoxDecoration(
// // // // //     //                     borderRadius: BorderRadiusDirectional.circular(15.r),
// // // // //     //                     color: white,
// // // // //     //
// // // // //     //                   ),
// // // // //     //                   child: Padding(
// // // // //     //                     padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
// // // // //     //                     child: Column(
// // // // //     //                       children: [
// // // // //     //                         CustomText(text: "Notification", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
// // // // //     //                         SizedBox(height: 20.h,),
// // // // //     //                         SizedBox(
// // // // //     //                           height: 600.h,
// // // // //     //
// // // // //     //                           child:
// // // // //     //
// // // // //     //                           ListView.separated(
// // // // //     //
// // // // //     //                               itemBuilder: (context,index)=>Column(
// // // // //     //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //     //                                 children: [
// // // // //     //                                   Row(
// // // // //     //                                     children: [
// // // // //     //                                       CircleAvatar(
// // // // //     //                                         radius: 40.r,
// // // // //     //                                         backgroundImage: AssetImage(
// // // // //     //                                             "assets/images/home/pesrson.png"),
// // // // //     //
// // // // //     //                                       ),
// // // // //     //
// // // // //     //                                       SizedBox(width: 5.w,),
// // // // //     //
// // // // //     //                                       Column(
// // // // //     //                                         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //     //                                         children: [
// // // // //     //                                           CustomText(text: "Your service is under review", size: 16.sp, color: black, fontWeight: FontWeight.w600),
// // // // //     //                                           SizedBox(height: 10.h,),
// // // // //     //
// // // // //     //                                           Row(
// // // // //     //                                             children: [
// // // // //     //                                               CustomText(text: "Today", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
// // // // //     //                                               SizedBox(width: 10.w,),
// // // // //     //                                               CustomText(text: "|", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
// // // // //     //                                               SizedBox(width: 10.w,),
// // // // //     //                                               CustomText(text: "09:56 AM", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
// // // // //     //
// // // // //     //
// // // // //     //                                             ],
// // // // //     //                                           )
// // // // //     //                                         ],
// // // // //     //                                       )
// // // // //     //                                     ],
// // // // //     //                                   ),
// // // // //     //                                   SizedBox(height: 10.h,),
// // // // //     //                                   Text("Your request is under review by the administration. Once it’s live, we’ll notify you with instructions and details.",style: TextStyle(
// // // // //     //                                       color: black,
// // // // //     //                                       fontSize: 14.sp,
// // // // //     //                                       fontWeight: FontWeight.w400
// // // // //     //
// // // // //     //
// // // // //     //                                   ),)
// // // // //     //                                 ],
// // // // //     //                               ), separatorBuilder:(context,index)=> SizedBox(height: 20.h,), itemCount: 10),
// // // // //     //                         )
// // // // //     //                       ],
// // // // //     //                     ),
// // // // //     //                   ),
// // // // //     //                 ),
// // // // //     //               )
// // // // //     //
// // // // //     //             ],
// // // // //     //           ),
// // // // //     //         )
// // // // //     //       ],
// // // // //     //     ),
// // // // //     //   ),
// // // // //     // );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:signalr_core/signalr_core.dart';
// // // //
// // // // void main() => runApp(MyApp());
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: SignalRExample(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class SignalRExample extends StatefulWidget {
// // // //   @override
// // // //   _SignalRExampleState createState() => _SignalRExampleState();
// // // // }
// // // //
// // // // class _SignalRExampleState extends State<SignalRExample> {
// // // //   HubConnection? _connection;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _connectToSignalR();
// // // //   }
// // // //
// // // //   void _connectToSignalR() async {
// // // //     _connection = HubConnectionBuilder()
// // // //         .withUrl('http://ashal.runasp.net/notificationHub')
// // // //         .build();
// // // //
// // // //     _connection!.on('ReceiveNotification', (message) {
// // // //       print('Message received: $message');
// // // //     });
// // // //
// // // //     try {
// // // //       await _connection!.start();
// // // //       print('SignalR connected');
// // // //     } catch (e) {
// // // //       print('Error connecting to SignalR: $e');
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('SignalR Flutter Example'),
// // // //       ),
// // // //       body: const Center(
// // // //         child: Text('Check console for SignalR messages.'),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     _connection?.stop();
// // // //     super.dispose();
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:signalr_core/signalr_core.dart';
// // //
// // //
// // // void main() => runApp(MyApp());
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: SignalRExample(),
// // //     );
// // //   }
// // // }
// // //
// // // class SignalRExample extends StatefulWidget {
// // //   @override
// // //   _SignalRExampleState createState() => _SignalRExampleState();
// // // }
// // //
// // // class _SignalRExampleState extends State<SignalRExample> {
// // //   HubConnection? _connection;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _connectToSignalR();
// // //   }
// // //
// // //   void _connectToSignalR() async {
// // //     _connection = HubConnectionBuilder()
// // //         .withUrl('http://ashal.runasp.net/notificationHub')
// // //         .build();
// // //
// // //     _connection!.on('ReceiveNotification', (message) {
// // //       // Handle the received notification
// // //       print('Notification received: $message');
// // //     });
// // //
// // //     try {
// // //       await _connection!.start();
// // //       print('SignalR connected');
// // //     } catch (e) {
// // //       print('Error connecting to SignalR: $e');
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('SignalR Flutter Example'),
// // //       ),
// // //       body: Center(
// // //         child: Text('Check console for notifications.'),
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _connection?.stop();
// // //     super.dispose();
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:signalr_core/signalr_core.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: SignalRExample(),
// //     );
// //   }
// // }
// //
// // class SignalRExample extends StatefulWidget {
// //   @override
// //   _SignalRExampleState createState() => _SignalRExampleState();
// // }
// //
// // class _SignalRExampleState extends State<SignalRExample> {
// //   HubConnection? _connection;
// //   List<String> _notifications = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _connectToSignalR();
// //   }
// //
// //   void _connectToSignalR() async {
// //     _connection = HubConnectionBuilder()
// //         .withUrl('http://ashal.runasp.net/notificationHub',
// //       HttpConnectionOptions(
// //
// //       )
// //
// //     )
// //         .build();
// //
// //     // Add connection event handlers
// //     _connection!.onclose((error) {
// //       print('Connection closed with error: $error');
// //       // Optionally, handle reconnection logic here
// //     });
// //
// //     _connection!.onreconnecting((error) {
// //       print('Reconnecting due to error: $error');
// //       // Optionally, handle UI changes for reconnecting state
// //     });
// //
// //     _connection!.onreconnected((connectionId) {
// //       print('Reconnected with connection ID: $connectionId');
// //       // Optionally, handle UI changes for reconnected state
// //     });
// //
// //     // Start the connection
// //     try {
// //       await _connection!.start();
// //       print('SignalR connected');
// //
// //       // Handle the ReceiveNotification event
// //       _connection!.on('ReceiveNotification', (message) {
// //         // Ensure message is handled properly
// //         final notificationMessage = message?.toString() ?? 'No message';
// //         setState(() {
// //           _notifications.add(notificationMessage);
// //           print("Notification received: $notificationMessage");
// //         });
// //         // Show a snack bar with the notification message
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Notification received: $notificationMessage')),
// //         );
// //       });
// //     } catch (e) {
// //       print('Error connecting to SignalR: $e');
// //       // Optionally, handle connection errors or retries
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('SignalR Flutter Example'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: _notifications.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(_notifications[index]),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _connection?.stop();
// //     super.dispose();
// //   }
// // }
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:signalr_core/signalr_core.dart';
//
//
//
// class NotificationContent extends StatefulWidget {
//   PageController notificationContent =PageController();
//    NotificationContent({super.key,required this.notificationContent});
//
//   @override
//   _NotificationContentState createState() => _NotificationContentState();
// }
//
// class _NotificationContentState extends State<NotificationContent> {
//   HubConnection? _connection;
//   final String _authToken = 'your_auth_token'; // Replace with your token
//   List<String> _notifications = [];
//   final storage = new FlutterSecureStorage();
//
//
//   @override
//   void initState() {
//     super.initState();
//     _connectToSignalR();
//   }
//
//   void _connectToSignalR() async {
//     var token = await storage.read(key: "token");
//
//
//
//     _connection = HubConnectionBuilder()
//         .withUrl(
//       'http://ashal.runasp.net/notificationHub',
//       HttpConnectionOptions(
//         accessTokenFactory: () async => token,
//       ),
//     )
//         .build();
//
//     _connection!.onclose((error) {
//       print('Connection closed with error: $error');
//     });
//
//     _connection!.onreconnecting((error) {
//       print('Reconnecting due to error: $error');
//     });
//
//     _connection!.onreconnected((connectionId) {
//       print('Reconnected with connection ID: $connectionId');
//     });
//
//     try {
//       await _connection!.start();
//       print('Connected to SignalR with connection ID: ${_connection?.connectionId}');
//
//       _connection!.on('ReceiveNotification', (message) {
//         if (message != null) {
//           print('Raw message received: $message');
//
//           try {
//             final messageJson = message[0].toString();
//             final notification = json.decode(messageJson);
//             print('Parsed notification: $notification');
//
//             final notificationMessage = notification['body'] ?? 'No message';
//             setState(() {
//               _notifications.add(notificationMessage);
//               print('Notification added to list: $notificationMessage');
//             });
//
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Notification received: $notificationMessage')),
//             );
//           } catch (e) {
//             print('Error parsing message: $e');
//           }
//         } else {
//           print('Received null message');
//         }
//       });
//
//     } catch (e) {
//       print('Error connecting to SignalR: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SignalR Flutter Example'),
//       ),
//       body: ListView.builder(
//         itemCount: _notifications.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_notifications[index]),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _connection?.stop();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';



class NotificationContent extends StatefulWidget {
  @override
  _NotificationContentState createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {

  final SignalRService _signalRService = SignalRService();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _signalRService.startConnection();
    _signalRService.receiveMessages((message) {
      setState(() {
        _messages.add(message[0]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SignalR Chat'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (text) {
                  _signalRService.sendMessage("User", text);
                },
                decoration: const InputDecoration(
                  labelText: 'Enter message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SignalRService {
  HubConnection? hubConnection;

  SignalRService() {
    hubConnection = HubConnectionBuilder()
        .withUrl("http://ashal.runasp.net/notificationHub")
        .build();
  }

  void startConnection() async {
    await hubConnection?.start();
    print(hubConnection?.connectionId);
    print("Connection started");
  }

  void sendMessage(String user, String message) {
    hubConnection?.invoke("SendMessage", args: [user, message]);
  }

  void receiveMessages(Function onMessageReceived) {
    hubConnection?.on("ReceiveMessage", (message) {
      onMessageReceived(message);
    });
  }
}

///
