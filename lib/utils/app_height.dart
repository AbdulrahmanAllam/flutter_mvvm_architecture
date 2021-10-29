import 'package:flutter/cupertino.dart';

abstract class AppHeight {
  static Widget get expanded {
    return const Expanded(
        child: SizedBox(
      height: double.infinity,
    ));
  }

  static Widget get h50 {
    return const SizedBox(
      height: 50,
    );
  }

  static Widget get h20 {
    return const SizedBox(
      height: 20,
    );
  }

  static Widget get h30 {
    return const SizedBox(
      height: 30,
    );
  }
}
