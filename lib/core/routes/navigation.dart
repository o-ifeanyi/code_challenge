import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class NavigationHandler {
  Future<T?> push<T extends Object?>(Route<T> route);

  Future<T?> pushNamed<T extends Object?>(String destinationRoute,
      {Object? arg});

  Future<T?> pushReplacementNamed<T extends Object?>(String destinationRoute,
      {Object? arg});

  void pop<T extends Object>([T? result]);

  bool canPop();

  void popToFirst();

  void exitApp();

  GlobalKey<NavigatorState>? navigatorKey;
}

class NavigationHandlerImpl implements NavigationHandler {
  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get state => navigatorKey!.currentState;

  @override
  void exitApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void pop<T extends Object>([T? result]) {
    return state!.pop(result);
  }

  @override
  void popToFirst() {
    return state!.popUntil((route) => route.isFirst);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String destinationRoute, {arg}) {
    return state!.pushNamed(destinationRoute, arguments: arg);
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?>(String destinationRoute,
      {arg}) {
    return state!.pushReplacementNamed(destinationRoute, arguments: arg);
  }

  @override
  bool canPop() {
    return state != null && state!.canPop();
  }

  @override
  Future<T?> push<T extends Object?>(Route<T> route) {
    return state!.push(route);
  }
}
