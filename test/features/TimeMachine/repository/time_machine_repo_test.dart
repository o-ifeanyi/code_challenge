import 'package:code_challenge/core/error/failure.dart';
import 'package:code_challenge/features/TimeMachine/data/repository/time_machine_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/time_machine_fixtures.dart';
import '../../../mocks/mocks.dart';

void main() {
  late MockNetworkService mockNetworkService;
  late TimeMachineRepoImpl timeMachineRepoImpl;

  setUp(() {
    mockNetworkService = MockNetworkService();
    timeMachineRepoImpl = TimeMachineRepoImpl(
      networkService: mockNetworkService,
    );
  });

  group('TimeMachineRepo', () {
    final queryResult = MockQueryResult();
    test('fetchDCA should return ResponseEntity when successful', () async {
      when(() => mockNetworkService.query(any())).thenAnswer(
        (_) => Future.value(queryResult),
      );
      when(() => queryResult.data).thenReturn(requestResultDataFixture);

      final response = await timeMachineRepoImpl.fetchDCA(requestEntityFixture);

      expect(response, equals(Right(responseModelFixture)));
    });

    test('fetchDCA should return ServerFailure when un-successful', () async {
      when(() => mockNetworkService.query(any())).thenThrow(Error);

      final response = await timeMachineRepoImpl.fetchDCA(requestEntityFixture);

      expect(response, equals(Left(ServerFailure(message: 'Failed to fetch data'))));
    });
  });
}
