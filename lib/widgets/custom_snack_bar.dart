import 'package:flutter/material.dart';

import '../main.dart';

abstract class CustomSnackBar{

  static void show({required String message}){
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(_snackBar(message: message));
  }

  static SnackBar _snackBar({required String message}){
    return SnackBar(
      content: Text("$message"),
    );
  }
}