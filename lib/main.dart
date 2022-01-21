import 'package:code_challenge/core/util/app_aware.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/navigation.dart';
import 'core/routes/router.dart';
import 'core/util/themes.dart';
import 'injection_container.dart';

void main() async {
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TimeMachineProvider>(
            create: (_) => sl<TimeMachineProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAware(
      child: MaterialApp(
        title: 'Accrue',
        theme: themeOptions[ThemeOptions.light],
        navigatorKey: sl<NavigationHandler>().navigatorKey,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
