import 'package:code_challenge/core/constants/constants.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';

class ResponseModel extends ResponseEntity {
  const ResponseModel({
    required String totalInvested,
    required String totalValue,
    required String percentageChange,
  }) : super(
          totalInvested: totalInvested,
          totalValue: totalValue,
          percentageChange: percentageChange,
        );

  factory ResponseModel.fromMap(JsonMap response) {
    final data = response['dca'];
    return ResponseModel(
      totalInvested: data['totalInvested'],
      totalValue: data['totalValue'],
      percentageChange: data['percentageChange'],
    );
  }
}
