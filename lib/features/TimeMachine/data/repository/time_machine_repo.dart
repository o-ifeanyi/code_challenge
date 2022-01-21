import 'package:code_challenge/core/services/network_service.dart';
import 'package:code_challenge/features/TimeMachine/data/model/request_model.dart';
import 'package:code_challenge/features/TimeMachine/data/model/response_model.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';
import 'package:code_challenge/core/error/failure.dart';
import 'package:code_challenge/features/TimeMachine/domain/repository/time_machine_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TimeMachineRepoImpl implements TimeMachineRepo {
  final NetworkService _networkService;

  TimeMachineRepoImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<Either<ServerFailure, ResponseEntity>> fetchDCA(
      RequestEntity request) async {
    try {
      final requestModel = RequestModel.fromEntity(request);
      debugPrint('QUERY: ${requestModel.toQuery}');
      final response = await _networkService.query(requestModel.toQuery);

      debugPrint('RESPONSE DATA: ${response.data}');
      if (response.data == null) {
        return Left(ServerFailure(message: 'Failed to fetch data'));
      }
      final responseModel = ResponseModel.fromMap(response.data!);
      return Right(responseModel);
    } catch (err) {
      debugPrint('$err');
      return Left(ServerFailure(message: 'Failed to fetch data'));
    }
  }
}
