import 'package:code_challenge/core/constants/constants.dart';
import 'package:code_challenge/features/TimeMachine/data/model/request_model.dart';
import 'package:code_challenge/features/TimeMachine/data/model/response_model.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';

RequestEntity get requestEntityFixture => const RequestEntity(
      amount: '10',
      crypto: 'bitcoin',
      frequency: 'weekly',
      duration: '1.0',
    );

RequestModel get requestModelFixture => const RequestModel(
      amount: '10',
      crypto: 'bitcoin',
      frequency: 'weekly',
      duration: '1.0',
    );

String get requestQueryFixture => '''
  query {
    dca(asset: bitcoin, amount: 10, frequency: weekly, duration: 1.0){
      totalInvested
      totalValue
      percentageChange
    }
  }
  ''';

JsonMap get requestResultDataFixture => {
      'dca': {
        'percentageChange': '-14.20',
        'totalInvested': '1850',
        'totalValue': '1587.27'
      }
    };

ResponseEntity get responseEntityFixture => const ResponseEntity(
      totalInvested: '1850',
      totalValue: '1587.27',
      percentageChange: '-14.20',
    );

ResponseModel get responseModelFixture => const ResponseModel(
      totalInvested: '1850',
      totalValue: '1587.27',
      percentageChange: '-14.20',
    );
