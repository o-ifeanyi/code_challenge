import 'package:code_challenge/core/routes/navigation.dart';
import 'package:code_challenge/core/util/config.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:code_challenge/features/TimeMachine/view/widgets/action_button.dart';
import 'package:code_challenge/features/TimeMachine/view/widgets/gradient_box.dart';
import 'package:code_challenge/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  static const String route = '/result_screen';
  const ResultScreen({Key? key}) : super(key: key);

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
                    'You would have',
                    textAlign: TextAlign.center,
                    style: Config.h1(context),
                  ),
                  SizedBox(height: Config.yMargin(context, 3)),
                  GradientBox(
                    title: 'Total invested',
                    value: '\$${timeMachine.responseEntity.totalInvested}',
                    footnote:
                        'Over the last ${timeMachine.requestEntity.durationString}',
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  GradientBox(
                    title: 'Current value',
                    value: '\$${timeMachine.responseEntity.totalValue}',
                    footnote: '',
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  GradientBox(
                    title: 'Percent increase',
                    value: '${timeMachine.responseEntity.percentageChange}%',
                    footnote: 'Better returns than a bank account',
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  GestureDetector(
                    onTap: () => Share.share(timeMachine.shareText),
                    child: RoundedBox(
                      radius: 20,
                      child: Text(
                        'Share on Twitter',
                        style: Config.b1(context).copyWith(
                          color: theme.backgroundColor,
                        ),
                      ),
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 2)),
                  GestureDetector(
                    onTap: () => sl<NavigationHandler>().pop(),
                    child: RoundedBox(
                      radius: 20,
                      child: Text(
                        'Try again',
                        style: Config.b1(context).copyWith(
                          color: theme.backgroundColor,
                        ),
                      ),
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 3)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
