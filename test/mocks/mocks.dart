import 'package:code_challenge/core/services/network_service.dart';
import 'package:code_challenge/features/TimeMachine/domain/repository/time_machine_repo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

// Repositories
class MockTimeMachineRepo extends Mock implements TimeMachineRepo {}

// Services
class MockNetworkService extends Mock implements NetworkService {}

// Externals
class MockQueryResult extends Mock implements QueryResult {}