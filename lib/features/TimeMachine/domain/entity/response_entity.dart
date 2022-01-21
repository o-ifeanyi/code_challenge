import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  final String totalInvested;
  final String totalValue;
  final String percentageChange;

  const ResponseEntity({
    required this.totalInvested,
    required this.totalValue,
    required this.percentageChange,
  });

  @override
  List<Object?> get props => [totalInvested, totalValue, percentageChange];
}
