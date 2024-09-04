
import 'dart:convert';

import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:aser_dash_board/repositories/shared/cacheNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'authState.dart';



class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(FirstState());

  static AuthCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController createPasswordConfirm = TextEditingController();
  TextEditingController emailForgotPassword = TextEditingController();
  TextEditingController verifyCode = TextEditingController();


  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController emailLogin = TextEditingController();

  final storage = const FlutterSecureStorage();



  // Register Method
  void Register() async {
    try {
      emit(AuthLoadingState());
      var response = await ApiConsumer().post(uri: EndPoint.register, rawData: {
        'name': name.text.trim(),
        'email': email.text.trim(),
        'phoneNumber': phone.text.trim(),
        'password': password.text,
        'ConfirmPassword': confirmPassword.text,
      });
      var jsonBody = json.decode(response.body);
      print(jsonBody.toString());
      if (response.statusCode == 200) {
        emit(AuthSuccessful());
      } else {
        emit(AuthError(error: jsonBody['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(AuthError(error: e.toString()));
    }
  }

  ///////////////////////////////////////////////////////
// login Method

  void login() async {
try {
  emit(LoginLoading());
  var response = await ApiConsumer().post(uri: EndPoint.login, rawData: {'email': emailLogin.text.trim(), 'password': passwordLogin.text});
  var jsonBody = json.decode(response.body);
  print(jsonBody.toString());
  print(jsonBody['data']['token']);
  if (response.statusCode == 200) {
    await storage.write(key: "token", value: jsonBody['data']['token']);

    var token = await storage.read(key: 'token');

    print("Login token $token");

    emit(LoginLoaded());
  } else {
    emit(LoginError(jsonBody["message"]));
  }
}catch (error){
  emit(LoginError("Email Or Password is Not Correct"));
}

    }

  bool isVisible = true;
  void togglePasswordVisibility() {
    isVisible = !isVisible;
    emit(PasswordVisibilityChanged());
  }

}
