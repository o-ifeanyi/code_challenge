import 'package:code_challenge/features/TimeMachine/view/pages/time_machine_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Start up and time machine flow', (WidgetTester tester) async {
    final robot = Robot(tester);

    await robot.startApp(const TimeMachineScreen());

    expect(find.text('Try out our time machine'), findsOneWidget);
    expect(find.text('How much would you have today if...'), findsOneWidget);
    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('Every day'), findsOneWidget);
    expect(find.text('1 year ago'), findsOneWidget);

    await robot.tap(find.text('Check now! 🚀'));

    await robot.waitFor(find.text('You would have'));

    expect(find.text('Try out our time machine'), findsNothing);
    expect(find.text('How much would you have today if...'), findsNothing);

    expect(find.text('Total invested'), findsOneWidget);
    expect(find.text('Current value'), findsOneWidget);
    expect(find.text('Percent increase'), findsOneWidget);
    await Future.delayed(const Duration(seconds: 1));

    expect(find.text('Try again'), findsOneWidget);
    await robot.tap(find.text('Try again'));

    expect(find.text('You would have'), findsNothing);

    expect(find.text('Try out our time machine'), findsOneWidget);
    expect(find.text('How much would you have today if...'), findsOneWidget);
    await Future.delayed(const Duration(seconds: 1));
    await robot.destroy();
  });
}
