import 'package:code_challenge/core/error/failure.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TimeMachineRepo {
  Future<Either<ServerFailure, ResponseEntity>> fetchDCA(RequestEntity request);
}