import 'package:flutter_mvvm_architecture/utils/app_log.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {

  static String addRoute({required Widget screen}){
    routes[screen.toString()] = (context) => screen;
    AppLog.debug("Add route : $routes");
    return screen.toString();
  }

  static void removeRoute({required String routeName}){
    routes.remove(routeName);
    AppLog.debug("remove route : $routes");
  }

  static Map<String, WidgetBuilder> routes = {};  
}
