import 'package:code_challenge/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

class RequestEntity extends Equatable {
  final String amount;
  final String crypto;
  final String frequency;
  final String duration;

  const RequestEntity({
    required this.amount,
    required this.crypto,
    required this.frequency,
    required this.duration,
  });

  RequestEntity copyWith({
    String? amount,
    String? crypto,
    String? frequency,
    String? duration,
  }) {
    return RequestEntity(
      amount: amount ?? this.amount,
      crypto: crypto ?? this.crypto,
      frequency: frequency ?? this.frequency,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [amount, crypto, frequency, duration];

  String get durationString => kDuration.keys.firstWhere(
        (key) => kDuration[key] == this.duration,
        orElse: () => '',
      ).split(' ago').first;

  @override
  String toString() {
    return 'amount: $amount, crypto: $crypto, frequency: $frequency, duration: $duration';
  }
}
