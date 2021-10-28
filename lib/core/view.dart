import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_architecture/utils/app_router.dart';

abstract class View extends StatefulWidget{}

abstract class ViewState<T extends View> extends State<T>{
  String get routeName;

  @override
  void dispose() {
    AppRouter.removeRoute(routeName: routeName);
    super.dispose();
  }
}