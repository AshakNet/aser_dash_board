import 'dart:io';


import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:aser_dash_board/repositories/shared/cacheNetwork.dart';
import 'package:aser_dash_board/view/notification/notification_content/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:window_manager/window_manager.dart';
import 'constant//route/route.dart' as route;
import 'constant/color.dart';
import 'logic/observe/observe.dart';
var token ;
var hubConnection;
SignalRServicem servicem = SignalRServicem();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheNetwork.cacheInitialization();
  final storage = new FlutterSecureStorage();

  token = await storage.read(key: "token");
  print( " token of person is \n $token");

  await windowManager.ensureInitialized();
  print("mahmoud");
  await servicem.initPlatformDartServer();
  print("zahran");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ThemeData getTheme(BuildContext context) {
    // Call MediaQuery.of(contex) here
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
      scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Color(0xFFF7F7F7),
      ),
      splashColor: Colors.transparent,
      dividerColor: Colors.transparent,
      popupMenuTheme: const PopupMenuThemeData(
        // textStyle: TextStyle(fontSize: 1.sp),
        surfaceTintColor: Colors.white,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: white,
          focusColor: white,
          hoverColor: white,
        ),
      ),
      fontFamily: 'Mona-Sans-Regular',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // You can use the library anywhere in the app even in theme
            theme: const MyApp().getTheme(context),
            home: child,
            onGenerateRoute: route.controller,
            initialRoute: route.splash,
          ),
        );
      },
    );
  }
}
