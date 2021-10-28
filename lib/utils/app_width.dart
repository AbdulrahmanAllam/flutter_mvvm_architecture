import 'package:flutter/cupertino.dart';

abstract class AppWidth {
  static Widget get expanded {
    return Expanded(
        child: SizedBox(
      width: double.infinity,
    ));
  }
}
