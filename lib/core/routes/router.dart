import 'package:code_challenge/core/util/config.dart';
import 'package:code_challenge/features/TimeMachine/view/pages/result_screen.dart';
import 'package:code_challenge/features/TimeMachine/view/pages/time_machine_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return pushPage(const TimeMachineScreen());
      case '/result_screen':
        return pushPage(const ResultScreen());
      default:
        return pushPage(const TimeMachineScreen());
    }
  }

  static Route<dynamic> pushPage(Widget screen) {
    if (Config.isAndroid) {
      return MaterialPageRoute(builder: (context) => screen);
    }
    return CupertinoPageRoute(builder: (context) => screen);
  }

  static String get initialRoute {
    return TimeMachineScreen.route;
  }
}
