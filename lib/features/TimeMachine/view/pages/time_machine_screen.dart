import 'package:code_challenge/core/constants/constants.dart';
import 'package:code_challenge/core/routes/navigation.dart';
import 'package:code_challenge/core/util/config.dart';
import 'package:code_challenge/features/TimeMachine/view/pages/result_screen.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/base_provider.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:code_challenge/features/TimeMachine/view/widgets/action_button.dart';
import 'package:code_challenge/features/TimeMachine/view/widgets/custom_field.dart';
import 'package:code_challenge/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TimeMachineScreen extends StatelessWidget {
  static const route = '/';
  const TimeMachineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<TimeMachineProvider>(
            builder: (context, timeMachine, child) {
              return Column(
                children: [
                  SizedBox(height: Config.yMargin(context, 2)),
                  Text(
                    'Try out our time machine',
                    textAlign: TextAlign.center,
                    style: Config.h2(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Config.xMargin(context, 4)),
                    child: Text(
                      'How much would you have today if...',
                      textAlign: TextAlign.center,
                      style: Config.h1(context),
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  Text(
                    'You bought',
                    textAlign: TextAlign.center,
                    style: Config.b2(context),
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  RoundedBox(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Config.b1(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '\$10',
                        hintStyle: Config.b1(context),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          timeMachine.requestEntity =
                              timeMachine.requestEntity.copyWith(amount: value);
                        }
                      },
                    ),
                    color: theme.backgroundColor,
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  CustomField(
                    title: 'worth of',
                    items: kCyptos,
                    onSelect: (value) {
                      timeMachine.requestEntity =
                          timeMachine.requestEntity.copyWith(crypto: value);
                    },
                  ),
                  SizedBox(height: Config.yMargin(context, 4)),
                  CustomField(
                    title: '',
                    items: kFrequencies,
                    onSelect: (value) {
                      timeMachine.requestEntity =
                          timeMachine.requestEntity.copyWith(frequency: value);
                    },
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  CustomField(
                    title: 'starting',
                    items: kDuration,
                    onSelect: (value) {
                      timeMachine.requestEntity =
                          timeMachine.requestEntity.copyWith(duration: value);
                    },
                  ),
                  SizedBox(height: Config.yMargin(context, 4)),
                  GestureDetector(
                    onTap: timeMachine.state == ProviderState.loading
                        ? null
                        : () {
                            debugPrint(timeMachine.requestEntity.toString());
                            timeMachine.fetchDCA().then((success) {
                              if (success) {
                                sl<NavigationHandler>()
                                    .pushNamed(ResultScreen.route);
                              }
                            });
                          },
                    child: RoundedBox(
                      radius: 20,
                      child: Text(
                        'Check now! 🚀',
                        style: Config.b1(context).copyWith(
                          color: theme.backgroundColor,
                        ),
                      ),
                      color: timeMachine.state == ProviderState.loading
                          ? theme.colorScheme.secondary.withOpacity(0.4)
                          : theme.colorScheme.secondary,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
