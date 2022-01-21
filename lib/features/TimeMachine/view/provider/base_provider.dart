import 'package:code_challenge/core/constants/constants.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/request_entity.dart';
import 'package:code_challenge/features/TimeMachine/domain/entity/response_entity.dart';
import 'package:flutter/cupertino.dart';

enum ProviderState {
  idle,
  loading,
}

class BaseProvider extends ChangeNotifier {
  ProviderState _providerState = ProviderState.idle;
  ProviderState get state => _providerState;
  setState(ProviderState state) {
    _providerState = state;
    notifyListeners();
  }

  RequestEntity _requestEntity = const RequestEntity(
    amount: '10',
    crypto: 'bitcoin',
    frequency: 'daily',
    duration: '1.0',
  );
  RequestEntity get requestEntity => _requestEntity;
  set requestEntity(RequestEntity entity) {
    _requestEntity = entity;
    notifyListeners();
  }

  ResponseEntity _responseEntity = const ResponseEntity(
    totalInvested: '0',
    totalValue: '0',
    percentageChange: '0',
  );
  ResponseEntity get responseEntity => _responseEntity;
  set responseEntity(ResponseEntity entity) {
    _responseEntity = entity;
    notifyListeners();
  }

  String get shareTextFrequency => kFrequencies.keys.firstWhere(
        (key) => kFrequencies[key] == _requestEntity.frequency, orElse: () => '',
      ).toLowerCase();

  String get shareText =>
      'If I bought \$${_requestEntity.amount} worth of ${_requestEntity.crypto} $shareTextFrequency starting ${_requestEntity.durationString} ago, I would\'ve spent \$${_responseEntity.totalInvested} and my investment would currently be worth ${_responseEntity.totalValue} (a ${_responseEntity.percentageChange}% change). Check for yourself at https://useaccrue.com/#time-machine via @useaccrue';
}
