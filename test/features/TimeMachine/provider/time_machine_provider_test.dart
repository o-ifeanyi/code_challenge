import 'package:code_challenge/core/error/failure.dart';
import 'package:code_challenge/core/services/snackbar_service.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/time_machine_fixtures.dart';
import '../../../mocks/mocks.dart';

void main() {
  late SnackBarService snackBarService;
  late MockTimeMachineRepo mockTimeMachineRepo;
  late TimeMachineProvider timeMachineProvider;

  setUp(() {
    snackBarService = SnackBarService();
    mockTimeMachineRepo = MockTimeMachineRepo();
    timeMachineProvider = TimeMachineProvider(
      timeMachineRepo: mockTimeMachineRepo,
      snackBarService: snackBarService,
    );

    registerFallbackValue(requestEntityFixture);
  });

  group('TimeMachineRepo', () {
    final queryResult = MockQueryResult();
    test('fetchDCA should return true when successful', () async {
      when(() => mockTimeMachineRepo.fetchDCA(any())).thenAnswer(
        (_) => Future.value(Right(responseModelFixture)),
      );
      when(() => queryResult.data).thenReturn(requestResultDataFixture);

      final response = await timeMachineProvider.fetchDCA();

      expect(response, equals(true));
    });

    test('fetchDCA should return false when un-successful', () async {
      when(() => mockTimeMachineRepo.fetchDCA(any())).thenAnswer(
        (_) => Future.value(Left(ServerFailure(message: 'error'))),
      );

      final response = await timeMachineProvider.fetchDCA();

      expect(response, equals(false));
    });
  });
}
