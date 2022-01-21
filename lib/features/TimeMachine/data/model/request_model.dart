import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';

class RequestModel extends RequestEntity {
  const RequestModel({
    required String amount,
    required String crypto,
    required String frequency,
    required String duration,
  }) : super(
          amount: amount,
          crypto: crypto,
          frequency: frequency,
          duration: duration,
        );

  factory RequestModel.fromEntity(RequestEntity entity) {
    return RequestModel(
      amount: entity.amount,
      crypto: entity.crypto,
      frequency: entity.frequency,
      duration: entity.duration,
    );
  }

  String get toQuery => '''
  query {
    dca(asset: ${crypto}, amount: ${amount}, frequency: ${frequency}, duration: ${duration}){
      totalInvested
      totalValue
      percentageChange
    }
  }
  ''';
}
