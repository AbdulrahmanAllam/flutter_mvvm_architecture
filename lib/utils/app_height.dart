import 'package:flutter/cupertino.dart';

abstract class AppHeight {
  static Widget get expanded {
    return Expanded(
        child: SizedBox(
      height: double.infinity,
    ));
  }

  static Widget get h50 {
    return SizedBox(
      height: 50,
    );
  }

  static Widget get h20 {
    return SizedBox(
      height: 20,
    );
  }

  static Widget get h30 {
    return SizedBox(
      height: 30,
    );
  }
}
