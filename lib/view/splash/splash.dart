import 'dart:async';


import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {

      if (token == null) {
        Navigator.pushReplacementNamed(context, 'login');
      }
        else{
          Navigator.pushReplacementNamed(context, 'homeLanding');
      }

    });
    return Scaffold(
      backgroundColor: orange,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/home/logo.png'),
            Spacer(),

            Image.asset('assets/images/load.gif',width: 400.w,height: 200.h,color: white,),





          ],
        ),
      ),
    );
  }
}
