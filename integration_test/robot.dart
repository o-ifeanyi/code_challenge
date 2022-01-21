import 'package:code_challenge/core/routes/navigation.dart';
import 'package:code_challenge/core/routes/router.dart';
import 'package:code_challenge/core/util/themes.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:code_challenge/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

class Robot {
  final WidgetTester tester;

  Robot(this.tester);

  Future<void> startApp(Widget widget) async {
    await init();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TimeMachineProvider>(
            create: (_) => sl<TimeMachineProvider>()),
        ],
        child: MaterialApp(
          title: 'Accrue',
          theme: themeOptions[ThemeOptions.light],
          navigatorKey: sl<NavigationHandler>().navigatorKey,
          onGenerateRoute: AppRoute.onGenerateRoute,
        ),
      ),
    );
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> tap(Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> pumpAndSettle() async {
    await tester.pumpAndSettle();
  }

  Future<void> destroy() async {
    await sl.reset();
  }
}
