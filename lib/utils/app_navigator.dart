import 'package:flutter_mvvm_architecture/main.dart';
import 'package:flutter/material.dart';

abstract class AppNavigator{
  static void push({required String routeName}){
    MyApp.navigatorKey.currentState!.pushNamed(routeName);
  }

  static void pop(){
    MyApp.navigatorKey.currentState!.pop();
  }

  static void pushReplacement({required String routeName}){
    MyApp.navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void pushAndRemoveUntil({required String routeName, required RoutePredicate predicate}){
    MyApp.navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, predicate);
  }
}