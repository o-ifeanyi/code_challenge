import 'package:code_challenge/features/TimeMachine/data/model/request_model.dart';
import 'package:code_challenge/features/TimeMachine/data/model/response_model.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/time_machine_fixtures.dart';

void main() {
  group('ResponseModel', () {
    test('should be a subtype of ResponseEntity', () {
      expect(responseModelFixture, isA<ResponseEntity>());
    });

    test('should return a valid ResponseModel from Map', () {
      final model = ResponseModel.fromMap(requestResultDataFixture);

      expect(model, equals(responseModelFixture));
    });
  });

  group('RequestModel', () {
    test('should be a subtype of RequestEntity', () {
      expect(requestModelFixture, isA<RequestEntity>());
    });

    test('should return a valid RequestModel from Entity', () {
      final model = RequestModel.fromEntity(requestEntityFixture);

      expect(model, equals(requestModelFixture));
    });

    test('should return a valid Query', () {
      final query = requestModelFixture.toQuery;

      expect(query, equals(requestQueryFixture));
    });
  });
}
